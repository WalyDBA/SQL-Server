use Northwind
go

-- Desafio 1 -> liste "ProductName" | "UnitPrice" | "UnitsInStock" da tabela "Products"
select ProductName, UnitPrice, UnitsInStock
from Products
--Correção: Correto

---------------------------------------------------------------------------

-- Desafio 2 -> liste "ProductName" | "UnitPrice" da tabela "Products" que tenham valor maior que 30
select ProductName, UnitPrice
from Products
where UnitPrice > 30
--Correção: Correto

---------------------------------------------------------------------------

-- Desafio 3 -> liste "ProductName" | "UnitPrice" | "UnitsInStock" da tabela "Products" que tenham valor menor que 20 e unidades em estoque maior que 10
select ProductName, UnitPrice, UnitsInStock
from Products
where UnitPrice < 20 and UnitsInStock > 10
--Correção: Correto

---------------------------------------------------------------------------

-- Desafio 4 -> liste "ProductName" | "UnitPrice" | "UnitsInStock" da tabela "Products" que tenham valor entre 10 e 50 ou unidade igual a zero 
select ProductName, UnitPrice, UnitsInStock
from Products
where UnitPrice between 10 and 50 or UnitsInStock = 0
--Correção: Correto -> OBS.: foi escrito BETWEEN para achar um range de valor incluído, porém poderia ser escrito "UnitPrice >=10 and UnitPrice <=50". Das duas maneiras funcionam exatamente igual.

---------------------------------------------------------------------------

-- Desafio 5 -> liste "ProductName" | "UnitPrice" da tabela "Products" que tenham produtos em estoque e valor maior que 40, ordenado do mais caro para ao mais barato
select ProductName, UnitPrice
from Products
where UnitsInStock > 1 and UnitPrice > 40
order by UnitPrice desc
--Correção: ERRADO -> aqui o erro foi de interpretação do desafio, pois foi solicitado produtos em estoque e a query trouxe todos acima de 1 unidade, mas se tem 1 unidade em estoque significa que deveria trazer. Portante o ideal seria escerver "UnitsInStock >0".

---------------------------------------------------------------------------

-- Desafio 6 -> liste "CompanyName" | "ContactName" | "City" | "Country" de clientes que sejam somente do Brazil
select CompanyName, ContactName, City, Country
from Suppliers
where Country = 'Brazil'
--Correção: ERRADO -> aqui o erro foi de consulta em tabela errada, o correto seria na tabela "Customers"

---------------------------------------------------------------------------

-- Desafio 7 -> liste "ProductName" | "UnitPrice" | "UnitsInStock" da tabela "Products" onde o valor seja acima de 40 e o estoque seja menor que 10. A ordenação para a interpretação: "Quero saber quais produtos estão caros e podem representar um problema de estoque."
select ProductName, UnitPrice, UnitsInStock
from Products
where UnitPrice > 40 and UnitsInStock < 10
order by UnitsInStock desc
-- Decido ordernar pelos produtos com mais estoques, pois assim teremos uma visão do que está parado e não está vendendo
--Correção: ERRADO -> aqui a escrita está correta, porém houve uma interpretação errada, onde foi solicitado "estoque baixo" e foi ordenado com os produtos com mais estoque, portanto deveria ser "order by UnitsInStock asc".

---------------------------------------------------------------------------

-- Desafio Bônus -> explique se o resultado de cada select são diferentes ou iguais, tente descrever a lógica
select *
from Products
where UnitPrice > 10 and UnitPrice < 20 or UnitsInStock = 0;

select *
from Products
where UnitPrice > 10 and (UnitPrice < 20 or UnitsInStock = 0);
-- O resultado é igual, pois, apesar da condição estar diferente, o valor unitário já vai ser algo entre 11 e 19 ou com unidade estocada = 0
/*
--Correção: ERRADO
  -> o resultado não é igual, e para entender isso devemos saber que o SQL Server sempre dá prioridade para o AND em relação ao OR. 
  -> portanto a primeira query ela pega todos os produtos entre 10 e 20 OU produtos sem estoque
  -> na segunda query vemos que ele pega o primeiro resultado já como maior que 10 e depois o SQL Server trará o resultado de preço maior que 20 ou estoque maior que 0.
*/

---------------------------------------------------------------------------

-- Desafio 8 -> liste "ProductName" | "UnitPrice" da tabela "Products" que tenham valor entre 20 e 40, ordene do mais barato para o mais caro
select ProductName, UnitPrice
from Products
where UnitPrice between 20 and 40
order by UnitPrice
--Correção:

---------------------------------------------------------------------------

-- Desafio 9 -> liste "CompanyName" | "ContactName" | "Country" da tabela "Customers" que sejam do Brazil ou Argentina, ordenando por país e em seguida pelo nome da empresa
select CompanyName, ContactName, Country
from Customers
where Country in ('Brazil','Argentina')
order by 3,1
--Correção:

---------------------------------------------------------------------------

-- Desafio 10 -> liste "ProductName" | "UnitPrice" | "UnitsInStock" da tabela "Products" que tenham valor maior que 30 e possuem estoque entre 0 e 10, ordenando pelo estoque do maior para o menor
select ProductName, UnitPrice, UnitsInStock
from Products
where UnitPrice > 30 and (UnitsInStock between 0 and 10)
order by UnitsInStock desc
--Correção: 

---------------------------------------------------------------------------

-- Desafio 11 -> liste "UnitPrice" | "UnitsInStock" da tabela "Products" em duas situações. 1° o valor maior que 50 e estoque menor que 10 | ou | 2° o valor menor que 10 e estoque maior que 50
select UnitPrice, UnitsInStock
from Products
where	UnitPrice > 50 and UnitsInStock < 10 
		or UnitPrice < 10 and UnitsInStock > 50
--Correção:

---------------------------------------------------------------------------

-- Desafio 12 -> liste "ProductName" | "UnitPrice" | "UnitsInStock" da tabela "Products" da seguinte interpretação "Me mostre os produtos que precisam de atenção. Quero produtos caros que estejam com pouco estoque, mas também quero ver produtos muito baratos que estejam sobrando no estoque." 
-- Rodando um script para ter uma noção do preço dos produtos caros
select top 20 UnitPrice
from Products
order by 1 desc

-- Rodando um script para ter uma noção do preço dos produtos muitos baratos
select top 20 UnitPrice
from Products
order by 1

select ProductName, UnitPrice, UnitsInStock
from Products
where	UnitPrice >= 80 and UnitsInStock <= 10 
		or (UnitPrice <= 10 and UnitsInStock >= 50)
order by 2
-- Escolhi o produto caro acima de 80, pois, no top 20, já conseguimos ver que a diferença de preço nos valores anteriores são de 1 à 7 reais... o estoque presumi que abaixo de 10 já podemos considerar pouco. Para a opção de muito barato, eu foquei neste termo e parti de que até 10 reais podemos considerar muito barato e até 50 em estoque é um valor considerável com relação ao valor do produto.

---------------------------------------------------------------------------
