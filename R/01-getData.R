#' @title API wrapper that fetches data from IsoMemo Applications
#'
#' @description Data retrieval for databases within the IsoMemo initiative (https://isomemo.com/). Given the parameters Database
#' name, category names, and field names.
#'
#'
#' @param db database options:  "14CSea"   "CIMA"     "IntChron" "LiVES"
#' @param category domain specific categories of fields to retrieve: "Dating info","Isotopic proxies." If set to NULL (default) all categories are returned
#' @param field fields to return. If set to NULL (default) all fields will be returned
#' @param mappingId (character) Optionally, provide a specific mappingId in order to obtain a list
#'  of databases only for that mapping. Check available mapping ids with getMappingIds().
#'
#' @return A data frame containing the requested databases, category domains, and variables of interest from the user
#' @export
#'
#' @examples
#' getData(db = "IntChron")
#' getData(db = "IntChron", category = "Location")
#' getData(db = "IntChron", category = "Location", field = "latitude")
#' getData(db = "IntChron", category = "Location", field = "latitude", mappingId = "IsoMemo")
#'
getData <- function(db = getDatabaseList(mappingId = "IsoMemo"),
                    category = NULL,
                    field = NULL,
                    mappingId = "IsoMemo") {
  if (is.null(db)) return(NULL)

  isoData <- getRemoteDataAPI(db = db, category = category, field = field, mappingId = mappingId)

  if(length(isoData) == 0){
    warning("data.frame is empty, the category or field may not exist in the database")
    return(NULL)
  } else {
    isoData[sapply(isoData, is.character)] <- lapply(isoData[sapply(isoData, is.character)], as.factor)
    isoData
  }
}


#' Get field mapping table
#' @return A data frame that describes data field name, data type, and domain category
#' @inheritParams getData
#' @export
getFields <- function(mappingId = "IsoMemo") {
  mapping <- getMappingAPI(mappingId = mappingId)
  names(mapping) <- c("field", "fieldType", "category")
  mapping
}

#' Get Mapping Ids
#'
#' Get all available mapping ids
#'
#' @export
getMappingIds <- function() {
  res <- callAPI("mapping-ids")
  if (!is.null(res) && length(res) > 0)
    res$mappingIds
  else
    res
}

#' Get Database List
#'
#' @param mappingId (character) If desired, provide a different mappingId in order to obtain a list
#'  of databases for that mapping. Check available mapping ids with getMappingIds().
#' @export
getDatabaseList <- function(mappingId = "IsoMemo") {
  res <- callAPI("dbsources", mappingId = mappingId)
  if (!is.null(res) && length(res) > 0)
    res$dbsource
  else
    res
}


#' Call API
#'
#' @param action (character) name of the endpoint, one of "mapping-ids", "dbsources", "iso-data" or
#'  "mapping"
#' @param ... parameters for the endpoint, e.g. mappingId = "IsoMemo", dbsource = "LiVES,
#'  field = "site,longitude", ...
callAPI <- function(action, ...) {
  if (!has_internet()) {
    warning("No internet connection.")
    res <- list()
    attr(res, "errorApi") <- "No internet connection ..."
    return(res)
  }

  params <- list(...)
  paramString <- paste(names(params), params, sep = "=", collapse = "&")

  apiBaseURL <- config$apiBaseUrl()
  url <- paste(apiBaseURL, action, "?", paramString, sep = "")

  data <- try({
    fromJSON(url)
  }, silent = TRUE)

  if (inherits(data, "try-error")) {
    warning(data[[1]])
    res <- list()
    attr(res, "errorApi") <- data[[1]]
  } else if (data$status == 200) {
    res <- data
  } else if (!is.null(data$message)) {
    warning(data$message)
    res <- list()
    attr(res, "errorApi") <- data$message
  } else if (!is.null(data$error)) {
    warning(data$error)
    res <- list()
    attr(res, "errorApi") <- data$error
  } else {
    warning("An error occured")
    res <- list()
    attr(res, "errorApi") <- "An error occured"
  }

  res
}

getRemoteDataAPI <- function(db = NULL, field = NULL, category = NULL, mappingId = "IsoMemo") {
  res <- callAPI(
    "iso-data",
    mappingId = mappingId,
    dbsource = paste(db, collapse = ","),
    field = paste(field, collapse = ","),
    category = paste(category, collapse = ",")
  )

  if (!is.null(res) && length(res) > 0) {
    attr(res$isodata, "updated") <- res$updated
    res$isodata
  } else res
}

getMappingAPI <- function(mappingId = "IsoMemo") {
  res <- callAPI("mapping", mappingId = mappingId)
  if (!is.null(res) && length(res) > 0)
    res$mapping
  else
    res
}

has_internet <- function(timeout = 2) {
  res <- try({
    httr::GET("http://google.com/", timeout(timeout))
  }, silent = TRUE)

  ! inherits(res, "try-error")
}
