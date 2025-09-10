package Ada8_System.Mem is

   type Byte is mod 2**8;
   type MemIndex is range 0 .. 16#FFF#;

   function ReadByte (I  : MemIndex) return Byte;

   procedure WriteByte
      (I  : MemIndex;
       B  : Byte);

end Ada8_System.Mem;
