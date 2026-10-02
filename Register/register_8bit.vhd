LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY register_8bit IS
    PORT(
        CLK   : IN  std_logic;
        RESET : IN  std_logic;
        LOAD  : IN  std_logic;
        D     : IN  std_logic_vector(7 downto 0);
        Q     : OUT std_logic_vector(7 downto 0)
    );
END register_8bit;


ARCHITECTURE Structural OF register_8bit IS

    COMPONENT register_1bit
        PORT(
            CLK   : IN  std_logic;
            RESET : IN  std_logic;
            LOAD  : IN  std_logic;
            D     : IN  std_logic;
            Q     : OUT std_logic
        );
    END COMPONENT;

BEGIN

    REG0: register_1bit
        PORT MAP(
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(0),
            Q     => Q(0)
        );

    REG1: register_1bit
        PORT MAP(
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(1),
            Q     => Q(1)
        );

    REG2: register_1bit
        PORT MAP(
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(2),
            Q     => Q(2)
        );

    REG3: register_1bit
        PORT MAP(
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(3),
            Q     => Q(3)
        );

    REG4: register_1bit
        PORT MAP(
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(4),
            Q     => Q(4)
        );

    REG5: register_1bit
        PORT MAP(
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(5),
            Q     => Q(5)
        );

    REG6: register_1bit
        PORT MAP(
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(6),
            Q     => Q(6)
        );

    REG7: register_1bit
        PORT MAP(
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(7),
            Q     => Q(7)
        );

END Structural;