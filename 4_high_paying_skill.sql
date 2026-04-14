/*
Question 4: What are the top paying skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focus on roles with specified salaries, regardless of location 
- Why? it reveals how diffrent skills impact salary levels for data analyst and
  helps identify the most financially rewarding skills to acquire or improve 
*/

SELECT
    skills,
    ROUND (AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg is NOT NULL AND
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 30           


/*PySpark dominates at ~$208K, proving that Big Data skills command the highest salaries in the analytics market.
Cloud and infrastructure tools (Databricks, Kubernetes, GCP) consistently appear in the high-paying range, indicating a shift toward cloud-native analytics roles.
Analysts with programming depth (Pandas, NumPy, Scikit-learn) and DevOps exposure (GitLab, Bitbucket) earn significantly more, reflecting the rise of hybrid data roles.
*/