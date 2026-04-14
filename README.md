SQL Project - Top Paying Skill & Role Analysis
About The Project
 1. You are an aspiring data nerd looking to analyze the top paying roles and skills
 2. You will create SQL Queries to explore this large dataset specific to you.
 3. For those job searching or looking for a promotion you can not only use this project to showcase experience but also to extract what roles/ skills you should target.

Questions to Answer
1. What are top paying jobs for my role?
2. What are skills required for these top paying roles?
3. What are the most in demand skills for my role?
4. What are top skills based on salary for my role?
5. What are the most optimal skills to learn?

📊 Data Analyst Job Market Analysis (SQL Project)
🚀 Project Objective
This project analyzes the Data Analyst job market using SQL to identify:
💰 High-paying job opportunities
📈 Most in-demand skills
🧠 Optimal skills (high demand + high salary)
🌍 Remote vs onsite job trends
The goal is to make data-driven career decisions based purely on structured data.

🗂️ Dataset Overview
The dataset follows a relational schema:
job_postings_fact → job details, salary, location
company_dim → company information
skills_job_dim → job-skill relationships
skills_dim → skill names
This structure simulates a real-world analytics database.

🛠️ Tools Used
SQL (PostgreSQL) → querying & analysis
Excel / Power BI → visualization (from SQL outputs)
GitHub → documentation

📌 Key Business Questions & Analysis

1️⃣ Top Paying Data Analyst Jobs
🔍 SQL Logic:
Filter Data Analyst roles
Remove NULL salaries
Sort by highest salary
SELECT job_title, job_location, salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;

📊 Visualization:
👉 Bar chart of Top 10 highest-paying jobs
💡 Insights:
Salaries exceed $100K+ in top roles
Remote roles dominate high-paying segment
Senior-level roles drive salary spikes

<img width="1606" height="894" alt="q1_top_paying_jobs" src="https://github.com/user-attachments/assets/196f0d24-7f03-413a-a4ea-368e8dd80353" />


2️⃣ Skills Required for Top Paying Jobs
🔍 SQL Logic:
Join job postings with skills
Filter top-paying jobs
Count skill frequency
SELECT skills, COUNT(*) AS skill_count
FROM job_postings_fact
JOIN skills_job_dim USING(job_id)
JOIN skills_dim USING(skill_id)
WHERE salary_year_avg IS NOT NULL
AND job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY skill_count DESC;

📊 Visualization:
👉 Horizontal bar chart (Skill vs Count)
💡 Insights:
SQL is the core skill across all high-paying jobs
Python is frequently required alongside SQL
Excel remains a baseline requirement
<img width="1445" height="819" alt="image" src="https://github.com/user-attachments/assets/7d03d7b4-6788-4864-b3a8-75be432085e1" />


3️⃣ Most In-Demand Skills
🔍 SQL Logic:
SELECT skills, COUNT(*) AS demand_count
FROM job_postings_fact
JOIN skills_job_dim USING(job_id)
JOIN skills_dim USING(skill_id)
WHERE job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC;

📊 Visualization:
👉 Bar chart of Top 10 in-demand skills
💡 Insights:
SQL dominates demand
Python and visualization tools follow
Demand is concentrated in core analytics stack

<img width="1514" height="894" alt="q3_most_in_demand" src="https://github.com/user-attachments/assets/3a280150-3d81-4510-892e-f7464541cb20" />


4️⃣ Highest Paying Skills
🔍 SQL Logic:
SELECT skills,
       ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
JOIN skills_job_dim USING(job_id)
JOIN skills_dim USING(skill_id)
WHERE salary_year_avg IS NOT NULL
AND job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY avg_salary DESC;

📊 Visualization:
👉 Bar chart (Skill vs Average Salary)
💡 Insights:
Cloud technologies → highest salaries
Specialized tools → high value but niche
SQL offers strong balance

<img width="1410" height="855" alt="q4_salary_by_skill" src="https://github.com/user-attachments/assets/7281564a-d8b6-4366-8b3c-13c37f6bde72" />


5️⃣ Optimal Skills (High Demand + High Salary)
🔍 SQL Logic:
SELECT 
    skills,
    COUNT(*) AS demand_count,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
JOIN skills_job_dim USING(job_id)
JOIN skills_dim USING(skill_id)
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
GROUP BY skills
HAVING COUNT(*) > 10
ORDER BY avg_salary DESC, demand_count DESC;

📊 Visualization:
👉 Scatter Plot
X-axis → Demand
Y-axis → Salary
💡 Insights:
SQL → best balance of demand + salary
Python → high demand, scalable skill
Cloud → high salary but lower demand

<img width="1451" height="1883" alt="q5_optimal_skills" src="https://github.com/user-attachments/assets/df5f6cc8-b6e4-4582-9281-87680d5994dd" />


🌍 Remote vs Onsite Jobs
🔍 SQL Logic:
SELECT 
    CASE 
        WHEN job_work_from_home = TRUE THEN 'Remote'
        ELSE 'Onsite'
    END AS job_type,
    COUNT(*) AS job_count
FROM job_postings_fact
GROUP BY job_type;



🧠 Key Takeaways
✅ SQL is the most critical skill for Data Analysts
✅ Python enhances analytical capabilities
✅ Cloud skills increase earning potential
✅ Remote jobs provide better flexibility + pay

📈 How to Recreate Visualizations
Run SQL queries in PostgreSQL
Export results as CSV
Use:
Excel → Insert Charts
Power BI → Build dashboards

🏁 Conclusion
This project demonstrates:
Strong SQL fundamentals
Real-world data analysis workflow
Ability to extract business insights

🔮 Future Improvements
Add dashboard (Power BI/Tableau)
Perform time-series analysis
Include job trend forecasting

👤 Author
Yash Malviya


