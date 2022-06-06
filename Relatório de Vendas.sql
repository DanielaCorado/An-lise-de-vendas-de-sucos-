# Relatório dos dados :

# 1 - Relatório de vendas válidas : 
# Relatório com as vendas válidas e inválidas, de acordo com o volume de compra de cada cliente 
# Calcular então o volume de compras por cliente no mês e comparar com o Volume de compra limites por mês (tabela_de_clientes)

# a) Vizualizar as tabelas : 
select *from itens_notas_fiscais; # Quantidade de vendas
select * from notas_fiscais; # CPF dos clientes 
select * from tabela_de_clientes; # Volume limite de compra por mês 

# b) Volume total de vendas para cada cliente dentro de um mês :
select nf.cpf, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') as Ano_Mes, sum(inf.quantidade) as Qtd_Vendas
from notas_fiscais as nf inner join itens_notas_fiscais as inf
on nf.numero = inf.numero
group by nf.cpf, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m'); 

# c) Limite de compras por cliente no mês : 
select tc.cpf, tc.nome, tc.volume_de_compra as Qtd_Limite
from tabela_de_clientes as tc;

# d) Comparar o resultados das duas tabelas : 
select x.cpf, x.nome, x.Ano_Mes, x.Qtd_Vendas, x.Qtd_Limite,
case when (x.Qtd_Limite-x.Qtd_Vendas ) < 0 then 'Inválida'
else 'Válida'  end as Status_Vendas
from(
select nf.cpf, tc.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') as Ano_Mes, sum(inf.quantidade) as Qtd_Vendas, max(tc.volume_de_compra) as Qtd_Limite
from notas_fiscais as nf inner join itens_notas_fiscais as inf
on nf.numero = inf.numero
inner join tabela_de_clientes as tc
on tc.cpf = nf.cpf 
group by nf.cpf, tc.nome, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) as X; 

# e) lista das vendas inválidas e a diferença entre o limite de venda máximo e o realizado, em percentuais.
select x.cpf, x.nome, x.Ano_Mes, x.Qtd_Vendas, x.Qtd_Limite,
case when (x.Qtd_Limite-x.Qtd_Vendas ) < 0 then 'Inválida'
else 'Válida'  end as Status_Vendas, round(((1 - (x.Qtd_Limite/ x.Qtd_Vendas)) * 100),2) AS Percentual
from(
select nf.cpf, tc.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') as Ano_Mes, sum(inf.quantidade) as Qtd_Vendas, max(tc.volume_de_compra) as Qtd_Limite
from notas_fiscais as nf inner join itens_notas_fiscais as inf
on nf.numero = inf.numero
inner join tabela_de_clientes as tc
on tc.cpf = nf.cpf 
group by nf.cpf, tc.nome, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')) as X
WHERE (x.Qtd_Limite-x.Qtd_Vendas) < 0;

# 2 - Relatório de vendas por sabor em 2016
# Tabela com os sabores, ano, total de vendas e percentual 

# a) Vizualizar as tabelas : 
select *from itens_notas_fiscais; # Quantidade de vendas;  inf número = nf número
select * from notas_fiscais; # Data das vendas
select * from tabela_de_produtos; # Sabores;  inf codigo_do_produto = tp codigo_do_produto

# b) Vendas por sabor em 2016 : 
select tp.SABOR, year(nf.DATA_VENDA) as Ano, sum(inf.QUANTIDADE) as Qtd
from tabela_de_produtos as tp
inner join itens_notas_fiscais as inf
on tp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais as nf
on nf.NUMERO = inf.NUMERO 
where year(nf.DATA_VENDA) = 2016
group by tp.SABOR, year(nf.DATA_VENDA)
order by sum(inf.QUANTIDADE) desc; 

# c) Vendas Totais em 2016 :
select tp.SABOR, year(nf.DATA_VENDA) as Ano, sum(inf.QUANTIDADE) as Qtd
from tabela_de_produtos as tp
inner join itens_notas_fiscais as inf
on tp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais as nf
on nf.NUMERO = inf.NUMERO 
where year(nf.DATA_VENDA) = 2016;

# d) Formando o relatório :
select Vendas_Sabor.SABOR, Vendas_Sabor.Ano, Vendas_Sabor.Qtd,
Round(((Vendas_Sabor.Qtd/Venda_Total.Qtd)*100),2)as Percentual_Total
 from
(select tp.SABOR, year(nf.DATA_VENDA) as Ano, sum(inf.QUANTIDADE) as Qtd
from tabela_de_produtos as tp
inner join itens_notas_fiscais as inf
on tp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais as nf
on nf.NUMERO = inf.NUMERO 
where year(nf.DATA_VENDA) = 2016
group by tp.SABOR, year(nf.DATA_VENDA)) as Vendas_Sabor
inner join
(select tp.SABOR, year(nf.DATA_VENDA) as Ano, sum(inf.QUANTIDADE) as Qtd
from tabela_de_produtos as tp
inner join itens_notas_fiscais as inf
on tp.CODIGO_DO_PRODUTO = inf.CODIGO_DO_PRODUTO
inner join notas_fiscais as nf
on nf.NUMERO = inf.NUMERO 
where year(nf.DATA_VENDA) = 2016) as Venda_Total
on Vendas_Sabor.Ano =  Venda_Total.Ano
order by Vendas_Sabor.Qtd desc;
