Select *
From PortfolioProjects ..CovidDeaths$

Select location, date, total_cases, new_cases, total_deaths, population
From PortfolioProjects..CovidDeaths$
order by 1,2

--total cases and deaths in united states 

Select location, date, total_cases,total_deaths
From PortfolioProjects..CovidDeaths$
where location like '%states%'
order by 1,2

--total cases vs population 
Select location, date, total_cases,population, (total_cases/population)*100 as Deathpercentage
From PortfolioProjects..CovidDeaths$
where location like '%states%'
order by 1,2

--looking at countries having higher rate  of infection 

Select location, population, MAX(total_cases) as InfectionCount , MAX((total_cases/population))*100 as percentagepopulationinfected
From PortfolioProjects..CovidDeaths$
Group by location, population
order by percentagepopulationinfected desc

--countries with highest death count per population
Select location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProjects..CovidDeaths$
where continent is not null
Group by location, population
order by TotalDeathCount desc

--in group of continent wiht highest death count 

 Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProjects..CovidDeaths$
where continent is not  null
Group by continent
order by TotalDeathCount desc

--total death count with compared wuth world 
Select location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProjects..CovidDeaths$
where continent is  null
Group by location
order by TotalDeathCount desc

--joining both the tables 
Select *
from PortfolioProjects..CovidVaccination$ vac
Join PortfolioProjects..CovidDeaths$ dea
	On dea.location=vac.location
	and dea.date=vac.date






