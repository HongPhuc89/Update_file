library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
---------------------------------------------------------------------
entity hien_thi_led is
    port (
        so      : in integer;
        out_7seg: out std_logic_vector (6 downto 0)
    );
end hien_thi_led;
---------------------------------------------------------------------
architecture behavior of hien_thi_led is
begin
    process(so)
    begin
        case so is
            when 0 => out_7seg <= "1111110";
            when 1 => out_7seg <= "0110000";
            when 2 => out_7seg <= "1101101";
            when 3 => out_7seg <= "1111001";
            when 4 => out_7seg <= "0110011";
            when 5 => out_7seg <= "1011011";
            when 6 => out_7seg <= "1011111";
            when 7 => out_7seg <= "1110000";
            when 8 => out_7seg <= "1111111";
            when 9 => out_7seg <= "1111011";
            when others => out_7seg<= "0000000";
        end case;
    end process;
end behavior;