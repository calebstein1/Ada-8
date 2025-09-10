package body Ada8_System.Mem is

   type Ada8_Mem_Array is array (MemIndex) of Byte;

   Ada8_Mem : Ada8_Mem_Array;

   procedure InitFont is
      type  FontSize   is range 0 .. 79;
      type  FontArray  is array (FontSize) of Byte;

      Base  : MemIndex  :=  16#050#;
      Font  : FontArray :=  (
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
   end InitFont;

   function ReadByte (I  : MemIndex) return Byte is
   begin
      return Ada8_Mem (I);
   end ReadByte;

   procedure WriteByte
      (I  : MemIndex;
       B  : Byte) is
   begin
      Ada8_Mem (I) := B;
   end WriteByte;

end Ada8_System.Mem;
