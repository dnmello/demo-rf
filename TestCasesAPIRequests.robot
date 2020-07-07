*** Settings ***
Documentation       Suíte de Exemplo de testes API com o Robot Framework
#Resource            BDDpt-br.robot
Resource            Resource.robot

*** Test Case ***
Cenário 01: Consulta de endereço existente
    Given que esteja conectado no webservice de consultas de CEP
    When o usuário consultar o CEP "88056-000"
    Then deve ser mostrado o endereço "Avenida Luiz Boiteux Piazza"
    AND deve ser mostrado o bairro "Cachoeira do Bom Jesus"
    AND deve ser mostrada a cidade "Florianópolis"
    AND deve ser mostrada a UF "SC"
    AND deve ser mostrado o CEP "88056000"

Cenário 03: Consulta de endereço inexistente
    Given que esteja conectado no webservice de consultas de CEP
    When o usuário consultar o CEP "99999-999"
    Then a mensagem de erro "CEP INVÁLIDO" deve ser retornada
