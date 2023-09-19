--=================================================================================================
-- File Name                           : data_unpacker.vhd
-- Targeted device                     : Microsemi-SoC
-- Author                              : India Solutions Team
--
-- COPYRIGHT 2020 BY MICROSEMI
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
--
--=================================================================================================

--=================================================================================================
-- Libraries
--=================================================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

--=================================================================================================
-- data_unpacker entity declaration
--=================================================================================================
entity data_unpacker is
  port(
-- Port list
    -- System reset
    reset_i : in std_logic;

    -- Display clock
    disp_clk_i : in std_logic;

    -- Read enable signal from DDR
    read_en_i : in std_logic;

    -- Data Input
    data_i : in std_logic_vector(31 downto 0);

    -- Data Input
    horz_resl_i : in std_logic_vector(15 downto 0);

    -- data output valid
    data_valid_o : out std_logic;

    -- Number of 128 bit packets to read 
    beats_to_read_o : out std_logic_vector(15 downto 0);

    -- Data output
    data_r : out std_logic_vector(7 downto 0);
    data_g : out std_logic_vector(7 downto 0);
    data_b : out std_logic_vector(7 downto 0)        

    );
end data_unpacker;

--=================================================================================================
-- data_unpacker architecture body
--=================================================================================================

architecture data_unpacker_arch of data_unpacker is

--=================================================================================================
-- Component declarations
--=================================================================================================
--NA--
--=================================================================================================
-- Synthesis Attributes
--=================================================================================================
--NA--
--=================================================================================================
-- Signal declarations
--=================================================================================================

  signal s_data_r    : std_logic_vector(7 downto 0);
  signal s_data_g    : std_logic_vector(7 downto 0);
  signal s_data_b    : std_logic_vector(7 downto 0);

begin

--=================================================================================================
-- Top level output port assignments
--=================================================================================================
  beats_to_read_o <= "000000" & horz_resl_i(15 downto 6) - 1;
  
  data_r <= s_data_r;
  data_g <= s_data_g;
  data_b <= s_data_b;
--=================================================================================================
-- Generate blocks
--=================================================================================================


--=================================================================================================
-- Asynchronous blocks
--=================================================================================================

--=================================================================================================
-- Synchronous blocks
--================================================================================================= 

--------------------------------------------------------------------------
-- Name       : DATA_ASSIGN
-- Description: Process assigns data based on counter value
--------------------------------------------------------------------------
  DATA_ASSIGN :
  process(disp_clk_i, RESET_I)
  begin
    if RESET_I = '0' then
      s_data_r  <= (others => '0');
      s_data_g  <= (others => '0');
      s_data_b  <= (others => '0');            
      data_valid_o     <= '0';
    elsif rising_edge(disp_clk_i) then
      if(read_en_i = '1')then
        s_data_r  <= data_i(23 downto 16);
        s_data_g  <= data_i(15 downto 8);
        s_data_b  <= data_i(7 downto 0);                   
        data_valid_o     <= '1';
      else
		data_valid_o <= '0';	
      end if;
    end if;
  end process;

--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--
end data_unpacker_arch;
