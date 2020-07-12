#' @importFrom ggplot2 autoplot
#' @export
ggplot2::autoplot

#' autoplot for sts
#'
#' @import ggplot2
#' @export
autoplot.sts <- function(object, ...) {
  df <- surveillance::tidy.sts(object)
  df$alarm_date <- as.Date(ifelse(df$alarm, df$date, NA), origin = "1970-01-01")

  ggplot(df, aes_string("date", "observed")) +
    geom_col() +
    geom_step(aes_string(y = "upperbound"), color = "blue") +
    geom_point(aes_string(x = "alarm_date", y = -1), color = "red", shape = 17, na.rm = TRUE)
}
