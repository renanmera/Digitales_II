library ieee; 
use ieee.std_logic_1164.all; 
library altera; 
use altera.altera_syn_attributes.all; 
ENTITY bcd7 IS 
port 
( 
F : out std_logic_vector(6 downto 0); 
x3 : in std_logic_vector(3 downto 0) 
); 
END bcd7; 
ARCHITECTURE ppl_type OF bcd7 IS 
BEGIN 
with x3 select 
F <=  
"0110000" when "0001", 
"1101101" when "0010", 
"1111001" when "0011", 
"0110011" when "0100", 
"1011011" when "0101", 
"1011111" when "0110", 
"1110000" when "0111", 
"1111111" when "1000", 
"1111011" when "1001", 
"1111110" when OTHERS;
END ppl_type;
