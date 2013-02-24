# Merona entry
$LOAD_PATH << "../lib"
$LOAD_PATH << "."

def import(_path)
	if _path[_path.length-1] == '*'
		path = "../lib/" + _path
		Dir[path[0..path.length-1] + "*.rb"].each {|file| require file }
		path = "./" + _path
		Dir[path[0..path.length-1] + "*.rb"].each {|file| require file }
	else
		require _path
	end
end

import 'main.rb'

