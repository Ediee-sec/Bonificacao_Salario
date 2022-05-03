>Lembrando que utilizo uma função desenvolvida por mim mesmo para formatar as datas (dbo.FormataData), mais abaixo irei deixar a sintaxe dela para vocês desenvolverem também

~~~SQL
-- Declarando as variáveis
DECLARE		
			@JornadaTrabalho	INT		= 8
		,	@DiasMes			INT		= 30
		,	@Bonificacao		FLOAT	= 0.05
		,	@Data		VARCHAR(10) = SUBSTRING(dbo.FormataData(GETDATE()),1,10)

-- Inciando o Select
SELECT 
		FirstName	AS	'Nome'
	,	LastName	AS	'Sobrenome'
	,	JobTitle	AS	'Cargo'
	,	(Rate * @JornadaTrabalho * @DiasMes)	AS	'Salário_Mês' -- Calculo para retornar o salário mês, pois a tabela retorna apenas o salário hora
	,	dbo.FormataData(HireDate)	AS	'Data_Contratação' -- FormataData é uma função criada por mim          
	,	CONCAT(@Bonificacao * (2013 - YEAR(HireDate)) * 100, ' %') AS '% Porcentagem' 
	,	CASE
			WHEN YEAR(HireDate) BETWEEN 2000 AND 2013 THEN CONVERT(DEC(10,2),@Bonificacao * Rate * (2013 - YEAR(HireDate)) * @JornadaTrabalho * @DiasMes)
		END AS 'Bonificação_Total'
FROM HumanResources.Employee HRE

INNER JOIN HumanResources.EmployeePayHistory HREP (NOLOCK) ON
	HREP.BusinessEntityID = HRE.BusinessEntityID

INNER JOIN Person.Person PP (NOLOCK) ON
	PP.BusinessEntityID = HRE.BusinessEntityID

ORDER BY Salário_Mês DESC
~~~


-----

### Funções Utilizadas:

1. **SUBSTRING** = *Está função tem como finalidade recortar parte de uma string. neste caso eu recordo a função GETDATE(), para pegar apenas ano,mes e dias e desconsiderar o horário*
* [Documentação SUBSTRING](https://docs.microsoft.com/pt-br/sql/t-sql/functions/substring-transact-sql?view=sql-server-ver15)

2. **GETDATE** = *Utilizo está função para pegar a data atual, porém está função vem com horario junto da data, por isso é necessário a utilização do SUBSTRING para retornar apenas a DATA*
* [Documentação GETDATE](https://docs.microsoft.com/pt-br/sql/t-sql/functions/getdate-transact-sql?view=sql-server-ver15)

3. **CONCAT** = *Função utilizada para concatenar (Juntar) informações ao resultado retornado na Query*
* [Documentacação CONCAT](https://docs.microsoft.com/pt-br/sql/t-sql/functions/concat-transact-sql?view=sql-server-ver15)

4. **YEAR** = *Retorna o ano da data informada dentro da função YEAR*
* [Documentação YEAR](https://docs.microsoft.com/pt-br/sql/t-sql/functions/year-transact-sql?view=sql-server-ver15)

5. **CONVERT** = *Converte um tipo de dado, converte de String para Decimal*
* [Documentação CONVERT](https://docs.microsoft.com/pt-br/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15)

6. **FormataData** = *Função desenvolvida internamente para converter o formato da data padrão do SQL para o formato utilizado no Brasil DD/MM/AAAA*
> **Sintaxe da função FomataData**

~~~~sql
CREATE FUNCTION [dbo].[FormataData](@Coluna datetime)
RETURNS VARCHAR(15)
AS
BEGIN
	DECLARE @AAA VARCHAR(20)
	SET @AAA = CONVERT(CHAR(10), CAST(@Coluna as datetime), 103) 
	RETURN @AAA
	
END
~~~~