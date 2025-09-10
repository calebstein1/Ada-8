with Ada.Text_IO;
with Ada.Characters.Latin_1;
with Interfaces;

package body Ada8_System.Display is

   type DisplayIdx  is range 0 .. 31;
   type ScanLine    is new Interfaces.Unsigned_64;
   type Display     is array (DisplayIdx) of ScanLine;

   D : Display := (others => 0);

   procedure Update_Display is
      P : ScanLine;

      use Ada.Characters.Latin_1;
      use Ada.Text_IO;
      use Interfaces;
   begin
      Put (ESC & "[2J" & ESC & "[H");
      for I in DisplayIdx loop
         for J in 0 .. 63 loop
            P := D (I) and (Shift_Left (1, J));
            if P = 0 then
               Put (" ");
            else
               Put ("#");
            end if;
         end loop;
         Put_Line ("");
      end loop;
   end Update_Display;

   procedure Draw_Sprite
      (S : Sprite;
       X : X_Coord;
       Y : Y_Coord) is
   begin
      null;
   end Draw_Sprite;

end Ada8_System.Display;
