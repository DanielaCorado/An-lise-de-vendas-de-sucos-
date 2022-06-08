<h1 align="center">RELATÓRIO DE VENDAS DE SUCOS</h1>

O objetivo do projeto é realizar alguns relatórios de vendas sobre um banco de dados de uma empresa que vende sucos, usando linguagem SQL e o sistema de gerenciamento de banco de dados MySQL.
 
<h4> 
  Status do Projeto: Concluido ✔️ 
</h4>

## Índice 

* [Introdução](##Introdução)
* [Relatório 1](##Relatório-1)
* [Relatório 2](##Relatório-2)

## Introdução

Primeiramente analisei o banco de dados, visualizando todas as tabelas e mapeando a relação entre elas, usando os comandos:

![1](https://user-images.githubusercontent.com/74689039/172687919-687218d3-3e22-40b0-b641-dc7213101173.png)

Essa é uma das maneiras de conhecer o seu banco de dados. Mas existe também uma forma mais visual de analisar as tabelas e seus relacionamentos, mostrado abaixo: 

![2](https://user-images.githubusercontent.com/74689039/172687955-2957bbb4-e786-486e-ac4d-db7443cd390b.png)

## Relatório 1

O primeiro relatório busca classificar as vendas como válidas ou inválidas, essa classificação se dá de acordo com a quantidade de produto vendido, uma venda é considerada válida quando o volume de vendas não ultrapassa o limite de vendas pré estabelecido, caso contrário a venda é inválida.
Para gerar esse relatório verificamos quais tabelas contém os dados necessários para a análise:

![3](https://user-images.githubusercontent.com/74689039/172688012-e5fb07b8-891d-439e-a275-3a26f5cf973b.png)

Pra criar esse primeiro relatório é preciso calcular o volume de vendas de cada cliente dentro de cada mês, essa divisão por mês se dá devido aos dados de volume limite de compras ser mensal.
O calculo foi feito da forma abaixo:

![4](https://user-images.githubusercontent.com/74689039/172688040-d73bc207-959a-461d-a509-fdeb1cc07d73.png)

Agora que temos o volume de compras mensal por cliente, precisamos do volume limite de compras, encontrado em :

![5](https://user-images.githubusercontent.com/74689039/172688062-8f7460da-55a2-49dd-bc4b-ef70fbb6b6e3.png)

Por fim basta comparar os valores e criar uma nova coluna com a classificação das vendas. 

![6](https://user-images.githubusercontent.com/74689039/172688102-5dae3aed-cc47-4b31-9fba-93131de35926.png)

Com resposta temos nosso primeiro relatório de vendas:

![r1](https://user-images.githubusercontent.com/74689039/172688306-40b7ffca-cffb-4d76-bee6-21e7eff86f8e.png)

Para complementar o relatório criei outra tabela com os dados das vendas inválidas, calculando o percentual da diferença entre o volume vendido e o volume limite:

![7](https://user-images.githubusercontent.com/74689039/172688131-4931263e-4f7d-420d-b275-166ec573f245.png)

Resposta obtida:

![r2](https://user-images.githubusercontent.com/74689039/172688385-3269405a-06ba-4b64-a3e3-46b0d5e26bf3.png)

## Relatório 2

O cliente solicitou um segundo relatório com os dados das vendas de acordo com cada sabor no ano de 2016, assim como no primeiro relatório comecei com a vizualização das tabelas que contém os dados de interesse:

![8](https://user-images.githubusercontent.com/74689039/172688185-02d02aea-f2a8-4c06-b37d-d8af8befd607.png)

A primeira parte do relatório consiste em calcular as vendas por sabor no ano de 2016, como mostra abaixo:

![9](https://user-images.githubusercontent.com/74689039/172688236-31466c5d-454c-40a0-b2cd-1c4ab4e0a338.png)

Após calcular as vendas por sabor, precisamos do total de vendas no ano para depois calcular os percentuais de vendas. Assim calculamos o total de vendas em 2016:

![10](https://user-images.githubusercontent.com/74689039/172688472-dbf100fc-7a5f-4d40-a241-79dcb0c2cfbf.png)

Por fim basta juntar as duas análises anteriores e criar a coluna com os percentuais, para isso foi usado os comandos abaixo:

![11](https://user-images.githubusercontent.com/74689039/172688517-1a980531-b470-4ad2-b19f-decba30ebc27.png)

Como resposta temos o segundo relatório de vendas solicitado pelo clientes:

![r3](https://user-images.githubusercontent.com/74689039/172688554-a7f79c2f-eb93-4233-ac80-a680ff011739.png)





