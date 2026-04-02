#include <stdio.h>
#include <string.h>
#include <pty.h>
#include <printf.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>



typedef struct {
	char pty_name[64]; // name of the PTY device
	char read_byte;	// storage for a received character
	int master;		// file descriptor for the master side of the PTY.
	int slave;		 // file descriptor for the slave side of the PTY.
} uart_t;


///////////////////////////////////////
// create handler
void* dpi_create_handler(const char *name) {
	// allocate memory for uart_t structure
    uart_t *obj = malloc(sizeof(uart_t));
    if (!obj) {
        perror("malloc failed");
        return NULL;
    }
	
	struct termios tty;
	memset(&tty, 0, sizeof(tty));
	// set up the terminal in raw mode
	cfmakeraw(&tty);
	
	// create a new pseudoterminal pair (master/slave)
	if (openpty(&obj->master, &obj->slave, NULL, &tty, NULL) == -1) {
        perror("openpty failed");
        free(obj);
        return NULL;
    }
	
	// get the name of the slave PTY
	if (ttyname_r(obj->slave, obj->pty_name, sizeof(obj->pty_name)) != 0) {
	    perror("ttyname_r failed");
	    close(obj->master);
	    close(obj->slave);
	    free(obj);
	    return NULL;
	}
	
	// print the PTY name for external connection
	printf("/dev/pts/<n>: %s for %s\n", obj->pty_name, name);
	
	// write pty name to file
    FILE* fp = fopen("uart_data/pty_name.txt", "w");
    if (fp) {
        fprintf(fp, "%s", obj->pty_name);
        fclose(fp);
    }
	
	
	// set the master file descriptor to non-blocking mode
	fcntl(obj->master, F_SETFL, fcntl(obj->master, F_GETFL, 0) | O_NONBLOCK);
	
	return (void*) obj;
}


///////////////////////////////////////
// write byte
void dpi_write_byte(void* obj, char c) {
	if (!obj) {
        fprintf(stderr, "dpi_write_byte: null pointer passed\n");
    }
	uart_t *dpi = (uart_t*) obj;
	int rv = write(dpi->master, &c, 1);
	(void) rv;
}


///////////////////////////////////////
// check if read byte is valid
int dpi_byte_valid(void* obj) {
	if (!obj) {
        fprintf(stderr, "dpi_byte_valid: null pointer passed\n");
        return 0;
    }
	uart_t *dpi = (uart_t*) obj;
	int rv = read(dpi->master, &dpi->read_byte, 1);
	return (rv == 1);
}


///////////////////////////////////////
// read byte
char dpi_read_byte(void* obj) {
	if (!obj) {
        fprintf(stderr, "dpi_read_byte: null pointer passed\n");
        return 0;
    }
	uart_t *dpi = (uart_t*) obj;
	return dpi->read_byte;
}


