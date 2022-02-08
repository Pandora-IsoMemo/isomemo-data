## R CMD check results
0 errors ✓ | 1 warning x | 3 notes x

There was 1 WARNING:

* checking for code which exercises the package ... WARNING
No examples, no tests, no vignettes

There were 3 NOTES:
New submission

Possibly mis-spelled words in DESCRIPTION:
  Isomemo (2:46, 6:72)

The Title field should be in title case. Current version is:
‘Package to retrieve data from the MPI Isomemo API’
In title case that is:
‘Package to Retrieve Data from the MPI Isomemo API’

The Description field should not start with the package name,
  'This package' or similar.

## Downstream dependencies
I have also run R CMD check on downstream dependencies of httr 
(https://github.com/wch/checkresults/blob/master/httr/r-release). 
All packages that I could install passed except:

* Ecoengine: this appears to be a failure related to config on 
  that machine. I couldn't reproduce it locally, and it doesn't 
  seem to be related to changes in httr (the same problem exists 
  with httr 0.4).
