
#https://cran.r-project.org/web/packages/htmltab/vignettes/htmltab.html

library(htmltab)
u = "https://pt.wikipedia.org/wiki/Lista_de_ministros_da_Cultura_do_Brasil"
# Tem que colocar o XPATH da tabela no codigo
# Ao inspecionar o elemento encontrei o codigo:
# Xpath = '//*[@id="mw-content-text"]/div/table[1]/tbody'
ministroscultura <- htmltab(doc = u, which = '//*[@id="mw-content-text"]/div/table[1]/tbody')

head(ministroscultura)

# Caracter especial no nome

Nomes<-c("N","Nome","Inicio","Fim","Presidente")
colnames(ministroscultura)<-Nomes

# Caracter especial no conteudo
Encoding(ministroscultura$Nome) <- "UTF-8"
Encoding(ministroscultura$Presidente) <- "UTF-8"
Encoding(ministroscultura$Inicio) <- "UTF-8"
Encoding(ministroscultura$Fim) <- "UTF-8"
head(ministroscultura)
saveRDS(ministroscultura,file='ministroscultura.rds')




library(htmltab)
url = "http://www.portaltransparencia.gov.br/pagina-interna/603417-dicionario-de-dados-orcamento-da-despesa"

# 1  tentativa: fuciona mas fica fora do formato tabela
dic_dados <- htmltab(doc = url, which = '/html/body/main/div[2]/table/tbody')
# 2  tentativa: problema corrigido
dic_dados <- htmltab(doc = url, which = '/html/body/main/div[2]/table')
colnames(dic_dados)<-c("COLUNA","DESCRICAO")
Encoding(dic_dados$COLUNA) <- "UTF-8"
Encoding(dic_dados$DESCRICAO) <- "UTF-8"


write.csv2(dic_dados,file= 'dic_dados.csv')
