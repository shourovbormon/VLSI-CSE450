library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end and_gate;

architecture Structural of and_gate is
    signal N1 : STD_LOGIC;
begin
    U_NAND1 : entity work.nand_gate
        port map (A => A, B => B, Y => N1);

    -- Invert the NAND result using a second NAND gate.
    U_NAND2 : entity work.nand_gate
        port map (A => N1, B => N1, Y => Y);
end Structural;