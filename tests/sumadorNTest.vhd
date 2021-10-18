-- 07.09.12 ---------------------------------------------------------------------------------------- sumadorNTest.vhd
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
----------------------------------------------------------------------------------------------------------------------
entity sumadorTest is
end entity sumadorTest;

----------------------------------------------------------------------------------------------------------------------
architecture arqTest of sumadorTest is 
	-----------------------------------------------------
	component sumadorN is
		generic(n : positive :=2); 
		port(a	   : in  std_logic_vector(n-1 downto 0); 
         b	   : in  std_logic_vector(n-1 downto 0);
			   ci	  : in  std_logic_vector(0 downto 0); 
			   suma : out std_logic_vector(n-1 downto 0);
			   co   : out std_logic) ;
	end component sumadorN;
	-----------------------------------------------------
	signal tA	  : std_logic_vector(1 downto 0):= "00"; 
  signal tB   : std_logic_vector(1 downto 0):= "00" ;
	signal tCi	 : std_logic_vector(0 downto 0):= "0"; 
	signal tSuma: std_logic_vector(1 downto 0);
	signal tCo	 : std_logic;
begin
DUT: sumadorN port map(a    => tA,
							         b	   => tB,
							         ci	  => tCi,
							         suma => tSuma,
							         co	  => tCo);
Prueba:
	process begin
		report "Verificando el sumador de 2 bits"
			severity note;
		tCi <= "0";
		for i in 0 to 3 loop
			for j in 0 to 3 loop
				tA <= std_logic_vector(to_unsigned(i,2));			
				tB <= std_logic_vector(to_unsigned(j,2));
				wait for 1 ns;
				assert tSuma=std_logic_vector(to_unsigned(i+j,2))
					report "Falla la suma, cuando Ci=0, para a=" & integer'image(i) & " y b=" & integer'image(j)
						severity failure;
				if i+j<4 then
					assert tCo='0'
						report "Falla el acarreo en 0, cuando Ci=0, para a=" & integer'image(i) & " y b=" & integer'image(j)
							severity failure;	
				else
					assert tCo='1'
						report "Falla el acarreo en 1, cuando Ci=0, para a=" & integer'image(i) & " y b=" & integer'image(j)
							severity failure;	
				end if;
			end loop;
		end loop;
		
		tCi <= "1";
		for i in 0 to 3 loop
			for j in 0 to 3 loop
				tA <= std_logic_vector(to_unsigned(i,2));			
				tB <= std_logic_vector(to_unsigned(j,2));
				wait for 1 ns;
				assert tSuma=std_logic_vector(to_unsigned(i+j+1,2))
					report "Falla la suma, cuando Ci=0, para a=" & integer'image(i) & " y b=" & integer'image(j)
						severity failure;
				if i+j+1<4 then
					assert tCo='0'
						report "Falla el acarreo en 0, cuando Ci=1, para a=" & integer'image(i) & " y b=" & integer'image(j)
							severity failure;	
				else
					assert tCo='1'
						report "Falla el acarreo en 1, cuando Ci=1, para a=" & integer'image(i) & " y b=" & integer'image(j)
							severity failure;	
				end if;
			end loop;
		end loop;
		report "!Verificacion exitosa!"
			severity note;
		wait;	
	end process Prueba;
end architecture arqTest;
----------------------------------------------------------------------------------------------------------------------