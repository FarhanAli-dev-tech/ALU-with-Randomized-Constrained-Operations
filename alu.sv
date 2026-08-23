class alu;
  rand bit [3:0] operand_a;
  rand bit [3:0] operand_b;
  bit [7:0] result;
  rand bit [1:0] inp;
  string op;
  constraint check {operand_a >= operand_b;
    				operand_a inside {[1:7]};
                    operand_b inside {[1:7]};
                    }
  
  function void display();
    $display("Operand A & B : %0d %0s %0d , Result : %0d"
             ,operand_a,op,operand_b,result);
  endfunction
  
  function void inp_op(bit[1:0]inp);
    if(inp == 2'b00)
      result = operand_a + operand_b;
    else if(inp == 2'b01)
      result = operand_a - operand_b;
    else if(inp == 2'b10)
      result = operand_a * operand_b;
    else
      result = operand_a / operand_b;
  endfunction
  
  function void random_operator();
    if(inp == 2'b00)
      op = "+";
    else if(inp == 2'b01)
      op = "-";
    else if(inp == 2'b10)
      op = "*";
    else 
      op = "/";
  endfunction
  
endclass

module tb;
  alu a1;
  
  bit [3:0] temp_operand_a;
  bit [3:0] temp_operand_b;
  bit [7:0] temp_result;
  bit [1:0] temp_inp;

  initial begin
    a1 = new();
    
    $dumpfile("dump.vcd");
    $dumpvars;
    
    repeat(10) begin
      a1.randomize();
      a1.inp_op(a1.inp);
      a1.random_operator();
      a1.display();

      temp_operand_a = a1.operand_a;
      temp_operand_b = a1.operand_b;
      temp_result    = a1.result;
      temp_inp       = a1.inp;

      #10;  
    end
    
    $finish;
  end
endmodule