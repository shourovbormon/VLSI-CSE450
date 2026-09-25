LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Full_adder_8bit IS
    PORT(
        A    : IN  std_logic_vector(7 downto 0);
        B    : IN  std_logic_vector(7 downto 0);
        Cin  : IN  std_logic;
        Sum  : OUT std_logic_vector(7 downto 0);
        Cout : OUT std_logic
    );
END Full_adder_8bit;

ARCHITECTURE Structural OF Full_adder_8bit IS

    -- Component Declaration for 1-bit Full Adder
    COMPONENT Full_adder
    PORT(
        A    : IN  std_logic;
        B    : IN  std_logic;
        Cin  : IN  std_logic;
        Sum  : OUT std_logic;
        Cout : OUT std_logic
    );
    END COMPONENT;

    -- Internal carry signals
    signal C : std_logic_vector(8 downto 0);

BEGIN

    -- Initial carry
    C(0) <= Cin;

    -- Bit 0
    FA0: Full_adder PORT MAP(
        A    => A(0),
        B    => B(0),
        Cin  => C(0),
        Sum  => Sum(0),
        Cout => C(1)
    );

    -- Bit 1
    FA1: Full_adder PORT MAP(
        A    => A(1),
        B    => B(1),
        Cin  => C(1),
        Sum  => Sum(1),
        Cout => C(2)
    );

    -- Bit 2
    FA2: Full_adder PORT MAP(
        A    => A(2),
        B    => B(2),
        Cin  => C(2),
        Sum  => Sum(2),
        Cout => C(3)
    );

    -- Bit 3
    FA3: Full_adder PORT MAP(
        A    => A(3),
        B    => B(3),
        Cin  => C(3),
        Sum  => Sum(3),
        Cout => C(4)
    );

    -- Bit 4
    FA4: Full_adder PORT MAP(
        A    => A(4),
        B    => B(4),
        Cin  => C(4),
        Sum  => Sum(4),
        Cout => C(5)
    );

    -- Bit 5
    FA5: Full_adder PORT MAP(
        A    => A(5),
        B    => B(5),
        Cin  => C(5),
        Sum  => Sum(5),
        Cout => C(6)
    );

    -- Bit 6
    FA6: Full_adder PORT MAP(
        A    => A(6),
        B    => B(6),
        Cin  => C(6),
        Sum  => Sum(6),
        Cout => C(7)
    );

    -- Bit 7
    FA7: Full_adder PORT MAP(
        A    => A(7),
        B    => B(7),
        Cin  => C(7),
        Sum  => Sum(7),
        Cout => C(8)
    );

    -- Final carry
    Cout <= C(8);

END Structural;