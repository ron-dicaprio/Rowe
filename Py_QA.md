#-*- coding:utf-8 -*-
#!/usr/bin/env python
# PyQA
## 求1-100之间所有自然数之和，用python下的for循环实现
sum=0
for i in range(0,101):
    sum=sum+i
print(sum)

## 求1-100之间所有偶数之和，用python下的for循环实现
sum=0
for i in range(0,101,2):
    sum=sum+i
print(sum)

## 给定一个整数a，输出这个整数是否为奇数或偶数。
a=100
if a%2==0:
    print('偶数')

## 用for循环输出一下99乘法表
for i in range(1,10):
    for n in range(1,i+1):
        print("%d*%d=%d" % (n,i,i*n),end=' ')
        if i==n:
            print('\n')

## 已知一个字符串'ashdkllasjdkljdsfaldsfjf1a3sd4fg35a4fg35adf1g3a2df1g32a1df'，统计'f'在字符串中出现的次数。
str_list='ashdkllasjdkljdsfaldsfjf1a3sd4fg35a4fg35adf1g3a2df1g32a1df'
count=0
for i in str_list:
    if i=='f':
        count = count +1 
print(count)

## 已知一个字符串'ashdkllasjdkljdsfaldsfjf1a3sd4fg35a4fg35adf1g3a2df1g32a1df'，如何在终端循环滚动输出。
import time
str_list='ashdkllasjdkljdsfaldsfjf1a3sd4fg35a4fg35adf1g3a2df1g32a1df'
while True:
    str_list=str_list[1:]+str_list[0]
    print(str_list, end="\r")
    time.sleep(0.5)


## 已知一个字符串'ashdkllasjdkljdsfaldsfjf1a3sd4fg35a4fg35adf1g3a2df1g32a1df'，把他转换成大写输出（小写也要会）。

str_list='ashdkllasjdkljdsfaldsfjf1a3sd4fg35a4fg35adf1g3a2df1g32a1df'
print(str_list.upper())

## 使用 Python 如何生成 200 个激活码，包含数字和大写字母。

## 找出列表 List = [10, 2, 32, 11, 2, 5, 3，23, 2, 5, 33, 88] 中最大值和最小值。

## 获取当前目录下的所有文件及文件夹，如果文件是以.py结尾的，则打印出来。



docker build -t docker-osx --build-arg SHORTNAME=catalina .