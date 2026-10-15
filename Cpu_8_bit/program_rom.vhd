library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_rom is
    Port (
        ADDR  : in  STD_LOGIC_VECTOR(3 downto 0);
        INSTR : out STD_LOGIC_VECTOR(11 downto 0)
    );
end program_rom;

architecture Behavioral of program_rom is
    type rom_t is array (0 to 15) of STD_LOGIC_VECTOR(11 downto 0);

    -- Exact Set 8 program from the CSE 450 project specification.
    constant ROM : rom_t := (
        0 => x"164", -- LDI 0x64
        1 => x"A00", -- STA
        2 => x"314", -- SUB 0x14
        3 => x"20A", -- ADD 0x0A
        4 => x"A00", -- STA
        5 => x"35A", -- SUB 0x5A
        6 => x"B00", -- LDR
        7 => x"360", -- SUB 0x60
        others => x"000" -- NOP
    );
begin
    -- Combinational read: no clock is needed for ROM.
    INSTR <= ROM(to_integer(unsigned(ADDR)));
end Behavioral;