#
#   parser.rb   - Parser Class
#
#     Luis Esteban    10 May 2015
#       Created
#

require 'readline'


# The Parser class defines the command parser.
#
# @author   Luis Esteban M.Sc., M.Teach

class Parser
  
  # Initializes a new Parser.
  #
  # @param  options     [Hash]        Reference to input text stream to parse
  # @return             [Parser]      parser object
  # @example                          Typical usage
  #   Parser.new 
  #   Parser.new true
  
  def initialize(options = {})
    Simulator.log "Parser.new = #{self.inspect}", :debug
    @tokenizer      = Tokenizer.new
    @grammar        = Grammar.new
    
    @debug_grammar  = options[:debug_grammar]
    
    self.input      = options[:input]  || ARGF
    self.target     = options[:target] || self
  end
  
  
  # Sets input for the parser
  # 
  # @param    input_file      [IO]    File to parse
  # @note                             Parsing stdin can be achieved by either;
  #           parser.input = nil      or
  #           parser.input = $stdin
  
  def input=(input_file)
    Simulator.log "Setting input = #{input_file.inspect}", :debug
    case input_file
      when String
        @input_name = input_file
        begin
          @input      = File.open(@input_name,'r')
        rescue Errno::ENOENT => error
          Simulator.error error.message
          @input = false
        end
      when IO
        @input = input_file
      when NilClass
        @input = $stdin
      when ARGF
        @input = ARGF
      else
        @input = false
        return
    end
    
    @interactive = @input.respond_to?(:isatty) && @input.isatty
  end
  
  
  # Checks if there is input for the parser
  # @return     [Boolean]     True if there is input ready
  
  def input?
    !!@input
  end
  
  
  # Sets the target for messages from parsing
  # @param    new_target    [Object]    The target to receive messages from parsing
  
  def target=(new_target)
    @target         = new_target
    @grammar.target = @target
  end
  
  
  # Starts the parser parsing the input
  
  def start
    Simulator.log 'Parser starting', :debug
    Simulator.log "input? = #{input?.inspect}", :debug
    return unless input?
    
    begin
      if @interactive
        @tokenizer.interactive
      else
        begin
          @tokenizer.scan_setup(@input.read)
        rescue Errno::ENOENT => error
          Simulator.error error.message
          @input = false
          return
        end
      end
      @grammar.parse(@tokenizer, @debug_grammar)
    rescue Racc::ParseError => error
      Simulator.error error.message
    end
  end
  
  
  # Stops the parser parsing the input
  #
  # @todo   Actually make it stop the parser, ... gracefully!
  
  def stop
    @continue = false
  end
  
  
  # Closes the input if the input was opened by the parser (when the input is the filename).
  
  def close
    if @input_name
      @input && @input.close
      @input_name = nil
      @input      = nil
    end
  end
  
end
