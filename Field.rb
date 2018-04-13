class Field
    attr_accessor :value, :checked, :flag

    def initialize(value)
        @value = value
        @checked = false
        @flag = false
    end

    def is_flag?
        @flag
    end

    def is_bomb?
        @value == '#'
    end

    def is_empty?
        @value == 0
    end

    def is_checked?
        @checked
    end

    def checked=(value)
        @checked = value if @checked == false
    end

end