library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
---------------------------------------------------------------------
entity bodem is
    port (
        reset,count     : in    std_logic;
        led1,led2,led3  : out   std_logic_vector(6 downto 0)
    );
end bodem;
---------------------------------------------------------------------
architecture behavior of bodem is
signal tram,chuc,donvi : integer;
component hien_thi_led is
    port (
        so      : in integer;
        out_7seg: out std_logic_vector (6 downto 0)
    );
end component;
begin
    process(count,reset)
    variable t_donvi,t_chuc,t_tram : integer;
    begin
        if reset = '1' then
            t_tram  := 0;
            t_chuc  := 0;
            t_donvi := 0;
        else
            if count'event and count = '1' then
                t_donvi := t_donvi + 1;
                if t_donvi = 10 then
                    t_donvi:= 0;
                    t_chuc := t_chuc + 1;
                end if;
                if t_chuc = 10 then
                    t_chuc:= 0;
                    t_tram := t_tram + 1;
                end if; 
                if t_tram = 10 then
                    t_tram := 0;
                end if;
            end if;
        end if;
        tram    <= t_tram;
        chuc    <= t_chuc;
        donvi   <= t_donvi;
    end process;
    u1:hien_thi_led port map (tram,led1);
    u2:hien_thi_led port map (chuc,led2);
    u3:hien_thi_led port map (donvi,led3);
end behavior;