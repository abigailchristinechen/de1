-- DE DAY 5 2021/10/05

-- Topic Questions
-- How can simplify the maintainable of long queries with similarities?
-- How can you build business logic with SQL?
-- How can you clean/fix a database with corrupted/bad quality data unfit for your analytics?

-- Objectives
-- Introducing procedural elements of SQL databases
-- Introducing Stored Procedures with parameters
-- Introducing IF/LOOP/CURSOR
-- Understanding the difference of processing data in the database vs. outside of database engine
-- Understanding the advantages and disadvantages of stored procedures
-- Example with fixing data

-- exercise #1 : Create a stored procedure which displays the first X entries of payment table. X is IN parameter for the procedure.
-- exercise #2 : Create a stored procedure which returns the amount for Xth entry of payment table. X is IN parameter for the procedure. Display the returned amount.
-- exercise #3 : Create a stored procedure which returns category of a given row. Row number is IN parameter, while category is OUT parameter. Display the returned category. CAT1 - amount > 100.000, CAT2 - amount > 10.000, CAT3 - amount <= 10.000
-- exercise #4 : Create a loop which counts to 5 and displays the actual count in each step as SELECT (eg. SELECT x)

-- HW #5 : Continue the last script: complete the US local phones to international using the city code. Hint: for this you need to find a data source with domestic prefixes mapped to cities, import as a table to the database and add new business logic to the procedure.
-- Upload the solution to your GitHub repo in a folder called HW5
-- Submit GitHub repo link to moodle when you are ready








