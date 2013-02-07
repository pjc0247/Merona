###################################################
#             ChocoPie GameEngine                 #
#                           Queue                 #
###################################################

class Queue
    
    def initialize
        @data = []

        @up = 0
        @dp = 0
    end
    def dispose
    end

    def clear
        @p = 0
        @dp = 0
    end

    def push(v)
        @data[@up] = v
        @up += 1
    end

    def top
        @data[@dp]
    end
    def pop
        if @up == @dp
            nil
        else
            @dp += 1
        end
    end

    def empty
        if @up == @dp
            1
        else
            nil
        end
    end
end