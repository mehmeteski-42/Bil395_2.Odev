with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Simple_Calculator is
   -- Variable to store the current expression
   Expression : Unbounded_String;

   -- Array to store variables and their values
   type Variable_Array is array (1 .. 26) of Integer;
   Variables : Variable_Array := (others => 0);

   -- Function to evaluate an expression
   function Evaluate (Expr : in Unbounded_String) return Integer is
      Result : Integer := 0;
      Op     : Character;
      Num1   : Integer;
      Num2   : Integer;
      Var    : Character;
   begin
      -- Parse the expression
      if Expr = "" then
         return 0;
      end if;

      -- Check for variable assignment
      if Element (Expr, 1) in 'a' .. 'z' and then Element (Expr, 2) = '=' then
         -- Get the variable name
         Var := Element (Expr, 1);

         -- Get the value
         Num1 := Integer'Value (Slice (Expr, 3, Length (Expr)));

         -- Assign the value to the variable
         Variables (Character'Pos (Var) - Character'Pos ('a') + 1) := Num1;

         return Num1;
      end if;

      -- Check for variable usage
      if Element (Expr, 1) in 'a' .. 'z' then
         -- Get the variable name
         Var := Element (Expr, 1);

         -- Return the variable value
         return Variables (Character'Pos (Var) - Character'Pos ('a') + 1);
      end if;

      -- Check for arithmetic expression
      if Element (Expr, 2) in '+' | '-' | '*' | '/' then
         -- Get the operator
         Op := Element (Expr, 2);

         -- Get the numbers
         Num1 := Integer'Value (Slice (Expr, 1, 1));
         Num2 := Integer'Value (Slice (Expr, 3, Length (Expr)));

         -- Evaluate the expression
         case Op is
            when '+' => Result := Num1 + Num2;
            when '-' => Result := Num1 - Num2;
            when '*' => Result := Num1 * Num2;
            when '/' => Result := Num1 / Num2;
            when others => null;
         end case;

         return Result;
      end if;

      -- If the expression is a single number, return it
      return Integer'Value (Expr);
   exception
      when Constraint_Error =>
         Put_Line ("Invalid expression");
         return 0;
   end Evaluate;

begin
   loop
      -- Get the user input
      Put ("Enter an expression (or 'q' to quit): ");
      Get_Line (Expression);

      -- Check if the user wants to quit
      if To_Lower (Slice (Expression, 1, Length (Expression))) = "q" then
         exit;
      end if;

      -- Evaluate the expression
      Put_Line ("Result: " & Integer'Image (Evaluate (Expression)));
   end loop;
end Simple_Calculator;
