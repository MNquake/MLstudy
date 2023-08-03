classdef Superclass                                 %父类
    
    properties
        prop1;
        prop2;
    end

    methods
        function obj = Superclass(va11,val2,val3)
            if nargin == 2
                obj.prop1 = val1;
                obj.prop2 = val2;
            end
        end

        function arg1 = plus(obj1,obj2)
            arg1 = obj1.prop1 + obj2.prop1;
        end

    end


end
