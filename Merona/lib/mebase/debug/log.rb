###################################################
#             ChocoPie GameEngine                 #
#                           Log                   #
###################################################

def defLogger(msg)
    puts "[LOG] : " + msg
end

class Log
    @@logfunc = method(:defLogger)

    def initialize
    end
    def dispose
    end

    def self.logfunc(lf)
        @@logfunc = lf
    end

    def self.output(msg)
        @@logfunc.call msg
    end
end

