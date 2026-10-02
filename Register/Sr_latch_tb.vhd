LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SR_Latch_tb IS
END SR_Latch_tb;


ARCHITECTURE behavior OF SR_Latch_tb IS

    COMPONENT SR_Latch
        PORT(
            S_N : IN  std_logic;
            R_N : IN  std_logic;
            Q   : OUT std_logic;
            Q_N : OUT std_logic
        );
    END COMPONENT;

    SIGNAL S_N : std_logic := '1';
    SIGNAL R_N : std_logic := '1';

    SIGNAL Q   : std_logic;
    SIGNAL Q_N : std_logic;

BEGIN

    -- Instantiate the SR Latch
    uut: SR_Latch
        PORT MAP(
            S_N => S_N,
            R_N => R_N,
            Q   => Q,
            Q_N => Q_N
        );


    -- Test process
    stim_proc: PROCESS
    BEGIN

        -- Initial condition
        S_N <= '1';
        R_N <= '1';
        WAIT FOR 100 ns;


        -- SET
        -- S_N = 0, R_N = 1
        S_N <= '0';
        R_N <= '1';
        WAIT FOR 100 ns;


        -- HOLD
        -- S_N = 1, R_N = 1
        S_N <= '1';
        R_N <= '1';
        WAIT FOR 100 ns;


        -- RESET
        -- S_N = 1, R_N = 0
        S_N <= '1';
        R_N <= '0';
        WAIT FOR 100 ns;


        -- HOLD
        S_N <= '1';
        R_N <= '1';
        WAIT FOR 100 ns;


        -- SET again
        S_N <= '0';
        R_N <= '1';
        WAIT FOR 100 ns;


        -- INVALID CONDITION
        -- Do not use this in the actual circuit
        S_N <= '0';
        R_N <= '0';
        WAIT FOR 100 ns;


        -- Return to HOLD
        S_N <= '1';
        R_N <= '1';
        WAIT FOR 100 ns;


        WAIT;

    END PROCESS;

END behavior;