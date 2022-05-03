#' @title API wrapper that fetches data from IsoMemo Applications
#'
#' @description Data retrieval for the Isomemoapp Project https://isomemoapp.com/
#' Given the parameters Database name, category names, and field names.
#'
#' @param db database options: "14CSea" ,  "IntChron" , "IsoArcH" , "LiVES"
#' @param category category of fields to retrieve: "Dating info","Isotopic proxies." If set to NULL (default) all categories are returned
#' @param field fields to return. If set to NULL (default) all fields will be returned
#'
#' @return A dataframe of relevant databases, categories, and fields
#' @export
#'
#' @examples
#' getData(db = "IntChron")
#' getData(db = "IntChron", category = "Location")
#' getData(db = "IntChron", category = "Location", field = "latitude")
#'
getData <- function(db = getDatabaseList(), category = NULL, field = NULL) {
  if (is.null(db)) return(NULL)

  isoData <- getRemoteDataAPI(db = db, category = category, field = field)

  if(dim(isoData)[2] == 0){
    warning("data.frame is empty, the category or field may not exist in the database")
    return(NULL)
  } else {
    isoData[sapply(isoData, is.character)] <- lapply(isoData[sapply(isoData, is.character)], as.factor)
    isoData
  }
}


#' Get field mapping table
#' @return A dataframe that contains the requested field, type, and categories of data specs
#' @export
getFields <- function() {
  mapping <- getMappingAPI()
  names(mapping) <- c("field", "fieldType", "category")
  mapping
}

#' Get list of databases available
#' @return A list of possible database names
#' @export
getDatabaseList <- function() {
  res <- callAPI("dbsources")
  if (!is.null(res)) res$dbsource
  else res
}


callAPI <- function(action, ...) {
  # return(NULL)
  params <- list(...)
  paramString <- paste(names(params), params, sep = "=", collapse = "&")

  apiBaseURL <- config$apiBaseUrl()
  url <- paste(apiBaseURL, action, "?", paramString, sep = "")
  data <- fromJSON(url)

  if (data$status == 200) data
  else if (!is.null(data$message)) {
    warning(data$message)
    NULL
  } else if (!is.null(data$error)) {
    stop(data$error)
    NULL
  }
  else {
    stop("An error occured when calling the API")
    NULL
  }
}

getRemoteDataAPI <- function(db, field = NULL, category = NULL) {
  res <- callAPI(
    "iso-data",
    dbsource = paste(db, collapse = ","),
    field = paste(field, collapse = ","),
    category = paste(category, collapse = ",")
  )
  if (!is.null(res)) {
    attr(res$isodata, "updated") <- res$updated
    res$isodata
  } else res
}

getMappingAPI <- function(){
  res <- callAPI("mapping")
  if (!is.null(res)) res$mapping
  else res
}
