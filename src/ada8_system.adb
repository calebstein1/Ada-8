with Ada8_System.Display;
with Ada8_System.Mem;

package body Ada8_System is

   procedure Power_On is
   begin
      Mem.Init_Font;
      Display.Update_Display;
   end Power_On;

end Ada8_System;
