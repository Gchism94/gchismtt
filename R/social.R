#' Generate Social Media HTML Caption
#'
#' This function creates an HTML string to display social media icons and
#' user details. It is designed to be used in environments that can render
#' HTML content such as R Markdown documents or Shiny applications.
#'
#' @param github_username GitHub username (default: "Gchism94").
#' @param linkedIn_username LinkedIn username (default: "greg-chism").
#' @param web_link Personal or professional website link (default: "gregtchism.com").
#' @param github_icon HTML character entity for GitHub icon (default: "&#xf09b").
#' @param linkedIn_icon HTML character entity for LinkedIn icon (default: "&#xf08c").
#' @param web_icon HTML character entity for a generic web icon (default: "&#xf0ac").
#' @param icon_col Color for the icons (default: "#006199").
#' @param text_col Color for the text (default: "#006199").
#' @param body_font Font family for the text (default: "roboto").
#' @return An HTML string representing the formatted social media details.
#' @importFrom glue glue
#' @importFrom sysfonts font_add
#' @importFrom showtext showtext_auto
#' @examples
#' social(github_username = "YourGitHub",
#'        linkedIn_username = "YourLinkedIn",
#'        web_link = "YourWebsite.com")
#' @export
social <- function(github_username = "Gchism94",
                           linkedIn_username = "greg-chism",
                           web_link = "gregtchism.com",
                           github_icon = "&#xf09b",
                           linkedIn_icon = "&#xf08c",
                           web_icon = "&#xf0ac",
                           icon_col = "#006199",
                           text_col = "#006199",
                           body_font = "roboto") {

  font_add(family = "Font Awesome 6 Brands",
                     regular = system.file("fonts/Font-Awesome-6-Brands-Regular-400.otf",
                                           package = "gchismtt",
                                           mustWork = TRUE))

  showtext_auto()

  glue(
    "<span style='font-family:\"Font Awesome 6 Brands\"; color: {icon_col};'>{github_icon}</span>
      <span style='color: {text_col}; font-family: \"{body_font}\";'> {github_username}</span>
      <span style='font-family:\"Font Awesome 6 Brands\"; color: {icon_col};'>{linkedIn_icon}</span>
      <span style='color: {text_col}; font-family: \"{body_font}\";'> {linkedIn_username}</span>
      <span style='font-family:\"Font Awesome 6 Brands\"; color: {icon_col};'>{web_icon}</span>
      <span style='color: {text_col}; font-family: \"{body_font}\";'> {web_link}</span>"
  )
}
