-- Copyright (C) 1991-2011 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "10/16/2012 02:59:32"
                                                            
-- Vhdl Test Bench template for design  :  NAND_N2
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
use ieee.numeric_std.all;

ENTITY NAND_N2_vhd_tst IS
END NAND_N2_vhd_tst;

-------------------------------------------

ARCHITECTURE NAND_N2_arch OF NAND_N2_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL entradas : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL salida : STD_LOGIC;
COMPONENT NAND_N2
	PORT (
	entradas : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	salida : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	DUT : NAND_N2
	PORT MAP (
-- list connections between master ports and signals
	entradas => entradas,
	salida => salida
	);
probando: PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
		report "probando NAND generica de 2 entradas"
		severity note;
		for i in 0 to 3 loop
		entradas <= std_logic_vector(to_unsigned(i,2));
		wait for 50 ns;
		end loop;
		
		report "fin de la prueba"
		severity note;
		
		
WAIT;                                                       
END PROCESS probando;                                           
END NAND_N2_arch;
