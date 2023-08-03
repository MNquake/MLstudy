import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import  train_test_split
from sklearn.linear_model import LinearRegression

#数据与处理
dataset = pd.read_csv('./dataset/studentscores.csv')
X = dataset.iloc[:,:1].values
Y = dataset.iloc[:,1].values
X_train, X_test, Y_train, Y_test = train_test_split( X, Y, test_size = 1/4, random_state = 0)

#训练
regressor = LinearRegression()
regressor = regressor.fit(X_train,Y_train)  #用最小二乘法进行训练

#预测
Y_pred = regressor.predict(X_test)

#训练集可视化
plt.scatter(X_train,Y_train,color="red")   #绘制散点图 X_train为横坐标 Y_train为纵坐标
plt.plot(X_train, regressor.predict(X_train), color='blue') #绘制折线图 X_train为横坐标 Y_train为纵坐标
plt.show()

#测试集可视化
plt.scatter(X_test,Y_test,color="red")
plt.plot(X_test , regressor.predict(X_test), color ='blue')
plt.show()

