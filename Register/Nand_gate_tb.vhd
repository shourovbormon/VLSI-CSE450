LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Nand_Gate_tb IS
END Nand_Gate_tb;

ARCHITECTURE behavior OF Nand_Gate_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Nand_Gate
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Y : OUT std_logic
        );
    END COMPONENT;

    -- Inputs
    signal A : std_logic := '0';
    signal B : std_logic := '0';

    -- Output
    signal Y : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: Nand_Gate PORT MAP (
          A => A,
          B => B,
          Y => Y
        );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test Case 1: A=0, B=0
        A <= '0';
        B <= '0';
        wait for 100 ns;

        -- Test Case 2: A=0, B=1
        A <= '0';
        B <= '1';
        wait for 100 ns;

        -- Test Case 3: A=1, B=0
        A <= '1';
        B <= '0';
        wait for 100 ns;

        -- Test Case 4: A=1, B=1
        A <= '1';
        B <= '1';
        wait for 100 ns;

        -- End simulation
        wait;

    end process;

END;