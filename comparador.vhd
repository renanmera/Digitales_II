library ieee;
use IEEE.std_logic_1164.all;

entity comparador is
port(A,B: in std_logic_vector(9 downto 0);
mayor, menor, igual: out std_logic);  --declaración variables de 
END comparador;

architecture situacion of comparador is

begin

	mayor <= '1' when (A>B)else '0'; --A > B, salida mayor a 1, resto a 0

	menor <= '1' when (A<B)else '0'; --A<B, salida menor a 1, resto a 0 

	igual <= '1' when (A=B)else '0'; --A=B, salida igual a 1, resto a 0

END situacion;

