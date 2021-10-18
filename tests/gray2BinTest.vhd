-- 29.08.12 -------------------------------------- Gray2BinTest.vhd
-- TEST BENCH DEL CONVERSOR DE CÓDIGO GRAY A BINARIO DE n BITS
library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-------------------------------------------------------------------
entity gray2BinTest is
end entity gray2BinTest;

-------------------------------------------------------------------
architecture Gray2BinArq of gray2BinTest is
	---------------------------------------------------------
	component gray2BinN is
		generic(N: integer := 4);       
		port   (gray	: in  std_logic_vector (N-1 downto 0);
				  bin 	: out std_logic_vector (N-1 downto 0));
	end component gray2BinN;
	---------------------------------------------------------
	signal tGray : std_logic_vector (3 downto 0) := "0000";
	signal tBin  : std_logic_vector (3 downto 0);
	type tabla is array(0 to 2**4-1) of std_logic_vector(3 downto 0);
	constant TABLA_GRAY : tabla := ("0000", "0001", "0011", "0010",
									  "0110", "0111", "0101", "0100",
									  "1100", "1101", "1111", "1110",
									  "1010", "1011", "1001", "1000");
begin
DUT: gray2BinN port map(gray	=> tGray,
								bin	=> tBin);
Prueba:
	process begin
		report "Probando el conversor de Gray a binario"
			severity note;
		for i in tabla'range loop
			tGray <= TABLA_GRAY(i);
			wait for 1 ns;
			assert tBin = std_logic_vector(to_unsigned(i, 4))
				report "Falla para "& integer'image(to_integer(unsigned(tGray)))
					severity failure;
		end loop;
		report "!Prueba exitosa!"
			severity note;
		wait;
	end process Prueba;
	
end architecture Gray2BinArq;
----------------------------------------------------------------------------