DECLARE		
			@JornadaTrabalho	INT		= 8
		,	@DiasMes			INT		= 30
		,	@Bonificacao		FLOAT	= 0.05
		,	@Data		VARCHAR(10) = SUBSTRING(dbo.FormataData(GETDATE()),1,10)

SELECT 
		FirstName	AS	'NOME'
	,	LastName	AS	'Sobrenome'
	,	JobTitle	AS	'Cargo'
	,	(Rate * @JornadaTrabalho * @DiasMes)	AS	'Sal�rio_M�s'
	,	dbo.FormataData(HireDate)	AS	'Data_Contrata��o'
	,	CONCAT(@Bonificacao * (2013 - YEAR(HireDate)) * 100, ' %') AS '% Porcentagem' 
	,	CASE
			WHEN YEAR(HireDate) BETWEEN 2000 AND 2013 THEN CONVERT(DEC(10,2),@Bonificacao * Rate * (2013 - YEAR(HireDate)) * @JornadaTrabalho * @DiasMes)
		END AS 'Bonifica��o_Total'
FROM HumanResources.Employee HRE

INNER JOIN HumanResources.EmployeePayHistory HREP (NOLOCK) ON
	HREP.BusinessEntityID = HRE.BusinessEntityID

INNER JOIN Person.Person PP (NOLOCK) ON
	PP.BusinessEntityID = HRE.BusinessEntityID

ORDER BY Sal�rio_M�s DESC















