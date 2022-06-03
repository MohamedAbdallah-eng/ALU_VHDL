LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
----------------------------------------------------------------------
ENTITY tb_ALU IS
END tb_ALU;
----------------------------------------------------------------------
ARCHITECTURE behavior OF tb_ALU IS
 -- Component Declaration for the Unit Under Test (UUT)
 COMPONENT ALU
 PORT(
 a: IN std_logic_vector(3 downto 0);
 b : IN std_logic_vector(3 downto 0);
 ALU_Sel : IN std_logic_vector(3 downto 0);
 ALU_Out : out STD_LOGIC_VECTOR(4 downto 0)
 );
END COMPONENT;
----------------------------------------------------------------------
 --Inputs
 signal a : std_logic_vector(3 downto 0) := (others => '0');
 signal b : std_logic_vector(3 downto 0) := (others => '0');
 signal ALU_Sel : std_logic_vector(3 downto 0) := (others => '0');
 constant t: time:= 50 ns;
 --Outputs
 signal ALU_Out : STD_LOGIC_VECTOR(4 downto 0);
----------------------------------------------------------------------
BEGIN
 -- Instantiate the Unit Under Test (UUT)
 uut: ALU PORT MAP (a => a,b => b,ALU_Sel => ALU_Sel,ALU_Out => ALU_Out);-- Stimulus process
stim_proc: process
 begin
 a<="0101";
 b<="1011";
 ALU_Sel<="0000";---inc a
 wait for t;
 ALU_Sel<="0001";---dec a
 wait for t;
 ALU_Sel<="0010" ; ---transfer b
 wait for t;
 ALU_Sel<="0011";---inc b
 wait for t;
 ALU_Sel<="0100";---dec b
 wait for t;
 ALU_Sel<="0101";---transfer a
 wait for t;
 ALU_Sel<="0110";---add a and b
 wait for t;
 ALU_Sel<="0111";---multiply by 2
 wait for t;
 ALU_Sel<="1000";---COMPLEMENT A
 wait for t;
 ALU_Sel<="1001";---COMPLEMENT B
 wait for t;
 ALU_Sel<="1010"; ----AND
 wait for t;
 ALU_Sel<="1011"; --OR
 wait for t;
 ALU_Sel<="1100";---XOR
 wait for t;
 ALU_Sel<="1101";---XNOR
 wait for t;
 ALU_Sel<="1110"; ----NAND
 wait for t;
 ALU_Sel<="1111"; --NOR
 wait;
end process;
END;

