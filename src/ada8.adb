with Ada.Text_IO;
with Ada8_System.Display;
with Ada8_System.Mem;
use Ada8_System;

procedure Ada8 is
   use Ada.Text_IO;
begin
   Mem.InitFont;
   Display.Update_Display;
end Ada8;
