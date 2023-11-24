#' #'Create folder and files for #TidyTuesday data viz
#' @param date_chr Date of #TidyTuesday in yyyy-mm-dd format.
#' @param readme Boolean indicating whether to also use README template.
#' @return a message if template file was successfully copied over
#' @export
use_tt_template <- function(date_chr = "yyyy-mm-dd",
                            readme = TRUE) {
  # check date in correct format
  if (is.na(as.Date(date_chr, format = "%Y-%m-%d"))) {
    stop("'date_chr' in incorrect format. Should be yyyy-mm-dd.")
  }
  # get year from date
  yr <- sub("-.*", "", date_chr)
  date_strip <- stringr::str_remove_all(date_chr, "-")
  # make folder
  new_folder <- file.path(yr, date_chr)
  if (!file.exists(new_folder)) {
    dir.create(new_folder, recursive = TRUE)
    message("Created new folder")
  }
  # make new file
  new_file <- file.path(yr, date_chr, paste0(date_strip, ".qmd"))
  if (!file.exists(new_file)) {
    file.create(new_file)
    message("Created '.qmd' file")
    # copy lines to .qmd file
    r_txt <- readLines(system.file("quarto-template.qmd",
                                   package = "gchismtt",
                                   mustWork = TRUE
    ))
    # replace placeholder text with variables
    r_txt <- gsub(
      pattern = "yr",
      replacement = paste0("\"", yr, "\""),
      x = r_txt
    )
    r_txt <- gsub(
      pattern = "date_chr",
      replacement = paste0("\"", date_chr, "\""),
      x = r_txt
    )
    r_txt <- gsub(
      pattern = "date_strip",
      replacement = paste0("\"", date_strip, "\""),
      x = r_txt
    )
    # write to new file
    writeLines(r_txt, con = new_file)
    message("'.qmd' contents copied")
  }

  if (readme) {
    # make new README file
    new_readme <- file.path(yr, date_chr, "README.md")
    if (!file.exists(new_readme)) {
      file.create(new_readme)
      message("Created 'README.md' file")
      # copy lines to README file
      readme_txt <- readLines(system.file("readme-template.md",
                                          package = "gchismtt",
                                          mustWork = TRUE
      ))
      # replace placeholder text with variables
      readme_txt <- gsub(
        pattern = "yr", replacement = yr, x = readme_txt
      )
      readme_txt <- gsub(
        pattern = "date_chr", replacement = date_chr, x = readme_txt
      )
      readme_txt <- gsub(
        pattern = "date_strip", replacement = date_strip, x = readme_txt
      )
      # write to file
      writeLines(readme_txt, con = new_readme)
      message("'README.md' contents copied")
    }
  }
  message("Template successfully copied!")
}
