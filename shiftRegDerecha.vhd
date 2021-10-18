-- 22.10.12 ---------------------- shiftRegDerecha.vhd
-- REGISTRO DE DESPLAZAMIENTO DE N BITS, ACTIVO 
-- POR FLANCO ASCENDENTE, CON RESET SINCRONICO
library ieee;   
use ieee.std_logic_1164.all;

-----------------------------------------------------
entity shiftRegDerecha is
	generic(N	: integer := 5);
	port(SI		: in  std_logic;
		  reloj	: in  std_logic;
		  reset 	: in  std_logic;
		  Q		: out std_logic_vector(N-1 downto 0));
end entity shiftRegDerecha;

-----------------------------------------------------
architecture algorit of shiftRegDerecha is
	signal auxQ: std_logic_vector(N-1 downto 0);
begin
	process (reloj) begin
		if rising_edge(reloj) then
			if reset ='1' then
				auxQ <= (others => '0');
			else
				auxQ <= SI & auxQ(N-1 downto 1);
			end if;
		end if;
	end process;
	Q <= auxQ;
end architecture algorit;
-----------------------------------------------------