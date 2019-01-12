library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1 is
GENERIC( n : integer :=  10);
    Port ( SEL : in  STD_LOGIC;
           A   : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B   : in  STD_LOGIC_VECTOR (n-1 downto 0);
           OUTPUT   : out STD_LOGIC_VECTOR (n-1 downto 0));
end mux_2to1;

architecture Behavioral of mux_2to1 is
begin
    OUTPUT <= A when (SEL = '0') else B;
end Behavioral;