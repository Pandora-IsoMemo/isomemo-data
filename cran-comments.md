## 23.10.1

* fixed missing Rd-tags of:
    * getDatabaseList.Rd: \value
    * getMappings.Rd: \value
## 23.10.0

* This is a re-release of the package with a new maintainer. The old package was 
  archived on 2023-06-28.

## 1.0.6 Submission
### R CMD check results
* checking dependencies in R code ... NOTE
Namespaces in Imports field not imported from:
  'curl' 'modules'
  All declared Imports should be used.
  #### we need this curl modul for the testing
* checking examples ... NOTE
Examples with CPU (user + system) or elapsed time > 5s
        user system elapsed
getData 1.36   0.46    7.22
#### this the core function, it takes a little bit of time. It's okay.
* checking for detritus in the temp directory ... NOTE
Found the following files/directories:
  'lastMiKTeXException'

## 1.0.5 Submission 
### R CMD check results
0 errors ✓ | 0 warning ✓ | 2 notes x

* checking CRAN incoming feasibility ... NOTE
Maintainer: ‘Jianyin Roachell <jianyin.roachell@inwt-statistics.de>’

New submission

Possibly mis-spelled words in DESCRIPTION:
  IsoMemo (2:62, 11:76) 
  Response: this is not misspelled. It's the name that the client wants.
  
* checking examples ... NOTE
Examples with CPU (user + system) or elapsed time > 5s
         user system elapsed
getData 0.952    0.4   8.141

> ### Review 1
> Please omit the redundant "Package to" from your title.

Yes, done.

> Please always write package names, software names and API (application
programming interface) names in single quotes in title and description.
e.g: --> 'IsoMemo'

Yes, done.

> Please provide a link to the used webservices to the description field
of your DESCRIPTION file in the form
<http:...> or <https:...>
with angle brackets for auto-linking and no space after 'http:' and
'https:'.

Yes, done. In `DESCRIPTION` line 10

> Please add \value to .Rd files regarding exported methods and explain
the functions results in the documentation. Please write about the
structure of the output (class) and also what the output means. (If a
function does not return a value, please document that too, e.g.
\value{No return value, called for side effects} or similar)
Missing Rd-tags:
      getDatabaseList.Rd: \value
      getFields.Rd: \value

Yes, done. `getDatabaseList.Rd` (line 9) & `getFields.Rd` (line 9)
