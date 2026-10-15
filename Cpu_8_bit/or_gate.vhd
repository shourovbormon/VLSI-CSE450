library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end or_gate;

architecture Structural of or_gate is
    signal NA, NB : STD_LOGIC;
begin
    U_INV_A : entity work.nand_gate
        port map (A => A, B => A, Y => NA);

    U_INV_B : entity work.nand_gate
        port map (A => B, B => B, Y => NB);

    -- De Morgan: A OR B = (NOT A) NAND (NOT B).
    U_NAND : entity work.nand_gate
        port map (A => NA, B => NB, Y => Y);
end Structural;