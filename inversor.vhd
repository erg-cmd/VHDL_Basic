-- 02.04.10 -------------------------- inversor.vhd  
library ieee;
use ieee.std_logic_1164.all;

---------------------------------------------------
entity inversor is
	port (entrada	: in  std_logic;
	      salida	: out std_logic);
end entity inversor;

---------------------------------------------------	
architecture arq of inversor is begin

	salida <= NOT entrada;
	
end arq;	
---------------------------------------------------