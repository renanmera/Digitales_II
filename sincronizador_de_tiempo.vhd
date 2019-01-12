	library ieee;
	use ieee. std_logic_1164.all;

	
entity sincronizador_de_tiempo is
PORT( senal,resetn, CLOCK: in std_logic;
	senal_sincronica: out std_logic);
end sincronizador_de_tiempo;

architecture behavioral of sincronizador_de_tiempo is

component flipflop_D is
	PORT( D,resetn, CLOCK: in std_logic;
			Q: out std_logic);
end component;

signal salida1,salida2 : std_logic;

begin

flfl1 : flipflop_D port map(senal,resetn,clock,salida1);
flfl2 : flipflop_D port map(salida1,resetn,clock,salida2);

senal_sincronica <= salida1 and (not salida2);

end behavioral;
