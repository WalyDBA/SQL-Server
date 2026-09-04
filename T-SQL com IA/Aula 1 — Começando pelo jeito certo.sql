-- Desafio 1
select ProductName, UnitPrice, UnitsInStock
from Products

-- Desafio 2
select ProductName, UnitPrice
from Products
where UnitPrice > 30

-- Desafio 3
select ProductName, UnitPrice, UnitsInStock
from Products
where UnitPrice < 20 and UnitsInStock > 10

-- Desafio 4
select ProductName, UnitPrice, UnitsInStock
from Products
where UnitPrice between 10 and 50 or UnitsInStock = 0

-- Desafio 5
select ProductName, UnitPrice
from Products
where UnitsInStock > 1 and UnitPrice > 40
order by UnitPrice desc

-- Desafio 6
select CompanyName, ContactName, City, Country
from Suppliers
where Country = 'Brazil'

-- Desafio 7
select ProductName, UnitPrice, UnitsInStock
from Products
where UnitPrice > 40 and UnitsInStock < 10
order by UnitsInStock desc
-- Decido ordernar pelos produtos com mais estoques, pois assim teremos uma visão do que está parado e não está vendendo

-- Desafio Bônus
SELECT *
FROM Products
WHERE UnitPrice > 10
  AND UnitPrice < 20
  OR UnitsInStock = 0;

 SELECT *
FROM Products
WHERE UnitPrice > 10
  AND (UnitPrice < 20
       OR UnitsInStock = 0);
-- O resultado é igual, pois, apesar da condição estar diferente, o valor unitário já vai ser algo entre 11 e 19 ou com unidade estocada = 0

---------------------------------------------------------------------------

-- Correção
/*
Desafio 1 (correto)
Desafio 2 (correto)
Desafio 3 (correto)
Desafio 4 (correto)
  -> OBS.: foi escrito BETWEEN para achar um range de valor incluído, porém poderia ser escrito "UnitPrice >=10 and UnitPrice <=50". Das duas maneiras funcionam exatamente igual.
Desafio 5 (errado)
  -> aqui o erro foi de interpretação do desafio, pois foi solicitado produtos em estoque e a query trouxe todos acima de 1 unidade, mas se tem 1 unidade em estoque significa que deveria trazer. Portante o ideal seria escerver "UnitsInStock >0".
Desafio 6 (errado)
  -> aqui o erro foi de consulta em tabela errada, o correto seria na tabela "Customers"
Desafio 7 (meio correto)
  -> aqui a escrita está correta, porém houve uma interpretação errada, onde foi solicitado "estoque baixo" e foi ordenado com os produtos com mais estoque, portanto deveria ser "order by UnitsInStock asc".
Desafio Bônus (errado)
  -> o resultado não é igual, e para entender isso devemos saber que o SQL Server sempre dá prioridade para o AND em relação ao OR. 
  -> portanto a primeira query ela pega todos os produtos entre 10 e 20 OU produtos sem estoque
  -> na segunda query 
/*
