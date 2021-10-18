-- 02.04.10 ----------------------------- compuertaNAND_n.vhd
-- NAND GENERICA DE N ENTRADAS

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------
entity compuertaNAND_n is
	generic (n 			: integer := 2);
	port 	(entradas	: in  std_logic_vector (n-1 downto 0);
			 salida		: out std_logic);
end entity compuertaNAND_n;

--------------------------------------------------------------
architecture arq of compuertaNAND_n is begin
	process (entradas)
		variable aux : std_logic;
	begin
		aux := '1';
		for i in 0 to n-1 loop
			aux := aux and entradas(i);
		end loop;
		salida <= not aux;
	end process;
end architecture arq;
--------------------------------------------------------------