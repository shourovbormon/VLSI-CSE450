LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUX_2to1_tb IS
END MUX_2to1_tb;

ARCHITECTURE behavior OF MUX_2to1_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT MUX_2to1
    PORT(
        I0 : IN  std_logic;
        I1 : IN  std_logic;
        S  : IN  std_logic;
        Y  : OUT std_logic
    );
    END COMPONENT;

    -- Inputs
    signal I0 : std_logic := '0';
    signal I1 : std_logic := '0';
    signal S  : std_logic := '0';

    -- Output
    signal Y : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: MUX_2to1 PORT MAP(
        I0 => I0,
        I1 => I1,
        S  => S,
        Y  => Y
    );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test 1
        -- I0=0, I1=0, S=0
        -- Expected Y=0
        I0 <= '0';
        I1 <= '0';
        S  <= '0';
        wait for 100 ns;

        -- Test 2
        -- I0=0, I1=1, S=0
        -- Expected Y=0
        I0 <= '0';
        I1 <= '1';
        S  <= '0';
        wait for 100 ns;

        -- Test 3
        -- I0=1, I1=0, S=0
        -- Expected Y=1
        I0 <= '1';
        I1 <= '0';
        S  <= '0';
        wait for 100 ns;

        -- Test 4
        -- I0=1, I1=1, S=0
        -- Expected Y=1
        I0 <= '1';
        I1 <= '1';
        S  <= '0';
        wait for 100 ns;

        -- Test 5
        -- I0=0, I1=0, S=1
        -- Expected Y=0
        I0 <= '0';
        I1 <= '0';
        S  <= '1';
        wait for 100 ns;

        -- Test 6
        -- I0=0, I1=1, S=1
        -- Expected Y=1
        I0 <= '0';
        I1 <= '1';
        S  <= '1';
        wait for 100 ns;

        -- Test 7
        -- I0=1, I1=0, S=1
        -- Expected Y=0
        I0 <= '1';
        I1 <= '0';
        S  <= '1';
        wait for 100 ns;

        -- Test 8
        -- I0=1, I1=1, S=1
        -- Expected Y=1
        I0 <= '1';
        I1 <= '1';
        S  <= '1';
        wait for 100 ns;

        -- End simulation
        wait;

    end process;

END;