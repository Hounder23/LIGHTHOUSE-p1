# Transforming and Analyzing Data with SQL

## Project/Goals
-Download and import data from the provided CSV files(located in the CSVs folder) into my local ecommercDB
-Explore/Study the imported data to gather possible insights, while also keeping an eye for garbage data
-Transform the DB tables, using SQL to clean usable data
-Save and upload notes onto the README to chronicle my process for future reference

## Process
    i started the process by creating a database named ecommerce in pgadmin4 using the setup tool
    i created a seperate table for each of the CSV files we were given to populate the DB
    in each table i had to match the file structure in regards to the names and order of each of the columns

## Results
(fill in what you discovered this data could tell you and how you used the data to answer those questions)

## Challenges 
    The beginning of the project was challengeing because i was sick with the flu and was sick in bed for half of the projects alloted 5 days.
-   While importing the data i found it difficult to choose the correct datatypes while creating the table columns in the database. 
    I found it especially challenging during this part of the process to choose how large these datatypes needed to be to accomodate the data from the table. 
    I think i chose the easy way and just ommitted sizes and chose a general but appropriate datatypes for some of the columns i was having issues with and just let postgreSQL figure it out for me during the import.
    Taking a look at the SQLs folder you can see the queries i used to create the tables and see what i mean by "easy". But i didnt have a better answer at the time.
    It was diufficult to know when to delete duplicate entries especially in the all_sessions and analytics tables. The entire cleaning process is definitly a weak point for me and my thinking though i ended up using what i think is a crude way to solve that issue with the all_sessions table i didnt know what to do with the analytics table or how to set its PK
    

## Future Goals
in this project i had
