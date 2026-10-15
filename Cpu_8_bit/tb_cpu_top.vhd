library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_cpu_top is
end tb_cpu_top;

architecture Behavioral of tb_cpu_top is
    signal CLK   : STD_LOGIC := '0';
    signal RESET : STD_LOGIC := '1';
    signal Q     : STD_LOGIC_VECTOR(7 downto 0);
    signal Z     : STD_LOGIC;
    signal PC    : STD_LOGIC_VECTOR(3 downto 0);
    signal R_OUT : STD_LOGIC_VECTOR(7 downto 0);
    signal DONE  : STD_LOGIC := '0';
begin
    DUT : entity work.cpu_top
        port map (
            CLK   => CLK,
            RESET => RESET,
            Q     => Q,
            Z     => Z,
            PC    => PC,
            R_OUT => R_OUT
        );

    -- 20 ns clock period: 10 ns low and 10 ns high.
    CLK_PROCESS : process
    begin
        CLK <= '0';
        while DONE = '0' loop
            wait for 10 ns;
            CLK <= '1';
            wait for 10 ns;
            CLK <= '0';
        end loop;
        CLK <= '0';
        wait;
    end process;

    STIMULUS : process
    begin
        -- Reset must be sampled high on one rising edge.
        RESET <= '1';
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert (Q = x"00") and (R_OUT = x"00") and
               (Z = '1') and (PC = "0000")
            report "RESET FAILED: expected ACC=00, R=00, Z=1, PC=0"
            severity error;

        RESET <= '0';

        -- Cycle 1: PC 0, LDI 0x64 -> ACC=64, R=00, Z=0, PC=1
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert (Q = x"64") and (R_OUT = x"00") and
               (Z = '0') and (PC = "0001")
            report "STEP 1 FAILED: LDI 0x64"
            severity error;

        -- Cycle 2: PC 1, STA -> R=64; ACC and Z hold; PC=2
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert (Q = x"64") and (R_OUT = x"64") and
               (Z = '0') and (PC = "0010")
            report "STEP 2 FAILED: STA"
            severity error;

        -- Cycle 3: PC 2, SUB 0x14 -> ACC=50, PC=3
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert (Q = x"50") and (R_OUT = x"64") and
               (Z = '0') and (PC = "0011")
            report "STEP 3 FAILED: SUB 0x14"
            severity error;

        -- Cycle 4: PC 3, ADD 0x0A -> ACC=5A, PC=4
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert (Q = x"5A") and (R_OUT = x"64") and
               (Z = '0') and (PC = "0100")
            report "STEP 4 FAILED: ADD 0x0A"
            severity error;

        -- Cycle 5: PC 4, STA -> R=5A; ACC and Z hold; PC=5
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert (Q = x"5A") and (R_OUT = x"5A") and
               (Z = '0') and (PC = "0101")
            report "STEP 5 FAILED: STA"
            severity error;

        -- Cycle 6: PC 5, SUB 0x5A -> ACC=00, Z=1, PC=6
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert (Q = x"00") and (R_OUT = x"5A") and
               (Z = '1') and (PC = "0110")
            report "STEP 6 FAILED: SUB 0x5A"
            severity error;

        -- Cycle 7: PC 6, LDR -> ACC=R=5A, Z=0, PC=7
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert (Q = x"5A") and (R_OUT = x"5A") and
               (Z = '0') and (PC = "0111")
            report "STEP 7 FAILED: LDR"
            severity error;

        -- Cycle 8: PC 7, SUB 0x60 -> ACC=FA, Z=0, PC=8
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert (Q = x"FA") and (R_OUT = x"5A") and
               (Z = '0') and (PC = "1000")
            report "STEP 8 FAILED: SUB 0x60"
            severity error;

        report "ALL SET 8 CPU TESTS PASSED" severity note;
        DONE <= '1';
        wait;
    end process;
end Behavioral;