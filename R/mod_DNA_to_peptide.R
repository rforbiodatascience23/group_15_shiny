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
      column(8, shiny::uiOutput(ns("DNAseq"))),
      column(4, shiny::numericInput(
          inputId = ns("randomDNA"),
          label = "Random DNA length",
          value = 6000,
          min = 3,
          max = 100000,
          step = 30)
          ,
    shiny::actionButton(
      inputId = ns("generate_dna"),
      label = "Generate random DNA", style = "margin-top: 18px;"
    ))),
    shiny::verbatimTextOutput(outputId = ns("peptide")) |>
      shiny::tagAppendAttributes(style = "white-space: pre-wrap;")
  )
}

#' DNA_to_peptide Server Functions
#'
#' @noRd
#' @import biocd
mod_DNA_to_peptide_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    dna <- reactiveVal()
    output$DNAseq <- renderUI({
      textAreaInput(
        inputId = ns("DNAseq"),
        label = "DNA sequence",
        placeholder = "Insert DNA sequence",
        value = dna(),
        height = 100,
        width = 600
      )
      observeEvent(input$generate_DNA, {
        dna(
          biocd::create_DNA(input$randomDNA)
          )
      })
    })
    output$peptide <- renderText({
      # Ensure input is not NULL and is longer than 2 characters
      if(is.null(input$DNAseq)){
        NULL
      } else if(nchar(input$DNAseq) < 3){
        NULL
      } else{
        input$DNAseq |>
          toupper() |>
          biocd::DNA_to_RNA() |>
          biocd::codons_extraction() |>
          biocd::aa_translation()
      }
    })
  })
}

## To be copied in the UI
# mod_DNA_to_peptide_ui("DNA_to_peptide_1")

## To be copied in the server
# mod_DNA_to_peptide_server("DNA_to_peptide_1")
