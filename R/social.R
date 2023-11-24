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
#' @param bg_color Background color for the HTML div (default: "#fefefe").
#' @param icon_color Color for the icons (default: "#006199").
#' @param font_color Color for the text (default: "#006199").
#' @param font_family Font family for the text (default: "roboto").
#' @return An HTML string representing the formatted social media details.
#' @importFrom glue glue
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
                           bg_color = "#fefefe",
                           icon_color = "#006199",
                           font_color = "#006199",
                           font_family = "roboto") {
  if (!require(glue))
    install.packages("glue")

  glue::glue(
    "<div style='background-color: {bg_color}; padding: 10px;'>
      <span style='font-family:\"Font Awesome 6 Brands\"; color: {icon_color};'>{github_icon}</span>
      <span style='color: {font_color}; font-family: {font_family};'> {github_username}</span><br>
      <span style='font-family:\"Font Awesome 6 Brands\"; color: {icon_color};'>{linkedIn_icon}</span>
      <span style='color: {font_color}; font-family: {font_family};'> {linkedIn_username}</span><br>
      <span style='font-family:\"Font Awesome 6 Brands\"; color: {icon_color};'>{web_icon}</span>
      <span style='color: {font_color}; font-family: {font_family};'> {web_link}</span>
    </div>"
  )
}
