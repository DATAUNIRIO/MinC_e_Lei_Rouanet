library(pdftools)
dat <- pdftools::pdf_text('C:/Users/Hp/Downloads/tabela_rouanet.pdf')
dat <- paste0(dat, collapse = " ")
library(tabulizer)
# Location of WARN notice pdf file
#location <- 'http://www.edd.ca.gov/jobs_and_training/warn/WARN-Report-for-7-1-2016-to-10-25-2016.pdf'
location <- 'C:/Users/Hp/Downloads/tabela_rouanet.pdf'
# Extract the table
out <- extract_tables(location)
table(salicapi_projetos$UF)
require(XML)
data <- xmlParse("http://api.pgi.gov.br/api/1/serie/1479.xml")
xml_data <- xmlToList(data)



library("rjson")
json_file <- "http://api.salic.cultura.gov.br/v1/projetos/?format=json"
json_projetos <- fromJSON(file=json_file)

json_file <- "http://api.salic.cultura.gov.br/v1/proponentes/?format=json"
json_proponentes <- fromJSON(file=json_file)

