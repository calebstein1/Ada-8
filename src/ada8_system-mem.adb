with Ada8_System.Exceptions;  use Ada8_System.Exceptions;

package body Ada8_System.Mem is

   type     Ada8_Mem_Array  is  array (MemIndex) of Byte;

   Ada8_Mem : Ada8_Mem_Array  := (others => 0);
   Ada8_SP  : Byte            := 16#FF#;

   procedure Init_Font is
      type FontSize   is range 0 .. 79;
      type FontArray  is array (FontSize) of Byte;

      Base  : constant MemIndex  := 16#050#;
      Font  : constant FontArray := (
         16#F0#, 16#90#, 16#90#, 16#90#, 16#F0#, -- 0
         16#20#, 16#60#, 16#20#, 16#20#, 16#70#, -- 1
         16#F0#, 16#10#, 16#F0#, 16#80#, 16#F0#, -- 2
         16#F0#, 16#10#, 16#F0#, 16#10#, 16#F0#, -- 3
         16#90#, 16#90#, 16#F0#, 16#10#, 16#10#, -- 4
         16#F0#, 16#80#, 16#F0#, 16#10#, 16#F0#, -- 5
         16#F0#, 16#80#, 16#F0#, 16#90#, 16#F0#, -- 6
         16#F0#, 16#10#, 16#20#, 16#40#, 16#40#, -- 7
         16#F0#, 16#90#, 16#F0#, 16#90#, 16#F0#, -- 8
         16#F0#, 16#90#, 16#F0#, 16#10#, 16#F0#, -- 9
         16#F0#, 16#90#, 16#F0#, 16#90#, 16#90#, -- A
         16#E0#, 16#90#, 16#E0#, 16#90#, 16#E0#, -- B
         16#F0#, 16#80#, 16#80#, 16#80#, 16#F0#, -- C
         16#E0#, 16#90#, 16#90#, 16#90#, 16#E0#, -- D
         16#F0#, 16#80#, 16#F0#, 16#80#, 16#F0#, -- E
         16#F0#, 16#80#, 16#F0#, 16#80#, 16#80#  -- F
      );
   begin
      for I in Font'Range loop
         Ada8_Mem (Base + MemIndex (I)) := Font (I);
      end loop;
   end Init_Font;

   function Read_Byte (I  : MemIndex) return Byte is
   begin
      return Ada8_Mem (I);
   end Read_Byte;

   procedure Write_Byte
      (I  : MemIndex;
       B  : Byte) is
   begin
      Ada8_Mem (I) := B;
   end Write_Byte;

   procedure Push_Stack
      (A  : Addr) is
      use Interfaces;
   begin
      if Ada8_SP = 0 then
         raise StackOverflow;
      end if;

      Ada8_Mem (16#100# + MemIndex (Ada8_SP)) := Byte (Shift_Right (A, 8));
      Ada8_SP := Ada8_SP - 1;
      Ada8_Mem (16#100# + MemIndex (Ada8_SP)) := Byte (A and 16#FF#);
      if Ada8_SP > 0 then
         Ada8_SP := Ada8_SP - 1;
      end if;
   end Push_Stack;

   function Pop_Stack return Addr is
      use Interfaces;

      Low : Byte;
      Hi  : Byte;
      A   : Addr;
   begin
      if Ada8_SP = 16#FF# then
         raise StackUnderflow;
      end if;

      if Ada8_SP > 0 then
         Ada8_SP := Ada8_SP + 1;
      end if;
      Low := Ada8_Mem (16#100# + MemIndex (Ada8_SP));
      Ada8_SP := Ada8_SP + 1;
      Hi := Ada8_Mem (16#100# + MemIndex (Ada8_SP));
      A := Shift_Left (Word (Hi), 8) or Word (Low);

      return A;
   end Pop_Stack;

end Ada8_System.Mem;
