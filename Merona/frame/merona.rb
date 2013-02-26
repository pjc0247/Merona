# Merona entry

require 'rubygems'

meorna_path = Gem::bin_path('merona', 'merona')
meorna_path.reverse!
meorna_path = path.split("/", 3)[2]
meorna_path.reverse!
meorna_path += "/lib"

$LOAD_PATH << meorna_path
$LOAD_PATH << File.dirname(File.expand_path(__FILE__))


def import(_path)
	if _path[_path.length-1] == '*'
		path = meorna_path + _path
		Dir[path[0..path.length-1] + "*.rb"].each {|file| require file }
		path = "./" + _path
		Dir[path[0..path.length-1] + "*.rb"].each {|file| require file }
	else
		require _path
	end
end

import 'main.rb'

