def defLogger(msg)
    puts msg
end

class Log
    @@logfunc = method(:defLogger)
	@@logfile
	
    def initialize
    end
    def dispose
    end

	def self.logfile=(fp)
		@@logfile = fp
	end
	
	def self.logfunc
		@@logfunc
	end
    def self.logfunc=(lf)
        @@logfunc = lf
    end
	
	private
	def self.time
		t = Time.new
		time = "[#{t.year}:#{t.month}:#{t.day}:#{t.hour}:#{t.min}:#{t.sec}]"
	end
	
	def self.warn(msg)
		@@logfunc.call time + " [WARN] : " + msg
	end
	def self.error(msg)
		@@logfunc.call time + " [ERROR] : " + msg
	end
    def self.output(msg)
        @@logfunc.call time + " [LOG] : " + msg
    end
end

