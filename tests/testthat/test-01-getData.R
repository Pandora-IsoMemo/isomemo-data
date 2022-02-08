test_that("getData() actually retrieves all data", {
  expect_equal(nrow(getData()), 42252)
  expect_warning(getData(db="IntChron",category = "Location", field = 'measure'),NULL)
})
