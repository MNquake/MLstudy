import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix
from matplotlib.colors import ListedColormap

dataset = pd.read_csv("./dataset/Social_Network_Ads.csv")
X = dataset.iloc[:,[2,3]].values
Y = dataset.iloc[:,4].values

X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size = 0.25, random_state = 0)

#特征缩放 归一化
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

#逻辑回归
classifier = LogisticRegression()
classifier.fit(X_train, y_train)

#预测
y_pred = classifier.predict(X_test)

#评估预测
#生成混淆矩阵 真正例、假正例、假反例、真反例
cm = confusion_matrix(y_test, y_pred)

#可视化
X_set,y_set=X_train,y_train
X1,X2 = np.meshgrid(np.arange(start=X_set[:,0].min()-1, stop=X_set[:,0].max()+1,step=0.01),
                    np.arange(start=X_set[:,1].min()-1,stop=X_set[:,1].max()+1,step=0.01))
    # 创建一个网格 使用两个一维数组作为输入，返回两个二维数组 (X1和X2)
    # 这两个数组可以表示平面上的所有点的坐标。其中X1表示横轴坐标，X2表示纵轴坐标

plt.contour(X1,X2,classifier.predict(np.array([X1.ravel(),X2.ravel()]).T).reshape(X1.shape),
            alpha=0.75, cmap=ListedColormap(('red', 'green')))
    # 绘制等高线图 ravel()函数将X1和X2展平为一维数组 np.array()将它们组合成一个特征向量的矩阵
    # classifier.predict(np.array([X1.ravel(),X2.ravel()]).T)用于对每个坐标点进行分类器的预测
    # cmap=ListedColormap(('red', 'green'))指定了等高线图的颜色映射。这里使用了一个名为ListedColormap()的函数
    # 并传入两种颜色('red'和'green')作为参数，来定义分类的不同标记对应的颜色
plt.xlim(X1.min(),X1.max()) # 设置X轴和Y轴的范围
plt.ylim(X2.min(),X2.max())

for i,j in enumerate(np.unique(y_set)):
    plt.scatter(X_set[y_set==j,0],X_set[y_set==j,1],
                c = ListedColormap(('red', 'green'))(i), label=j)
    # np.unique(y_set)返回目标变量(y_set)中的唯一值，并用enumerate()函数进行遍历 为每个唯一值分配一个索引i
    # 通过scatter()函数绘制散点图，其中X_set[y_set==j,0]表示根据目标变量y_set的值筛选出对应的特征变量(X_set)的第一列
    # X_set[y_set==j,1]表示筛选特征变量的第二列
    # label=

plt.title(' LOGISTIC(Training set)')
plt.xlabel(' Age')
plt.ylabel(' Estimated Salary')
plt.legend()   # 添加标签
plt.show()

X_set,y_set=X_test,y_test
X1,X2=np.meshgrid(np.arange(start=X_set[:,0].min()-1, stop=X_set[:, 0].max()+1, step=0.01),
                   np.arange(start=X_set[:,1].min()-1, stop=X_set[:,1].max()+1, step=0.01))

plt.contourf(X1, X2, classifier.predict(np.array([X1.ravel(),X2.ravel()]).T).reshape(X1.shape),
             alpha = 0.75, cmap = ListedColormap(('red', 'green')))
plt.xlim(X1.min(),X1.max())
plt.ylim(X2.min(),X2.max())
for i,j in enumerate(np.unique(y_set)):
    plt.scatter(X_set[y_set==j,0],X_set[y_set==j,1],
                c = ListedColormap(('red', 'green'))(i), label=j)

plt.title('LOGISTIC(Test set)')
plt.xlabel('Age')
plt.ylabel('Estimated Salary')
plt.legend()
plt.show()