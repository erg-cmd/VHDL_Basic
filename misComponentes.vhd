-- 02.04.10 ----------------------------- misComponentes.vhd
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
package misComponentes is

	component inversor is
	port(entrada  : in  std_logic;
	     salida   : out std_logic);
	end component inversor;
	
	--------------------------------------------------------
	component compuertaNAND_n is
	generic(n 		  : integer := 2);
	port   (entradas  : in  std_logic_vector (n-1 downto 0);
			salida	  : out std_logic);
	end component compuertaNAND_n;

end package misComponentes;
------------------------------------------------------------