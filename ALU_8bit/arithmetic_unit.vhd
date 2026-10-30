library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arithmetic_unit is
    Port (
        A    : in  STD_LOGIC_VECTOR(7 downto 0);
        B    : in  STD_LOGIC_VECTOR(7 downto 0);
        SUB  : in  STD_LOGIC;
        Result : out STD_LOGIC_VECTOR(7 downto 0);
        Cout : out STD_LOGIC
    );
end arithmetic_unit;

architecture Structural of arithmetic_unit is

    signal B_modified : STD_LOGIC_VECTOR(7 downto 0);

begin

    B_modified <= B XOR (7 downto 0 => SUB);

    RCA: entity work.ripple_carry_adder_8bit
        port map (
            A    => A,
            B    => B_modified,
            Cin  => SUB,
            Sum  => Result,
            Cout => Cout
        );

end Structural;