library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_nand is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        SUM  : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end full_adder_nand;

architecture Structural of full_adder_nand is
    signal X1 : STD_LOGIC;
    signal N1, N2 : STD_LOGIC;
begin
    U_XOR1 : entity work.xor_gate
        port map (A => A, B => B, Y => X1);

    U_XOR2 : entity work.xor_gate
        port map (A => X1, B => Cin, Y => SUM);

    -- Cout = AB + Cin(A XOR B), implemented with three NAND gates.
    U_NAND1 : entity work.nand_gate
        port map (A => A, B => B, Y => N1);

    U_NAND2 : entity work.nand_gate
        port map (A => X1, B => Cin, Y => N2);

    U_NAND3 : entity work.nand_gate
        port map (A => N1, B => N2, Y => Cout);
end Structural;