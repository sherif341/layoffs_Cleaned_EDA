-- Data Cleaning

-- 1_ Remove duplicates
-- 2_ standardize the data
-- 3_ Null values or blank values
-- 4_ Remove any columns or rows 
 
 
create table layoffs_staging
like layoffs;

insert layoffs_staging
select *
from layoffs;

select *from layoffs_staging;

-- 1_ Remove duplicates
with dublicates_cte as
(
select *,
row_number() over(partition by
company, location, industry, total_laid_off, percentage_laid_off,
 layoffs_staging.date, stage, country, funds_raised_millions) as row_num
from layoffs_staging
)
select * 
from dublicates_cte
where row_num > 1;

with dublicates_cte as
(
select *,
row_number() over(partition by
company, location, industry, total_laid_off, percentage_laid_off,
 layoffs_staging.date, stage, country, funds_raised_millions) as row_num
from layoffs_staging
)
Delete  
from dublicates_cte
where row_num > 1;

select * 
from layoffs_staging
where company='Hibob';

CREATE TABLE `layoffs_staging3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
	`row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * 
from layoffs_staging3
where row_num >1 ;


insert into layoffs_staging3
select *,
row_number() over(
partition by company, location,
 industry, total_laid_off, percentage_laid_off,layoffs_staging.date, stage,
 country, funds_raised_millions) as row_num
from layoffs_staging;

Delete 
from layoffs_staging3
where row_num >1 ;

-- 2_ standardize the data

select *
from layoffs_staging3;

select company,trim(company)
from layoffs_staging3;

update layoffs_staging3
set company = trim(company);

select distinct industry
from layoffs_staging3
order by 1;

select *
from layoffs_staging3
where company like 'Crypto%';

update layoffs_staging3
set industry ='Crypto'
where industry like 'Crypto%';

select distinct country
from layoffs_staging3
order by 1;

select distinct country,trim(trailing '.' from country)
from layoffs_staging3
order by 1;

update layoffs_staging3
set country =trim(trailing '.' from country)
where country like 'United States%';

select `date`
from layoffs_staging3;

update layoffs_staging3
set `date` = str_to_date(`date`,'%m/%d/%Y') ;

alter table layoffs_staging3
modify column `date` date;


-- 3_ Null values or blank values

select *
from layoffs_staging3
where company ='Airbnb';

select t1.industry,t2.industry
from layoffs_staging3 t1
join layoffs_staging3 t2
	on t1.company=t2.company
where (t1.industry is null or t1.industry='')
and t2.industry is not null;

update layoffs_staging3
set industry = null 
where industry ='';

update layoffs_staging3 t1
join layoffs_staging3 t2
	on t1.company=t2.company
set t1.industry =t2.industry
where t1.industry is null
and t2.industry is not null;
 
select * 
from layoffs_staging3
where industry is null 
or industry ='';

select *
from layoffs_staging3
where company like 'Bally%';


select *
from layoffs_staging3
where total_laid_off is null
and percentage_laid_off is null;

Delete
from layoffs_staging3
where total_laid_off is null
and percentage_laid_off is null;

alter table layoffs_staging3
drop column row_num;
