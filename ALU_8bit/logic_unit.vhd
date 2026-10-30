library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_unit is
    Port (
        A      : in  STD_LOGIC_VECTOR(7 downto 0);
        B      : in  STD_LOGIC_VECTOR(7 downto 0);
        SEL    : in  STD_LOGIC_VECTOR(2 downto 0);
        Result : out STD_LOGIC_VECTOR(7 downto 0)
    );
end logic_unit;

architecture Behavioral of logic_unit is
begin

    process(A, B, SEL)
    begin

        case SEL is

            when "010" =>
                Result <= A AND B;

            when "011" =>
                Result <= A OR B;

            when "100" =>
                Result <= A XOR B;

            when "101" =>
                Result <= A NAND B;

            when "110" =>
                Result <= NOT A;

            when "111" =>
                Result <= B;

            when others =>
                Result <= (others => '0');

        end case;

    end process;

end Behavioral;