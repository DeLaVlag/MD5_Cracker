-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.4
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity md5_hasher_r_rom is 
    generic(
             dwidth     : integer := 5; 
             awidth     : integer := 6; 
             mem_size    : integer := 64
    ); 
    port (
          addr0      : in std_logic_vector(awidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(dwidth-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of md5_hasher_r_rom is 

signal addr0_tmp : std_logic_vector(awidth-1 downto 0); 
type mem_array is array (0 to mem_size-1) of std_logic_vector (dwidth-1 downto 0); 
signal mem : mem_array := (
    0 => "00111", 1 => "01100", 2 => "10001", 3 => "10110", 4 => "00111", 
    5 => "01100", 6 => "10001", 7 => "10110", 8 => "00111", 9 => "01100", 
    10 => "10001", 11 => "10110", 12 => "00111", 13 => "01100", 14 => "10001", 
    15 => "10110", 16 => "00101", 17 => "01001", 18 => "01110", 19 => "10100", 
    20 => "00101", 21 => "01001", 22 => "01110", 23 => "10100", 24 => "00101", 
    25 => "01001", 26 => "01110", 27 => "10100", 28 => "00101", 29 => "01001", 
    30 => "01110", 31 => "10100", 32 => "00100", 33 => "01011", 34 => "10000", 
    35 => "10111", 36 => "00100", 37 => "01011", 38 => "10000", 39 => "10111", 
    40 => "00100", 41 => "01011", 42 => "10000", 43 => "10111", 44 => "00100", 
    45 => "01011", 46 => "10000", 47 => "10111", 48 => "00110", 49 => "01010", 
    50 => "01111", 51 => "10101", 52 => "00110", 53 => "01010", 54 => "01111", 
    55 => "10101", 56 => "00110", 57 => "01010", 58 => "01111", 59 => "10101", 
    60 => "00110", 61 => "01010", 62 => "01111", 63 => "10101" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;


Library IEEE;
use IEEE.std_logic_1164.all;

entity md5_hasher_r is
    generic (
        DataWidth : INTEGER := 5;
        AddressRange : INTEGER := 64;
        AddressWidth : INTEGER := 6);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of md5_hasher_r is
    component md5_hasher_r_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    md5_hasher_r_rom_U :  component md5_hasher_r_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


