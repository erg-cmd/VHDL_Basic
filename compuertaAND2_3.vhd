-- 03.04.12 -------------------------------- compuertaAND2_3.vhd  
-- COMPUERTA AND DE 2 ENTRADAS

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

----------------------------------------------------------------
entity compuertaAND2_3 is
 	port(a, b 	: in  std_logic;
		 y	    : out std_logic);
end entity compuertaAND2_3;

----------------------------------------------------------------
-- DESCRIPCIÓN USANDO TABLA DE VERDAD Y PUNTERO (COMPORTAMIENTO)

architecture tabla_de_verdad of compuertaAND2_3 is 
	signal   entradas: std_logic_vector (1 downto 0);
	constant COLUMNA : std_logic_vector (0 to 3) := "0001";
begin
	entradas <= b & a;
	y        <= COLUMNA(to_integer(unsigned(entradas)));
		 
end architecture tabla_de_verdad;
----------------------------------------------------------------