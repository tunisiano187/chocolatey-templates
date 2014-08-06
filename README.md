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

### Test Local Package only
```bash
cinst packageName -source %cd%
```

### Test Local Package with Remote Dependencies
```
cinst packageName -source '%cd%;http://chocolatey.org/api/v2/'
```

### Force Re-install of a package
```bash
cinst packageName -source %cd% -force
```

### Enable Debug logging/output for an installation
```bash
cinst packageName -source %cd% -debug
```


## Push a Package
### From the Commandline
* Retrieve API Key from https://chocolatey.org/account
```bash
cpush packageName.nupkg
```

### From Website
* http://chocolatey.org/



