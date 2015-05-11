#
#   tokens.rex     - Lexical analyser for Robot Commands
#
#     Luis Esteban    10 May 2015
#       Created
#


# The Lexical Analyser/Tokenizer class for Robot Commands.
#
# @author   Luis Esteban M.Sc., M.Teach

require 'racc/parser'

class Tokenizer

macro

  EOL             (\ *\n)+
  SPACE           \s+
  NUMBER          -?\d+
  IDENTIFIER      [a-zA-Z_][a-zA-Z0-9_]*


rule

  {EOL}           { eol text        }
  {SPACE}         {                 }
  
  PLACE           { command text    }
  REPORT          { command text    }
  LEFT            { command text    }
  RIGHT           { command text    }
  MOVE            { command text    }
  
  NORTH           { symbol text     }
  EAST            { symbol text     }
  SOUTH           { symbol text     }
  WEST            { symbol text     }
  
  {NUMBER}        { number text     }
  {IDENTIFIER}    { identifier text }
  .               { raw text        }
  

inner
  
  # Create a command token
  # @param    str     [String]      input string for the token
  # @return           [Array]       Two element array [token, value]
  
  def command(str)
    [str.to_sym, str]
  end
  
  
  # Create a symbol token
  # @param    str     [String]      input string for the token
  # @return           [Array]       Two element array [token, value]
  
  def symbol(str)
    [str.to_sym, str.downcase.to_sym]
  end
  
  
  # Create a number token
  # @param    str     [String]      input string for the token
  # @return           [Array]       Two element array [token, value]
  
  def number(str)
    [:NUMBER, str.to_i]
  end
  
  
  # Create a identifier token
  # @param    str     [String]      input string for the token
  # @return           [Array]       Two element array [token, value]
  
  def identifier(str)
    [:IDENTIFIER, str]
  end
  
  
  # Create a raw token
  # @param    str     [String]      input string for the token
  # @return           [Array]       Two element array [token, value]
  
  def raw(str)
    [str, str]
  end
  
  
  # Create a end-of-line token
  # @param    str     [String]      input string for the token
  # @return           [Array]       Two element array [token, value]
  
  def eol(str)
    [:EOL, str]
  end
  
  
  # Get next token from input, getting more text if necessary
  # @param    str     [String]      input string for the token
  # @return           [Array]       Two element array [token, value]
  
  def next_token
    if @interactive
      if @ss.nil? or @ss.eos?
        line = Readline.readline("> ", true)
        Simulator.log "line = #{line.inspect}", :debug
        return [false, '$end'] unless line
        @ss = StringScanner.new(line + "\n")
      end
    end
    
    return [false, '$end'] if @ss.eos?
    
    until token = _next_token or @ss.eos?; end
    
    Simulator.log "next token = #{token.inspect}", :debug
    
    token
  end
  
  
  # Put the tokenizer into interactive mode (i.e. prompt for new lines)
  
  def interactive
    @interactive = true
    @lineno      = 1
    @state       = nil
  end
  
  
  # Parse all input
  # @return     [Array<Token>]    parsed tokens
  
  def tokenize
    tokens = []
    
    while (token = next_token) != [false, '$end']
      tokens << token
    end
    
    tokens
  end
  
end

