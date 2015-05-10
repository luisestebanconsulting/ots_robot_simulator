#
#   simulator.rb   - Simulator Class
#
#     Luis Esteban    16 April 2015
#       Created
#

require 'optparse'
require 'syslog'
require 'logger'
require 'readline'


# The Simulator class defines the simulation.
# @author   Luis Esteban M.Sc., M.Teach
class Simulator
  
  # Map Logger levels to Syslog levels
  SYSLOG_LEVELS = {
    debug:        :debug,
    info:         :info,
    notice:       :notice,
    warn:         :warning,
    warning:      :warning,
    error:        :err,
    err:          :err,
    fatal:        :crit,
    crit:         :crit,
    unknown:      :alert,
    alert:        :alert,
    emerg:        :emerg
  }

  # Map Syslog levels to Logger levels
  LOGGER_LEVELS = {
    debug:        :debug,
    info:         :info,
    notice:       :info,
    warning:      :warn,
    warn:         :warn,
    err:          :error,
    error:        :error,
    crit:         :fatal,
    fatal:        :fatal,
    alert:        :unknown,
    unknown:      :unknown,
    emerg:        :unknown
  }

  # Initializes a new Simulator.
  #
  # @param  argv    [Array<String>] Array of command line arguments (usually ARGV)
  # @return         [Simulator]     Simulation manager object
  # @example                        Typical usage
  #   Simulator.new ARGV
  # @note                           This class has been designed expecting that there
  #                                 is only object instance, but it is possible to have
  #                                 more.
  def initialize(argv = [])
    determine_usage(argv)
    
    return unless @input
    
    setup
    start
    shutdown
  end

  # Determines the usage specified by argv.
  #
  # @param  argv    [Array<String>] Array of command line arguments (usually ARGV)
  def determine_usage(argv)
    option_parser = OptionParser.new
    
    option_parser.banner = "Usage: #{File.basename($0)} [options] [files]"
    
    option_parser.on('-h', '--help', 'Show usage'){
      puts option_parser.to_s
      @input = false
      return
    }
    
    option_parser.on('-d', 'Daemon mode (for now, just logs messages to syslog)'){
      @syslog      = Syslog.open(File.basename($0))
      @syslog.mask = Syslog::LOG_UPTO(@syslog_level || Syslog::Level::LOG_NOTICE)
    }
    
    levels = Syslog::Level.constants.map{|sym| sym.to_s.sub(/^LOG_/,'').downcase }.join(',')
    
    option_parser.on('-v', '--level=LEVEL', "Set sys-logging level (#{levels}) [default: notice]"){|level|
      begin
        @syslog_level           = Kernel.const_get "Syslog::Level::LOG_#{level.upcase}"
      rescue NameError => error
        puts "Unknown level #{level}, use one of #{levels}"
        raise OptionParser::InvalidOption, "Unknown level #{level}"
      end
      @syslog && @syslog.mask = Syslog::LOG_UPTO(@syslog_level || Syslog::Level::LOG_NOTICE)
    }
    
    option_parser.on('-l', '--log[=FILENAME]', "Turn on logging to a -lfile or stderr if no file given (can use -lstdout, -lstderr)"){|filename|
      file = case filename
        when  'stdout'    then    $stdout
        when  'stderr'    then    $stderr
        when  nil         then    $stderr
        else                      filename
      end
      begin
        @logger = Logger.new file
      rescue Errno::ENOENT => error
        puts error.message
        @input = false
        return
      end
      
      @logger.progname = File.basename($0)
      @logger.level    = @logger_level || Logger::Severity::WARN
    }
    
    severities = Logger::Severity.constants.map{|sym| sym.to_s.downcase }.join(',')
    
    option_parser.on('-s', '--severity=SEVERITY', "Set logging severity (#{severities}) [default: warn]"){|severity|
      begin
        @logger_level           = Kernel.const_get "Logger::Severity::#{severity.upcase}"
      rescue NameError => error
        puts "Unknown severity #{severity}, use one of #{severities}"
        raise OptionParser::InvalidOption, "Unknown severity #{severity}"
      end
      @logger && @logger.level = @logger_level || Logger::Severity::WARN
    }
    
    begin
      option_parser.parse!(argv)
      
      if argv.empty?
        @interactive = $stdin.isatty
      else
        @interactive = false
      end
      
      @input = true
      
    rescue OptionParser::InvalidOption => error
      log error.message, :error
      puts error.message
      puts option_parser.to_s
      
      @input = false
    
    rescue OptionParser::MissingArgument => error
      log error.message, :error
      puts error.message
      puts option_parser.to_s
      
      @input = false
      
    end
  end
  
  # Sets up the objects for simulation.
  def setup
    log 'Setting up simulation'
    #@parser = Parser.new
  end
  
  # Shuts down the objects used in the simulation.
  #
  # @note           The simulation cannot be restarted after it is shutdown.
  #                 It must be set up again.
  def shutdown
    log 'Shutting down simulation'
  end
  
  # Starts the simulation.
  def start
    log 'Starting simulation'
    #@parser.start
    if @interactive
      while (line = Readline.readline("> ", true))
        log "line = #{line.inspect}", :debug
        puts line
      end
      puts
    else
      begin
        puts ARGF.read
      rescue Errno::ENOENT => error
        log error.message, :error
      end
    end
  end
  
  # Stops the simulation.
  def stop
    log 'Stopping simulation'
    #@parser.stop
  end
  
  # Logs a message at a given level to syslog and logger file if they are used.
  #
  # @param  message [String]        Message to log
  # @param  level   [Symbol]        Level at which to log the message
  # @example                        Typical usage
  #   log 'Started'
  #   log 'Started', :notice
  # @note                           The level is converted to the closest level between Syslog and Logger.
  def log(message, level = :notice)
    @syslog && @syslog.send(SYSLOG_LEVELS[level] || :notice, message)
    @logger && @logger.send(LOGGER_LEVELS[level] || :info,   message)
  end
  
end
