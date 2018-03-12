# Curso Big Data & Data Science
# script visualização de dados 17/11/2016
# prof.: Daiane Marcolino de Mattos

# diretório de trabalho ---------------------------------------
# defina seu diretório de trabalho para a pasta que contém as 
# bases que serão utilizadas durante a aula
setwd("")


# dispersão ou pontos -----------------------------------------

plot(iris[,"Sepal.Length"], iris[,"Petal.Length"], 
     xlab = "Sepal Length", ylab = "Petal Length",
     main = "Sepal Length vs. Petal Length")

# pacote necessário
library(plotly)

# (a)
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length)
# (b)
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, color = ~Species) %>%
  layout(title = "Sepal Length vs. Petal Length (data: iris)",
         yaxis = list(title = 'Petal Length'), 
         xaxis = list(title = "Sepal Length"))
# (c)
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, symbol = ~Species)

# matriz de correlação ----------------------------------------

# coeficiente de correlação entre duas variáveis
cor(iris[,"Sepal.Length"], iris[,"Petal.Length"])

# carregar dados
data(mtcars)

# calcular coeficiente de correlação
M <- cor(mtcars, use = "complete.obs")

# pacote necessário
library(corrplot)

# matriz de correlação 1
corrplot(M)

# matriz de correlação 2
corrplot(M, method = "color", cl.pos = "b", type = "lower", addgrid.col = "white",
         addCoef.col = "white", tl.col = "black", tl.cex = 0.7, number.cex = 0.7, cl.cex = 0.7)

# pirâmide etária ---------------------------------------------

# pacote necessário
library(plotrix)

# leitura da tabela 200
tabela200 <- read.csv2("populacao_br.csv")

# calcular proporções
brasil_prop <- tabela200
brasil_prop[,2] <- round(tabela200[,2]/sum(tabela200[,2], na.rm = T)*100,2)
brasil_prop[,3] <- round(tabela200[,3]/sum(tabela200[,3], na.rm = T)*100,2)
brasil_prop[,4] <- round(tabela200[,4]/sum(tabela200[,4])*100,2)
brasil_prop[,5] <- round(tabela200[,5]/sum(tabela200[,5])*100,2)

# visualizar novos dados
head(brasil_prop)

# pirâmide 1970
pyramid.plot(brasil_prop[,2], brasil_prop[,3], labels = brasil_prop[,1],
             main = "Pirâmide Etária - Brasil - Censo 1970 (IBGE)",
             lxcol = "#0198E1" , rxcol ="#FF82AB", gap = 2, show.values = T,
             top.labels = c("Homens", "Faixa Etária", "Mulheres"), xlim = c(18,18))

# pirâmide 2010
pyramid.plot(brasil_prop[,4], brasil_prop[,5], labels = brasil_prop[,1],
             main = "Pirâmide Etária - Brasil - Censo 2010 (IBGE)",
             lxcol = "#0198E1" , rxcol ="#FF82AB", gap = 2, show.values = T,
             top.labels = c("Homens", "Faixa Etária", "Mulheres"), xlim = c(18,18))

# gráfico de barras -------------------------------------------

# leitura de dados + pacotes necessários
ipea <- read.csv2("base_pesquisa_ipea.csv")
library(RColorBrewer) # paleta de cores
library(plotly)

# calculando a frequência e proporção da variável
freq <- table(ipea$região.onde.foi.realizada.a.entrevista)
prop <- round(prop.table(freq)*100,2)
prop

# barplot modelo default
barplot(prop)

# transformar objeto de proporções em um data.frame
prop2 <- data.frame(prop)

# gráfico de barras usando plotly (modo default)
plot_ly(data = prop2, x = ~Var1, y = ~Freq, type = "bar")

# personalizando o gráfico de barras
plot_ly(data = prop2, x = ~Var1, y = ~Freq, type = "bar", color = ~Var1,
        marker = list(color = brewer.pal(5,"Set1")), showlegend = F) %>%
  layout(title = "Proporção de entrevistados por região de realização da entrevista <br> (IPEA 2014)",
         font = list(color = 'black', family = 'verdana', size = 11),
         margin = list(b = 90, l = 90, r = 90, t = 90),
         xaxis = list(title = "Região"),
         yaxis = list(title = "Proporção (%)"),
         annotations = list(x = ~Var1, y = ~Freq, text = ~paste0(Freq,"%"),
                            xanchor = 'center', yanchor = 'bottom',
                            showarrow = F))


# transformando a variável em fator
colnames(ipea)
ipea[,18] <- factor(ipea[,18], levels = c("discorda total","discorda parcial",
                                          "neutro","concorda parcial",
                                          "concorda total", "ns"))
# tabela cruzada entre duas variáveis
freq <- table(ipea[,18], ipea[,5])
prop <- round(prop.table(freq, margin = 2),3)
colnames(prop) <- c("Feminino","Masculino")
k <- data.frame(prop)
k

# via barplot
barplot(prop, beside = T, legend = T, args.legend = list(x = 9, y = 0.5, bty = "n") )

# gráfico
plot_ly(k, x = ~Var2, y = ~Freq, color = ~Var1, type = 'bar', colors = brewer.pal(6,"Spectral")) %>%
  layout(title = "Afirmação: Os homens devem ser a cabeça do lar <br> (IPEA, 2014)",
         yaxis = list(title = 'Proporção (%)'), barmode = 'group',
         xaxis = list(title = "Sexo"))


# transformando a variável em fator
colnames(ipea)
ipea[,41] <- factor(ipea[,41], levels = c("discorda total","discorda parcial",
                                          "neutro","concorda parcial",
                                          "concorda total", "ns"))
# tabela cruzada entre duas variáveis
freq <- table(ipea[,41], ipea[,5])
prop <- round(prop.table(freq, margin = 2),3)
colnames(prop) <- c("Feminino","Masculino")
k <- data.frame(prop)

# via barplot
barplot(prop, beside = F, legend = T, xlim = c(0,4), args.legend = list(x = 3.5, y = 1, bty = "n") )

# gráfico via plotly
plot_ly(k, x = ~Var2, y = ~Freq, type = 'bar', color = ~Var1, colors = brewer.pal(6,"Blues")) %>%
  layout(barmode = 'stack',
         title = "Afirmação: Tem mulher que é pra casar, tem mulher que é pra cama <br> (IPEA, 2014)",
         yaxis = list(title = 'Proporção (%)'),
         xaxis = list(title = "Sexo"),
         margin = list(b = 90, l = 90, r = 90, t = 90))

# histograma --------------------------------------------------

# gerando dados aleatórios
set.seed(1)
dados1 <- rnorm(1000,2,1)
dados2 <- rnorm(1000,6,1.5)

# via hist

# gráfico 1 - default
hist(dados1)

# gráfico 2 - cores
hist(dados1, col = '#FFF0F5', border = "#DB7093")

# gráfico 3 - mais de um histograma
hist(dados1, col = 'skyblue', xlim = c(-5,15), ylim = c(0,0.5),
     border = "#3299CC", main = "", xlab = "", freq = F)
hist(dados2, add = T, col = scales::alpha('red',0.4), border = "#BE2625", freq = F)

# via plotly

# gráfico 1 - default
plot_ly(x = dados1, type = "histogram")

# gráfico 2 - cores
plot_ly(x = dados1, type = "histogram", marker = list(color = '#FFF0F5', line = list(width = 0.5, color = "#DB7093")))

# gráfico 3 - mais de um histograma

plot_ly(x = dados1, type = "histogram", marker = list(color = "skyblue", line = list(color = "#3299CC", width = 0.5)), name = "dados1") %>%
  add_trace(x = dados2, type = "histogram", marker = list(color = scales::alpha('red',0.4), line = list(width = 0.5, color = "#BE2625")), name = "dados2") %>%
  layout(barmode = "overlay")

# boxplot -----------------------------------------------------

set.seed(1)
dados <- rnorm(1000)

### via pacote graphics ###
boxplot(dados, horizontal = T)

### via pacote plotly ###

# pacote necessário
library(plotly)

# gráfico 1 - básico
plot_ly(iris, x = ~Sepal.Length, type = "box")

# gráfico 2 - personalizando cores
plot_ly(iris, x = ~Sepal.Width, type = "box", name = "Width",
        fillcolor = "#C5E3BF", marker = list(outliercolor = "#7BBF6A"), line = list(color = "#7BBF6A"))

# gráfico 3 - grupos de caixas
plot_ly(iris, y = ~Sepal.Length, x = ~Species, color = ~Species, type = "box")

# gráfico 4 - grupos de caixas (add uma a uma)
plot_ly(iris, y = ~Sepal.Length, type = "box", name = "Sepal Length") %>%
  add_trace(y = ~Petal.Length, type = "box", name = "Petal Length") %>%
  add_trace(y = ~Sepal.Width, type = "box", name = "Sepal Width") %>%
  add_trace(y = ~Petal.Width, type = "box", name = "Petal Width") %>%
  layout(yaxis = list(zeroline = F, title =""))

# pizza -------------------------------------------------------

# dados
prop <- data.frame(prop = c(0.8, 0.2), categoria = c("Categoria 1","Categoria 2"))

pie(prop$prop) # função pie

# plotly
plot_ly(prop, labels = ~categoria, values = ~prop, type = "pie") %>%
  layout(showlegend = T)
        
plot_ly(prop, labels = ~categoria, values = ~prop, type = 'pie',
        textinfo = 'percent', hoverinfo ="label+value", 
        marker = list(colors = c("#FFAA00", "#FFFFFF"), line = list(width = 0.5, color = "#C0C0C0"))) %>%
  add_annotations(x = 0.5, y = -0.2, text = "Fonte ", showarrow = F) %>%
  layout(title = 'Gráfico de Pizza', showlegend = T, margin = list(t = 90, b = 90))

plot_ly(prop, labels = ~categoria, values = ~prop, textposition = 'inside', textinfo = 'percent', hoverinfo ="label+value",
        marker = list(colors = c("#FFAA00", "#FFFFFF"), line = list(width = 0.5, color = "#C0C0C0"))) %>%
  add_pie(hole = 0.5) %>%
  layout(title = 'Gráfico de Rosca', showlegend = T)

# digrama de venn ---------------------------------------------

# leitura dos dados
ipea <- read.csv2("base_pesquisa_ipea.csv")
dados <- ipea[,c("sexo","mulheres.que.usam.roupas.que.mostram.o.corpo.merecem.ser.atacadas",
                 "se.as.mulheres.soubessem.como.se.comportar..haveria.menos.estupros")]
colnames(dados) <- c("sexo","A","B")

#source("http://www.bioconductor.org/biocLite.R")
#biocLite("limma")
library(limma)

novos_dados <- subset(dados, sexo == "masculino")[,2:3]
novos_dados$A <- ifelse(novos_dados$A %in% c("concorda parcial","concorda total"), 1, 0)
novos_dados$B <- ifelse(novos_dados$B %in% c("concorda parcial","concorda total"), 1, 0)

contagem <- vennCounts(novos_dados)
vennDiagram(contagem)
vennDiagram(contagem, circle.col = c("tomato","steelblue"), counts.col = 1)

# outro diagrama de venn
contagem <- table(novos_dados)
freq_concordaAB <- contagem[2,2]
freq_concordaA <- contagem[2,1]
freq_concordaB <- contagem[1,2]

# esboçar diagrama de Venn
library(VennDiagram)
grid.newpage()
draw.pairwise.venn(area1 = freq_concordaA + freq_concordaAB, 
                   area2 = freq_concordaB + freq_concordaAB, 
                   cross.area = freq_concordaAB, scaled = T,
                   category = c("Afirmação A", "Afirmação B"),
                   fill = c("skyblue","tomato"),
                   print.mode = "percent", sigdigs = 3,
                   cat.dist = c(0.05,0.05),
                   cat.pos = c(210,-210))


# grafos ------------------------------------------------------

# pacote necessário
library(visNetwork)

# gráfico 1 - default
nodes <- data.frame(id = 1:7)
edges <- data.frame(from = c(1,2,3,4,3,5,6,7), to = c(2,3,4,2,5,6,7,5))
visNetwork(nodes, edges)

# gráfico 2 - criando grupos
nodes <- data.frame(id = 1:7, label = LETTERS[1:7], group = c(1,2,2,2,3,3,3))
edges <- data.frame(from = c(1,2,3,4,3,5,6,7), to = c(2,3,4,2,5,6,7,5))
visNetwork(nodes, edges) %>%
  visLegend(main = "Grupos")

# gráfico 3 - cores e formas
nodes <- data.frame(id = 1:3, label = c("A","B","C"),
                    color = c("#38B0DE","#EEAEEE","#66FF66"),
                    shape = c("square","diamond","triangle"))
edges <- data.frame(from = c(1,1,2), to = c(2,3,3), arrows = c("to","to","to"))
visNetwork(nodes, edges)


# leitura dos dados
library(readxl)
nodes <- data.frame(read_excel("likes_assai.xlsx", sheet = 1))
edges <- data.frame(read_excel("likes_assai.xlsx", sheet = 2))

# esboçar grafo
library(visNetwork)
visNetwork(nodes = nodes, edges = edges) %>%
  visNodes(shape = "square", size = 20, shadow = list(enabled = TRUE, size = 10)) %>%
  visGroups(groupname = "Companhia de Varejo", color = "#FFFFFF", shape = "dot") %>%
  visGroups(groupname = "Alimentação e Bebidas", color = "#00B2EE", shape = "square") %>%
  visGroups(groupname = "Causas", color = "#26466D", shape = "square") %>%
  visLegend()


# treemap -----------------------------------------------------

# pacote necessário
library(treemap)

# dados que serão utilizados
data(GNI2014)

# esboçar gráfico
treemap(GNI2014, index = c("continent", "iso3"), vSize = "population", vColor = "GNI", type = "value", palette = "Blues")

# nuvem de palavras -------------------------------------------

# pacotes necessários
library(tm)
library(RColorBrewer) # paleta de cores
library(wordcloud)

# ler discurso
dilma <- readLines("discurso_dilma.txt")

# palavras que não gostaria que entrassem 
palavras_remover <- c("que","para","com","isso","como","por", "essa","esse","mas","são","uma",
                      "vão","eles","elas","ela", "eu","nós","meu", "minha","não","mais","foi","aqui",
                      "então","tem","dos","das","de","da","seu","sua","seus","suas","era", "meus","ele",
                      "nos","está","estou","estamos", "muito","até","houve","aos")

# criar objeto corpus
corpus_dilma <- Corpus(VectorSource(dilma))
corpus_dilma <- tm_map(corpus_dilma, removePunctuation)
corpus_dilma <- tm_map(corpus_dilma, removeNumbers)
corpus_dilma <- tm_map(corpus_dilma, removeWords, palavras_remover)

# observar a contagem das palavras
as.matrix(TermDocumentMatrix(corpus_dilma))
View(as.matrix(TermDocumentMatrix(corpus_dilma)))

# desenhar nuvem
wordcloud(corpus_dilma, max.words = 20, random.order = F, rot.per = F, 
          colors = RColorBrewer::brewer.pal(5,"Reds"), font = 2)

# ler outro discurso
temer <- readLines("discurso_temer.txt")

# criar objeto corpus
corpus_temer <- Corpus(VectorSource(temer))
corpus_temer <- tm_map(corpus_temer, removePunctuation)
corpus_temer <- tm_map(corpus_temer, removeNumbers)
corpus_temer <- tm_map(corpus_temer, removeWords, palavras_remover)

# observar a contagem das palavras
as.matrix(TermDocumentMatrix(corpus_temer))
View(as.matrix(TermDocumentMatrix(corpus_temer)))

# esboçar nuvem de palavras
wordcloud(corpus_temer, max.words = 20, random.order = F, rot.per = F, 
          colors = RColorBrewer::brewer.pal(5,"Blues"), font = 2)



# nuvem de palavras conjunta
corpus_conjuntos <- Corpus(VectorSource(c(dilma,temer)))
corpus_conjuntos <- tm_map(corpus_conjuntos, removePunctuation)
corpus_conjuntos <- tm_map(corpus_conjuntos, removeNumbers)
corpus_conjuntos <- tm_map(corpus_conjuntos, removeWords, palavras_remover)

tdm <- as.matrix(TermDocumentMatrix(corpus_conjuntos))
colnames(tdm) <- c("Dilma","Temer")

# juntar palavras
comparison.cloud(tdm, random.order=FALSE, colors = c("indianred3","lightsteelblue"),
                 title.size=2.5, max.words=150)

# palavras comuns
commonality.cloud(tdm, random.order=FALSE, colors = brewer.pal(10, "RdYlBu"),
                  title.size=2.5, max.words=150)


# esboçar nuvem de palavras quando se tem a contagem das palavras

# forma 1 
wordcloud(words = c("palavra1", "palavra2", "palavra3", "palavra4", "palavra5"),
          freq = c(12,15,7,5,22), colors = brewer.pal(3, "Paired"), random.order = F, rot.per = F)

# forma 2 - vários documentos
(freqs <- data.frame(freq1 = c(20,12,13,0,4), freq2 = c(12,1,0,2,6)))
rownames(freqs) <- c("palavra1", "palavra2", "palavra3", "palavra4", "palavra5")

comparison.cloud(freqs, random.order = FALSE, title.size = 2.5, rot.per = F)
commonality.cloud(freqs, random.order = FALSE, rot.per = F)

# pacote wordcloud2
library(wordcloud2)
wordcloud2(demoFreq)


# séries temporais --------------------------------------------

# simular um AR(1)
set.seed(1)
x <- rnorm(300,0,1)
# transformar em ts
xts <- ts(x, start = c(2000,1), freq = 12)
plot(xts)


# instalar e carregar pacote BETS para coletar séries temporais
# library(devtools)
# install_github("pedrocostaferreira/BETS")
library(BETS)

# procurar séries disponíveis que contenham a palavra IPCA
BETS.search(description = "IPCA")

# guardar IPCA e IPCA Acumulado em 12 meses (iniciando em jan/2006)
ipca <- window(BETS.get("433"), start = c(2006,1), freq = 12)
ipca_acum <- window(BETS.get("13522"), start = c(2006,1), freq = 12)

# juntar os dois objetos num só objeto
precos <- cbind(ipca,ipca_acum)

# carregar pacote dygraphs
library(dygraphs)

# dygraph 1: genérico
dygraph(precos)

# dygraph 2: alterando labels das séries e utilizando dois eixos
dygraph(precos) %>%
  dySeries("ipca", label = "IPCA", strokeWidth = 2, col = "#EE6363") %>%
  dySeries("ipca_acum", label = "IPCA Acum. 12 meses", axis = "y2", 
           strokeWidth = 2, col = "#2B4F81") %>%
  dyRangeSelector(fillColor = "white", strokeColor = "#000000") %>% 
  dyLegend(labelsSeparateLines = F)

# dygraph 3: área sombreada
dygraph(precos, main = "IPCA vs. IPCA Acumulado") %>% 
  dySeries("ipca", label = "IPCA", strokeWidth = 2, col = "#EE6363") %>%
  dySeries("ipca_acum", label = "IPCA Acum. 12 meses", axis = "y2", 
           strokeWidth = 2, col = "#2B4F81") %>%
  dyShading(from = "2010-1-1", to = "2011-1-1", color = "#E5E5E5")

# novos objetos: IPCA Acumulado + meta da inflação
meta_inf <- ts(2.5, start = start(ipca), end = end(ipca), freq = 12)
meta_sup <- ts(6.5, start = start(ipca), end = end(ipca), freq = 12)
precos2 <- cbind(ipca_acum, meta_inf, meta_sup)

# dygraph 4: série com 'intervalo'
dygraph(precos2, main = "IPCA Acumulado 12 meses + Intervalo de Meta") %>%
  dySeries(c("meta_inf", "ipca_acum", "meta_sup"), label = "IPCA Acumulado",
           color = "#EE6363", strokeWidth = 2)

# dygraph 5: adicionando linha de evento ao gráfico
dygraph(precos2, main = "IPCA Acumulado 12 meses + Intervalo de Meta + Evento") %>%
  dySeries(c("meta_inf", "ipca_acum", "meta_sup"), label = "IPCA Acumulado",
           color = "#EE6363", strokeWidth = 2) %>%
  dyEvent("2014-10-1", "Dilma reeleita (out/2014)", labelLoc = "bottom")

# dygraph 6: adicionando plaquinha de evento ao gráfico
dygraph(precos2, main = "IPCA Acumulado 12 meses + Intervalo de Meta + Plaquinha") %>%
  dySeries(c("meta_inf", "ipca_acum", "meta_sup"), label = "IPCA Acumulado",
           color = "#EE6363", strokeWidth = 2) %>%
  dyAnnotation("2014-10-1", text = "Eleições 2014", tooltip = "Dilma reeleita",
               width = 100, tickHeight = -50)

