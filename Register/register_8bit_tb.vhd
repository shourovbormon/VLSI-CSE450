LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY register_8bit_tb IS
END register_8bit_tb;


ARCHITECTURE behavior OF register_8bit_tb IS

    COMPONENT register_8bit
        PORT(
            CLK   : IN  std_logic;
            RESET : IN  std_logic;
            LOAD  : IN  std_logic;
            D     : IN  std_logic_vector(7 downto 0);
            Q     : OUT std_logic_vector(7 downto 0)
        );
    END COMPONENT;


    SIGNAL CLK   : std_logic := '0';
    SIGNAL RESET : std_logic := '0';
    SIGNAL LOAD  : std_logic := '0';

    SIGNAL D : std_logic_vector(7 downto 0) := "00000000";
    SIGNAL Q : std_logic_vector(7 downto 0);


BEGIN

    ---------------------------------------------------------------
    -- Unit Under Test
    ---------------------------------------------------------------

    uut: register_8bit
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
    -- TEST STIMULUS
    ---------------------------------------------------------------

    stimulus_process: PROCESS
    BEGIN

        -----------------------------------------------------------
        -- TEST 1: RESET
        -----------------------------------------------------------

        RESET <= '1';
        LOAD  <= '0';
        D     <= "10101010";

        WAIT FOR 100 ns;


        -----------------------------------------------------------
        -- TEST 2: LOAD 10101010
        -----------------------------------------------------------

        RESET <= '0';
        LOAD  <= '1';
        D     <= "10101010";

        WAIT FOR 100 ns;


        -----------------------------------------------------------
        -- TEST 3: HOLD
        --
        -- D changes, but LOAD = 0
        -- Q should remain 10101010
        -----------------------------------------------------------

        RESET <= '0';
        LOAD  <= '0';
        D     <= "11111111";

        WAIT FOR 100 ns;


        -----------------------------------------------------------
        -- TEST 4: LOAD 11001100
        -----------------------------------------------------------

        RESET <= '0';
        LOAD  <= '1';
        D     <= "11001100";

        WAIT FOR 100 ns;


        -----------------------------------------------------------
        -- TEST 5: HOLD
        -----------------------------------------------------------

        RESET <= '0';
        LOAD  <= '0';
        D     <= "00001111";

        WAIT FOR 100 ns;


        -----------------------------------------------------------
        -- TEST 6: LOAD 11110000
        -----------------------------------------------------------

        RESET <= '0';
        LOAD  <= '1';
        D     <= "11110000";

        WAIT FOR 100 ns;


        -----------------------------------------------------------
        -- TEST 7: RESET AGAIN
        -----------------------------------------------------------

        RESET <= '1';
        LOAD  <= '1';
        D     <= "11111111";

        WAIT FOR 100 ns;


        -----------------------------------------------------------
        -- END
        -----------------------------------------------------------

        RESET <= '0';
        LOAD  <= '0';
        D     <= "00000000";

        WAIT;

    END PROCESS;

END behavior;