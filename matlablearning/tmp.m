v = [0 0; 1 0; 1 1; 0 1];
f = [1 2 3 4];
hp = patch('Faces',f,'Vertices',v,'FaceColor','red');     %创建一个或多个多边形，其中V指定顶点的值，F定义要连接的顶点
hp2 = patch('Faces',f,'Vertices',v+0.2,'FaceColor','blue');

ax = gca;
ax.Children = ax.Children([2 1]);           %调换次序 以达到图层的转换
