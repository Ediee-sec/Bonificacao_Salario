### Query SQL Server
-------------

* #### Estudo de caso

> *O ano é 2014 e uma empresa decide bonificar todos os funcionários que estão na empresa desde o ano 2000, sendo que cada ano será dada uma bonificação de 5% em cima do salário base*

> **Exemplo**: *Funcionário "Ken" tem o salário base de 50$ a hora, ele foi contratado em 2010 por tanto, ele tem 4 anos de bonificação.*
* *O cauculo ficaria Assim:*
~~~
    Ano_Contratação = 2010
    Ano_Corte       = 2013
    Bonificação     = 0.05
    Salario_Base    = 50
    
    Bonificação * Salario_Base * (Ano_Corte - Ano_Contratação)
    
    Resultado = 7.5
~~~
----------------

#### Mão na Massa:
> *Utilize o banco de dados acadêmico da Microsoft [AdventureWorks2019](https://docs.microsoft.com/pt-br/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms), o mesmo já possui dados consolidados não sendo necessária a criação de um novo banco de dados, se tiver duvida de como restaurar dados de um DB, segue um [Video Explicativo](https://www.youtube.com/watch?v=y86qxcZHr0Y&t=225s)*

* *Nesta mesma pasta terá um arquivo com o nome SOLUÇÃO, onde está a solução deste problema, mas aconselho a tentar realizar a QUERY o máximo que conseguir* 


