library ieee;
use ieee.std_logic_1164.all;

entity may_trang_thai is
    port (
        inp     : in std_logic;
        clk,rst : in std_logic;
        outp    : out std_logic_vector (1 downto 0)
    );
end may_trang_thai;

architecture behavior of may_trang_thai is
type states is (S1,S2,S3,S4);
signal current_state,next_state : states;
begin
    -- Phan mach day
    process(rst,inp,clk)
    begin
        if rst = '1' then
            current_state <= S1;
        else
            if clk'event and clk = '1' then
                current_state <= next_state;
            end if;
        end if;
    end process;
    -- Phan mach to hop
    process(current_state)
    begin
        case current_state is
            when S1 =>
                outp <= "00";
                if inp = '1' then
                    next_state <= S2;
                else
                    next_state <= S1;
                end if;
            when S2 =>
                outp <= "01";
                if inp = '1' then
                    next_state <= S4;
                else
                    next_state <= S3;
                end if;
            when S3 =>
                outp <= "10";
                if inp = '1' then
                    next_state <= S4;
                else
                    next_state <= S3;
                end if;
            when S4 =>
                outp <= "11";
                if inp = '1' then
                    next_state <= S1;
                else
                    next_state <= S2;
                end if;
        end case;
    end process;
end behavior;