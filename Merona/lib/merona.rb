# Merona entry

def import(path)
	if path[path.length-1] == '*'
		Dir[path[0..path.length-1] + "*.rb"].each {|file| load file }
	else
		load path
	end
end

import 'main.rb'

