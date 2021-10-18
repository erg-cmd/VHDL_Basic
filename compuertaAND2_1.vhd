-- 02.04.12 --------------------------- compuertaAND2_1.vhd  
-- COMPUERTA AND DE 2 ENTRADAS QUE PUEDEN VALER "0" O
-- "1" SOLAMENTE

library ieee;
use ieee.std_logic_1164.all;

-----------------------------------------------------------
entity compuertaAND2_1 is
 	port (a, b 	: in  std_logic;
		  y	    : out std_logic);
end entity compuertaAND2_1;

-----------------------------------------------------------
-- DESCRIPCIÓN POR FLUJO DE DATOS (COMPORTAMIENTO)
-- CONDICIONES NO MUTUAMENTE EXCLUYENTES. SE GENERA
-- PRIORIDAD

architecture flujo_de_datos of compuertaAND2_1 is begin

	y <=  a  when b='1' else	                
		 '0' when b='0' else
		 'X';                          
		 
end architecture flujo_de_datos;
-----------------------------------------------------------
-- Se trata de sentencias condicionadas, las condiciones 
-- no son mutuamente excluyentes. Se realiza una asignación
-- si se cumple una determinada condición. El valor de 
-- verdad de las condiciones se analiza en un determinado 
-- orden generándose así una PRIORIDAD dada por el orden en
-- que se colocan las condiciones. Las condiciones pueden
-- analizar el valor de verdad de distintas señales por lo
-- tanto no son condiciones mutuamente excluyentes.
-----------------------------------------------------------