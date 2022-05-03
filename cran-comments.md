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

## 1.0.5.001 Submission
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
