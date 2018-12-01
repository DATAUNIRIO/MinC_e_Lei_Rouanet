#http://www.portaltransparencia.gov.br/download-de-dados/orcamento-despesa
#http://www.portaltransparencia.gov.br/pagina-interna/603417-dicionario-de-dados-orcamento-da-despesa


library(readr)
Orca_2017 <- read_delim("dados_portal_transparencia/2017_OrcamentoDespesa.zip.csv", 
                ";", escape_double = FALSE, locale = locale(decimal_mark = ",",
                grouping_mark = ".", encoding = "WINDOWS-1252"), 
                trim_ws = TRUE)

#names(Orca_2017)
nomes<-c('exec','cod_os','nome_os','cod_osu','nome_osu','cod_uo','nome_uo','cod_func','nome_func','cod_subfunc','nome_subfunc','cod_prog_orca','nome_prog_orca','cod_acao','nome_acao','cod_cat_eco','nome_cat_eco','cod_grupo_desp','nome_grupo_desp','cod_elemento_desp','nome_elemento_desp','orca_inicial','orca_atual','orca_realizado')
colnames(Orca_2017)<-nomes

# SELECIONANDO A FUNCAO CULTURA
# para ficar compativel com o SIGA BRASIL
library(dplyr)
Orca_2017 <- Orca_2017 %>% 
  filter(cod_func == 13)

sum(Orca_2017$orca_realizado)
# valor encontrado no portal da transparencia
#1.020.637.185 
# valor encontrado no SIGA BRASIL (Pago - R$)
#1.020.637.184,92957
# conclusao: o orcamento realizado do
#portal da transparencia e igual ao
# orcamento pago do SIGA BRASIL

############################################################

Orca_2018 <- read_delim("dados_portal_transparencia/2018_OrcamentoDespesa.zip.csv", 
                        ";", escape_double = FALSE, locale = locale(decimal_mark = ",",
                                                                    grouping_mark = ".", encoding = "WINDOWS-1252"), 
                        trim_ws = TRUE)
colnames(Orca_2018)<-nomes

# SELECIONANDO A FUNCAO CULTURA
# para ficar compativel com o SIGA BRASIL
library(dplyr)
Orca_2018 <- Orca_2018 %>% 
  filter(cod_func == 13)

sum(Orca_2018$orca_realizado)
# o orcamento de 2018 nao acabou. 
# sera que os dois sistemas (SIGA e transparencia)
# sao atualizados na mesma medida? data da consulta: 10/11/2018





# valor encontrado no portal da transparencia
#743.048.851
# valor encontrado no SIGA BRASIL (Pago - R$)
#731.562.310,15
# conclusao: o portal da transparencia atualiza mais rapido 
# do que o SIGA brasil


aggregate(Orca_2017$orca_realizado, by=list(Category=Orca_2017$nome_os), FUN=sum)
aggregate(Orca_2018$orca_realizado, by=list(Category=Orca_2018$nome_os), FUN=sum)

aggregate(Orca_2017$orca_realizado, by=list(Category=Orca_2017$nome_uo), FUN=sum)
aggregate(Orca_2018$orca_realizado, by=list(Category=Orca_2018$nome_uo), FUN=sum)



