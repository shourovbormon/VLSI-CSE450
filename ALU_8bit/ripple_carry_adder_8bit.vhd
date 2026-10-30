library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_carry_adder_8bit is
    Port (
        A    : in  STD_LOGIC_VECTOR(7 downto 0);
        B    : in  STD_LOGIC_VECTOR(7 downto 0);
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC_VECTOR(7 downto 0);
        Cout : out STD_LOGIC
    );
end ripple_carry_adder_8bit;

architecture Structural of ripple_carry_adder_8bit is

    signal C : STD_LOGIC_VECTOR(8 downto 0);

begin

    C(0) <= Cin;

    FA0: entity work.full_adder_nand
        port map(A(0), B(0), C(0), Sum(0), C(1));

    FA1: entity work.full_adder_nand
        port map(A(1), B(1), C(1), Sum(1), C(2));

    FA2: entity work.full_adder_nand
        port map(A(2), B(2), C(2), Sum(2), C(3));

    FA3: entity work.full_adder_nand
        port map(A(3), B(3), C(3), Sum(3), C(4));

    FA4: entity work.full_adder_nand
        port map(A(4), B(4), C(4), Sum(4), C(5));

    FA5: entity work.full_adder_nand
        port map(A(5), B(5), C(5), Sum(5), C(6));

    FA6: entity work.full_adder_nand
        port map(A(6), B(6), C(6), Sum(6), C(7));

    FA7: entity work.full_adder_nand
        port map(A(7), B(7), C(7), Sum(7), C(8));

    Cout <= C(8);

end Structural;