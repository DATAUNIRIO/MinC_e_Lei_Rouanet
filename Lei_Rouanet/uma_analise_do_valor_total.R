options(stringsAsFactors=FALSE)
options(OutDec=',')
options(digits = 3)
load("orcamento_2001_2018.RData")

library(dplyr)
orcamento2018<-aggregate(orca_2018$Pago, by=list(Category=orca_2018$Orgao_Superior), FUN=sum)
orcamento2017<-aggregate(orca_2017$PagoReal, by=list(Category=orca_2017$Orgao_Superior), FUN=sum)
orcamento2016<-aggregate(orca_2016$PagoReal, by=list(Category=orca_2016$Orgao_Superior), FUN=sum)
orcamento2015<-aggregate(orca_2015$PagoReal, by=list(Category=orca_2015$Orgao_Superior), FUN=sum)
orcamento2014<-aggregate(orca_2014$PagoReal, by=list(Category=orca_2014$Orgao_Superior), FUN=sum)
orcamento2013<-aggregate(orca_2013$PagoReal, by=list(Category=orca_2013$Orgao_Superior), FUN=sum)
orcamento2012<-aggregate(orca_2012$PagoReal, by=list(Category=orca_2012$Orgao_Superior), FUN=sum)
orcamento2011<-aggregate(orca_2011$PagoReal, by=list(Category=orca_2011$Orgao_Superior), FUN=sum)
orcamento2010<-aggregate(orca_2010$PagoReal, by=list(Category=orca_2010$Orgao_Superior), FUN=sum)
orcamento2009<-aggregate(orca_2009$PagoReal, by=list(Category=orca_2009$Orgao_Superior), FUN=sum)
orcamento2008<-aggregate(orca_2008$PagoReal, by=list(Category=orca_2008$Orgao_Superior), FUN=sum)
orcamento2007<-aggregate(orca_2007$PagoReal, by=list(Category=orca_2007$Orgao_Superior), FUN=sum)
orcamento2006<-aggregate(orca_2006$PagoReal, by=list(Category=orca_2006$Orgao_Superior), FUN=sum)
orcamento2005<-aggregate(orca_2005$PagoReal, by=list(Category=orca_2005$Orgao_Superior), FUN=sum)
orcamento2004<-aggregate(orca_2004$PagoReal, by=list(Category=orca_2004$Orgao_Superior), FUN=sum)
orcamento2003<-aggregate(orca_2003$PagoReal, by=list(Category=orca_2003$Orgao_Superior), FUN=sum)
orcamento2002<-aggregate(orca_2002$PagoReal, by=list(Category=orca_2002$Orgao_Superior), FUN=sum)
orcamento2001<-aggregate(orca_2001$PagoReal, by=list(Category=orca_2001$Orgao_Superior), FUN=sum)

orcamento2001$ano<-2001
orcamento2002$ano<-2002
orcamento2003$ano<-2003
orcamento2004$ano<-2004
orcamento2005$ano<-2005
orcamento2006$ano<-2006
orcamento2007$ano<-2007
orcamento2008$ano<-2008
orcamento2009$ano<-2009
orcamento2010$ano<-2010
orcamento2011$ano<-2011
orcamento2012$ano<-2012
orcamento2013$ano<-2013
orcamento2014$ano<-2014
orcamento2015$ano<-2015
orcamento2016$ano<-2016
orcamento2017$ano<-2017
orcamento2018$ano<-2018

orcamento<-c()
orcamento<-rbind(orcamento,orcamento2001)
orcamento<-rbind(orcamento,orcamento2002)
orcamento<-rbind(orcamento,orcamento2003)
orcamento<-rbind(orcamento,orcamento2004)
orcamento<-rbind(orcamento,orcamento2005)
orcamento<-rbind(orcamento,orcamento2006)
orcamento<-rbind(orcamento,orcamento2007)
orcamento<-rbind(orcamento,orcamento2008)
orcamento<-rbind(orcamento,orcamento2009)
orcamento<-rbind(orcamento,orcamento2010)
orcamento<-rbind(orcamento,orcamento2011)
orcamento<-rbind(orcamento,orcamento2012)
orcamento<-rbind(orcamento,orcamento2013)
orcamento<-rbind(orcamento,orcamento2014)
orcamento<-rbind(orcamento,orcamento2015)
orcamento<-rbind(orcamento,orcamento2016)
orcamento<-rbind(orcamento,orcamento2017)
orcamento<-rbind(orcamento,orcamento2018)

orcamento<-subset(orcamento, x!=0)
colnames(orcamento)<-c("Categoria","Valor","ano")

library(ggplot2)
#ggplot(orcamento, aes(x = ano, y = Valor, fill = Categoria, label = Categoria)) +
#  geom_bar(stat = "identity") +
#  geom_text(size = 1, position = position_stack(vjust = 0.5))

library(dplyr)
# QUEM GASTA COM CULTURA? QUAL MINISTÉRIO?
cultura_sem_Minc<-filter(orcamento, Categoria!='MINISTÉRIO DA CULTURA' & Categoria!='OPERAÇÕES OFICIAIS DE CRÉDITO')

p<-ggplot(cultura_sem_Minc, aes(x = ano, y = Valor, fill = Categoria, label = Categoria)) +
  geom_bar(stat = "identity") +
  geom_text(size = 6, position = position_stack(vjust = 0.5), angle = 75)
p + theme(legend.position="bottom") 


#############################################################
# O ORÇAMENTO DO MINC ESTÁ DIMINUINDO?
#############################################################

library('colormap')
#https://github.com/bpostlethwaite/colormap
COR<-colormap(colormap=colormaps$winter, nshades=18) # Diff Palette
cultura_Minc<-filter(orcamento, Categoria=='MINISTÉRIO DA CULTURA')
p<-ggplot(cultura_Minc, aes(x = ano, y = Valor, fill = Categoria, label = Categoria)) +
  geom_bar(stat = "identity",fill=COR) 
p
# COM TENDENCIA
p<-ggplot(cultura_Minc, aes(x = ano, y = Valor, fill = Categoria, label = Categoria)) +
  geom_bar(stat = "identity",fill=COR) + 
  geom_smooth()
p
#############################################################
# TAXA DE CRESCIMENTO
#############################################################
growth <- function(x)x/lag(x)-1
cultura_Minc %>% 
  mutate_each(funs(growth), Valor)
#############################################################
# QUEDA DO ORCAMENTO DE 17%
#############################################################
100*(cultura_Minc[17,2]-cultura_Minc[10,2])/cultura_Minc[10,2]

#https://www.nexojornal.com.br/explicado/2016/10/06/Lei-Rouanet-os-acertos-e-os-erros-do-incentivo-%C3%A0-cultura-no-Brasil


COR2<-colormap(colormap=colormaps$oxygen, nshades=23) 

