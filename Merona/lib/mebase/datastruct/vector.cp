###################################################
#             ChocoPie GameEngine                 #
#                           Vector                #
###################################################

class Vector
    def initialize
        @data = []
    end
    def dispose
    end

    def size
        @data.size
    end
    def [](idx)
        @data[idx]
    end
    def []=(idx,v)
        @data[idx] = v
    end

    def push_back(v)
        self[size] = v
    end
    def push(v)
        push_back(v)
    end

    def clear
        @data.clear
    end

    def delete(v)
        @data.delete v
    end
    def delete_at(idx)
        @data.delete_at idx
    end
end