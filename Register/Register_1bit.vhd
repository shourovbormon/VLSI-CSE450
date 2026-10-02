LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY register_1bit IS
    PORT(
        CLK   : IN  std_logic;
        RESET : IN  std_logic;
        LOAD  : IN  std_logic;
        D     : IN  std_logic;
        Q     : OUT std_logic
    );
END register_1bit;


ARCHITECTURE Structural OF register_1bit IS

    COMPONENT MUX_2to1
        PORT(
            I0 : IN  std_logic;
            I1 : IN  std_logic;
            S  : IN  std_logic;
            Y  : OUT std_logic
        );
    END COMPONENT;


    COMPONENT D_Flip_Flop
        PORT(
            D   : IN  std_logic;
            CLK : IN  std_logic;
            Q   : OUT std_logic;
            Q_N : OUT std_logic
        );
    END COMPONENT;


    SIGNAL LOAD_DATA : std_logic;
    SIGNAL DFF_INPUT : std_logic;

    SIGNAL Q_INT : std_logic;
    SIGNAL Q_N   : std_logic;

BEGIN

    ----------------------------------------------------------------
    -- MUX 1: LOAD control
    --
    -- LOAD = 0 → keep old Q
    -- LOAD = 1 → load new D
    ----------------------------------------------------------------

    LOAD_MUX: MUX_2to1
        PORT MAP(
            I0 => Q_INT,
            I1 => D,
            S  => LOAD,
            Y  => LOAD_DATA
        );


    ----------------------------------------------------------------
    -- MUX 2: RESET control
    --
    -- RESET = 0 → use LOAD_DATA
    -- RESET = 1 → use 0
    --
    -- Because reset is applied BEFORE the D flip-flop,
    -- this is a synchronous reset.
    ----------------------------------------------------------------

    RESET_MUX: MUX_2to1
        PORT MAP(
            I0 => LOAD_DATA,
            I1 => '0',
            S  => RESET,
            Y  => DFF_INPUT
        );


    ----------------------------------------------------------------
    -- D Flip-Flop
    ----------------------------------------------------------------

    DFF: D_Flip_Flop
        PORT MAP(
            D   => DFF_INPUT,
            CLK => CLK,
            Q   => Q_INT,
            Q_N => Q_N
        );


    ----------------------------------------------------------------
    -- Output
    ----------------------------------------------------------------

    Q <= Q_INT;

END Structural;