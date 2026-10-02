LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY D_Flip_Flop_tb IS
END D_Flip_Flop_tb;


ARCHITECTURE behavior OF D_Flip_Flop_tb IS

    COMPONENT D_Flip_Flop
        PORT(
            D   : IN  std_logic;
            CLK : IN  std_logic;
            Q   : OUT std_logic;
            Q_N : OUT std_logic
        );
    END COMPONENT;


    SIGNAL D   : std_logic := '0';
    SIGNAL CLK : std_logic := '0';

    SIGNAL Q   : std_logic;
    SIGNAL Q_N : std_logic;


BEGIN

    uut: D_Flip_Flop
        PORT MAP(
            D   => D,
            CLK => CLK,
            Q   => Q,
            Q_N => Q_N
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

        WAIT;

    END PROCESS;


    ---------------------------------------------------------------
    -- DATA
    ---------------------------------------------------------------

    data_process: PROCESS
    BEGIN

        -- D = 0
        D <= '0';
        WAIT FOR 100 ns;

        -- D = 1
        D <= '1';
        WAIT FOR 100 ns;

        -- D = 0
        D <= '0';
        WAIT FOR 100 ns;

        -- D = 1
        D <= '1';
        WAIT FOR 100 ns;

        WAIT;

    END PROCESS;

END behavior;