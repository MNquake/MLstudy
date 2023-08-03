classdef MyclassName            %类名要与脚本名保持一致 一个文件仅允许定义一个类
    
    properties                  %成员变量
        prop1 = 1;              
        prop2 = 2;
        prop3 = date(now);         %可以用函数来赋予默认值
    end

    methods                     %成员方法        
        function obj = MyclassName(val1,val2)       %构造方法
            if nargin == 2                          %保证有参无参都有可以构造
                obj.prop1 = val1;
                obj.prop2 = val2;
            end
        end

        function objout = plus(obj1,obj2)           %重载加号 可以obj3 = obj1 + obj2
            objout.prop1 = obj1.prop1 + obj2.prop1;
        end

        function objout = minus(obj1,obj2)          %重载减号 可以obj3 = obj1 - obj2
            objout.prop1 = obj1.prop1 - obj2.prop1;
        end

        function out = lt(obj1,obj2)
            out = obj1.pro1 < obj2.prop1;           %重载小于号
        end

        function out = gt(obj1,obj2)
            out = obj1.pro1 > obj2.prop1;           %重载大于号
        end


    end
end

