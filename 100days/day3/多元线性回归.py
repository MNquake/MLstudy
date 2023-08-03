import pandas as pd
import numpy as np
from sklearn.preprocessing import LabelEncoder,OneHotEncoder
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
from sklearn.compose import ColumnTransformer

#导入数据集
dataset = pd.read_csv('./dataset/50_Startups.csv')
X = dataset.iloc[:,:-1].values
Y = dataset.iloc[:,4].values

#类别标签数字化
labelencoder = LabelEncoder()
X[:,3] = labelencoder.fit_transform(X[:,3])
onehotencoder = ColumnTransformer([('State', OneHotEncoder(), [3])], remainder = 'passthrough')
X = onehotencoder.fit_transform(X)

#躲避虚拟标签陷阱
X = X[:,1:]

#拆分数据集为训练集和测试集
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.2, random_state = 0)

#训练集上训练多元线性回归模型
regressor = LinearRegression()
regressor.fit(X_train,Y_train)

#预测结果
y_pred = regressor.predict(X_test)

#可视化
plt.plot(np.arange(0,y_pred.shape[0]), y_pred, color='blue')
plt.plot(np.arange(0,y_pred.shape[0]), Y_test, color='red')
plt.show()