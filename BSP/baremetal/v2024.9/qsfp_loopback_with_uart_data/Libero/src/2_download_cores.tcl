puts "***** 2_download_cores.tcl - download cores"

download_core -vlnv {Actel:DirectCore:COREUART:5.7.100} -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv {Actel:SgCore:PF_TX_PLL:2.0.304} -location {www.actel-ip.com/repositories/SgCore}
download_core -vlnv {Actel:SgCore:PF_XCVR_REF_CLK:1.0.103} -location {www.actel-ip.com/repositories/SgCore}
download_core -vlnv {Actel:SystemBuilder:PF_XCVR_ERM:3.1.205} -location {www.actel-ip.com/repositories/SgCore}
download_core -vlnv {Microsemi:SolutionCore:LiteFast:1.0.6} -location {www.microchip-ip.com/repositories/SolutionCore}
download_core -vlnv {Actel:SgCore:PF_OSC:1.0.102} -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv {Actel:SgCore:PF_CCC:2.2.220} -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv {Actel:DirectCore:CORERESET_PF:2.3.100} -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv {Microsemi:SgCore:PFSOC_INIT_MONITOR:1.0.307} -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv {Actel:DirectCore:COREFIFO:3.1.101} -location {www.microchip-ip.com/repositories/DirectCore}
