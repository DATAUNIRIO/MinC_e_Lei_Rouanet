library(readxl)

orca_2001 <- read_excel('dados_SIGA_BRASIL/xlsx/2001.xlsx')
orca_2002 <- read_excel('dados_SIGA_BRASIL/xlsx/2002.xlsx')
orca_2003 <- read_excel('dados_SIGA_BRASIL/xlsx/2003.xlsx')
orca_2004 <- read_excel('dados_SIGA_BRASIL/xlsx/2004.xlsx')
orca_2005 <- read_excel('dados_SIGA_BRASIL/xlsx/2005.xlsx')
orca_2006 <- read_excel('dados_SIGA_BRASIL/xlsx/2006.xlsx')
orca_2007 <- read_excel('dados_SIGA_BRASIL/xlsx/2007.xlsx')
orca_2008 <- read_excel('dados_SIGA_BRASIL/xlsx/2008.xlsx')
orca_2009 <- read_excel('dados_SIGA_BRASIL/xlsx/2009.xlsx')
orca_2010 <- read_excel('dados_SIGA_BRASIL/xlsx/2010.xlsx')
orca_2011 <- read_excel('dados_SIGA_BRASIL/xlsx/2011.xlsx')
orca_2012 <- read_excel('dados_SIGA_BRASIL/xlsx/2012.xlsx')
orca_2013 <- read_excel('dados_SIGA_BRASIL/xlsx/2013.xlsx')
orca_2014 <- read_excel('dados_SIGA_BRASIL/xlsx/2014.xlsx')
orca_2015 <- read_excel('dados_SIGA_BRASIL/xlsx/2015.xlsx')
orca_2016 <- read_excel('dados_SIGA_BRASIL/xlsx/2016.xlsx')
orca_2017 <- read_excel('dados_SIGA_BRASIL/xlsx/2017.xlsx')
orca_2018 <- read_excel('dados_SIGA_BRASIL/xlsx/2018.xlsx')

nomes<-c("Orgao_Superior","Cod_UO", "nome_UO","Cod_Acao","Cod_Subfuncao","nome_Subfuncao",
         "Cod_Programa","Nome_Programa","Acao","Acao_Subtitulo","PO","Cod_PI","nomePI",
         "Cod_Cat_Eco", "nome_Cat_Eco","Cod_Modalidade_Aplic", "nome__Modalidade_Aplic","Cod_Elemento_Despesa",    
         "nome_Elemento_Despesa","nome_Sub_elemento_Despesa","Cod_Sub_elemento_Despesa",
         "Cod_UG","nome_UG","Empenhado","Liquidado","Pago","RP_Pago")

colnames(orca_2001)<-nomes
colnames(orca_2002)<-nomes
colnames(orca_2003)<-nomes
colnames(orca_2004)<-nomes
colnames(orca_2005)<-nomes
colnames(orca_2006)<-nomes
colnames(orca_2007)<-nomes
colnames(orca_2008)<-nomes
colnames(orca_2009)<-nomes
colnames(orca_2010)<-nomes
colnames(orca_2011)<-nomes
colnames(orca_2012)<-nomes
colnames(orca_2013)<-nomes
colnames(orca_2014)<-nomes
colnames(orca_2015)<-nomes
colnames(orca_2016)<-nomes
colnames(orca_2017)<-nomes
colnames(orca_2018)<-nomes

# Carrega o pacote
library(deflateBR)

# Deflaciona orcamentos
orca_2001$PagoReal<-deflate(nominal_values = orca_2001$Pago, nominal_dates = as.Date("2002-01-01"), real_date = "10/2018")
orca_2002$PagoReal<-deflate(nominal_values = orca_2002$Pago, nominal_dates = as.Date("2003-01-01"), real_date = "10/2018")
orca_2003$PagoReal<-deflate(nominal_values = orca_2003$Pago, nominal_dates = as.Date("2004-01-01"), real_date = "10/2018")
orca_2004$PagoReal<-deflate(nominal_values = orca_2004$Pago, nominal_dates = as.Date("2005-01-01"), real_date = "10/2018")
orca_2005$PagoReal<-deflate(nominal_values = orca_2005$Pago, nominal_dates = as.Date("2006-01-01"), real_date = "10/2018")
orca_2006$PagoReal<-deflate(nominal_values = orca_2006$Pago, nominal_dates = as.Date("2007-01-01"), real_date = "10/2018")
orca_2007$PagoReal<-deflate(nominal_values = orca_2007$Pago, nominal_dates = as.Date("2008-01-01"), real_date = "10/2018")
orca_2008$PagoReal<-deflate(nominal_values = orca_2008$Pago, nominal_dates = as.Date("2009-01-01"), real_date = "10/2018")
orca_2009$PagoReal<-deflate(nominal_values = orca_2009$Pago, nominal_dates = as.Date("2010-01-01"), real_date = "10/2018")
orca_2010$PagoReal<-deflate(nominal_values = orca_2010$Pago, nominal_dates = as.Date("2011-01-01"), real_date = "10/2018")
orca_2011$PagoReal<-deflate(nominal_values = orca_2011$Pago, nominal_dates = as.Date("2012-01-01"), real_date = "10/2018")
orca_2012$PagoReal<-deflate(nominal_values = orca_2012$Pago, nominal_dates = as.Date("2013-01-01"), real_date = "10/2018")
orca_2013$PagoReal<-deflate(nominal_values = orca_2013$Pago, nominal_dates = as.Date("2014-01-01"), real_date = "10/2018")
orca_2014$PagoReal<-deflate(nominal_values = orca_2014$Pago, nominal_dates = as.Date("2015-01-01"), real_date = "10/2018")
orca_2015$PagoReal<-deflate(nominal_values = orca_2015$Pago, nominal_dates = as.Date("2016-01-01"), real_date = "10/2018")
orca_2016$PagoReal<-deflate(nominal_values = orca_2016$Pago, nominal_dates = as.Date("2017-01-01"), real_date = "10/2018")
orca_2017$PagoReal<-deflate(nominal_values = orca_2017$Pago, nominal_dates = as.Date("2018-01-01"), real_date = "10/2018")


orca_2001$LiquidadoReal<-deflate(nominal_values = orca_2001$Liquidado, nominal_dates = as.Date("2002-01-01"), real_date = "10/2018")
orca_2002$LiquidadoReal<-deflate(nominal_values = orca_2002$Liquidado, nominal_dates = as.Date("2003-01-01"), real_date = "10/2018")
orca_2003$LiquidadoReal<-deflate(nominal_values = orca_2003$Liquidado, nominal_dates = as.Date("2004-01-01"), real_date = "10/2018")
orca_2004$LiquidadoReal<-deflate(nominal_values = orca_2004$Liquidado, nominal_dates = as.Date("2005-01-01"), real_date = "10/2018")
orca_2005$LiquidadoReal<-deflate(nominal_values = orca_2005$Liquidado, nominal_dates = as.Date("2006-01-01"), real_date = "10/2018")
orca_2006$LiquidadoReal<-deflate(nominal_values = orca_2006$Liquidado, nominal_dates = as.Date("2007-01-01"), real_date = "10/2018")
orca_2007$LiquidadoReal<-deflate(nominal_values = orca_2007$Liquidado, nominal_dates = as.Date("2008-01-01"), real_date = "10/2018")
orca_2008$LiquidadoReal<-deflate(nominal_values = orca_2008$Liquidado, nominal_dates = as.Date("2009-01-01"), real_date = "10/2018")
orca_2009$LiquidadoReal<-deflate(nominal_values = orca_2009$Liquidado, nominal_dates = as.Date("2010-01-01"), real_date = "10/2018")
orca_2010$LiquidadoReal<-deflate(nominal_values = orca_2010$Liquidado, nominal_dates = as.Date("2011-01-01"), real_date = "10/2018")
orca_2011$LiquidadoReal<-deflate(nominal_values = orca_2011$Liquidado, nominal_dates = as.Date("2012-01-01"), real_date = "10/2018")
orca_2012$LiquidadoReal<-deflate(nominal_values = orca_2012$Liquidado, nominal_dates = as.Date("2013-01-01"), real_date = "10/2018")
orca_2013$LiquidadoReal<-deflate(nominal_values = orca_2013$Liquidado, nominal_dates = as.Date("2014-01-01"), real_date = "10/2018")
orca_2014$LiquidadoReal<-deflate(nominal_values = orca_2014$Liquidado, nominal_dates = as.Date("2015-01-01"), real_date = "10/2018")
orca_2015$LiquidadoReal<-deflate(nominal_values = orca_2015$Liquidado, nominal_dates = as.Date("2016-01-01"), real_date = "10/2018")
orca_2016$LiquidadoReal<-deflate(nominal_values = orca_2016$Liquidado, nominal_dates = as.Date("2017-01-01"), real_date = "10/2018")
orca_2017$LiquidadoReal<-deflate(nominal_values = orca_2017$Liquidado, nominal_dates = as.Date("2018-01-01"), real_date = "10/2018")

orca_2001$EmpenhadoReal<-deflate(nominal_values = orca_2001$Empenhado, nominal_dates = as.Date("2002-01-01"), real_date = "10/2018")
orca_2002$EmpenhadoReal<-deflate(nominal_values = orca_2002$Empenhado, nominal_dates = as.Date("2003-01-01"), real_date = "10/2018")
orca_2003$EmpenhadoReal<-deflate(nominal_values = orca_2003$Empenhado, nominal_dates = as.Date("2004-01-01"), real_date = "10/2018")
orca_2004$EmpenhadoReal<-deflate(nominal_values = orca_2004$Empenhado, nominal_dates = as.Date("2005-01-01"), real_date = "10/2018")
orca_2005$EmpenhadoReal<-deflate(nominal_values = orca_2005$Empenhado, nominal_dates = as.Date("2006-01-01"), real_date = "10/2018")
orca_2006$EmpenhadoReal<-deflate(nominal_values = orca_2006$Empenhado, nominal_dates = as.Date("2007-01-01"), real_date = "10/2018")
orca_2007$EmpenhadoReal<-deflate(nominal_values = orca_2007$Empenhado, nominal_dates = as.Date("2008-01-01"), real_date = "10/2018")
orca_2008$EmpenhadoReal<-deflate(nominal_values = orca_2008$Empenhado, nominal_dates = as.Date("2009-01-01"), real_date = "10/2018")
orca_2009$EmpenhadoReal<-deflate(nominal_values = orca_2009$Empenhado, nominal_dates = as.Date("2010-01-01"), real_date = "10/2018")
orca_2010$EmpenhadoReal<-deflate(nominal_values = orca_2010$Empenhado, nominal_dates = as.Date("2011-01-01"), real_date = "10/2018")
orca_2011$EmpenhadoReal<-deflate(nominal_values = orca_2011$Empenhado, nominal_dates = as.Date("2012-01-01"), real_date = "10/2018")
orca_2012$EmpenhadoReal<-deflate(nominal_values = orca_2012$Empenhado, nominal_dates = as.Date("2013-01-01"), real_date = "10/2018")
orca_2013$EmpenhadoReal<-deflate(nominal_values = orca_2013$Empenhado, nominal_dates = as.Date("2014-01-01"), real_date = "10/2018")
orca_2014$EmpenhadoReal<-deflate(nominal_values = orca_2014$Empenhado, nominal_dates = as.Date("2015-01-01"), real_date = "10/2018")
orca_2015$EmpenhadoReal<-deflate(nominal_values = orca_2015$Empenhado, nominal_dates = as.Date("2016-01-01"), real_date = "10/2018")
orca_2016$EmpenhadoReal<-deflate(nominal_values = orca_2016$Empenhado, nominal_dates = as.Date("2017-01-01"), real_date = "10/2018")
orca_2017$EmpenhadoReal<-deflate(nominal_values = orca_2017$Empenhado, nominal_dates = as.Date("2018-01-01"), real_date = "10/2018")

table(orca_2018$Orgao_Superior)

library(dplyr)
#orca_2018<-filter(orca_2018, Orgao_Superior=='MINISTÉRIO DA CULTURA')
#table(orca_2018$Orgao_Superior)
#aggregate(orca_2018$Pago, by=list(Category=orca_2018$Orgao_Superior), FUN=sum)

orca_2018<-filter(orca_2018, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2017<-filter(orca_2017, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2016<-filter(orca_2016, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2015<-filter(orca_2015, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2014<-filter(orca_2014, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2013<-filter(orca_2013, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2012<-filter(orca_2012, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2011<-filter(orca_2011, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2010<-filter(orca_2010, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2009<-filter(orca_2009, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2008<-filter(orca_2008, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2007<-filter(orca_2007, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2006<-filter(orca_2006, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2005<-filter(orca_2005, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2004<-filter(orca_2004, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2003<-filter(orca_2003, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2002<-filter(orca_2002, Orgao_Superior=='MINISTÉRIO DA CULTURA')
orca_2001<-filter(orca_2001, Orgao_Superior=='MINISTÉRIO DA CULTURA')

save(orca_2001,orca_2002,orca_2003,orca_2004,orca_2005,orca_2006,orca_2007,orca_2008,orca_2009,orca_2010,orca_2011,orca_2012,orca_2013,orca_2014,orca_2015,orca_2016,orca_2017,orca_2018, file = "orcamento_2001_2018.RData")




#require(rpivotTable)
#rpivotTable(orca_2018)

for (i in c(2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018)){
print(paste0("orca_",i))
}

for (i in c(2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018)){
  print(paste0("colnames(orca_",i,")<-nomes"))
}

for (i in c(2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018)){
  print(paste0("orcamento",i,"$ano<-",i))
}

orcamento2018$ano<-2018



for (i in c(2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018)){
  print(paste0("orcamento<-rbind(orcamento,orcamento",i,")"))
}