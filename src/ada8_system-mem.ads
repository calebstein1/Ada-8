package Ada8_System.Mem is

   type Byte is mod 256;
   type MemIndex is range 0 .. 4095;

   function ReadByte (I  : MemIndex) return Byte;

   procedure WriteByte
      (I  : MemIndex;
       B  : Byte);

end Ada8_System.Mem;
