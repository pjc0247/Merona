###################################################
#             ChocoPie GameEngine                 #
#                           Stack                 #
###################################################

class Stack
    
    def initialize
        @data = []

        @p = 0
    end
    def dispose
    end

    def clear
        @p = 0
    end

    def push(v)
        @data[@p] = v
        @p += 1
    end
    def top
        if @p == 0
            nil
        else
            @data[@p-1]
        end
    end
    def pop
        @p -= 1
    end
end