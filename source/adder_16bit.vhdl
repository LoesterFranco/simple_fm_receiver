-- $Id: adder_16bit.vhdl,v 1.3 2005-03-04 08:06:16 arif_endro Exp $
-------------------------------------------------------------------------------
-- Title       : Adder 16 bit
-- Project     : FM Receiver 
-------------------------------------------------------------------------------
-- File        : adder_16bit.vhdl
-- Author      : "Arif E. Nugroho" <arif_endro@yahoo.com>
-- Created     : 2004/12/23
-- Last update : 
-- Simulators  : 
-- Synthesizers: 
-- Target      : 
-------------------------------------------------------------------------------
-- Description : Ripple carry adder 16 bit with output 17 bit
-------------------------------------------------------------------------------
-- Copyright (C) 2004 Arif E. Nugroho
-- This VHDL design file is an open design; you can redistribute it and/or
-- modify it and/or implement it after contacting the author
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- 
-- 	THIS SOURCE FILE MAY BE USED AND DISTRIBUTED WITHOUT RESTRICTION
-- PROVIDED THAT THIS COPYRIGHT STATEMENT IS NOT REMOVED FROM THE FILE AND THAT
-- ANY DERIVATIVE WORK CONTAINS THE ORIGINAL COPYRIGHT NOTICE AND THE
-- ASSOCIATED DISCLAIMER.
-- 
-------------------------------------------------------------------------------
-- 
-- 	THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
-- IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
-- MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
-- EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
-- SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
-- OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
-- WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
-- OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_16bit is
   port (
      addend_16bit  : in  bit_vector (15 downto 0);
      augend_16bit  : in  bit_vector (15 downto 0);
      adder16_output: out bit_vector (16 downto 0) -- 17 bit output
      );
end adder_16bit;

architecture structural of adder_16bit is

   component fulladder
      port (
      addend        : in   bit;
      augend        : in   bit;
      carry_in      : in   bit;
      sum           : out  bit;
      carry         : out  bit
      );
   end component;

-- internal signal
signal c00 : bit;
signal c01 : bit;
signal c02 : bit;
signal c03 : bit;
signal c04 : bit;
signal c05 : bit;
signal c06 : bit;
signal c07 : bit;
signal c08 : bit;
signal c09 : bit;
signal c10 : bit;
signal c11 : bit;
signal c12 : bit;
signal c13 : bit;
signal c14 : bit;
signal c15 : bit;
signal c16 : bit;
signal over16 : bit;
signal adder16_output_int : bit_vector (16 downto 0);

begin

c00 			<= '0';
over16                  <= (addend_16bit (15) xor augend_16bit (15));
adder16_output_int (16) <= ((adder16_output_int (15) and over16) or 
			   (c16 and (not (over16))));
adder16_output          <= adder16_output_int;

fa15 : fulladder
   port map (
      addend     => addend_16bit(15),
      augend     => augend_16bit(15),
      carry_in   => c15,
      sum        => adder16_output_int(15),
      carry      => c16
      );

fa14 : fulladder
   port map (
      addend     => addend_16bit(14),
      augend     => augend_16bit(14),
      carry_in   => c14,
      sum        => adder16_output_int(14),
      carry      => c15
      );

fa13 : fulladder
   port map (
      addend     => addend_16bit(13),
      augend     => augend_16bit(13),
      carry_in   => c13,
      sum        => adder16_output_int(13),
      carry      => c14
      );

fa12 : fulladder
   port map (
      addend     => addend_16bit(12),
      augend     => augend_16bit(12),
      carry_in   => c12,
      sum        => adder16_output_int(12),
      carry      => c13
      );

fa11 : fulladder
   port map (
      addend     => addend_16bit(11),
      augend     => augend_16bit(11),
      carry_in   => c11,
      sum        => adder16_output_int(11),
      carry      => c12
      );

fa10 : fulladder
   port map (
      addend     => addend_16bit(10),
      augend     => augend_16bit(10),
      carry_in   => c10,
      sum        => adder16_output_int(10),
      carry      => c11
      );

fa09 : fulladder
   port map (
      addend     => addend_16bit(09),
      augend     => augend_16bit(09),
      carry_in   => c09,
      sum        => adder16_output_int(09),
      carry      => c10
      );

fa08 : fulladder
   port map (
      addend     => addend_16bit(08),
      augend     => augend_16bit(08),
      carry_in   => c08,
      sum        => adder16_output_int(08),
      carry      => c09
      );

fa07 : fulladder
   port map (
      addend     => addend_16bit(07),
      augend     => augend_16bit(07),
      carry_in   => c07,
      sum        => adder16_output_int(07),
      carry      => c08
      );

fa06 : fulladder
   port map (
      addend     => addend_16bit(06),
      augend     => augend_16bit(06),
      carry_in   => c06,
      sum        => adder16_output_int(06),
      carry      => c07
      );

fa05 : fulladder
   port map (
      addend     => addend_16bit(05),
      augend     => augend_16bit(05),
      carry_in   => c05,
      sum        => adder16_output_int(05),
      carry      => c06
      );

fa04 : fulladder
   port map (
      addend     => addend_16bit(04),
      augend     => augend_16bit(04),
      carry_in   => c04,
      sum        => adder16_output_int(04),
      carry      => c05
      );

fa03 : fulladder
   port map (
      addend     => addend_16bit(03),
      augend     => augend_16bit(03),
      carry_in   => c03,
      sum        => adder16_output_int(03),
      carry      => c04
      );

fa02 : fulladder
   port map (
      addend     => addend_16bit(02),
      augend     => augend_16bit(02),
      carry_in   => c02,
      sum        => adder16_output_int(02),
      carry      => c03
      );

fa01 : fulladder
   port map (
      addend     => addend_16bit(01),
      augend     => augend_16bit(01),
      carry_in   => c01,
      sum        => adder16_output_int(01),
      carry      => c02
      );

fa00 : fulladder
   port map (
      addend     => addend_16bit(00),
      augend     => augend_16bit(00),
      carry_in   => c00,
      sum        => adder16_output_int(00),
      carry      => c01
      );

end structural;
