PostgreSQL
==========

## Installs PostgreSQL for Windows from EnterpriseDB
* http://www.enterprisedb.com/products-services-training/pgdownload

## Installer Includes pgAdminIII

## Install Location, Service, and User
* Installs to **%ChocolateyBinRoot%\postgresql94**
* By default %ChocolateyBinRoot% is C:\tools

* Creates the user: **postgresql** with password: **Postgres-1234**
* Creates, and starts, a Windows Service for PostgreSQL named: **postgresql94**

## Service Control
* Run these commands from an elevated shell prompt

### Start the Service
```bash
net start PostgreSQL
```

### Stop the Service
```bash
net stop PostgreSQL
```

### Delete (remove) the Service
* **The Program Uninstaller will complain about the missing Service when you uninstall PostgreSQL, but you can safely ignore the warning.**
```bash
sc delete PostgreSQL
```

## Package name
* The **postgresql94** package name was chosen to mirror the **postgresql94** package name on RHEL Linux:



## This version was originally forked from ferventcoder
* ***On Chocolatey.org:*** http://chocolatey.org/profiles/ferventcoder
* ***On GitHub:*** https://github.com/ferventcoder




