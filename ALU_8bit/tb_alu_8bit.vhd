library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_alu_8bit is
end tb_alu_8bit;

architecture Behavioral of tb_alu_8bit is

    signal A      : STD_LOGIC_VECTOR(7 downto 0);
    signal B      : STD_LOGIC_VECTOR(7 downto 0);
    signal SEL    : STD_LOGIC_VECTOR(2 downto 0);

    signal Result : STD_LOGIC_VECTOR(7 downto 0);
    signal Cout   : STD_LOGIC;
    signal Zero   : STD_LOGIC;

begin

    DUT: entity work.alu_8bit
        port map (
            A      => A,
            B      => B,
            SEL    => SEL,
            Result => Result,
            Cout   => Cout,
            Zero   => Zero
        );

    stimulus: process
    begin

        -- Test 1: ADD
        A <= x"AA";
        B <= x"0F";
        SEL <= "000";
        wait for 20 ns;

        assert Result = x"B9" and Cout = '0' and Zero = '0'
        report "ADD FAILED"
        severity error;

        -- Test 2: SUB
        A <= x"AA";
        B <= x"0F";
        SEL <= "001";
        wait for 20 ns;

        assert Result = x"9B" and Cout = '1' and Zero = '0'
        report "SUB FAILED"
        severity error;

        -- Test 3: AND
        A <= x"AA";
        B <= x"0F";
        SEL <= "010";
        wait for 20 ns;

        assert Result = x"0A" and Zero = '0'
        report "AND FAILED"
        severity error;

        -- Test 4: OR
        A <= x"AA";
        B <= x"0F";
        SEL <= "011";
        wait for 20 ns;

        assert Result = x"AF" and Zero = '0'
        report "OR FAILED"
        severity error;

        -- Test 5: XOR
        A <= x"AA";
        B <= x"0F";
        SEL <= "100";
        wait for 20 ns;

        assert Result = x"A5" and Zero = '0'
        report "XOR FAILED"
        severity error;

        -- Test 6: NAND
        A <= x"AA";
        B <= x"0F";
        SEL <= "101";
        wait for 20 ns;

        assert Result = x"F5" and Zero = '0'
        report "NAND FAILED"
        severity error;

        -- Test 7: NOT A
        A <= x"AA";
        B <= x"0F";
        SEL <= "110";
        wait for 20 ns;

        assert Result = x"55" and Zero = '0'
        report "NOT FAILED"
        severity error;

        -- Test 8: PASS B
        A <= x"AA";
        B <= x"0F";
        SEL <= "111";
        wait for 20 ns;

        assert Result = x"0F" and Zero = '0'
        report "PASS B FAILED"
        severity error;

        -- Test 9: ADD with carry
        A <= x"FF";
        B <= x"01";
        SEL <= "000";
        wait for 20 ns;

        assert Result = x"00" and Cout = '1' and Zero = '1'
        report "ADD CARRY FAILED"
        severity error;

        -- Test 10: SUB with borrow
        A <= x"00";
        B <= x"01";
        SEL <= "001";
        wait for 20 ns;

        assert Result = x"FF" and Cout = '0' and Zero = '0'
        report "SUB BORROW FAILED"
        severity error;

        -- Test 11: Zero result
        A <= x"55";
        B <= x"55";
        SEL <= "001";
        wait for 20 ns;

        assert Result = x"00" and Zero = '1'
        report "ZERO FLAG FAILED"
        severity error;

        report "ALL ALU TESTS COMPLETED"
        severity note;

        wait;

    end process;

end Behavioral;