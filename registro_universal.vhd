library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity registro_universal is
	Port ( D: in STD_LOGIC_VECTOR(10 downto 0);
		S : in STD_LOGIC_VECTOR(1 downto 0);
		CLK, R, L, RESETn, enable: in STD_LOGIC;
		Q: out STD_LOGIC_VECTOR(10 downto 0));
end registro_universal;

Architecture sol of registro_universal is
SIGNAL Q1: STD_LOGIC_VECTOR(10 downto 0);
Begin
	Q <= Q1;
	process (RESETn,CLK)
	begin
		if resetn ='0' then Q1 <= (others=>'0');
		elsif (clk'event and clk='1' and enable='1') then
		case S is
			when "00"=>  Q1<=Q1;
			when "01"=>  Q1<=R & Q1 (10 downto 1);
			when "10"=>  Q1<=Q1 (9 downto 0) & L;
			when "11"=>  Q1<=D (10 downto 0);
			when others => Q1<=Q1;
		end case;
		end if;
	end process;	
end sol;