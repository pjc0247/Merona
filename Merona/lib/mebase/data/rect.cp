###################################################
#             ChocoPie GameEngine                 #
#                           Collision Check       #
###################################################

class Rect
    attr_accessor :x,:y,:w,:h

    def initialize(x=0,y=0,w=0,h=0)
        self.set(x,y,w,h)
    end
    def dispose
    end

    def set(x,y,w,h)
        @x = x
        @y = y
        @w = w
        @h = h
    end

    def +(obj)
        return Rect.new(
                        @x+obj.x,
                        @y+obj.y,
                        @w+obj.w,
                        @h+obj.h)
    end
    def -(obj)
        return Rect.new(
                        @x-obj.x,
                        @y-obj.y,
                        @w-obj.w,
                        @h-obj.h)
    end
    def *(m)
        return Rect.new(
                        @x-0.5*@w*(m-1),@y-0.5*@h*(m-1),
                        @w*m,
                        @h*m)
    end
    def /(d)
        return Rect.new(
                        @x/d,
                        @y/d,
                        @w/d,
                        @h/d)
    end
end

def HasIntersection(a,b)
    amin = a.x
    amax = amin + a.w
    bmin = b.x
    bmax = bmin + b.w
    if (bmin > amin)
        amin = bmin
    end
    if (bmax < amax)
        amax = bmax
    end
    if (amax <= amin)
        return nil
    end

    amin = a.y
    amax = amin + a.h
    bmin = b.y
    bmax = bmin + b.h
    if (bmin > amin)
        amin = bmin
    end
    if (bmax < amax)
        amax = bmax
    end
    if (amax <= amin)
        return nil
    end

    return true
end
