#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  mod_aa_plotting_server("aa_plotting_1")
  mod_DNA_to_peptide_server("DNA_to_peptide_1")
}
