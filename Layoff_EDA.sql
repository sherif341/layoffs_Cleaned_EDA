-- Exploratory Data Analysis

select *
from layoffs_staging3;

select company,total_laid_off,percentage_laid_off
from layoffs_staging3
order by total_laid_off desc
limit 5;

select company,sum(total_laid_off) as total
from layoffs_staging3
group by company
order by total desc;


select min(`date`),max(`date`)
from layoffs_staging3;

select industry,sum(total_laid_off)
from layoffs_staging3
group by industry
order by 2 desc;

select country,sum(total_laid_off)
from layoffs_staging3
group by country
order by 2 desc;


select year (`date`) as yearly,sum(total_laid_off)
from layoffs_staging3
group by yearly
order by 1 ;

select stage,sum(total_laid_off)
from layoffs_staging3
group by stage
order by 2 desc;

select substring(`date`,1,7) monthly,sum(total_laid_off) total
from layoffs_staging3
group by monthly
order by total desc;

select year (`date`) as yearly, company ,sum(total_laid_off)
from layoffs_staging3
group by company,yearly
order by 2  ;

with company_year (company,years,total_layoff) as
(
select  company  ,year (`date`) ,sum(total_laid_off) 
from layoffs_staging3
group by company,year (`date`)
), company_year_rank as
(
select * ,dense_rank() over (partition by years order by total_layoff desc) ranking
from company_year
where years is not null
)
select *
from company_year_rank
where ranking <= 5;