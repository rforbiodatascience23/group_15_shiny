#' DNA_to_peptide UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_DNA_to_peptide_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(8, textAreaInput(
        inputId = ns("DNAseq"),
        label = "DNA sequence",
        width = 800,
        height = 100,
        placeholder = "Insert DNA sequence"
      )),
      column(4, numericInput(
          inputId = ns("randomDNA"),
          label = "Random DNA length",
          value = 6000,
          min = 3,
          max = 100000,
          step = 30),
        actionButton(
          inputID = ns("generate"),
          label = "Generate random DNA",
          style = "margin-top: 18px;"
          ))
    ),
    "peptide"
  )
}

#' DNA_to_peptide Server Functions
#'
#' @noRd
mod_DNA_to_peptide_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_DNA_to_peptide_ui("DNA_to_peptide_1")

## To be copied in the server
# mod_DNA_to_peptide_server("DNA_to_peptide_1")
