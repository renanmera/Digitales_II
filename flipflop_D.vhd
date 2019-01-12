	library ieee;
	use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
entity flipflop_D is
PORT( D,resetn, CLOCK: in std_logic;
Q: out std_logic);
end flipflop_D;

architecture behavioral of flipflop_D is
begin
process(resetn,CLOCK)
begin
if(resetn='0' ) then Q<= '0';

elsif(CLOCK='1' and CLOCK'EVENT) then
Q <= D;
end if;

end process;

end behavioral;
