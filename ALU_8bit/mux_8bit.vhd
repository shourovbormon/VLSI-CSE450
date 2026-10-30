library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_8bit is
    Port (
        D0  : in  STD_LOGIC_VECTOR(7 downto 0);
        D1  : in  STD_LOGIC_VECTOR(7 downto 0);
        SEL : in  STD_LOGIC;
        Y   : out STD_LOGIC_VECTOR(7 downto 0)
    );
end mux_8bit;

architecture Behavioral of mux_8bit is
begin

    Y <= D0 when SEL = '0' else D1;

end Behavioral;