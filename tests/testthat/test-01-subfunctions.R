Sys.setenv(API_BASE_URL = "https://isomemodb.com/api/v1/")

test_that("Test getMappings()", {
  expect_true(length(getMappings()) > 0)
  expect_type(getMappings(), "character")
})

test_that("Test getDatabaseList()", {
  expect_true(length(getDatabaseList()) > 0)
  expect_type(getDatabaseList(), "character")
  expect_equal(getDatabaseList(), getDatabaseList(mapping = "IsoMemo"))
  suppressWarnings(expect_warning(getDatabaseList(mapping = "doNotExist")))
})

test_that("Test getFields()", {
  expect_true(length(getFields()) > 0)
  expect_type(getFields(), "list")
  expect_equal(getFields(), getFields(mapping = "IsoMemo"))
  suppressWarnings(expect_warning(getFields(mapping = "doNotExist")))
  expect_true(all(colnames(getFields(colnamesAPI = TRUE)) %in% c("shiny", "fieldType", "category", "mappingId")))
})

test_that("Test getData()", {
  expect_true(length(getData(db = "LiVES")) > 0)
  expect_type(getData(db = "LiVES"), "list")
  expect_equal(getData(db = "LiVES"), getData(mapping = "IsoMemo", db = "LiVES"))
  suppressWarnings(expect_warning(getData(mapping = "doNotExist", db = "LiVES")))
  expect_equal(unique(getData(db = "LiVES")$source),
               structure(1L, levels = "LiVES", class = "factor"))
})

test_that("Test getData() from data tables on main and test database", {
  # comparing the outputs of both APIs, they should be identical

  # helper function:
  mainEqualToTest <- function(main, test) {
    # identical no of rows?
    if (nrow(main) != nrow(test)) return("Number of rows differ")
    # identical no of cols?
    if (ncol(main) != ncol(test)) return("Number of cols differ")
    # identical colnames?
    if (any(colnames(main) != colnames(test))) return("Column names differ")

    # are all columns identical?
    identicalColumns <- sapply(colnames(main),
                               function(colname) {identical(main[[colname]],
                                                            test[[colname]])}
    )

    if (all(identicalColumns)) return(TRUE)

    # for the columns that are not identical:
    notIdenticalColumns <- names(identicalColumns[!identicalColumns])
    ## is data from main contained in test?
    mainPartOfTest <- sapply(notIdenticalColumns, function(column) {
      all(main[[column]] %in% test[[column]])
    })
    ## are all different values NA in main and not NA in test?
    ValueInTestButNAInMain <- sapply(notIdenticalColumns, function(column) {
      (main[[column]][!(test[[column]] %in% main[[column]])]) %>%
        is.na() %>%
        all()
    })

    differentColumns <- notIdenticalColumns[!(mainPartOfTest & ValueInTestButNAInMain)]

    if (length(differentColumns) == 0) {
      return(TRUE)
    } else {
      return(
        sprintf("values on test differ from non-NA values on main for columns %s",
                paste0(differentColumns, collapse = ", "))
      )
    }
  }

  # Arrange:
  Sys.unsetenv("API_BASE_URL")
  Sys.setenv(API_BASE_URL = "https://isomemodb.com/api/v1/")

  allDataIsoMain <- getData(db = c("14CSea", "CIMA", "IntChron", "LiVES"),
                            mapping = "IsoMemo")

  Sys.unsetenv("API_BASE_URL")
  Sys.setenv(API_BASE_URL = "https://isomemodb.com/testapi/v1/")

  allDataIsoTest <- getData(db = c("14CSea", "CIMA", "IntChron", "LiVES"),
                            mapping = "IsoMemo")

  # Act:
  expect_true(mainEqualToTest(allDataIsoMain, allDataIsoTest))
})

Sys.unsetenv("API_BASE_URL")
Sys.setenv(API_BASE_URL = "https://isomemodb.com/testapi/v1/")

# for this API the parameter mappingId ALREADY exists
test_that("Test getMappings()", {
  expect_true(length(getMappings()) > 0)
  expect_type(getMappings(), "character")
})

test_that("Test getDatabaseList()", {
  expect_true(length(getDatabaseList()) > 0)
  expect_type(getDatabaseList(), "character")
  expect_equal(getDatabaseList(), getDatabaseList(mapping = "IsoMemo"))
  suppressWarnings(expect_warning(getDatabaseList(mapping = "doNotExist")))
})

test_that("Test getFields()", {
  expect_true(length(getFields()) > 0)
  expect_type(getFields(), "list")
  expect_equal(getFields(), getFields(mapping = "IsoMemo"))
  suppressWarnings(expect_warning(getFields(mapping = "doNotExist")))
  expect_true(all(colnames(getFields(colnamesAPI = TRUE)) %in% c("shiny", "fieldType", "category", "mappingId")))
})

test_that("Test getData()", {
  expect_true(length(getData(db = "LiVES")) > 0)
  expect_type(getData(db = "LiVES"), "list")
  expect_equal(getData(db = "LiVES"), getData(mapping = "IsoMemo", db = "LiVES"))
  suppressWarnings(expect_warning(getData(mapping = "doNotExist", db = "LiVES")))
  expect_equal(unique(getData(db = "LiVES")$source),
               structure(1L, levels = "LiVES", class = "factor"))
})

Sys.unsetenv("API_BASE_URL")
