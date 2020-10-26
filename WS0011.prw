#Include "TOTVS.ch"
#Include "RESTFUL.ch"

/*/{Protheus.doc} WS0011
	Serviço básico contendo um método em branco
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3085/rest/index/WS0011
/*/

WSRESTFUL WS0011 DESCRIPTION "Estrutura básica de serviço REST em branco" 
	WSMETHOD GET DESCRIPTION "Método GET simples"
END WSRESTFUL

WSMETHOD GET WSSERVICE WS0011
	Local lOK := .T.
Return (lOK)
