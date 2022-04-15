
<!-- README.md is generated from README.Rmd. Please edit that file -->

# IsoMemo

<!-- badges: start -->

[![R-CMD-check](https://github.com/Pandora-IsoMemo/isomemo-data/workflows/R-CMD-check/badge.svg)](https://github.com/Pandora-IsoMemo/isomemo-data/actions)
<!-- badges: end -->

IsoMemo is a Big Data initiative bringing together isotopic data from
archaeology, ecology, and environmental & life sciences. Isotopic
tracers are used across a variety of research fields to provide a rich
diversity of scientific information, but lack of centralized storage
limits efficient data use. The IsoMemo initiative brings together
independent repositories of isotopic data within the fields of
archaeology, ecology, and environmental & life sciences. The goals of
the initiative are to make isotopic data easily findable and accessible
so that it can be easily reused for research purposes. IsoMemo also
promotes the creation of data standards and interoperability with other
types. Within IsoMemo each independent database self-manages and curates
their data and defines metadata requirements. However, the initiative
also promotes the creation of networks linking different databases.

This R package to retrieve data from Max-Planck-Institute (MPI) IsoMemo
Web-application API and publish on CRAN for public download. For more
information, please visit: <https://isomemo.com/>

To Access All IsoMemo Apps: <https://isomemoapp.com/>

*Isomemo Project Director:*

-   Dr. Ricardo Fernandes: <fernandes@shh.mpg.de>
-   Max Planck Institute for the Science of Human History. School of
    Archaeology (University of Oxford)

*Developer*: INWT Statistics GmbH

-   API developer: Andreas Neudecker, INWT
    <andreas.neudecker@inwt-statistics.de>
-   Maintainer: Jianyin Roachell, INWT
    <jianyin.roachell@inwt-statistics.de>

## Installation

You can install the released version of IsoMemo from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("IsoMemo")
```

And the development version from [GitHub](https://github.com/) with:

``` r
options(repos = c(getOption("repos"), PANDORA = "https://Pandora-IsoMemo.github.io/drat/"))
install.packages("IsoMemo")
```

## Example of how to use the package:

``` r
options(repos = c(getOption("repos"), PANDORA = "https://Pandora-IsoMemo.github.io/drat/"))
install.packages("IsoMemo")
#> Installing package into '/nethome/jroachell/R/x86_64-pc-linux-gnu-library/4.1'
#> (as 'lib' is unspecified)
#> Warning: package 'IsoMemo' is not available for this version of R
#> 
#> A version of this package for your version of R might be available elsewhere,
#> see the ideas at
#> https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages
#> ℹ Loading IsoMemo
library(IsoMemo)
## basic example code
df = getData(db="IntChron")
head(df)
#>     source    id        description                         site dateMean
#> 1 IntChron A-205       NA , wood ,                         Semna     3290
#> 2 IntChron A-206       NA , wood ,                         Semna     3300
#> 3 IntChron A-207          , wood ,                         Kumma     3160
#> 4 IntChron A-219 NA , wood , acacia Saqqara Step Pyramid Complex     4240
#> 5 IntChron A-220       NA , wood ,                    El-Bersheh     3840
#> 6 IntChron A-330   NA , charcoal ,                         Buhen     3960
#>   dateUncertainty d13C
#> 1             120   NA
#> 2             120   NA
#> 3             160   NA
#> 4             150   NA
#> 5             150   NA
#> 6              60   NA

# with category argument
df = getData(db="IntChron",category = "Location")
head(df)
#>                           site
#> 1                        Semna
#> 2                        Semna
#> 3                        Kumma
#> 4 Saqqara Step Pyramid Complex
#> 5                   El-Bersheh
#> 6                        Buhen

# with field argument
df = getData(db="IntChron",category = "Location",field= "latitude")
#> Warning in getData(db = "IntChron", category = "Location", field = "latitude"):
#> data.frame is empty, the category or field may not exist in the database
head(df)
#> NULL
```
