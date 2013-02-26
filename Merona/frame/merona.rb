# Merona entry

require 'rubygems'

$merona_path = Gem::bin_path('merona', 'merona')
$merona_path.reverse!
$merona_path = $merona_path.split("/", 3)[2]
$merona_path.reverse!
$merona_path += "/lib"

$LOAD_PATH << $merona_path
$LOAD_PATH << File.dirname(File.expand_path(__FILE__))


def import(_path)
	if _path[_path.length-1] == '*'
		path = $merona_path + "/" + _path
		Dir[path[0..path.length-1] + "*.rb"].each {|file| require file }
		path = "./" + _path
		Dir[path[0..path.length-1] + "*.rb"].each {|file| require file }
	else
		require _path
	end
end

import 'main.rb'

