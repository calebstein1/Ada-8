with Interfaces;

package Ada8_System.Mem is

   type     Byte      is  new Interfaces.Unsigned_8;
   type     Word      is  new Interfaces.Unsigned_16;
   type     MemIndex  is  range 0 .. 16#FFF#;
   subtype  Addr      is  Word  range 0 .. 16#FFF#;

   procedure Init_Font;

   function Read_Byte (I  : MemIndex) return Byte;
   procedure Write_Byte
      (I  : MemIndex;
       B  : Byte);

   procedure Push_Stack
      (A  : Addr);
   function Pop_Stack return Addr;

end Ada8_System.Mem;
