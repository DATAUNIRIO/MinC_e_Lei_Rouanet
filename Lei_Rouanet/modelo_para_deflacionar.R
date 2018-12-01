##---------------------------------------------------------------##
##                                                               ##
##    Nome: Deflacionando com o R                                ##
##                                                               ##
##                                                               ##
##    site:                                                      ##
##                                                               ##
##    prof. Steven Dutt-Ross                                     ##
##    UNIRIO                                                     ##
##---------------------------------------------------------------##

#install.packages("deflateBR")

# Carrega o pacote
library(deflateBR)

# Deflaciona 100 reais de janeiro de 2000
deflate(nominal_values = 100, nominal_dates = as.Date("2000-01-01"), real_date = "01/2018")

# orcamento da unirio em 2001
#valor nominal = 68.690.790,09
#valor real = 192.959.431,2

# orcamento da unirio em 2016
#valor nominal = 361.173.092,83
#valor real = 379.387.007,36

# orcamento da unirio em 2017
#valor nominal = 399.590.025,7	
#valor real = #405931620,6

#data de coleta de dados = 06/03/2018

deflate(nominal_values = 399590025.7,  nominal_dates = as.Date("2017-12-31"), real_date = "03/2018","ipca")
deflate(nominal_values = 361173092.83, nominal_dates = as.Date("2016-12-31"), real_date = "03/2018","ipca")
deflate(nominal_values = 68690790.09,  nominal_dates = as.Date("2001-12-31"), real_date = "03/2018","ipca")


deflate(nominal_values = 399590025.7,  nominal_dates = as.Date("2017-11-15"), real_date = "03/2018","ipca")
deflate(nominal_values = 68690790.09,  nominal_dates = as.Date("2001-09-15"), real_date = "03/2018","ipca")
