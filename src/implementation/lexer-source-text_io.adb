--  part of ParserTools, (c) 2017 Felix Krause
--  released under the terms of the MIT license, see the file "copying.txt"

package body Lexer.Source.Text_IO is
   procedure Read_Data (S : in out Instance; Buffer : out String;
                        Length : out Natural) is
   begin
      for I in Buffer'Range loop
         if Ada.Text_IO.End_Of_File (S.File_Pointer.all) then
            Buffer (I) := Character'Val (4);
            Length := I;
            return;
         elsif Ada.Text_IO.End_Of_Line (S.File_Pointer.all) then
            Buffer (I) := Character'Val (10);
            Ada.Text_IO.Skip_Line (S.File_Pointer.all);
         else
            Ada.Text_IO.Get (S.File_Pointer.all, Buffer (I));
         end if;
      end loop;
      Length := Buffer'Last;
   end Read_Data;

   function As_Source (File : Ada.Text_IO.File_Access) return Pointer is
     (Pointer'(new Instance'(Source.Instance with File_Pointer => File)));
end Lexer.Source.Text_IO;
