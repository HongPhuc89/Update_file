------------ full_adder -----------------
--add library----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-----------------------------------------
--make entity----------------------------
entity full_adder is
port(
        A   : in std_logic;
        B   : in std_logic;
        Cin : in std_logic;
        S   : out std_logic;
        Cout: out std_logic;
    )
end full_adder;
-----------------------------------------
--architecture---------------------------
architecture behavioral of full_adder is
begin
    add2:
    process (A,B,Cin)
    begin
        S       =   (A xor B) xor Cin;
        Cout    =   (A nand B) nand (Cin nand (A xor B));
    end process add2;
end behavioral;
