# PARTE 4 - Alterando o banco de dados
Crie um script que adicione uma coluna “em_atividade” para os médicos, indicando se ele ainda está atuando no hospital ou não. 

Crie um script para atualizar ao menos dois médicos como inativos e os demais em atividade.

## Resolução
```bash
ALTER TABLE Medico
ADD COLUMN emAtividade boolean;
Desc Medico;

update Medico set emAtividade = true where id = 1;
update Medico set emAtividade = true where id = 2;
update Medico set emAtividade = false where id = 3;
update Medico set emAtividade = true where id = 4;
update Medico set emAtividade = true where id = 5;
update Medico set emAtividade = false where id = 6;
update Medico set emAtividade = true where id = 7;
update Medico set emAtividade = false where id = 8;
update Medico set emAtividade = true where id = 9;
update Medico set emAtividade = true where id = 10;

SELECT 
    nome,
    CASE # é basicamente um if
        WHEN emAtividade = 1 THEN 'Ativo'
        WHEN emAtividade = 0 THEN 'Inativo'
        ELSE 'Desconhecido' #é um default
    END AS status  # end é a finalização, e o as é pra renomear o emAtividade
FROM Medico;
```

## Código completo
🔗<a href='sql/SegredosHospital.sql'>SegredosHospital.sql</a>