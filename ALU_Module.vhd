library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
 --------------------------------------------------------------------
entity ALU is
Port (
 a, b : in STD_LOGIC_VECTOR(3 downto 0);                    -- 2 inputs 4-bit
 ALU_Sel : in STD_LOGIC_VECTOR(3 downto 0);                 -- 1 input 4-bit for selecting function
 ALU_Out : out STD_LOGIC_VECTOR(4 downto 0)                 -- 1 output 5-bit
  );
end ALU;
 --------------------------------------------------------------------
architecture behavior of ALU is
signal ALU_Result_Arithimatic : std_logic_vector (4 downto 0);
signal ALU_Result_Logical : std_logic_vector (3 downto 0);
begin
 --------------------------------------------------------------------
process(a,b,ALU_Sel)
begin
case(ALU_Sel(2 downto 0)) is
when "110" =>                                                      -- Addition
ALU_Result_Arithimatic <= ('0' & A) + ('0' & B) ;
when "001" =>                                                      --- dec a
ALU_Result_Arithimatic <= ('0' & A) - "00001";
when "000" =>                                                      ---inc a
ALU_Result_Arithimatic <= ('0' & A) + "00001";
when "100" =>                                                      ---dec b
ALU_Result_Arithimatic <= ('0' & B) - "00001";
when "011" =>                                                      ---inc b
ALU_Result_Arithimatic <= ('0' & B) + "00001";
when "010" =>                                                      ---transfer b
ALU_Result_Arithimatic <= ('0' & B) ;
when "101" =>                                                      ---transfer a
ALU_Result_Arithimatic <= ('0' & A) ;
when others =>                                                     ---multply by 2
ALU_Result_Arithimatic <= ('0' & A) + ('0' & A);
end case;
 ------------------------------------------------------------------
case(ALU_Sel(2 downto 0)) is
when "010" =>                                                      -- Logical and
ALU_Result_Logical <= A and B;
when "011" =>                                                      -- Logical or
ALU_Result_Logical <= A or B;
when "100" =>                                                      -- Logical xor
ALU_Result_Logical <= A xor B;
when "110" =>                                                      -- Logical nand
ALU_Result_Logical <= A nand B;
when "101" =>                                                      -- Logical xnor
ALU_Result_Logical <= A xnor B; 
when"000"=>                                                        --Complement a (1's complement)
ALU_Result_Logical <= not A;
when"001"=>                                                        --Complement b (1'scomplement);
ALU_Result_Logical <= not B;
when others =>                                                     -- Logical nor
ALU_Result_Logical <= A nor B;
end case;
end process;
 ------------------------------------------------------------------
With (ALU_Sel(3)) SELECT 
ALU_Out <= ALU_Result_Arithimatic when '0',
          ('0' & ALU_Result_Logical) when others;
 ------------------------------------------------------------------
end behavior ;


