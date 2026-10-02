LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUX_2to1 IS
    PORT(
        I0 : IN  std_logic;
        I1 : IN  std_logic;
        S  : IN  std_logic;
        Y  : OUT std_logic
    );
END MUX_2to1;

ARCHITECTURE Structural OF MUX_2to1 IS

    -- NAND Gate Component
    COMPONENT Nand_Gate
        PORT(
            A : IN  std_logic;
            B : IN  std_logic;
            Y : OUT std_logic
        );
    END COMPONENT;

    -- Internal signals
    signal S_not : std_logic;
    signal N1    : std_logic;
    signal N2    : std_logic;

BEGIN

    -- Generate NOT S
    -- S_not = S NAND S
    NAND1: Nand_Gate PORT MAP(
        A => S,
        B => S,
        Y => S_not
    );

    -- First NAND
    -- N1 = NOT(I0 AND S_not)
    NAND2: Nand_Gate PORT MAP(
        A => I0,
        B => S_not,
        Y => N1
    );

    -- Second NAND
    -- N2 = NOT(I1 AND S)
    NAND3: Nand_Gate PORT MAP(
        A => I1,
        B => S,
        Y => N2
    );

    -- Final NAND
    -- Y = I0.S' + I1.S
    NAND4: Nand_Gate PORT MAP(
        A => N1,
        B => N2,
        Y => Y
    );

END Structural;