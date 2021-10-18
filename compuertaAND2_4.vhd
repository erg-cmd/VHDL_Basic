-- 05.04.12 -------------------------------- compuertaAND2_4.vhd  
-- COMPUERTA AND DE 2 ENTRADAS

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

----------------------------------------------------------------
entity compuertaAND2_4 is
 	port(a, b 	: in  std_logic;
		 y	    : out std_logic);
end entity compuertaAND2_4;

----------------------------------------------------------------
-- DESCRIPCIÓN USANDO SUMA DE MINITÉRMINOS (COMPORTAMIENTO)

architecture tabla_de_verdad of compuertaAND2_4 is 
	signal   entradas: std_logic_vector (1 downto 0);
begin
	entradas <= b & a;
	
	with entradas select
	y <= '1' when "11",
	     '0' when "00"|"01"|"10",
	     'X' when others;
	     
end architecture tabla_de_verdad;
----------------------------------------------------------------