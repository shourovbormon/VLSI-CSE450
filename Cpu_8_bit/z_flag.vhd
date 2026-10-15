library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity z_flag is
    Port (
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        EN    : in  STD_LOGIC;
        D     : in  STD_LOGIC;
        Z     : out STD_LOGIC
    );
end z_flag;

architecture Behavioral of z_flag is
    signal Z_Q : STD_LOGIC := '1';
begin
    Z <= Z_Q;

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                Z_Q <= '1';
            elsif EN = '1' then
                Z_Q <= D;
            end if; -- Otherwise, Z holds its previous value.
        end if;
    end process;
end Behavioral;