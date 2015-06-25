#' Remove duplicates.
#'
#' @section Aesthetics:
#' \Sexpr[results=rd,stage=build]{ggplot2:::rd_aesthetics("stat", "unique")}
#'
#' @export
#' @inheritParams stat_identity
#' @examples
#' ggplot(mtcars, aes(vs, am)) + geom_point(alpha = 0.1)
#' ggplot(mtcars, aes(vs, am)) + geom_point(alpha = 0.1, stat="unique")
stat_unique <- function (mapping = NULL, data = NULL, geom = "point",
  position = "identity", show_guide = NA, inherit.aes = TRUE, ...)
{
  Layer$new(
    data = data,
    mapping = mapping,
    stat = StatUnique,
    geom = geom,
    position = position,
    show_guide = show_guide,
    inherit.aes = inherit.aes,
    params = list(...)
  )
}

StatUnique <- R6::R6Class("StatUnique", inherit = Stat,
  public = list(
    objname = "unique",

    desc = "Remove duplicates",

    default_geom = function() GeomPoint,

    calculate_groups = function(data, scales, ...) unique(data)
  )
)
