-- 16.10.12 ----------------------- FlipFlopDTest.vhd
-- BANCO DE PRUEBAS DEL FLIP FLOP D, FLANCO POSITIVO 

library ieee;  
use ieee.std_logic_1164.all;

-----------------------------------------------------
entity FlipFlopDTest is
end entity FlipFlopDTest;
-----------------------------------------------------
architecture arqTest of FlipFlopDTest is
	-----------------------------------------
	component FlipFlopD is
		port(D, reloj	: in  std_logic; 
	      	Q 		     : out std_logic);
	end component FlipFlopD;
	---------------------------------------------------
  constant FRECUENCIA: integer := 20; -- MHz
  constant PERIODO   : time := 1 us/FRECUENCIA; -- ns
  signal tD 	        : std_logic := '0';
  signal treloj      : std_logic := '1';
  signal tQ	         : std_logic;
  signal detener     : boolean := false;
  
begin
DUT: FlipFlopD port map(D     => tD,
					              reloj => treloj, 
	      			             Q     => tQ);
  GeneraReloj:
  process begin -- crea un reloj de prueba	
  		treloj <= '0', '1' after PERIODO/2;
  		wait for PERIODO;
  		if detener then
  		  wait;
		end if;
  end process GeneraReloj;
  
  Prueba:
  process begin
    report "Verificando el flip-flop D"
      severity note;
       			
		tD <= '0';
		wait until rising_edge(tReloj);
		wait for 5 ns;
		assert tQ = '0'
		  report "Falla por 0"
		    severity failure;
		    
		tD <= '1';
		wait for PERIODO;
		assert tQ = '1'
		  report "Falla por 1"
		    severity failure;	    		    
		    
		report "Verificación exitosa"
			severity note;
   	detener <= true;
		wait;		
	end process Prueba;						
end architecture arqTest;
----------------------------------------------------