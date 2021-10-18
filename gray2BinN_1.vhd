-- 06.07.11 ------------------------------------- Gray2BinN_1.vhd
-- CONVERSOR DE CÓDIGO GRAY A BINARIO DE n BITS

library ieee; 
use ieee.std_logic_1164.all;

-----------------------------------------------------------------
entity gray2BinN_1 is
	generic(n: integer := 4);       -- por defecto será de 4 bits
	port   (G	: in  std_logic_vector (n-1 downto 0);
		    B	: out std_logic_vector (n-1 downto 0));
end entity gray2BinN_1;

-----------------------------------------------------------------
-- DESCRIPCIÓN USANDO LA FUNCIÓN XOR ENTRE VECTORES
-- USANDO SEÑAL AUXILIAR PARA PODER LEERLA Y ESCRIBIRLA (ESTÁ A
-- LA DERECHA Y A LA IZQUIERDA DE LA ASIGNACIÓN)     

architecture bhv1 of gray2BinN_1 is
	signal auxB	: std_logic_vector (n-1 downto 0); 
begin

	auxB(n-1) 		   <= G(n-1);
	auxB(n-2 downto 0) <= auxB(n-1 downto 1) xor G(n-2 downto 0);
	
	B <= auxB; 	-- Asigno el resultado (nro. binario) a la salida
	
end architecture bhv1;
-----------------------------------------------------------------