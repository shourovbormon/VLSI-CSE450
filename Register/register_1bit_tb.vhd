LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY register_1bit_tb IS
END register_1bit_tb;


ARCHITECTURE behavior OF register_1bit_tb IS

    COMPONENT register_1bit
        PORT(
            CLK   : IN  std_logic;
            RESET : IN  std_logic;
            LOAD  : IN  std_logic;
            D     : IN  std_logic;
            Q     : OUT std_logic
        );
    END COMPONENT;


    SIGNAL CLK   : std_logic := '0';
    SIGNAL RESET : std_logic := '0';
    SIGNAL LOAD  : std_logic := '0';
    SIGNAL D     : std_logic := '0';

    SIGNAL Q : std_logic;

BEGIN

    ---------------------------------------------------------------
    -- Unit Under Test
    ---------------------------------------------------------------

    uut: register_1bit
        PORT MAP(
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D,
            Q     => Q
        );


    ---------------------------------------------------------------
    -- CLOCK
    ---------------------------------------------------------------

    clock_process: PROCESS
    BEGIN

        CLK <= '0';
        WAIT FOR 50 ns;

        CLK <= '1';
        WAIT FOR 50 ns;

        CLK <= '0';
        WAIT FOR 50 ns;

        CLK <= '1';
        WAIT FOR 50 ns;

        CLK <= '0';
        WAIT FOR 50 ns;

        CLK <= '1';
        WAIT FOR 50 ns;

        CLK <= '0';
        WAIT FOR 50 ns;

        CLK <= '1';
        WAIT FOR 50 ns;

        CLK <= '0';
        WAIT FOR 50 ns;

        CLK <= '1';
        WAIT FOR 50 ns;

        CLK <= '0';
        WAIT FOR 50 ns;

        CLK <= '1';
        WAIT FOR 50 ns;

        WAIT;

    END PROCESS;


    ---------------------------------------------------------------
    -- INPUT TEST
    ---------------------------------------------------------------

    stimulus_process: PROCESS
    BEGIN

        -----------------------------------------------------------
        -- TEST 1: RESET
        -----------------------------------------------------------

        RESET <= '1';
        LOAD  <= '0';
        D     <= '1';

        WAIT FOR 100 ns;


        -----------------------------------------------------------
        -- TEST 2: LOAD 1
        -----------------------------------------------------------

        RESET <= '0';
        LOAD  <= '1';
        D     <= '1';

        WAIT FOR 100 ns;


        -----------------------------------------------------------
        -- TEST 3: HOLD
        -----------------------------------------------------------

        RESET <= '0';
        LOAD  <= '0';
        D     <= '0';

        WAIT FOR 100 ns;


        -----------------------------------------------------------
        -- TEST 4: LOAD 0
        -----------------------------------------------------------

        RESET <= '0';
        LOAD  <= '1';
        D     <= '0';

        WAIT FOR 100 ns;


        -----------------------------------------------------------
        -- TEST 5: HOLD
        -----------------------------------------------------------

        RESET <= '0';
        LOAD  <= '0';
        D     <= '1';

        WAIT FOR 100 ns;


        -----------------------------------------------------------
        -- TEST 6: RESET AGAIN
        -----------------------------------------------------------

        RESET <= '1';
        LOAD  <= '1';
        D     <= '1';

        WAIT FOR 100 ns;


        RESET <= '0';
        LOAD  <= '0';
        D     <= '0';

        WAIT;

    END PROCESS;

END behavior;