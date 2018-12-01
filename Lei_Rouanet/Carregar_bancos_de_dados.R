#options(stringsAsFactors=FALSE)
#options(OutDec=',')
#options(digits = 22)


ministroscultura<-readRDS('ministroscultura.rds')
orcamento<-readRDS('orcamento.rds')
orca_2018<-readRDS('orca_2018.rds')

names(orcamento)
table(orcamento$nome_UO)
table(orcamento$nome_Subfuncao)
orcamento$nome_UO<-gsub("FUNDAÇÃO BIBLIOTECA NACIONAL - BN","FUNDAÇÃO BIBLIOTECA NACIONAL",orcamento$nome_UO)
orcamento$nome_UO<-gsub("MINISTÉRIO DA CULTURA - ADMINISTRAÇÃO DIRETA","MINISTÉRIO DA CULTURA",orcamento$nome_UO)
orcamento$nome_UO<-gsub("INSTITUTO DO PATRIMÔNIO HISTÓRICO E ARTÍSTICO NACIONAL","IPHAN",orcamento$nome_UO)
orcamento$nome_Subfuncao<-gsub("ADMINISTRACAO GERAL","ADMINISTRAÇÃO",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("ADMINISTRAÇÃO GERAL","ADMINISTRAÇÃO",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("ADMINISTRAÇÃO FINANCEIRA","ADMINISTRAÇÃO",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("ATENCAO BASICA","ATENÇÃO BÁSICA",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("COMUNICACAO SOCIAL","COMUNICAÇÃO SOCIAL",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("DESENVOLVIMENTO CIENTIFICO","DESENVOLVIMENTO CIENTÍFICO",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("DIFUSAO CULTURAL","DIFUSÃO CULTURAL",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("DIREITOS INDIVIDUAIS, COLETIVOS E DIFUSOS","DIREITOS INDIV, COLETI E DIFUSOS",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("EDUCAÇÃO ESPECIAL","EDUCAÇÃO INFANTIL/ESPECIAL",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("EDUCAÇÃO INFANTIL","EDUCAÇÃO INFANTIL/ESPECIAL",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("FORMACAO DE RECURSOS HUMANOS","FORMAÇÃO DE RECURSOS HUMANOS",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("NORMATIZACAO E FISCALIZACAO","NORMATIZAÇÃO E FISCALIZAÇÃO",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("OUTRAS TRANSFERÊNCIAS","OUTROS",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("OUTROS ENCARGOS ESPECIAIS","OUTROS",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("PATRIMONIO HISTORICO, ARTISTICO E ARQUEOLOGICO","PATRIMÔNIO",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("PATRIMÔNIO HISTÓRICO, ARTÍSTICO E ARQUEOLÓGICO","PATRIMÔNIO",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("PROMOCAO COMERCIAL","PROMOÇÃO COMERCIAL",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("PROMOÇÃO INDUSTRIAL","PRODUÇÃO INDUSTRIAL",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("PROTECAO E BENEFICIOS AO TRABALHADOR","PROTEÇÃO AO TRABALHADOR",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("PROTEÇÃO E BENEFÍCIOS AO TRABALHADOR","PROTEÇÃO AO TRABALHADOR",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("TRANSFERÊNCIAS","OUTROS",orcamento$nome_Subfuncao)

orcamento$nome_Subfuncao<-gsub("ADMINISTRACAO GERAL","ADMINISTRAÇÃO",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("ADMINISTRACAO GERAL","ADMINISTRAÇÃO",orcamento$nome_Subfuncao)
orcamento$nome_Subfuncao<-gsub("ADMINISTRACAO GERAL","ADMINISTRAÇÃO",orcamento$nome_Subfuncao)


library('colormap')
#https://github.com/bpostlethwaite/colormap
COR<-colormap(colormap=colormaps$winter, nshades=18) # Diff Palette

library(dplyr)
library(ggplot2)
#################
#Geral
#################
orcamento %>%
  group_by(ano) %>%
  summarize(Soma = sum(LiquidadoReal, na.rm=TRUE)) %>%
  ggplot(aes(x = ano, y = Soma)) +
  geom_bar(stat = "identity",fill=COR) 
#################
#UO
#################

p<-orcamento %>%
  group_by_at(vars(c("ano","nome_UO"))) %>%
  summarize(Soma = sum(LiquidadoReal, na.rm=TRUE)) %>%
  ggplot(aes(x = ano, y = Soma)) +
  geom_line(aes(color = nome_UO, size = 2))
p + theme(legend.position="bottom")

p<-orcamento %>%
  group_by_at(vars(c("ano","nome_UO"))) %>%
  summarize(Soma = sum(LiquidadoReal, na.rm=TRUE)) %>%
  ggplot(aes(x = ano, y = Soma)) +
  geom_line(aes(color = nome_UO, size = 2))+
  facet_wrap(~ nome_UO, scales = 'free_y', ncol = 1)
p + theme(legend.position="bottom")


p<-orcamento %>%
  group_by_at(vars(c("ano","nome_UO"))) %>%
  summarize(Soma = sum(LiquidadoReal, na.rm=TRUE)) %>%
  ggplot(aes(x = ano, y = Soma)) +
  geom_line(aes(color = nome_UO, size = 2))+
  geom_text(aes(x=2007, y=520000000, label="\nMinistério da Cultura"), text=element_text(size=13))+
  geom_text(aes(x=2009, y=420000000, label="\nFundo Nacional de Cultura"), text=element_text(size=13))+
  geom_text(aes(x=2017, y=320000000, label="\nIPHAN"), text=element_text(size=13))
p + theme(legend.position="bottom")

p<-orcamento %>%
  group_by_at(vars(c("ano","nome_UO"))) %>%
  summarize(Soma = sum(LiquidadoReal, na.rm=TRUE)) %>%
  ggplot(aes(x = ano, y = Soma)) +
  geom_line(aes(color = nome_UO, size = 2))+
  geom_vline(xintercept = 2001, colour="grey")+
  geom_vline(xintercept = 2003, colour="grey")+
  geom_vline(xintercept = 2008, colour="grey")+
  geom_vline(xintercept = 2011, colour="grey")+
  geom_vline(xintercept = 2013, colour="grey")+
  geom_vline(xintercept = 2015, colour="grey")+
  geom_vline(xintercept = 2016, colour="grey")+
  geom_vline(xintercept = 2017, colour="grey")+
  geom_text(aes(x=2001, y=450000000, label="\nWeffort"), angle=90, text=element_text(size=11))+  
  geom_text(aes(x=2003, y=450000000, label="\nGilberto Gil"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2008, y=450000000, label="\nJuca Ferreira"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2011, y=450000000, label="\nAna de Hollanda"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2013, y=450000000, label="\nMarta Suplicy"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2015, y=450000000, label="\nJuca Ferreira"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2016, y=450000000, label="\nCalero e Roberto Freire"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2017, y=450000000, label="\nSérgio Sá"), angle=90, text=element_text(size=11))
p + theme(legend.position="bottom")

#################
#nome_Subfuncao
#################

p<-orcamento %>%
  group_by_at(vars(c("ano","nome_Subfuncao"))) %>%
  summarize(Soma = sum(LiquidadoReal, na.rm=TRUE)) %>%
  ggplot(aes(x = ano, y = Soma)) +
  geom_line(aes(color = nome_Subfuncao, size = 2))+
  geom_text(aes(x=2011, y=520000000, label="\nDifusão Cultural"), text=element_text(size=13))+
  geom_text(aes(x=2005, y=420000000, label="\nAdministração"), text=element_text(size=13))
p + theme(legend.position="bottom")

p<-orcamento %>%
  group_by_at(vars(c("ano","nome_Subfuncao"))) %>%
  summarize(Soma = sum(LiquidadoReal, na.rm=TRUE)) %>%
  ggplot(aes(x = ano, y = Soma)) +
  geom_line(aes(color = nome_Subfuncao, size = 2))+
  geom_vline(xintercept = 2001, colour="grey")+
  geom_vline(xintercept = 2003, colour="grey")+
  geom_vline(xintercept = 2008, colour="grey")+
  geom_vline(xintercept = 2011, colour="grey")+
  geom_vline(xintercept = 2013, colour="grey")+
  geom_vline(xintercept = 2015, colour="grey")+
  geom_vline(xintercept = 2016, colour="grey")+
  geom_vline(xintercept = 2017, colour="grey")+
  geom_text(aes(x=2001, y=650000000, label="\nWeffort"), angle=90, text=element_text(size=11))+  
  geom_text(aes(x=2003, y=650000000, label="\nGilberto Gil"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2008, y=650000000, label="\nJuca Ferreira"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2011, y=650000000, label="\nAna de Hollanda"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2013, y=650000000, label="\nMarta Suplicy"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2015, y=650000000, label="\nJuca Ferreira"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2016, y=650000000, label="\nCalero e Roberto Freire"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2017, y=650000000, label="\nSérgio Sá"), angle=90, text=element_text(size=11))
p + theme(legend.position="bottom") 


#################
#categoria economica
#################

p<-orcamento %>%
  group_by_at(vars(c("ano","nome_Cat_Eco"))) %>%
  summarize(Soma = sum(LiquidadoReal, na.rm=TRUE)) %>%
  ggplot(aes(x = ano, y = Soma)) +
  geom_line(aes(color = nome_Cat_Eco, size = 2))+
  geom_text(aes(x=2010, y=920000000, label="\nDespesas Correntes"), text=element_text(size=13))+
  geom_text(aes(x=2005, y=220000000, label="\nDespesas de Capital"), text=element_text(size=13))
p + theme(legend.position="bottom")

p<-orcamento %>%
  group_by_at(vars(c("ano","nome_Cat_Eco"))) %>%
  summarize(Soma = sum(LiquidadoReal, na.rm=TRUE)) %>%
  ggplot(aes(x = ano, y = Soma)) +
  geom_line(aes(color = nome_Cat_Eco, size = 2))+
  geom_vline(xintercept = 2001, colour="grey")+
  geom_vline(xintercept = 2003, colour="grey")+
  geom_vline(xintercept = 2008, colour="grey")+
  geom_vline(xintercept = 2011, colour="grey")+
  geom_vline(xintercept = 2013, colour="grey")+
  geom_vline(xintercept = 2015, colour="grey")+
  geom_vline(xintercept = 2016, colour="grey")+
  geom_vline(xintercept = 2017, colour="grey")+
  geom_text(aes(x=2001, y=1050000000, label="\nWeffort"), angle=90, text=element_text(size=11))+  
  geom_text(aes(x=2003, y=1050000000, label="\nGilberto Gil"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2008, y=650000000, label="\nJuca Ferreira"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2011, y=950000000, label="\nAna de Hollanda"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2013, y=850000000, label="\nMarta Suplicy"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2015, y=750000000, label="\nJuca Ferreira"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2016, y=650000000, label="\nCalero e Roberto Freire"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2017, y=650000000, label="\nSérgio Sá"), angle=90, text=element_text(size=11))
p + theme(legend.position="bottom") 

# COMPARACAO "ESCRITORIO FINANCEIRO EM NOVA IORQUE", "SECRETARIA DO AUDIOVISUAL/FNC")) %>%

p<-orcamento %>%
  filter(nome_UG %in% c("ESCRITORIO FINANCEIRO EM NOVA IORQUE", "ASSESSORIA DE COMUNICACAO SOCIAL","MUSEU DA REPUBLICA - RIO DE JANEIRO","MUSEU IMPERIAL - PETROPOLIS")) %>%
  #filter(ano >=2011) %>%
  group_by_at(vars(c("ano","nome_UG"))) %>%
  summarize(Soma = sum(LiquidadoReal, na.rm=TRUE)) %>%
  ggplot(aes(x = ano, y = Soma)) +
  geom_line(aes(color = nome_UG, size = 2))+
  geom_vline(xintercept = 2001, colour="grey")+
  geom_vline(xintercept = 2003, colour="grey")+
  geom_vline(xintercept = 2008, colour="grey")+
  geom_vline(xintercept = 2011, colour="grey")+
  geom_vline(xintercept = 2013, colour="grey")+
  geom_vline(xintercept = 2015, colour="grey")+
  geom_vline(xintercept = 2016, colour="grey")+
  geom_vline(xintercept = 2017, colour="grey")+
  geom_text(aes(x=2001, y=20000000, label="\nWeffort"), angle=90, text=element_text(size=11))+  
  geom_text(aes(x=2003, y=20000000, label="\nGilberto Gil"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2008, y=20000000, label="\nJuca Ferreira"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2011, y=20000000, label="\nAna de Hollanda"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2013, y=20000000, label="\nMarta Suplicy"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2015, y=20000000, label="\nJuca Ferreira"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2016, y=20000000, label="\nCalero e Roberto Freire"), angle=90, text=element_text(size=11))+
  geom_text(aes(x=2017, y=20000000, label="\nSérgio Sá"), angle=90, text=element_text(size=11))
p + theme(legend.position="bottom")



p<-orcamento %>%
  filter(nome_UG %in% c("FUNDACAO BIBLIOTECA NACIONAL", "FCP-FUNDACAO CULTURAL PALMARES","FUNDACAO NACIONAL DE ARTES")) %>%
  #filter(ano >=2011) %>%
  group_by_at(vars(c("ano","nome_UG"))) %>%
  summarize(Soma = sum(LiquidadoReal, na.rm=TRUE)) %>%
  ggplot(aes(x = ano, y = Soma)) +
  geom_line(aes(color = nome_UG, size = 2))
p + theme(legend.position="bottom") 