# Get field mapping table

Get field mapping table

## Usage

``` r
getFields(mapping = "IsoMemo", colnamesAPI = FALSE)
```

## Arguments

- mapping:

  (character) Optionally, provide a specific mapping in order to obtain
  a list of databases only for that mapping. Check available mapping ids
  with getMappings()

- colnamesAPI:

  (logical) Optionally, return a dataframe with the column names as they
  come from the 'IsoMemo' API

## Value

A data frame that describes data field name, data type, and domain
category
