library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
    Port (
        A     : in  STD_LOGIC;
        B     : in  STD_LOGIC;
        SUM   : out STD_LOGIC;
        CARRY : out STD_LOGIC
    );
end half_adder;

architecture Structural of half_adder is
begin
    U_XOR : entity work.xor_gate
        port map (A => A, B => B, Y => SUM);

    U_AND : entity work.and_gate
        port map (A => A, B => B, Y => CARRY);
end Structural;