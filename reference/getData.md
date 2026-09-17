# API wrapper that fetches data from IsoMemo Applications

Data retrieval for databases within the IsoMemo initiative
(https://isomemo.com/). Given the parameters Database name, category
names, and field names.

## Usage

``` r
getData(
  db = getDatabaseList(mapping = "IsoMemo"),
  category = NULL,
  field = NULL,
  mapping = "IsoMemo"
)
```

## Arguments

- db:

  (character) database options: "14CSea" "CIMA" "IntChron" "LiVES"

- category:

  (character) domain specific categories of fields to retrieve: "Dating
  info","Isotopic proxies." If set to NULL (default) all categories are
  returned

- field:

  (character) fields to return. If set to NULL (default) all fields will
  be returned

- mapping:

  (character) Optionally, provide a specific mapping in order to obtain
  a list of databases only for that mapping. Check available mapping ids
  with getMappings()

## Value

A data frame containing the requested databases, category domains, and
variables of interest from the user
