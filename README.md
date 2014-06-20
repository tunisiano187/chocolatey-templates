chocolatey-templates
====================

* Templates for creating Chocolatey (http://www.chocolatey.org/) packages

## Package
* In the directory where the nuspec is:
```bash
cpack
```

## Test a Package
* In the same directory as the .nupkg file
```bash
cinst packageName -source %cd%
```

## Push a Package
### From the Commandline
```bash
cpush packageName.nupkg
```

### From Website
* http://chocolatey.org/



