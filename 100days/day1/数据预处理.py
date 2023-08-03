import numpy as np
import pandas as pd
from sklearn.preprocessing import Imputer
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler


dataset = pd.read_csv('Data.csv')

X = dataset.iloc[:, : -1].values   #切片，取出范围内的元素 选择所有行和除后一列之外的所有列
Y = dataset.iloc[:, 3].values #取第三列 .values转换为numpy储存的数组中

#处理丢失的数据
imputer = Imputer(missing_values = "NaN", strategy = "mean", axis = 0) #按列计算均值，填充Nan的缺少值
imputer = imputer.fit(X[:,1:3])             #计算填充的信息
X[:,1:3] = imputer.transform(X[:,1:3])      #填充缺少的值

#解析分类数据
labelencoder_X = LabelEncoder
X[:,0] = labelencoder_X.fit_transform(X[:,0]) #将分类变量转换为数标签

onehotencoder = OneHotEncoder(categorical_features=[0])   #将分类变量转换为数值特征，categorical_features=[0]表示第0列是分类列
X = onehotencoder.fit_transform(X).toarray()

labelencoder_Y = LabelEncoder()
Y = labelencoder_Y.fit_transform(Y)  #将分类变量转换为数标签
#LabelEncoder用于将分类变量映射为整数值，而OneHotEncoder用于进一步将整数值编码为二制向量

# 拆分数据集
X_train, X_test, Y_train, Y_test = train_test_split( X , Y , test_size = 0.2, random_state = 0) #random_state随机种子，用于控制数据集的随机划分过程

#特征量化
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)  #均值和标准差来对训练集进行标准化处理
X_test = sc_X.transform(X_test) #使用之前在训练集上计算得到的均值和标准差来对测试进行相同的标准化处理
