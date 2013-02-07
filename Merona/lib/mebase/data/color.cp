class Color
    attr_accessor :r, :g, :b, :a
    
    def initialize(r=0,g=0,b=0,a=255)
        set(r,g,b,a)
    end

    def dispose
    end

    def set(r,g,b,a=255)
        @r = r
        @g = g
        @b = b
        @a = a
    end

    def self.Black
        Black
    end
    def self.White
        White
    end
    def self.Red
        Red
    end
    def self.Green
        Green
    end
    def self.Blue
        Blue
    end
    def self.Yellow
        Yellow
    end
    def self.Magenta
        Magenta
    end
    def self.Cyan
        Cyan
    end
    def self.Brown
        Brown
    end
    def self.Orange
        Orange
    end
    def self.Gray
        Gray
    end
    def self.HotPink
        HotPink
    end
    def self.Olive
        Olive
    end
    def self.DarkGray
        DarkGray
    end
end

##presets
Black = Color.new(0,0,0)
White = Color.new(255,255,255)

Red = Color.new(255,0,0)
Green = Color.new(0,255,0)
Blue = Color.new(0,0,255)

Yellow = Color.new(255,255,0)
Magenta = Color.new(255,0,255)
Cyan = Color.new(0,255,255)

Brown = Color.new(165,42,42)
Orange = Color.new(255,165,0)
Gray = Color.new(128,128,128)
DarkGray = Color.new(64,64,64)
HotPink = Color.new(255,105,180)
Olive = Color.new(128,128,0)