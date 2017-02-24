#' Population adjuster
#'
#' This function appends state population data
#' @param any_df The name of the dataframe you want to append to
#' @param state_type if state identification is abbreviations, use "Abbrev" if full state name, use "State"
#' @keywords per capita
#' @import dplyr
#' @export
#' @examples
#' pc_adjust()


pc_adjust <- function(any_df, state_type){
  pop <- read.csv("https://docs.google.com/spreadsheets/d/16oW_uvRJCNoOnCeAkJH4fDouFokjaGUdGFUCaFdKd6I/pub?output=csv", stringsAsFactors=F)
  colnames(any_df)[1] <- state_type
  df_adjusted <- left_join(any_df, pop, by=state_type)
  df_adjusted$per_capita <- df_adjusted[,2] / df_adjusted$Population * 1000000
  return(df_adjusted)
}
