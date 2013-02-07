class Point
    attr_accessor :x, :y

    def initialize(x=0,y=0)
        set(x,y)
    end

    def dispose
    end

    def set(x,y)
        @x = x
        @y = y
    end

    def +(obj)
        return Point.new(@x+obj.x,
                        @y+obj.y)
    end
    def -(obj)
        return Point.new(@x-obj.x,
                        @y-obj.y)
    end
end