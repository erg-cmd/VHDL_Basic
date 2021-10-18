library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumador is
	port(A,B	:in	std_logic_vector(3 downto 0);
		 Ci		:in std_logic_vector(0 downto 0);
		 S		:out std_logic_vector(4 downto 0));

end entity sumador;

architecture funcionamiento of sumador is
	
	signal auxS: integer;
	
	--to_integer (unsigned )
	--to_unsigned(natural)
	--to_integer(signed)
	--to_signed(*entero*)
	

begin	
	
	auxS <=  ((  (to_integer(unsigned('0'&A))) ) + (  (to_integer(unsigned('0'&B)))))   + ( to_integer( unsigned('0'& Ci) ));
	
	S <= std_logic_vector ( to_unsigned(auxS,5) );

end architecture funcionamiento;	
