/*
Question 2. What skills are require for the top-paying data analyst jobs?
-- Use top 10 highest paying Data Analyst jobs from first query.
-- Add the specific skills required for these roles.
-- Why? it provides a detailed look at which high-paying jobs demand certain skills,
   helping job seekers understand which skills to develope that aligns with top salaries.
*/

WITH top_paying_jobs AS(
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg is NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10                
)
SELECT *
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

    /*
    Industry Insights (Top 10 Skills)
SQL leads the market with a dominant count of 8, reinforcing its position as the backbone of data querying and extraction.
Python follows closely at 7, highlighting the industry shift toward code-driven analytics and automation.
Tableau ranks third with 6, confirming that data visualization and stakeholder communication are critical expectations.
R appears with a count of 4, indicating continued demand in statistically intensive and research-oriented roles.
Pandas, Excel, and Snowflake (3 each) form the mid-tier stack, combining data manipulation, business usability, and cloud warehousing.
Azure, Power BI, and Go (2 each) represent emerging or role-specific skills that provide a competitive edge but are not universally required.
    */