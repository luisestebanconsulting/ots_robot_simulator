#
#   Rakefile      - Rakefile for OTS Robot Simulator project
#
#     Luis Esteban    8 May 2015
#       Created
#

desc "Build and run the project"
task default:   [:build, :run]


desc "Build the project"
task :build do

end


desc "Run the project"
task run: [:build] do
  ruby 'bin/robot_simulator'
end


desc "Test the project"
task test: [:build] do
  
end


desc "Generate docs"
task doc: [] do
  sh "yard"
  sh "yard graph | dot -Tpng -o doc/yard_graph.png"
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


desc "Clean"
task clean: [] do
  
end


desc "Clobber"
task clobber: [] do
  
end
