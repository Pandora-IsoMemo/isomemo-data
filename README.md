<!-- README.md is generated from README.Rmd. Please edit that file -->

# IsomemoData (CRAN R-package)

<!-- badges: start -->

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

You can install the released version of IsomemoData from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("IsomemoData")
```

Install latest development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
library(devtools)
devtools::install_github("Pandora-IsoMemo/isomemo-data")
```

## Example of how to use the package:

``` r
library(IsomemoData)
## basic example code
df = getData(db="IntChron")
head(df)
#>     source    id        description latitude longitude
#> 1 IntChron A-205       NA , wood ,   21.5083   30.9828
#> 2 IntChron A-206       NA , wood ,   21.5083   30.9828
#> 3 IntChron A-207          , wood ,   21.5083   30.9828
#> 4 IntChron A-219 NA , wood , acacia  29.8712   31.2166
#> 5 IntChron A-220       NA , wood ,   27.7625   30.9150
#> 6 IntChron A-330   NA , charcoal ,   21.9319   31.2881
#>                           site dateMean dateUncertainty  datingType d13C
#> 1                        Semna     3290             120 radiocarbon   NA
#> 2                        Semna     3300             120 radiocarbon   NA
#> 3                        Kumma     3160             160 radiocarbon   NA
#> 4 Saqqara Step Pyramid Complex     4240             150 radiocarbon   NA
#> 5                   El-Bersheh     3840             150 radiocarbon   NA
#> 6                        Buhen     3960              60 radiocarbon   NA

# with category argument
df = getData(db="IntChron",category = "Location")
head(df)
#>   latitude longitude                         site
#> 1  21.5083   30.9828                        Semna
#> 2  21.5083   30.9828                        Semna
#> 3  21.5083   30.9828                        Kumma
#> 4  29.8712   31.2166 Saqqara Step Pyramid Complex
#> 5  27.7625   30.9150                   El-Bersheh
#> 6  21.9319   31.2881                        Buhen

# with field argument
df = getData(db="IntChron",category = "Location",field= "latitude")
head(df)
#>   latitude
#> 1  21.5083
#> 2  21.5083
#> 3  21.5083
#> 4  29.8712
#> 5  27.7625
#> 6  21.9319
```
