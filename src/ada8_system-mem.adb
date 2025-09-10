package body Ada8_System.Mem is

   type Ada8_Mem_Array is array (MemIndex) of Byte;
   Ada8_Mem : Ada8_Mem_Array;

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
