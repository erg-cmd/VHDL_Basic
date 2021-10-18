-- 02.04.12 ---------------------------- compuertaAND2_2.vhd  
-- COMPUERTA AND DE 2 ENTRADAS

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
entity compuertaAND2_2 is
 	port (a, b 	: in  std_logic;
		  y	    : out std_logic);
end entity compuertaAND2_2;

------------------------------------------------------------
-- DESCRIPCIÓN USANDO TABLA DE VERDAD (COMPORTAMIENTO)
-- NO HAY PRIORIDAD. CONDICIONES MUTUAMENTE EXCLUYENTES

architecture tabla_de_verdad of compuertaAND2_2 is 
	signal entradas: std_logic_vector (1 downto 0);
begin
	entradas <= b & a;
	
	with entradas select
	y <= '0' when "00",	                
		 '0' when "01",
		 '0' when "10",
		 '1' when "11",
		 'X' when others;             -- indeterminado
		 
end architecture tabla_de_verdad;
------------------------------------------------------------
-- Con este tipo de descripción se selecciona una de las
-- posibles combinaciones que puede tomar una determinada 
-- señal ("y" puede valer ó "0" ó "1" ó "X"). Como se 
-- trata de seleccionar una entre las posibles combinaciones
-- no hay prioridad porque solamente una de las condiciones 
-- es verdadera, resultando ser condiciones mutuamente
-- EXCLUYENTES. Se deben incluir TODAS las combinaciones
-- posibles o sino usar la sentencia:
--              'X' when others;
-- de lo contrario puede que no se comporte como un circuito 
-- combinacional.
------------------------------------------------------------