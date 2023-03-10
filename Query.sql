/* Each company in the accounts table wants to create an email address for each primary_poc. The email address
should be the first name of the primary_poc . last name primary_poc @ company name .com. */
WITH first_last_name AS (SELECT LEFT(primary_poc, POSITION(' ' IN primary_poc) - 1) first_name,
                                RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) last_name, name
						 FROM accounts)

SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com') email
FROM first_last_name;

/* You may have noticed that in the previous solution some of the company names include spaces, which will certainly
not work in an email address. See if you can create an email address that will work by removing all of the spaces
in the account name, but otherwise your solution should be just as in question 1. */
WITH first_last_name AS (SELECT LEFT(primary_poc, POSITION(' ' IN primary_poc) - 1) first_name,
                                RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) last_name, name
						 FROM accounts)

SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', REPLACE(name, ' ', ''), '.com') email
FROM first_last_name;

/* We would also like to create an initial password, which they will change after their first log in. The first
password will be the first letter of the primary_poc's first name (lowercase), then the last letter of their
first name (lowercase), the first letter of their last name (lowercase), the last letter of their last name
(lowercase), the number of letters in their first name, the number of letters in their last name, and then the name
of the company they are working with, all capitalized with no spaces. */
WITH first_last_name AS (SELECT LEFT(primary_poc, POSITION(' ' IN primary_poc) - 1) first_name,
                                RIGHT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) last_name, name
						 FROM accounts)

SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', REPLACE(name, ' ', ''), '.com') email,
       CONCAT(LEFT(LOWER(first_name), 1), RIGHT(LOWER(first_name), 1),
       LEFT(LOWER(first_name), 1), RIGHT(LOWER(first_name), 1), LENGTH(first_name), LENGTH(last_name),
       UPPER(name)) password
FROM first_last_name;
