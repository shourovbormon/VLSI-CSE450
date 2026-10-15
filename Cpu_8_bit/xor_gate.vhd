library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end xor_gate;

architecture Structural of xor_gate is
    signal X1, X2, X3 : STD_LOGIC;
begin
    -- Four-NAND implementation of XOR.
    U_NAND1 : entity work.nand_gate
        port map (A => A, B => B, Y => X1);

    U_NAND2 : entity work.nand_gate
        port map (A => A, B => X1, Y => X2);

    U_NAND3 : entity work.nand_gate
        port map (A => B, B => X1, Y => X3);

    U_NAND4 : entity work.nand_gate
        port map (A => X2, B => X3, Y => Y);
end Structural;