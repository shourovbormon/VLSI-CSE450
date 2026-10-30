library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_nand is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end full_adder_nand;

architecture Structural of full_adder_nand is

    signal X1, X2, X3, XOR1 : STD_LOGIC;
    signal X4, X5, X6 : STD_LOGIC;

begin

    G1: entity work.nand_gate
        port map(A => A, B => B, Y => X1);

    G2: entity work.nand_gate
        port map(A => A, B => X1, Y => X2);

    G3: entity work.nand_gate
        port map(A => B, B => X1, Y => X3);

    G4: entity work.nand_gate
        port map(A => X2, B => X3, Y => XOR1);

    G5: entity work.nand_gate
        port map(A => XOR1, B => Cin, Y => X4);

    G6: entity work.nand_gate
        port map(A => XOR1, B => X4, Y => X5);

    G7: entity work.nand_gate
        port map(A => Cin, B => X4, Y => X6);

    G8: entity work.nand_gate
        port map(A => X5, B => X6, Y => Sum);

    G9: entity work.nand_gate
        port map(A => X1, B => X4, Y => Cout);

end Structural;