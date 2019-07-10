# DataScienceTest

Neste repositório contém a resolução do teste aplicado pela IBM a fim de verificar as habilidades técnicas para o cargo. O teste foi realizado em linguagem R.

## Conteúdo do repositório

Segue uma descrição dos principais arquivos e pastas do repositório

  * `DB.sqlite`: base de dados em sqlite contendo os dados de análise
  * `report.Rmd`: arquivo contendo uma descrição detalhada de todo o processo de solução do problema e ferramentas adicionais que foram desenvolvidas. Contém informações técnicas e de metodologia. Os códigos também estão documentados aqui.
  * `report.html`: o conteúdo deste arquivo é o mesmo do que o anterior (`report.Rmd`), contudo está renderizado, assim aqui é possivel visualizar os gráficos, tabelas e resultados em geral de forma mais clara. As análises aqui apresentadas são de somente 1 cliente, contudo as mesmas análises para os demais clientes poderão ser vistas na aplicação Web.
  * `dashboard.Rmd`: este arquivo contém o código para criação da aplicação web. Ela foi desenvolvido no pacote `shiny` do R. A aplicação poderá ser acessada em: <http://35.229.22.117:3838/DataScientistTest/>
  * `api/prediction`: neste diretório contém o código para gerar a API. A API fornece a projeção para o dia 28 de fevereiro. A API poderá ser consumida em <http://35.229.22.117:7852/predict?cliente=215> (exemplo utilizando o cliente 215).