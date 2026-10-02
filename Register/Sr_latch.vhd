LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SR_Latch IS
    PORT(
        S_N : IN  std_logic;   -- Active-low Set
        R_N : IN  std_logic;   -- Active-low Reset
        Q   : OUT std_logic;
        Q_N : OUT std_logic
    );
END SR_Latch;


ARCHITECTURE Structural OF SR_Latch IS

    COMPONENT Nand_Gate
        PORT(
            A : IN  std_logic;
            B : IN  std_logic;
            Y : OUT std_logic
        );
    END COMPONENT;

    SIGNAL Q_INT  : std_logic;
    SIGNAL QN_INT : std_logic;

BEGIN

    -- NAND gate for Q
    NAND1: Nand_Gate
        PORT MAP(
            A => S_N,
            B => QN_INT,
            Y => Q_INT
        );

    -- NAND gate for Q_N
    NAND2: Nand_Gate
        PORT MAP(
            A => R_N,
            B => Q_INT,
            Y => QN_INT
        );

    Q   <= Q_INT;
    Q_N <= QN_INT;

END Structural;