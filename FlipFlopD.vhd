-- 18.09.12 ----------------------- FlipFlopD.vhd
-- FLIP FLOP D DISPARADO POR FLANCO POSITIVO 

library ieee;  
use ieee.std_logic_1164.all;

---------------------------------------------------
entity FlipFlopD is
	port( D, reloj	: in  std_logic; 
	      Q 		: out std_logic);
end entity FlipFlopD;

---------------------------------------------------
architecture simple of FlipFlopD is begin
	process (reloj) begin
		if rising_edge(reloj) then
			Q <= D;
		end if;
	end process;						
end architecture simple;
---------------------------------------------------