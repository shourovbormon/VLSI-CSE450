LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY D_Flip_Flop IS
    PORT(
        D   : IN  std_logic;
        CLK : IN  std_logic;
        Q   : OUT std_logic;
        Q_N : OUT std_logic
    );
END D_Flip_Flop;


ARCHITECTURE Structural OF D_Flip_Flop IS

    COMPONENT Nand_Gate
        PORT(
            A : IN  std_logic;
            B : IN  std_logic;
            Y : OUT std_logic
        );
    END COMPONENT;

    COMPONENT SR_Latch
        PORT(
            S_N : IN  std_logic;
            R_N : IN  std_logic;
            Q   : OUT std_logic;
            Q_N : OUT std_logic
        );
    END COMPONENT;

    SIGNAL D_N   : std_logic;
    SIGNAL CLK_N : std_logic;

    SIGNAL S_M : std_logic;
    SIGNAL R_M : std_logic;

    SIGNAL Q_M   : std_logic;
    SIGNAL Q_M_N : std_logic;

    SIGNAL S_S : std_logic;
    SIGNAL R_S : std_logic;

    SIGNAL Q_S   : std_logic;
    SIGNAL Q_S_N : std_logic;

BEGIN

    -- NOT D
    NAND_D: Nand_Gate
        PORT MAP(
            A => D,
            B => D,
            Y => D_N
        );

    -- NOT CLK
    NAND_CLK: Nand_Gate
        PORT MAP(
            A => CLK,
            B => CLK,
            Y => CLK_N
        );


    ---------------------------------------------------------------
    -- MASTER
    -- Active when CLK = 1
    ---------------------------------------------------------------

    NAND_SM: Nand_Gate
        PORT MAP(
            A => D,
            B => CLK,
            Y => S_M
        );

    NAND_RM: Nand_Gate
        PORT MAP(
            A => D_N,
            B => CLK,
            Y => R_M
        );

    MASTER: SR_Latch
        PORT MAP(
            S_N => S_M,
            R_N => R_M,
            Q   => Q_M,
            Q_N => Q_M_N
        );


    ---------------------------------------------------------------
    -- SLAVE
    -- Active when CLK = 0
    ---------------------------------------------------------------

    NAND_SS: Nand_Gate
        PORT MAP(
            A => Q_M,
            B => CLK_N,
            Y => S_S
        );

    NAND_RS: Nand_Gate
        PORT MAP(
            A => Q_M_N,
            B => CLK_N,
            Y => R_S
        );

    SLAVE: SR_Latch
        PORT MAP(
            S_N => S_S,
            R_N => R_S,
            Q   => Q_S,
            Q_N => Q_S_N
        );


    Q   <= Q_S;
    Q_N <= Q_S_N;

END Structural;