-- 07.11.12 --------------------------------------------- Moore.vhd
-- DESCRIPCIÓN DE UNA MAQUINA DE ESTADO MOORE. 

library ieee;  
use ieee.std_logic_1164.all;

-------------------------------------------------------------------
entity Moore is
	port( entrada	: in  std_logic;
	      reset		: in  std_logic;
	      reloj		: in  std_logic;
	      salida	: out std_logic);
end entity Moore;

-------------------------------------------------------------------
-- ESTADO INICIAL: "A", SEÑAL DE RELOJ ACTIVA POR FLANCO ASCENDENTE

architecture arq of Moore is 
	type estado is (A, B, C);
	signal actual, proximo : estado;
begin

	-- DESCRIPCIÓN DE LA PARTE SECUENCIAL -------------------------
	process (reloj) begin
		if rising_edge(reloj) then 	  
			if reset='1' then
            actual <= A;
         else      
            actual <= proximo;
         end if;
      end if;
	end process;
	
	-- DESCRIPCIÓN DE LA PARTE COMBINACIONAL ----------------------
	process (entrada, actual) begin
		salida  <= '0';
		case actual is
			when A =>
				if entrada ='0' then
					proximo <= B;
				else
 					proximo <= A;
				end if; 					
			when B =>
				salida  <= '1';
				if entrada ='1' then
					proximo <= C;
				else
 					proximo <= A;				
				end if;
			when C =>
				salida  <= '0';					
				if entrada ='1' then
					proximo <= A;
				else
 					proximo <= C;				
				end if;
			when others =>
				salida  <= 'X';
				proximo <= A;
 		end case;
	end process;
end architecture arq;
------------------------------------------------------------------