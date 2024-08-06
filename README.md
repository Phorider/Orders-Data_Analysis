#  Orders Analysis with Python and MySQL
This project involves extracting, cleaning, transforming, and analyzing a retail orders dataset using Python and MySQL. The goal is to generate valuable insights into sales performance, product profitability, and growth trends.

Project Overview
Steps Involved:
Data Extraction: Downloaded the dataset from Kaggle using the Kaggle API.
Data Cleaning & Transformation:
Handled missing values.
Standardized column names.
Created new columns for discount, sale price, and profit.
Converted date columns to the appropriate format.
Database Integration:
Designed and created a MySQL database and table.
Loaded the cleaned and transformed data into the MySQL table.
Data Analysis:
Conducted SQL queries to extract business insights.
Getting Started
Prerequisites
Python 3.x
Pandas
SQLAlchemy
PyMySQL
Kaggle API
MySQL Server
Installation
Clone the Repository:

bash
Copy code
git clone https://github.com/Phorider/pizzaSalesSQL.git
cd pizzaSalesSQL
Install Required Packages:

bash
Copy code
pip install kaggle pandas sqlalchemy pymysql
Configure Kaggle API:

Create an account on Kaggle and get your API credentials.
Place the kaggle.json file in the appropriate directory (usually ~/.kaggle/).
Running the Project
Download and Extract Dataset:

Use the provided script to download and extract the dataset.
Data Cleaning and Transformation:

Run the script to clean and transform the data.
Database Integration:

Run the script to load the data into the MySQL database.
Data Analysis:

Use the provided SQL queries to analyze the data and generate insights.
Key SQL Queries for Analysis
Top 10 Highest Revenue Generating Products
Top 5 Highest Selling Products in Each Region
Month-over-Month Sales Growth for 2022 and 2023
Highest Sales Month for Each Category
Highest Profit Growth by Sub-Category (2023 vs. 2022)
Conclusion
This project demonstrates the end-to-end process of data extraction, transformation, and analysis using Python and MySQL. The insights generated from the SQL queries can help businesses make informed decisions and identify key areas for growth.
