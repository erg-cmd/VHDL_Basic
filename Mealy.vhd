-- 07.11.12 -------------------------------------------- Mealy.vhdl
-- DESCRIPCIÓN DE UNA MAQUINA DE ESTADO MEALY 

library ieee;  
use ieee.std_logic_1164.all;

-------------------------------------------------------------------
entity Mealy is
	port( entrada : in  std_logic; 
	      reset	  : in  std_logic;
	      reloj	  : in  std_logic;
	      salida  : out std_logic);
end entity Mealy;

-------------------------------------------------------------------
-- ESTADO INICIAL: a, SEÑAL DE RELOJ ACTIVA POR FLANCO ASCENDENTE

architecture arq of Mealy is 
	type estado is (a, b, c);
	signal actual, proximo 	: estado;
begin

	-- DESCRIPCIÓN DE LA PARTE SECUENCIAL --------------------------
	process (reloj) begin
		if rising_edge(reloj) then 	  
			if reset='1' then
            actual <= a;
         else      
            actual <= proximo;
         end if;
      end if;
	end process;

	-- DESCRIPCIÓN DE LA PARTE COMBINACIONAL -----------------------
	process (entrada, actual) begin
		salida <= '0';
		case actual is
			when a =>
				if entrada='0' then 
					proximo <= b;
				else
					proximo <= a;				
		      end if;				
			when b =>
				if entrada='0' then 
					proximo <= c;
				else          
					proximo <= b;
		      end if;
			when c =>
				if entrada='0' then 
					proximo <= a;
					salida  <='1';				
				else           
					proximo <= b;
		      end if;
			when others =>
				salida  <= 'X';
				proximo <= a;		        
 		end case;
	end process;
end architecture arq;
--------------------------------------------------------------------