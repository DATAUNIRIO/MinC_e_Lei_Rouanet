# colocando o banco de dados de 2018 
#com as mesmas dimensoes dos outros bancos
# incluindo as variaveis: 

orca_2018$PagoReal<-orca_2018$Pago
orca_2018$LiquidadoReal<-orca_2018$Liquidado
orca_2018$EmpenhadoReal<-orca_2018$Empenhado

# colocando o ano
orca_2001$ano<-2001
orca_2002$ano<-2002
orca_2003$ano<-2003
orca_2004$ano<-2004
orca_2005$ano<-2005
orca_2006$ano<-2006
orca_2007$ano<-2007
orca_2008$ano<-2008
orca_2009$ano<-2009
orca_2010$ano<-2010
orca_2011$ano<-2011
orca_2012$ano<-2012
orca_2013$ano<-2013
orca_2014$ano<-2014
orca_2015$ano<-2015
orca_2016$ano<-2016
orca_2017$ano<-2017
orca_2018$ano<-2018

# juntando tudo em um unico banco de dados
orcamento<-c()
orcamento<-rbind(orcamento,orca_2001)
orcamento<-rbind(orcamento,orca_2002)
orcamento<-rbind(orcamento,orca_2003)
orcamento<-rbind(orcamento,orca_2004)
orcamento<-rbind(orcamento,orca_2005)
orcamento<-rbind(orcamento,orca_2006)
orcamento<-rbind(orcamento,orca_2007)
orcamento<-rbind(orcamento,orca_2008)
orcamento<-rbind(orcamento,orca_2009)
orcamento<-rbind(orcamento,orca_2010)
orcamento<-rbind(orcamento,orca_2011)
orcamento<-rbind(orcamento,orca_2012)
orcamento<-rbind(orcamento,orca_2013)
orcamento<-rbind(orcamento,orca_2014)
orcamento<-rbind(orcamento,orca_2015)
orcamento<-rbind(orcamento,orca_2016)
orcamento<-rbind(orcamento,orca_2017)
orcamento<-rbind(orcamento,orca_2018)

#saveRDS(orcamento,file='orcamento.RDS')




table(orca_2018$nome_UG)
table(orca_2018$nome_UO)
table(orca_2018$nome_Subfuncao)
table(orca_2018$nome_Cat_Eco)
table(orca_2018$nome_Elemento_Despesa)
table(orca_2018$Nome_Programa)

