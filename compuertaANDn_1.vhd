-- 07.04.12 -------------------------------- compuertaANDn_1.vhd  
-- COMPUERTA NAND GENÉRICA DE n ENTRADAS

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------
entity compuertaANDn_1 is
	generic(n: positive := 4);
 	port   (entradas 	: in  std_logic_vector(n-1 downto 0);
		    salida	    : out std_logic);
end entity compuertaANDn_1;

-------------------------------------------------------------------
-- DESCRIPCIÓN POR FLUJO DE DATOS (COMPORTAMIENTO)

architecture flujo_de_datos of compuertaANDn_1 is begin

	process (entradas) 
		variable aux : std_logic;
	begin
		aux := '1';	-- se debe poner en '1' cada vez que se dispara
		for i in n-1 downto 0 loop
			if entradas(i) = '0' then 
				aux := '0';
			end if;
		end loop;
		salida <= aux;
	end process;
	
end architecture flujo_de_datos;
-------------------------------------------------------------------