# -*- coding: utf-8 -*-

# -- Project --

# # Final Project - Analyzing Sales Data
# 
# **Date**: 30 March 2024
# 
# **Author**: Narubet I.
# 
# **Course**: `Pandas Foundation`


import pandas as pd

# import data
import pandas as pd
df = pd.read_csv("sample-store.csv")

# preview top 5 rows
df.head()

# shape of dataframe
df.shape

# see data frame information using .info()
df.info()

# We can use `pd.to_datetime()` function to convert columns 'Order Date' and 'Ship Date' to datetime.


# example of pd.to_datetime() function
pd.to_datetime(df['Order Date'].head(), format='%m/%d/%Y')

# TODO - convert order date and ship date to datetime in the original dataframe

df['Order Date'] = pd.to_datetime(df['Order Date'], format='%m/%d/%Y')
df['Ship Date'] = pd.to_datetime(df['Ship Date'], format='%m/%d/%Y')
#pd.to_datetime(df['Ship Date'].head())

df[['Order Date','Ship Date']]

# TODO - count nan in postal code column

df['Postal Code'].isna()

df['Postal Code'].isna().sum()

# TODO - filter rows with missing values
df_nan = df[df['Postal Code'].isna()]

df_nan

# TODO - Explore this dataset on your owns, ask your own questions
# which Sub-category has the highest profit in 2018 - 2019

Sub_categor = df[df['Order Date'].dt.strftime('%Y').between('2018','2019')]

Sub_categor.groupby('Sub-Category')['Profit'].sum().sort_values(ascending=False)

Sub_categor.groupby('Sub-Category')['Profit'].mean().sort_values(ascending=False)

# ## Data Analysis Part
# 
# Answer 10 below questions to get credit from this course. Write `pandas` code to find answers.


import datetime as dt
import numpy as np
import pandas as pd
df_store = pd.read_csv("sample-store.csv")

# TODO 01 - how many columns, rows in this dataset

df_store.shape

# TODO 02 - is there any missing values?, if there is, which colunm? how many nan values?

missing_value = df_store.isna().sum()

print(missing_value)

df_store[df_store['Postal Code'].isna()]


# TODO 03 - your friend ask for `California` data, filter it and export csv for him.

df_california = df_store[df_store['State'] == 'California']
df_california.to_csv('df_california.csv')

df_california

# TODO 04 - your friend ask for all order data in `California` and `Texas` in 2017 (look at Order Date), send him csv file

df_store['Order Date'] = pd.to_datetime(df_store['Order Date'], format='%m/%d/%Y')


friend = df_store.query("State == 'California' | State == 'Texas'")

#friend = df_store.query("State == 'California' | State == 'Texas'")

#friend = friend[friend['Order Date'].dt.strftime('%Y') == '2017'].reset_index()

friend = friend[friend['Order Date'].dt.strftime('%Y') == '2017'].reset_index()


friend.to_csv('friend.csv')

friend

# TODO 05 - how much total sales, average sales, and standard deviation of sales your company make in 2017
df_store['Order Date'] = pd.to_datetime(df['Order Date'], format='%m/%d/%Y')
df_sales = df_store[df_store['Order Date'].dt.strftime('%Y') == '2017']

df_sales['Sales'].agg(['sum','mean','std'])

# TODO 06 - which Segment has the highest profit in 2018

df_profit = df_store[df_store['Order Date'].dt.strftime('%Y') == '2018']

df_profit = df_profit.groupby('Segment')['Profit'].sum().sort_values(ascending = False )

df_profit

# TODO 07 - which top 5 States have the least total sales between 15 April 2019 - 31 December 2019

least_sales = df_store[df_store['Order Date'].dt.strftime('%Y-%m-%d').between('2019-04-15','2019-12-31')]

top_five = least_sales.groupby('State')['Sales'].sum().sort_values(ascending=False).tail(5)


top_five

# TODO 08 - what is the proportion of total sales (%) in West + Central in 2019 e.g. 25% 

df_prop = df_store[df_store['Order Date'].dt.strftime('%Y') == '2019']

df_prop = df_prop.query('Region == "West" | Region == "Central"')


Percent_prop = df_prop.groupby('Region')['Sales'].agg(Proportion_Sales = ('sum')) / df_prop['Sales'].agg('sum')*100

Percent_prop

# TODO 09 - find top 10 popular products in terms of number of orders vs. total sales during 2019-2020

pop = df_store[df_store['Order Date'].dt.strftime('%Y').between('2019','2020')]

pop.groupby('Sub-Category')[['Quantity', 'Sales']].agg(number_order = ('Quantity','sum'), total_sales = ('Sales','sum'))\
    .sort_values('number_order',ascending = False).head(10)



df_store.info()
df_store.head()

# TODO 10 - plot at least 2 plots, any plot you think interesting :)
hist = df_store['Sub-Category'].value_counts().plot(kind='bar', color = 'blue')

df_store[['Sales', 'Profit']].plot(x='Sales', y='Profit', kind = 'scatter', color = 'green')

# TODO Bonus - use np.where() to create new column in dataframe to help you answer your own questions

df_store['Profit_Inspectation'] = np.where(df_store['Profit'] >= 0, 'Positive', 'Negative')

df_store.head()

