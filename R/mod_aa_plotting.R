#' aa_plotting UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_aa_plotting_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::textAreaInput(
          inputId = ns("peptide"),
          label = "Peptide sequence",
          width = 300,
          height = 100,
          placeholder = "Insert peptide sequence"
      )
    ),
    shiny::mainPanel(
      shiny::plotOutput(
        outputId = ns("abundance")
      )
    )
  )
  )
}

#' aa_plotting Server Functions
#'
#' @noRd
#' @importFrom ggplot2 theme
#' @import biocd
mod_aa_plotting_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$abundance <- renderPlot({
      if(input$peptide == ""){
        NULL}
      else{
        input$peptide |>
          biocd::aa_distribution_plot() +
          ggplot2::theme(legend.position = "none")
      }
    })
  })
}

## To be copied in the UI
# mod_aa_plotting_ui("aa_plotting_1")

## To be copied in the server
# mod_aa_plotting_server("aa_plotting_1")
