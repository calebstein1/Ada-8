with Interfaces;

package body Ada8_System.Display is

   type DisplayIdx  is range 0 .. 31;
   type ScanLine    is new Interfaces.Unsigned_64;
   type Display     is array (DisplayIdx) of ScanLine;

   D : Display;

   procedure Draw_Sprite
      (S : Sprite;
       X : X_Coord;
       Y : Y_Coord) is
   begin
      null;
   end Draw_Sprite;

end Ada8_System.Display;
