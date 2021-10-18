-- 07.09.12 ---------------------------------- sumadorN.vhd
-- SUMADOR BINARIO DE MAGNITUDES DE N BITS

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

-----------------------------------------------------------
entity sumadorN is
  generic(n : positive:=2); 
  port(a	   : in  std_logic_vector(n-1 downto 0) ; 
       b	   : in  std_logic_vector(n-1 downto 0) ;
       ci	  : in  std_logic_vector(0 downto 0); 
       suma : out std_logic_vector(n-1 downto 0);
       co	  : out std_logic) ;
end entity sumadorN;

-----------------------------------------------------------
architecture sumador of sumadorN is 
  signal auxSuma: unsigned(n downto 0);
begin
  auxSuma <= '0'& unsigned(a)+ unsigned(b) + unsigned(ci);
  suma    <= std_logic_vector(auxSuma (n-1 downto 0)); 
  co		    <= auxSuma(n);	
end architecture sumador;
-----------------------------------------------------------