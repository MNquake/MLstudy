linspace(1,10,9);  %表示从1到10，排列出9个数
logspace(1,10,9);  %表示等比数列，以10e1开始到10e10，排列9个数

v1 = 1:3;           %表示1到3的行向量
v2 = 1 : 2 : 5;     %表示从1到5的向量 以2为间隔
v3 = [1 : 2 : 5]';  %与上相同 只是为列向量
v1(2);              %访问向量中的元素    

ans = v2([1,2]);    %范围向量中的部分元素

mat = [1,2,3,4];    %表示矩阵
rand(3);            %生成维度是3的随机矩阵
mat2 = randi([1,10],[4,3]);%生成矩阵，前者是生成数的范围(整数)，后者是维度

a = mat2(1,:);      %表示取矩阵中第一行的所有数据
b = mat2(2,:);      %表示取矩阵中第二行的所有数据
c = mat';           %表示取矩阵的转置

reshape(mat,1,4);    %改变矩阵形状，后者为改变后的维度
diag(1:5,1);         %生成对角线矩阵,前者表示对角线的元素，后者表示第几条对角线
flipud(mat);         %翻转矩阵  对列向量进行反转
repmat(mat,2,3);     %重复矩阵
[r,c] = size(mat);           %输出矩阵形状,r和c分别存储矩阵的行数和列数

m1 = randi([1,9],[3,4]);   %三行四列的1~9的随机矩阵
m2 = randi([1,9],[4,3]);
m3 = m1 * m2;                %矩阵叉乘          
m4 = m1 .* m1;               %矩阵点乘

%-------------------------------------------------------------------------%

% 计算圆的面积
letter = input('Enter a char: ','s');       %输入的作为字符 不解读成数字
radius = input('Enter the radius: ');
area = pi * radius^2;
disp(['the area of the disc is ' num2str(area)]);
fprintf('the area of the disc is %f',area);       %另一种输出方式

%-------------------------------------------------------------------------%
v = input('Enter a vector: ');
% 直接输入 [12 4 75]


%-------------------------------画图-------------------------------------%
x = 11;
y = 48;
plot(x,y,'r*');      %标注一个点,以红色*号的形式标注出来

axis([9 12 35 55]);   %创建一个坐标轴  axis([xmin, xmax, ymin, ymax])
xlabel('Time');         %x轴名称
ylabel('Temperature');  %y轴名称

title('Time and Tempertaure')  %标题

x = 1:6;
y = [1 5 3 9 11 8];
plot(x,y,'r');          %此时会直接绘画红色线段
plot(x,y,'k--');        %此时会直接绘画段虚线
plot(x,y,'k:');         %此时会直接绘画点虚线
plot(y);                %若只赋给一个量，会直接将其作为纵坐标，横坐标为1，2，4....

plot(x,y);
hold;                   %hold会将是否擦画布的状态进行翻转，可以通过ishold判断是否擦画布 不擦画布的话 所有的plot都会显示 否则只显示最后一个
hold on;                %会一直保持不擦画布状态
hold off;               %会一直保持擦画布状态
plot(x,x+1,'x-');

figure();           %开一个新的窗口
figure(1);          %表示此时开始对figure 1进行操作
close all;          %关闭所有窗口
clf;                %清空当前画布
grid on;            %显示/隐藏网格
grid off;
legend('Line 1','Line 2','Line 3')    %绘制的解释，顺序和画线顺序一致

subplot(2,1,1);     %subplot(m,n,p) 将当前图形划分为m×n网格，在p位置创建一个画布     
plot(x,y);          %上面的操作都是对画布进行操作 一个窗口可以存放很多个画布
hold on;
subplot(2,1,2);
plot(x,y);
hold on;
subplot(2,2,[2,4]);    %还可进行组合,使得某个画布占比更大，此画布就占据了2和4的块


bar(1:10,randi([1,10],[1,10]))      %绘制柱状图
hold on;
plot(1:0.1:10,sin(1:0.1:10),1:0.1:10,cos(1:0.1:10)); %同时画多条线

year = 2016 : 2020;
pop = [0.9 1.4 1.7 1.3 1.8];
area(year, pop);                    %绘制填充折线图
title('area');
xlabel('Year');
ylabel('Population (mil)');

stem(year, pop);                    %绘制填充折线图
title('stem');
xlabel('Year');
ylabel('Population (mil)');
 
groupages = [8 19 43 25; 35 44 30 45];
bar(groupages,0.4);                 %把每行变量分为一组 宽度为0.4
bar(groupages, 'stacked')           %会把每行堆叠起来 并分组
xlabel('Group');
ylabel('Ages'); 

x = categorical({'Small', 'Medium', 'Large', 'Extra Large'});
y = [10 21 33 52];
bar(x,y);               %bar会自动对x和y进行排序
x = reordercats(x,{'Small', 'Medium', 'Large', 'Extra Large'});
bar(x,y);               %x轴会保持不排序
y = [2 3 6; 11 23 26];
bar(x,y,'FaceColor',[0 0.5 0.5], 'EdgeColor',[0 0.9 0.9],'LineWidth','1.5');               %会对每一组自动分配两个y

quizzes = randi([0 10], [50 1]);
histogram(quizzes);     %生成直方图
xlabel('Grade');
ylabel('#');

pie([11 14 8 3 1], {'A','B','C','D','E'});          %生成圆饼图 会计算每一个数占整体的权重 
legend({'A','B','C','D','E'}, 'Location','best');   %修饰图例

ax = gca;               %拿到当前处于激活状态的图的坐标轴
ax.XScale = 'log';      %更改x轴的刻度为等比数列

text(0.9,2,'2');        %在(0.9，2)的位置显示字符'2'


%动画
x = -2*pi : 1/5 : 2*pi;
y = sin(x);
n = length(x);

for i = 1 : n
    plot(x(i),y(i),'r*');
    axis([min(x)-1 max(x)+1 min(y)-1 max(y)+1])         %设置坐标轴刻度
    drawnow;                                            %绘画点
    M(i) = getframe;                                    %会将当前的画布信息存成一帧
end
movie(M);                                               %播放之前的信息
save('sinmovie', 'M');                                  %存储该动画

% 生成gif文件
h = figure(1);
filename = 'testAnimated2.gif';

for n = 1 : 0.5 : 5
   x = 0: 0.01 : 1;
   y = x.^n;
   plot(x,y);
   xlim([0,1]);                             %x坐标范围
   ylim([0,1]);
   drawnow;
   frame = getframe(h);
   im = frame2im(frame);                    %转换为图像
   [imind,cm] = rgb2ind(im,256);            %可以进行图像压缩

   if n == 1
       imwrite(imind,cm,filename,'gif','LoopCount',inf);
   else
       imwrite(imind,cm,filename,'gif','WriteMode','append');
   end
 
end

%三维图像
x = 1:5;
y = [0 -2 4 11 3];
z = 2 : 2 : 10;
plot3(x,y,z,'k*');          %绘制三维图像
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
title('3D Plot');
axis equal;                 %坐标轴不进行拉伸
view(47,44);                %锁定画布的角度

X = [1 3 0.5 2.5 2];
pie3(X);                    %绘制三维饼状图

[x, y] = meshgrid(-2*pi: 0.1 : 2 * pi);     %生成网格采样点
z = cos(x) + sin(y);
surf(x,y,z);                                %绘制三维曲面
title('cos(x) + sin(y)');
xlabel('x');
ylabel('y');
zlabel('z');
shading('interp');                          %更改图像表面细节

[x, y, z] = sphere(15);         %生成一个球体 15表示对球在精度和纬度进行15次分割
size(x);
mesh(x,y,z, 'FaceAlpha',0.5);   %和surf一样会形成表面 但表面不会填充颜色 边缘会填充颜色 透明度为20
title('Mesh of sphere');

x = -4 : 0.2 : 4;
y = sin(x);
hp = line(x,y,'LineWidth',3);

thand = text(2,0,'Sin(\pi)\rightarrow');            %\可现实符号

thand.BackgroundColor = [0.8 0.8 0.8];
thand.EdgeColor = [1 0 0];

rh = rectangle('Position', [0.2, 0.2, 0.5, 0.8], 'Curvature', [0.5, 0.1]);  %绘画长方形
axis([0 1.2 0 1.2]);    %设定坐标轴的范围       
rh.LineWidth = 3;       %设定线的样式
rh.LineStyle = ':';

v = [0 0; 1 0; 1 1; 0 1];
f = [1 2 3 4];
hp = patch('Faces',f,'Vertices',v,'FaceColor','red');     %创建一个或多个多边形，其中V指定顶点的值，F定义要连接的顶点
hp2 = patch('Faces',f,'Vertices',v+0.2,'FaceColor','blue');

ax = gca;
ax.Children = ax.Children([2 1]);           %调换次序 以达到图层的转换
 
%---------------------数据存储和读取----------------------------------------
mymat = rand(2,3);
save testfile.dat mymat -ascii;     %存储数据，tesfile.dat为存储目标，mymat为存储变量
mymat2 = rand(4,3);
save tesfile.dat mymat2 -ascii;     %会覆盖上次写入的数据
mymat3 = rand(4,3);
save tesfile.dat mymat3 -ascii -append;  %表示在文件后面添加数据

load tesfile.dat;     %读取该文件数据，存储到以文件名为变量名的变量中

%--------------------------判断语句----------------------------------------
%if condition
%
%   action-1
%
%elseif
%
%   action-2
%
%else
%
%   action-3
%
%end  

%switch input
%    case {condition,condition}
%        action-1;
%    case condition
%        action-2;
%    otherwise
%        action-3;
%end

%------------------------------循环语句------------------------------------

inputnum = NaN(10,1);

for i = 1:10

    inputnum(i) = input('Enter a number: ');

end

%画四张图
n = 4;
for i = 1:n

    x = linspace(0,2*pi,20*i);
    y = sin(x);
    subplot(1,n,i);             %将窗口分块填充画布
    plot(x,y,'ko--');
    xlabel('x');
    ylabel('y');

end

%while conditioninfo
% 
%     action
% 
% end

%----------------------------字符串----------------------------------------
Apple_char = "apple";
char = Apple_char(1);            %直接访问某个字符
char_end = Apple_char(end);      %访问最后一个字符
len = strlength(Apple_char);     %输出字符串的长度
new_Apple = "new1" + "apple";    %拼接字符串
strcat('hello','world');         %字符拼接  会忽略单一的空格
strcat("hello","world");         %字符串拼接 不会忽略单一的空格
test_char = "    test    ";
strtrim(test_char);              %去除字符串前后的空格
test_char = "---------test-------";
strip(test_char,'-');            %去除字符串中指定的前后字符
test_char = "----test--tyest--";
erase(test_char);                %去除字符串中指定的字符
lower(test_char);                %全部转小写                 
upper(test_char);                %全部转大写
strncmp(Apple_char,test_char,3); %比较两个字符串
strfind(Apple_char,'a');         %返回该字符出现的位置 
[word, rest] = strtok(Apple_char,' ');  %根据指定的字符分割字符串
endwith(Apple_char,'ch');           %字符串以什么结束
startsWith(Apple_char,'ch');        %字符串以什么开始

num = 38;
int2str(num);                   %数字转字符串
num2str(pi);                     
str2num('123');                 %字符串转数字
str2num('123 123');             %根据空格会返回一个数组

%---------------------------元胞数组---------------------------------------
%该数据结构中每个元素的类型不一致
tmp = {23, 'a', 1:2:9, "hello"};
tmp = cell(3,4);                %创建一个三行四列的空的cell矩阵
tmp1 = tmp(1);                  %返回的是元胞数组的一部分（也是一个元胞数组）
tmp1 = tmp{1};                  %返回的是相应位置的本体（不是元胞数组）
%大部分操作和矩阵操作一致
tmp(2) = [];                    %将元胞数组指定的位置删除

cvnames_char = {'Sue', 'Cathy', 'Xavier'};
strjoin(cvnames_char,'-')       %以'-'拼接在一起
strsplit(cvnames_char, '-')     %以'-'切割开

%-------------------------------结构体-------------------------------------
package = struct('item_no', 123, 'cost', 19.99, 'price', 39.95, 'code', 'g');  %变量紧随变量名后面
package.item_no;                %返回对应的成员变量
package.cost = 29.9;            %修改对应的成员变量
package = rmfield(package,'cost');        %删除选择的成员变量
isfield(package,'cost');        %判断是否为成员变量
package.('item_no');            %以字符串形式访问
package1 = struct('item_no', [], 'cost', [], 'price', [], 'code', []);  %只声明成员变量

%[**, **] = **, **               逗号分割符的赋值方式

packages(3) = struct('item_no', 123, 'cost', 19.99, 'price', 49.95, 'code', 'g');
packages(2) = struct('item_no', 456, 'cost', 9.99, 'price', 59.95, 'code', 'h');
packages(1) = struct('item_no', 789, 'cost', 29.99, 'price', 39.95, 'code', 'b');

[packages.cost] = deal(11,55,66);   %统一赋值
sum([packages.cost])                %计算总值

%categorical数组
icecream_cell = {'Vanilla', 'Chocolate', 'Chocolate', 'Rum Raisin', 'Strawberry', 'Rocky Road'};
icecream_cat = categorical(icecream_cell);          %categorical数组会以整数来进行存储 以减少存储空间

A = [...
    3,2;...
    3,3;...
    3,2;...
    2,1;...
    3,2;...
    ];
valueset = [1:3];
catnames = {'child','adult','senior'};  
B = categorical(A, valueset, catnames);             %以此方式设定categorical数组

%table数组
names = {'Harry','Sally','Jose'};
weights = [185;133;210];
heights = [74;65.4;72.2];
patients = table(weights,heights,'RowNames',names); %rowName和colName不能重复
patients(1:2,1);                                    %可以任意选取多行多列
patients('Harry',:);

%---------------------------排序-------------------------------------------
vec = [85 70 100 95 80 91];
sort(vec);                                  %直接返回递增的序列 
packages_order = sort(packages.cost);       %根据结构体内的数据进行排序
sortrows(patients,'heights');               %对table中的某一列或行进行排序
issortedrows(patients,'heights');           %判断是否已经排好序

%-----------------------------对象-----------------------------------------
fig1 = figure(1);                       %获取figure对象
line1 = plot(rand(1,10));               %获取plot对象
ax1 = fig1.children;                    %figure的子对象实际上就是坐标系
line2 = ax1.children;                   %坐标系的子对象实际上就是线段        
groot;                                  %返回最上层的figure对象
gcf;                                    %返回激活状态的figure window   

% classdef MyclassName            %类名要与脚本名保持一致 一个文件仅允许定义一个类
%     
%     properties                  %成员变量
%         prop1 = 1;              
%         prop2 = 2;
%         prop3 = date(now);         %可以用函数来赋予默认值
%     end
% 
%     methods                     %成员方法        
%         function obj = MyclassName(val1,val2)       %构造方法
%             if nargin == 2                          %保证有参无参都有可以构造
%                 obj.prop1 = val1;
%                 obj.prop2 = val2;
%             end
%         end
% 
%         function objout = plus(obj1,obj2)           %重载加号 可以obj3 = obj1 + obj2
%             objout.prop1 = obj1.prop1 + obj2.prop1;
%         end
% 
%         function objout = minus(obj1,obj2)          %重载减号 可以obj3 = obj1 - obj2
%             objout.prop1 = obj1.prop1 - obj2.prop1;
%         end
% 
%         function out = lt(obj1,obj2)
%             out = obj1.pro1 < obj2.prop1;           %重载小于号
%         end
% 
%         function out = gt(obj1,obj2)
%             out = obj1.pro1 > obj2.prop1;           %重载大于号
%         end
%     end
% end

%继承
% classdef Superclass                                 %父类
%     
%     properties
%         prop1;
%         prop2;
%     end
% 
%     methods
%         function obj = Superclass(va11,val2,val3)
%             if nargin == 2
%                 obj.prop1 = val1;
%                 obj.prop2 = val2;
%             end
%         end
% 
%         function arg1 = plus(obj1,obj2)
%             arg1 = obj1.prop1 + obj2.prop1;
%         end
% 
%     end
% end

% classdef SimpleClass < Superclass              %继承superclass类
%     properties
%        prop3;   
%     end
% 
%     methods
%         function obj = SimpleClass(val1,val2,val3)
%             obj@Superclass(val1,val2);      %继承构造函数 该行必须会被执行
%             obj.prop3 = val3;
%         end
%     end
% 
% end

% classdef SimpleClass < handle              %继承handle 会变为句柄类 
%     properties                             %这时simpleclass1 = simpleclass2 会变为相同指向而不是复制
%        prop1;                              %这时该类的对象的变量名实际上存放的是对象的地址(变量名实际上是指针名)
%     end
% 
%     methods
%         
%     end
% end
% 注意 在函数中 变量的传递的是值传递 所以修改形参实参不会更改
% 但当对象继承handle后 在函数中就是地址传递 修改形参实参会随之改变

% classdef SimpleClass
%     properties (GetAccess = public)       %对该范围的变量的获取是公开的                            
%         num = 0;
%     end
% 
%     properties (SetAccess = public)       %对该范围的变量的设定是公开的
%         word = 'hello';
%     end
% 
%     % operation      protected       private        public
%     % get        在本对象及子对象内   在本对象内      完全公开
%     % set        在本对象及子对象内   在本对象内      完全公开      
% 
%     methods
%         
%         function obj = SimpleClass(n,w)
%             if nargin == 2
%                 obj.num = n;
%                 obj.word = w;
%             end
%         end
% 
%         function obj = set.num(obj,num)   %simpleclass.num的设定有范围限制
%              if num > 0 && val <= 100
%                  obj.num = num;
%              else
%                 error('not in range');
%              end
%         end
%     end
% 
%     methods (Access = public)            %方法同样能设置属性 public static private sealed(子类不能重新定义) protected abstract
%         function obj = curve(obj,num)
%             obj.num = num
%         end
%     end
% 
%     % event
% 
%     % listen
% 
%     % some object event -> listener: object, call back function
%     
% end



%-------------------------------匿名函数-----------------------------------
cirarea = @(radius) pi * radius .^2;      %创建匿名函数      
cirarea(1);                               %实际上是句柄

volAndBase = @(len,wid,ht)[len*wid*ht, len*wid];   %多返回参数  
save 'volAndBase' 'volAndBase';                    %保存匿名函数

funh = @sin;
function funexample(funh)                           %句柄可以做为参数发送给函数
    x = 1 : 0.25 : 6;
    y = funh(x);
    plot(x,y,'ko-');
end

%----------------------可变长输入参数列表-----------------------------------
%输入参数不确定
function [area, circum] = areacirc_d(varargin)      %输入的参数列表是可变长的 varargin参数会自动打包输入的参数

    rad = varargin{1};  

    if nargin == 2            %判断输出列表的长度  nargin是一个隐藏量 表示本次输入的参数个数           
        unit = varargin{2};
        if unit == 'i'
            rad = rad / 12;
        end
    end
    area = pi * rad .^2;
    circum = 2 * pi * rad;
end

%输出参数不确定
function [type, varargout] = typesize(M)        %varargout打包不定长的输出列表

    [r, c] = szie(M);
    if r == 1 && c == 1
        type = 's';
    elseif r == 1 || c == 1
        type = 'v';
    else
        type = 'm';
    end
     
    if nargout == 1
        return;
    elseif nargout == 2 
        varargout{1} = max(r,c);
    elseif nargout == 3
        varargout{1} = r;
        varargout{2} = c;
    else
        error('Expectiong 1,2 or 3 output variable(s).');
    end
    
end
%------------------------------嵌套函数------------------------------------
function outvol = nestedvolume(len,wid,ht)
    
    outvol = base(len,wid) * ht;

    function outbase = base(len,wid)                %嵌套函数
        outbase = len * wid;                        %两个函数之间相同的变量不属于同一个变量
    end

end

function outvol = nestedvolume_(len,wid,ht) 
    
    outvol = base() * ht;

    function outbase = base()                %嵌套函数
        outbase = len * wid;                 %此时两个函数通用外函数的输入变量
        inner_x = 1;
    end
    disp(inner_x);
    inner_x = Nan;                          %在外部定义的则可以通用，甚至可以在调用的后面声明

end

%---------------------------函数-------------------------------------------
% function outputArgument = functionName(inputArgument)  %outputArgument：输出变量名 functionName：函数名 inputArgument：输入变量名

function area = calcarea(rad)   %一般文件名与函数名一致
    
area = pi * rad ^ 2;            %函数内部体

end                             %函数结束

%多输出函数
function [area, circum] = areacirc(rad)
    area = pi * rad ^ 2;
    circum = 2 * pi * rad;   
end

%无输出函数
function printem(a,b)
    
    fprintf('there is two number : %d,%d',a,b);

end

function test

    persistent count;                   %持久变量 该变量会一直记录 不论是否函数已经结束
                                        %下一次函数会唤醒该变量
    if isempty(count)                   %通过clear命令可以清空该变量 （clear test）
        count = 0;
    end
    count = count + 1;
    fprintf('The value of count is %d \n',count);
end

function outoutGlobal()

    global g;               %全局变量 函数体外也可使用和声明

    fprintf('g = %f \n',g);

end




