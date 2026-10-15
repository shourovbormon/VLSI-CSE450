library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpu_top is
    Port (
        CLK     : in  STD_LOGIC;
        RESET   : in  STD_LOGIC;
        Q       : out STD_LOGIC_VECTOR(7 downto 0); -- ACC output
        Z       : out STD_LOGIC;
        PC      : out STD_LOGIC_VECTOR(3 downto 0);
        R_OUT   : out STD_LOGIC_VECTOR(7 downto 0)  -- Debug output for verification
    );
end cpu_top;

architecture Structural of cpu_top is
    signal PC_Q       : STD_LOGIC_VECTOR(3 downto 0);
    signal INSTR      : STD_LOGIC_VECTOR(11 downto 0);
    signal OPCODE     : STD_LOGIC_VECTOR(3 downto 0);
    signal OPERAND    : STD_LOGIC_VECTOR(7 downto 0);

    signal ACC_WE     : STD_LOGIC;
    signal R_WE       : STD_LOGIC;
    signal Z_WE       : STD_LOGIC;
    signal ALU_SEL    : STD_LOGIC_VECTOR(1 downto 0);
    signal ACC_SRC    : STD_LOGIC_VECTOR(1 downto 0);

    signal ACC_Q      : STD_LOGIC_VECTOR(7 downto 0);
    signal R_Q        : STD_LOGIC_VECTOR(7 downto 0);
    signal ACC_D      : STD_LOGIC_VECTOR(7 downto 0);
    signal ALU_RESULT : STD_LOGIC_VECTOR(7 downto 0);
    signal Z_D        : STD_LOGIC;
    signal Z_Q        : STD_LOGIC;
begin
    PC <= PC_Q;
    Q <= ACC_Q;
    R_OUT <= R_Q;
    Z <= Z_Q;

    OPCODE  <= INSTR(11 downto 8);
    OPERAND <= INSTR(7 downto 0);

    U_PC : entity work.program_counter
        port map (
            CLK    => CLK,
            RESET  => RESET,
            PC_OUT => PC_Q
        );

    U_ROM : entity work.program_rom
        port map (
            ADDR  => PC_Q,
            INSTR => INSTR
        );

    U_CONTROL : entity work.control_unit
        port map (
            OPCODE  => OPCODE,
            ACC_WE  => ACC_WE,
            R_WE    => R_WE,
            Z_WE    => Z_WE,
            ALU_SEL => ALU_SEL,
            ACC_SRC => ACC_SRC
        );

    U_ALU : entity work.alu_8bit
        port map (
            A          => ACC_Q,
            OPERAND    => OPERAND,
            ALU_SEL    => ALU_SEL,
            ALU_RESULT => ALU_RESULT
        );

    -- Select the value that may be written into ACC.
    process(ACC_SRC, OPERAND, ALU_RESULT, R_Q)
    begin
        case ACC_SRC is
            when "00" => ACC_D <= OPERAND;    -- LDI
            when "01" => ACC_D <= ALU_RESULT; -- ADD or SUB
            when "10" => ACC_D <= R_Q;        -- LDR
            when others => ACC_D <= (others => '0');
        end case;
    end process;

    -- Z is based on the value being written to ACC for Z-updating instructions.
    Z_D <= '1' when ACC_D = x"00" else '0';

    U_ACC : entity work.acc_register
        port map (
            CLK   => CLK,
            RESET => RESET,
            EN    => ACC_WE,
            D     => ACC_D,
            Q     => ACC_Q
        );

    U_R : entity work.r_register
        port map (
            CLK   => CLK,
            RESET => RESET,
            EN    => R_WE,
            D     => ACC_Q,
            Q     => R_Q
        );

    U_Z : entity work.z_flag
        port map (
            CLK   => CLK,
            RESET => RESET,
            EN    => Z_WE,
            D     => Z_D,
            Z     => Z_Q
        );
end Structural;