-- 03.04.10 --------------- instanciadoConPackage_1.vhd
-- DESCRIPCIÓN ESTRUCTURAL DE UN CIRCUITO COMBINACIONAL 

library ieee;
use ieee.std_logic_1164.all;
library MiBiblioteca;
use MiBiblioteca.misComponentes.all;

-------------------------------------------------------
entity instanciadoConPackage_1 is
	port(a, b, c, d	:in	 std_logic;
		 u, v		:out std_logic);
end entity instanciadoConPackage_1;

-------------------------------------------------------	
architecture estructural of instanciadoConPackage_1 is
	signal w: std_logic;
begin		
	u1: inversor        port map(entrada     => b, 
								 salida      => w);
	u2: compuertaNAND_n port map(entradas(0) => a, 
								 entradas(1) => b, 
								 salida      => u);
	u3: compuertaNAND_n generic map(n => 3)
						port map(entradas(0) => w, 
								 entradas(1) => c, 
								 entradas(2) => d, 
								 salida 	 => v);		
end estructural;	
-------------------------------------------------------	