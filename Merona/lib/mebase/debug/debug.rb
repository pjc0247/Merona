class Debug
    attr_accessor :debuging
    @@debugging = true

    def self.eval(cmd)
        evalString(cmd)
    end

    def self.error(msg)
        debugError(msg)
    end

    def self.assert(&block)
        return Debug.assertBlock(&block)
    end
    def self.assertBlock(&block)
        if @@debugging == false
            return
        end
        ret = block.call
        if(ret == true)
        else
            Debug.error("Assertion Failed\n\n" +
                        block.to_s
                        )

        end
    end
    def self.assertString(msg)
        if @@debugging == false
            return
        end
        ret = Debug.eval(msg)
        if(ret == true)
        else
            Debug.error("Assertion Failed"+
                        msg)
        end
    end

    def self.protect(msg="none",&block)
        begin
            block.call
        rescue
            Debug.error("An error has occurred\n\n" +
                        "message : " + msg  + "\n\n" +
                        "code : " + block.to_s + "\n\n" +
                        "error : " + "#{$!}")
        end
    end
end