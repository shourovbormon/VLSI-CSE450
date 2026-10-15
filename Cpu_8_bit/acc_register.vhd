library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity acc_register is
    Port (
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        EN    : in  STD_LOGIC;
        D     : in  STD_LOGIC_VECTOR(7 downto 0);
        Q     : out STD_LOGIC_VECTOR(7 downto 0)
    );
end acc_register;

architecture Behavioral of acc_register is
    signal ACC_Q : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    Q <= ACC_Q;

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                ACC_Q <= (others => '0');
            elsif EN = '1' then
                ACC_Q <= D;
            end if; -- Otherwise, hold the previous value.
        end if;
    end process;
end Behavioral;