LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;

ENTITY controlador IS
	PORT(clock,reset,start,un_min,fin: IN STD_LOGIC;
		 cargar_datos,escribir_en_memoria,activar_funcionamiento,
		 next_number,mostrar_fin,resetear,enable_registro: OUT STD_LOGIC);
END controlador;

ARCHITECTURE sol OF controlador IS
Type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th);
SIGNAL y:estado;
BEGIN
	PROCESS(reset,clock)
	BEGIN
		if reset='0' then y<=Ta;
  		elsif (clock'event and clock='1') then
			case y is
				when Ta=> 	if start='1' then y<=Tb;
								else y<=Ta;
								end if;
				when Tb=>	if start='1' then y<=Tb;
								else y<=Tc;
								end if;
				when Tc=>	y<=Td;
				when Td=>	if (fin or un_min)='1' then y<=Th;
								else y<=Td;
								end if;
				when Th=>	y<=Te;	
				when Te=>	y<=Tf;
				when Tf=>	if fin='1' then y<=Tg;
								end if;
				when Tg=>   if start='0' then y<=Tg;
								else y<=Tb;
								end if;
			end case;
		end if;
	END PROCESS;
	
PROCESS(y,un_min,fin)
	BEGIN
		cargar_datos<='0';escribir_en_memoria<='0';activar_funcionamiento<='0';
		next_number<='0';mostrar_fin<='0';resetear<='1';enable_registro<='0';

			case y is
				when Ta=>	resetear<='0';
				when Tb=>	enable_registro<='1';
				when Tc=>	activar_funcionamiento<='1';
				when Td=>	if (fin or un_min)='1' then cargar_datos<='1';end if;
				when Te=>	escribir_en_memoria<='1';
				when Th=>   --
				when Tf=>	escribir_en_memoria<='1'; next_number<='1';
				when Tg=>   mostrar_fin<='1';resetear<='0';
			end case;
	END PROCESS;
END sol;

