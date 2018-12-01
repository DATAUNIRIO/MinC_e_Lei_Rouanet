orca_2018<-readRDS('orca_2018.rds')

names(orca_2018)
table(orca_2018$nome_UO)
table(orca_2018$nome_Subfuncao)
orca_2018$nome_UO<-gsub("FUNDAÇÃO BIBLIOTECA NACIONAL - BN","FUNDAÇÃO BIBLIOTECA NACIONAL",orca_2018$nome_UO)
orca_2018$nome_UO<-gsub("MINISTÉRIO DA CULTURA - ADMINISTRAÇÃO DIRETA","MINISTÉRIO DA CULTURA",orca_2018$nome_UO)
orca_2018$nome_UO<-gsub("INSTITUTO DO PATRIMÔNIO HISTÓRICO E ARTÍSTICO NACIONAL","IPHAN",orca_2018$nome_UO)
orca_2018$nome_Subfuncao<-gsub("ADMINISTRACAO GERAL","ADMINISTRAÇÃO",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("ADMINISTRAÇÃO GERAL","ADMINISTRAÇÃO",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("ADMINISTRAÇÃO FINANCEIRA","ADMINISTRAÇÃO",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("ATENCAO BASICA","ATENÇÃO BÁSICA",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("COMUNICACAO SOCIAL","COMUNICAÇÃO SOCIAL",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("DESENVOLVIMENTO CIENTIFICO","DESENVOLVIMENTO CIENTÍFICO",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("DIFUSAO CULTURAL","DIFUSÃO CULTURAL",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("DIREITOS INDIVIDUAIS, COLETIVOS E DIFUSOS","DIREITOS INDIV, COLETI E DIFUSOS",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("EDUCAÇÃO ESPECIAL","EDUCAÇÃO INFANTIL/ESPECIAL",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("EDUCAÇÃO INFANTIL","EDUCAÇÃO INFANTIL/ESPECIAL",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("FORMACAO DE RECURSOS HUMANOS","FORMAÇÃO DE RECURSOS HUMANOS",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("NORMATIZACAO E FISCALIZACAO","NORMATIZAÇÃO E FISCALIZAÇÃO",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("OUTRAS TRANSFERÊNCIAS","OUTROS",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("OUTROS ENCARGOS ESPECIAIS","OUTROS",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("PATRIMONIO HISTORICO, ARTISTICO E ARQUEOLOGICO","PATRIMÔNIO",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("PATRIMÔNIO HISTÓRICO, ARTÍSTICO E ARQUEOLÓGICO","PATRIMÔNIO",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("PROMOCAO COMERCIAL","PROMOÇÃO COMERCIAL",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("PROMOÇÃO INDUSTRIAL","PRODUÇÃO INDUSTRIAL",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("PROTECAO E BENEFICIOS AO TRABALHADOR","PROTEÇÃO AO TRABALHADOR",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("PROTEÇÃO E BENEFÍCIOS AO TRABALHADOR","PROTEÇÃO AO TRABALHADOR",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("TRANSFERÊNCIAS","OUTROS",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("ADMINISTRACAO GERAL","ADMINISTRAÇÃO",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("ADMINISTRACAO GERAL","ADMINISTRAÇÃO",orca_2018$nome_Subfuncao)
orca_2018$nome_Subfuncao<-gsub("ADMINISTRACAO GERAL","ADMINISTRAÇÃO",orca_2018$nome_Subfuncao)

library(treemap)
Minc2018<-itreemap(orca_2018,command.line.output	
=FALSE)



library(treemap)
library(d3treeR)
  
Minc2018<-d3tree2(
    treemap(
      orca_2018
      ,index=c("nome_UO", "nome_UG")
      ,vSize="Liquidado"
      #,vColor="GNI"
      #,type="value"
    )
    )
library(htmlwidgets)
setwd('C:/Users/Hp/Google Drive/google maps e R/DATAUNIRIO/Lei_Rouanet/Lei_Rouanet/tree')
saveWidget(Minc2018, file="Minc2018.html")
