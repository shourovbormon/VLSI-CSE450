library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ACC_SRC: "00" = immediate, "01" = ALU result, "10" = R register.
-- ALU_SEL: "00" = ADD, "01" = SUB.
entity control_unit is
    Port (
        OPCODE  : in  STD_LOGIC_VECTOR(3 downto 0);
        ACC_WE  : out STD_LOGIC;
        R_WE    : out STD_LOGIC;
        Z_WE    : out STD_LOGIC;
        ALU_SEL : out STD_LOGIC_VECTOR(1 downto 0);
        ACC_SRC : out STD_LOGIC_VECTOR(1 downto 0)
    );
end control_unit;

architecture Behavioral of control_unit is
begin
    process(OPCODE)
    begin
        -- Safe default: NOP; state registers hold and PC still advances.
        ACC_WE  <= '0';
        R_WE    <= '0';
        Z_WE    <= '0';
        ALU_SEL <= "00";
        ACC_SRC <= "00";

        case OPCODE is
            when "0001" => -- LDI immediate
                ACC_WE <= '1';
                Z_WE   <= '1';
                ACC_SRC <= "00";

            when "0010" => -- ADD immediate
                ACC_WE  <= '1';
                Z_WE    <= '1';
                ALU_SEL <= "00";
                ACC_SRC <= "01";

            when "0011" => -- SUB immediate
                ACC_WE  <= '1';
                Z_WE    <= '1';
                ALU_SEL <= "01";
                ACC_SRC <= "01";

            when "1010" => -- STA: R <- ACC; ACC and Z hold
                R_WE <= '1';

            when "1011" => -- LDR: ACC <- R
                ACC_WE  <= '1';
                Z_WE    <= '1';
                ACC_SRC <= "10";

            when others =>
                null;
        end case;
    end process;
end Behavioral;