#
#   Rakefile      - Rakefile for OTS Robot Simulator project
#
#     Luis Esteban    8 May 2015
#       Created
#

# Rakefile for OTS Robot Simulator project
# @author   Luis Esteban M.Sc., M.Teach

require 'rake/clean'

desc "Build and run the project (in debug mode)"
task default:   [:build, :run]





desc 'Build lexer and parser'
task :build => [:lexer, :parser]


rule '.rb' => '.racc' do |t|
  sh "racc -t -v -o #{t.name} #{t.source}"
end


rule '.rb' => '.rex' do |t|
  #sh "rex  -i -o #{t.name} #{t.source}"    # for case insensitive commands
  sh "rex  -o #{t.name} #{t.source}"
end


desc "Build the project"
task :build => [:lexer, :parser] do

end


desc 'Create lexical analyser/tokenizer'
task :lexer  => ["lib/parser/tokens.rb"]
CLEAN        <<  "lib/parser/tokens.rb"
CLOBBER      <<  "lib/parser/tokens.rb"


desc 'Create parser'
task :parser => ["lib/parser/grammar.rb"]
CLEAN        <<  "lib/parser/grammar.rb"
CLOBBER      <<  "lib/parser/grammar.rb"
CLEAN        <<  "lib/parser/grammar.output"
CLOBBER      <<  "lib/parser/grammar.output"


desc "Run the project"
task run: [:build] do
  ruby 'bin/robot_simulator -D'
end


desc "Test the project"
task test: [:build] do
  ruby 'test/test_all.rb'
end


desc "Generate docs"
task doc: [:test] do
  sh "yard"
  sh "yard graph | dot -Tpng -o doc/yard_graph.png"
end

task undoc: [:test] do
  sh "yard stats --list-undoc"
end


desc "Run bundle"
task bundle: [] do
  sh "bundle"
end


desc "Install the project and library"
task install: [:bundle,:build,:test,:doc] do
  
end


desc "Install the library"
task install_library: [:bundle,:build,:test,:doc] do
  
end


desc "Uninstall the project and library"
task uninstall: [:uninstall_project] do
  
end


desc "Uninstall"
task uninstall_project: [] do
  
end

