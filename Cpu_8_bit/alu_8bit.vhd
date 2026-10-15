library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ALU_SEL = "00": ADD; ALU_SEL = "01": SUB.
-- Other selector values return zero. Carry beyond bit 7 is discarded.
entity alu_8bit is
    Port (
        A          : in  STD_LOGIC_VECTOR(7 downto 0);
        OPERAND    : in  STD_LOGIC_VECTOR(7 downto 0);
        ALU_SEL    : in  STD_LOGIC_VECTOR(1 downto 0);
        ALU_RESULT : out STD_LOGIC_VECTOR(7 downto 0)
    );
end alu_8bit;

architecture Structural of alu_8bit is
    signal SUB_MODE : STD_LOGIC;
    signal B_MOD    : STD_LOGIC_VECTOR(7 downto 0);
    signal C        : STD_LOGIC_VECTOR(8 downto 0);
    signal SUM_INT  : STD_LOGIC_VECTOR(7 downto 0);
begin
    -- Two's-complement subtraction: A + NOT(B) + 1.
    SUB_MODE <= '1' when ALU_SEL = "01" else '0';
    C(0) <= SUB_MODE;

    GEN_BITS : for i in 0 to 7 generate
        U_XOR_B : entity work.xor_gate
            port map (
                A => OPERAND(i),
                B => SUB_MODE,
                Y => B_MOD(i)
            );

        U_FULL_ADDER : entity work.full_adder_nand
            port map (
                A    => A(i),
                B    => B_MOD(i),
                Cin  => C(i),
                SUM  => SUM_INT(i),
                Cout => C(i + 1)
            );
    end generate GEN_BITS;

    process(ALU_SEL, SUM_INT)
    begin
        if (ALU_SEL = "00") or (ALU_SEL = "01") then
            ALU_RESULT <= SUM_INT;
        else
            ALU_RESULT <= (others => '0');
        end if;
    end process;
end Structural;