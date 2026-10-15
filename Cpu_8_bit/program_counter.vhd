library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_counter is
    Port (
        CLK    : in  STD_LOGIC;
        RESET  : in  STD_LOGIC;
        PC_OUT : out STD_LOGIC_VECTOR(3 downto 0)
    );
end program_counter;

architecture Behavioral of program_counter is
    signal PC_Q : unsigned(3 downto 0) := (others => '0');
begin
    PC_OUT <= std_logic_vector(PC_Q);

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                PC_Q <= (others => '0');
            else
                -- Set 8 has no jump instruction; advance after every instruction.
                PC_Q <= PC_Q + 1;
            end if;
        end if;
    end process;
end Behavioral;