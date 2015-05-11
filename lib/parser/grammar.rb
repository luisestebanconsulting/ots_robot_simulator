#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.12
# from Racc grammer file "".
#

require 'racc/parser.rb'


# Grammar for parsing robot simulator commands
#
# @author   Luis Esteban M.Sc., M.Teach

class Grammar < Racc::Parser

module_eval(<<'...end grammar.racc/module_eval...', 'grammar.racc', 75)
  
  # Starts parsing the tokens provide by the tokenizer
  #
  # @param    tokenizer   [Racc::Parser]      The tokenizer
  # @param    yydebug     [Boolean]           Whether to turn on debugging in the parser
  # @return               [Object]            Result of the start rule
  
  def parse(tokenizer, yydebug = false)
    Simulator.log 'Grammar starting', :debug
    @yydebug   = yydebug
    @tokenizer = tokenizer
    
    do_parse
  end
  
  
  # Gets the next token from the tokenizer
  
  def next_token
    token = @tokenizer.next_token
    
    Simulator.log "token = #{token.inspect}", :debug
    
    token
  end
  
  
  # Specifies the new target to receive messages during parsing
  #
  # @param    new_target    [Object]        The object to receive messages
  
  def target=(new_target)
    
    Simulator.log "new target = #{new_target.inspect}", :debug
    
    @target = new_target
  end
  
  
...end grammar.racc/module_eval...
##### State transition tables begin ###

racc_action_table = [
     8,     9,    10,    11,    12,     8,     9,    10,    11,    12,
    25,    26,    27,    28,    19,    16,    17,    18,    15,    20,
    21,    22,    23,    13,    29 ]

racc_action_check = [
     0,     0,     0,     0,     0,     2,     2,     2,     2,     2,
    23,    23,    23,    23,    12,     9,    10,    11,     8,    13,
    15,    21,    22,     1,    24 ]

racc_action_pointer = [
    -2,    23,     3,   nil,   nil,   nil,   nil,   nil,     7,     2,
     3,     4,     1,    19,   nil,     6,   nil,   nil,   nil,   nil,
   nil,    10,     8,     3,    11,   nil,   nil,   nil,   nil,   nil ]

racc_action_default = [
    -1,   -17,    -1,    -3,    -4,    -5,    -6,    -7,   -17,   -17,
   -17,   -17,   -17,   -17,    -2,   -17,    -9,   -10,   -11,   -12,
    30,   -17,   -17,   -17,   -17,   -13,   -14,   -15,   -16,    -8 ]

racc_goto_table = [
     1,    24,    14 ]

racc_goto_check = [
     1,     8,     1 ]

racc_goto_pointer = [
   nil,     0,   nil,   nil,   nil,   nil,   nil,   nil,   -22 ]

racc_goto_default = [
   nil,   nil,     2,     3,     4,     5,     6,     7,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 16, :_reduce_none,
  2, 16, :_reduce_none,
  1, 17, :_reduce_none,
  1, 17, :_reduce_none,
  1, 17, :_reduce_none,
  1, 17, :_reduce_none,
  1, 17, :_reduce_none,
  7, 18, :_reduce_8,
  2, 19, :_reduce_9,
  2, 20, :_reduce_10,
  2, 21, :_reduce_11,
  2, 22, :_reduce_12,
  1, 23, :_reduce_none,
  1, 23, :_reduce_none,
  1, 23, :_reduce_none,
  1, 23, :_reduce_none ]

racc_reduce_n = 17

racc_shift_n = 30

racc_token_table = {
  false => 0,
  :error => 1,
  :PLACE => 2,
  :REPORT => 3,
  :LEFT => 4,
  :RIGHT => 5,
  :MOVE => 6,
  :NORTH => 7,
  :EAST => 8,
  :SOUTH => 9,
  :WEST => 10,
  :NUMBER => 11,
  :IDENTIFIER => 12,
  :EOL => 13,
  "," => 14 }

racc_nt_base = 15

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "PLACE",
  "REPORT",
  "LEFT",
  "RIGHT",
  "MOVE",
  "NORTH",
  "EAST",
  "SOUTH",
  "WEST",
  "NUMBER",
  "IDENTIFIER",
  "EOL",
  "\",\"",
  "$start",
  "commands",
  "command",
  "place_command",
  "report_command",
  "left_command",
  "right_command",
  "move_command",
  "direction" ]

Racc_debug_parser = true

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

# reduce 2 omitted

# reduce 3 omitted

# reduce 4 omitted

# reduce 5 omitted

# reduce 6 omitted

# reduce 7 omitted

module_eval(<<'.,.,', 'grammar.racc', 37)
  def _reduce_8(val, _values, result)
                                  @target.place_command([val[1],val[3]],val[5])
                            
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.racc', 42)
  def _reduce_9(val, _values, result)
                                  @target.report_command
                            
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.racc', 47)
  def _reduce_10(val, _values, result)
                                  @target.left_command
                            
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.racc', 52)
  def _reduce_11(val, _values, result)
                                  @target.right_command
                            
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.racc', 57)
  def _reduce_12(val, _values, result)
                                  @target.move_command
                            
    result
  end
.,.,

# reduce 13 omitted

# reduce 14 omitted

# reduce 15 omitted

# reduce 16 omitted

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Grammar

