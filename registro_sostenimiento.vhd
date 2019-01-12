library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity registro_sostenimiento is
GENERIC( n : integer :=  10);
	Port ( resetn,clk: in STD_LOGIC;
		Enable : in STD_LOGIC;
		entrada: in STD_LOGIC_VECTOR(n-1 downto 0);
		Q: out STD_LOGIC_VECTOR(n-1 downto 0));
end registro_sostenimiento;

Architecture sol of registro_sostenimiento is
Begin

	process (resetn,CLK)
	begin
		if resetn ='0' then Q <= (others=>'0');
		elsif (clk'event and clk='1') then
			if enable='1' then
				Q<= entrada;
			end if;
		end if;
end process;	
end sol;