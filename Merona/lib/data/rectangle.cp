## not used

class Rect1234
    attr_accessor :x,:y,:w,:h

    def initialize(x=0,y=0,w=0,h=0)
        set(x,y,w,h)
    end
    
    def dispose
    end

    def set(x,y,w,h)
        @x = x
        @y = y
        @w = w
        @h = h
    end

    def +(p)
        return Rect.new(@x,@y,@w+p,@h+p)
    end
    def -(m)
        return Rect.new(@x,@y,@w-m,@h-m)
    end
    def *(m)
        return Rect.new(
                    @x-2*@w*(m-1),@y-2*@h*(m-1),
                    @w*m,@h*m)
    end
    def /(d)
        return Rect.new(@x/d,@y/d,@w/d,@h/d)
    end
end            