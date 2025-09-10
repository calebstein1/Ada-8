with Ada8_System.Mem;
use Ada8_System;

package Ada8_System.Display is

   type SprLineIndex  is range 0 .. 7;
   type Sprite        is array (SprLineIndex) of Mem.Byte;
   type X_Coord       is mod 2 ** 6;
   type Y_Coord       is mod 2 ** 5;

   procedure Update_Display;
   procedure Draw_Sprite
      (S : Sprite;
       X : X_Coord;
       Y : Y_Coord);

end Ada8_System.Display;
