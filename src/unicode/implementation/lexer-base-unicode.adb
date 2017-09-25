--  part of ParserTools, (c) 2017 Felix Krause
--  released under the terms of the MIT license, see the file "copying.txt"

with Ada.IO_Exceptions;

package body Lexer.Base.Unicode is
   function Next (Object : in out Instance'Class) return Rune is
   begin
      return Ret : Rune do
         Strings_Edit.UTF8.Get (Object.Buffer.all, Object.Pos, Ret);
      end return;
   exception
      when Ada.IO_Exceptions.Data_Error =>
         raise Lexer_Error with "Illegal content in UTF-8 source";
   end Next;
end Lexer.Base.Unicode;
