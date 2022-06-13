<h1 align="center">RELATÓRIO DE VENDAS DE SUCOS</h1>

O objetivo do projeto é realizar alguns relatórios de vendas sobre um banco de dados de uma empresa que vende sucos, usando linguagem SQL e o sistema de gerenciamento de banco de dados MySQL.
 
<h4> 
  Status do Projeto: Concluido ✔️ 
</h4>

## Índice 

* [Introdução](#Introdução)
* [Relatório 1](#Relatório-1)
* [Relatório 2](#Relatório-2)

## Introdução

Primeiramente analisei o banco de dados, visualizando todas as tabelas e mapeando a relação entre elas, usando os comandos:

![11](https://user-images.githubusercontent.com/74689039/173383771-bd63c1ec-da0d-4dca-8f02-1db9f05df2ff.png)

Essa é uma das maneiras de conhecer o seu banco de dados. Mas existe também uma forma mais visual de analisar as tabelas e seus relacionamentos, mostrado abaixo: 

![22](https://user-images.githubusercontent.com/74689039/173383813-3a781922-6e01-4c6a-b242-21ba9ba4d6e3.png)

## Relatório 1

O primeiro relatório busca classificar as vendas como válidas ou inválidas, essa classificação se dá de acordo com a quantidade de produto vendido, uma venda é considerada válida quando o volume de vendas não ultrapassa o limite de vendas pré estabelecido, caso contrário a venda é inválida.
Para gerar esse relatório verificamos quais tabelas contém os dados necessários para a análise:

![1](https://user-images.githubusercontent.com/74689039/173383846-001de279-0b13-47fb-967e-29c6ac5e0fe0.png)

Pra criar esse primeiro relatório é preciso calcular o volume de vendas de cada cliente dentro de cada mês, essa divisão por mês se dá devido aos dados de volume limite de compras ser mensal.
O calculo foi feito da forma abaixo:

![2](https://user-images.githubusercontent.com/74689039/173383868-acbc274f-12c3-4c98-8cb1-0232501426b7.png)

Agora que temos o volume de compras mensal por cliente, precisamos do volume limite de compras, encontrado em :

![3](https://user-images.githubusercontent.com/74689039/173383899-b0bd9fb1-7097-468e-8c5a-0c92c0996f95.png)

Por fim basta comparar os valores e criar uma nova coluna com a classificação das vendas. 

![4](https://user-images.githubusercontent.com/74689039/173384008-fe2909af-4949-4b14-9cb2-ce8ebd200722.png)


Com resposta temos nosso primeiro relatório de vendas:

![r1](https://user-images.githubusercontent.com/74689039/173384033-54f4bedb-1bdb-4972-922b-bf1ffccae09f.png)

Para complementar o relatório criei outra tabela com os dados das vendas inválidas, calculando o percentual da diferença entre o volume vendido e o volume limite:

![5](https://user-images.githubusercontent.com/74689039/173384161-9294efef-0d37-47d5-89e0-3961c2dc050b.png)

Resposta obtida:

![r2](https://user-images.githubusercontent.com/74689039/173384204-f55b91b5-de1a-4ed3-bdcf-0ac26c677e86.png)

## Relatório 2

O cliente solicitou um segundo relatório com os dados das vendas de acordo com cada sabor no ano de 2016, assim como no primeiro relatório comecei com a vizualização das tabelas que contém os dados de interesse:

![6](https://user-images.githubusercontent.com/74689039/173384241-c674a7a5-1541-4d96-8ede-9f6a620c41f1.png)

A primeira parte do relatório consiste em calcular as vendas por sabor no ano de 2016, como mostra abaixo:

![7](https://user-images.githubusercontent.com/74689039/173384289-3d89ef62-cde7-4dad-bd3d-e75cfb858ed8.png)

Após calcular as vendas por sabor, precisamos do total de vendas no ano para depois calcular os percentuais de vendas. Assim calculamos o total de vendas em 2016:

![8](https://user-images.githubusercontent.com/74689039/173384315-94f99d82-9f5e-470c-a55a-1b1eb91d0997.png)

Por fim basta juntar as duas análises anteriores e criar a coluna com os percentuais, para isso foi usado os comandos abaixo:

![9](https://user-images.githubusercontent.com/74689039/173384337-c243e99c-19ec-427c-983a-e9f38ba99344.png)

Como resposta temos o segundo relatório de vendas solicitado pelo clientes:

![r3](https://user-images.githubusercontent.com/74689039/173384396-c079fcd9-3cd3-4070-b09c-a5c6372d08a6.png)




