classdef SimpleClass
    properties (GetAccess = public)       %对该范围的变量的获取是公开的                            
        num = 0;
    end

    properties (SetAccess = public)       %对该范围的变量的设定是公开的
        word = 'hello';
    end

    % operation      protected       private        public
    % get        在本对象及子对象内   在本对象内      完全公开
    % set        在本对象及子对象内   在本对象内      完全公开      

    methods
        
        function obj = SimpleClass(n,w)
            if nargin == 2
                obj.num = n;
                obj.word = w;
            end
        end

        function obj = set.num(obj,num)   %simpleclass.num的设定有范围限制
             if num > 0 && val <= 100
                 obj.num = num;
             else
                error('not in range');
             end
        end
    end

    methods (Access = public)            %方法同样能设置属性 public static private sealed(子类不能重新定义) protected abstract
        function obj = curve(obj,num)
            obj.num = num
        end
    end

    % event

    % listen

    % some object event -> listener: object, call back function
    
end