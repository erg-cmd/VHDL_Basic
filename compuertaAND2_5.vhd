-- 05.04.12 ------------------- compuertaAND2_5.vhd  
-- COMPUERTA AND DE 2 ENTRADAS

library ieee;
use ieee.std_logic_1164.all;

---------------------------------------------------
entity compuertaAND2_5 is
	port (a, b	: in  std_logic;
		  y		: out std_logic);
end compuertaAND2_5;

---------------------------------------------------
-- DESCRIPCIÓN POR ECUACIONES (COMPORTAMIENTO)
architecture ecuaciones of compuertaAND2_5 is begin

	y <= a and b;

end ecuaciones;
---------------------------------------------------