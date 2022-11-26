#' Preview a `ggplot` in black and white
#'
#' @param plot Plot that you want to view in black and white. If it's not speficied
#' then the last plot is used. Only works with plots made with `ggplot2` (and
#' extensions).
#'
#' @export

previewbw <- function(plot) {

  if (missing(plot) || is.null(plot)) plot <- ggplot2::last_plot()

  save_path <- tempfile(fileext = ".png")
  suppressMessages(ggplot2::ggsave(save_path, plot))

  i <- magick::image_read(save_path)
  plot(magick::image_convert(i, colorspace = 'gray'))

}
