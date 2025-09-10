with Interfaces;

package Ada8_System.Mem is

   type     Byte      is  new Interfaces.Unsigned_8;
   type     Word      is  new Interfaces.Unsigned_16;
   type     MemIndex  is  range 0 .. 16#FFF#;
   subtype  Addr      is  Word  range 0 .. 16#FFF#;

   procedure InitFont;

   function ReadByte (I  : MemIndex) return Byte;
   procedure WriteByte
      (I  : MemIndex;
       B  : Byte);

   procedure PushStack
      (A  : Addr);
   function PopStack return Addr;

end Ada8_System.Mem;
