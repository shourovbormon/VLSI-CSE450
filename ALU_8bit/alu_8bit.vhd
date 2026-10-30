library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_8bit is
    Port (
        A      : in  STD_LOGIC_VECTOR(7 downto 0);
        B      : in  STD_LOGIC_VECTOR(7 downto 0);
        SEL    : in  STD_LOGIC_VECTOR(2 downto 0);

        Result : out STD_LOGIC_VECTOR(7 downto 0);
        Cout   : out STD_LOGIC;
        Zero   : out STD_LOGIC
    );
end alu_8bit;

architecture Structural of alu_8bit is

    signal Arithmetic_Result : STD_LOGIC_VECTOR(7 downto 0);
    signal Logic_Result      : STD_LOGIC_VECTOR(7 downto 0);

    signal Arithmetic_Cout   : STD_LOGIC;
    signal Mux_Select        : STD_LOGIC;

    signal ALU_Result        : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- Select arithmetic or logic operation
    Mux_Select <= '0' when
                 (SEL = "000" or SEL = "001")
                 else '1';

    -- Arithmetic Unit
    AU: entity work.arithmetic_unit
        port map (
            A      => A,
            B      => B,
            SUB    => SEL(0),
            Result => Arithmetic_Result,
            Cout   => Arithmetic_Cout
        );

    -- Logic Unit
    LU: entity work.logic_unit
        port map (
            A      => A,
            B      => B,
            SEL    => SEL,
            Result => Logic_Result
        );

    -- Result Multiplexer
    MUX: entity work.mux_8bit
        port map (
            D0  => Arithmetic_Result,
            D1  => Logic_Result,
            SEL => Mux_Select,
            Y   => ALU_Result
        );

    -- Connect internal result to output
    Result <= ALU_Result;

    -- Carry output
    Cout <= Arithmetic_Cout when
            (SEL = "000" or SEL = "001")
            else '0';

    -- Zero Flag
    Zero <= '1' when ALU_Result = "00000000"
            else '0';

end Structural;