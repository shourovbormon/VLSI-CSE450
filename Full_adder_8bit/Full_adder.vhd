LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Full_adder IS
    PORT(
        A    : IN  std_logic;
        B    : IN  std_logic;
        Cin  : IN  std_logic;
        Sum  : OUT std_logic;
        Cout : OUT std_logic
    );
END Full_adder;

ARCHITECTURE Structural OF Full_adder IS

    -- NAND Gate Component
    COMPONENT Nand_Gate
        PORT(
            A : IN  std_logic;
            B : IN  std_logic;
            Y : OUT std_logic
        );
    END COMPONENT;

    -- Internal signals
    signal n1, n2, n3, xor_ab : std_logic;
    signal n4, n5, n6, xor_sum : std_logic;
    signal n7, n8, n9 : std_logic;

BEGIN

    ----------------------------------------------------------------
    -- XOR1 = A XOR B
    -- NAND implementation:
    ----------------------------------------------------------------

    NAND1: Nand_Gate PORT MAP(
        A => A,
        B => B,
        Y => n1
    );

    NAND2: Nand_Gate PORT MAP(
        A => A,
        B => n1,
        Y => n2
    );

    NAND3: Nand_Gate PORT MAP(
        A => B,
        B => n1,
        Y => n3
    );

    NAND4: Nand_Gate PORT MAP(
        A => n2,
        B => n3,
        Y => xor_ab
    );


    ----------------------------------------------------------------
    -- SUM = (A XOR B) XOR Cin
    ----------------------------------------------------------------

    NAND5: Nand_Gate PORT MAP(
        A => xor_ab,
        B => Cin,
        Y => n4
    );

    NAND6: Nand_Gate PORT MAP(
        A => xor_ab,
        B => n4,
        Y => n5
    );

    NAND7: Nand_Gate PORT MAP(
        A => Cin,
        B => n4,
        Y => n6
    );

    NAND8: Nand_Gate PORT MAP(
        A => n5,
        B => n6,
        Y => Sum
    );


    ----------------------------------------------------------------
    -- CARRY = AB + Cin(A XOR B)
    ----------------------------------------------------------------

    NAND9: Nand_Gate PORT MAP(
        A => A,
        B => B,
        Y => n7
    );

    NAND10: Nand_Gate PORT MAP(
        A => xor_ab,
        B => Cin,
        Y => n8
    );

    NAND11: Nand_Gate PORT MAP(
        A => n7,
        B => n8,
        Y => Cout
    );

END Structural;