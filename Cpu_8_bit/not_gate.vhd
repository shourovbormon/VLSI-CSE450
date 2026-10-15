library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate is
    Port (
        A : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end not_gate;

architecture Structural of not_gate is
begin
    -- A NAND gate with both inputs tied together acts as an inverter.
    U_NAND : entity work.nand_gate
        port map (A => A, B => A, Y => Y);
end Structural;