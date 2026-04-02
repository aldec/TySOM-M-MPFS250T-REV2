-- ADV7611_RX.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ADV7611_RX is
    Generic (
        DATA_WIDTH : integer := 24;
        INVERT_VSYNC : integer range 0 to 1 := 0
    );
    Port (
        vid_clk     : in  std_logic;
        vid_rst_n   : in  std_logic;
        vid_de      : in  std_logic;
        vid_vsync   : in  std_logic;
        vid_data    : in  std_logic_vector(DATA_WIDTH-1 downto 0);

        m_axis_tdata  : out std_logic_vector(DATA_WIDTH-1 downto 0);
        m_axis_tvalid : out std_logic;
        m_axis_tuser  : out std_logic;
        m_axis_tlast  : out std_logic;
        m_axis_tready : in  std_logic
    );
end ADV7611_RX;

architecture Behavioral of ADV7611_RX is

    -- Pipeline registers
    signal r_data       : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
    signal r_de         : std_logic := '0';
    signal r_vsync_prev : std_logic := '0';
    
    -- Control flags
    signal sof_armed    : std_logic := '0';
    signal vsync_active : std_logic;

begin

    -- VSYNC polarization control
    vsync_active <= not vid_vsync when INVERT_VSYNC = 1 else vid_vsync;

    process(vid_clk, vid_rst_n)
    begin
        if vid_rst_n = '0' then
            r_data        <= (others => '0');
            r_de          <= '0';
            r_vsync_prev  <= '0';
            sof_armed     <= '0';
            
            m_axis_tdata  <= (others => '0');
            m_axis_tvalid <= '0';
            m_axis_tuser  <= '0';
            m_axis_tlast  <= '0';
            
        elsif rising_edge(vid_clk) then
            
            r_data <= vid_data;
            r_de   <= vid_de;

            r_vsync_prev <= vsync_active;
            
            if (vsync_active = '1' and r_vsync_prev = '0') then
                sof_armed <= '1';
            end if;

            m_axis_tdata <= r_data;

            m_axis_tvalid <= r_de;

            if (r_de = '1' and sof_armed = '1') then
                m_axis_tuser <= '1';
                sof_armed    <= '0';
            else
                m_axis_tuser <= '0';
            end if;

            if (r_de = '1' and vid_de = '0') then
                m_axis_tlast <= '1';
            else
                m_axis_tlast <= '0';
            end if;

        end if;
    end process;

end Behavioral;