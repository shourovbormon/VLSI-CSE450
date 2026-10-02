library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nand_Gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end Nand_Gate;

architecture Behavioral of Nand_Gate is

begin

    Y <= A NAND B;

end Behavioral;