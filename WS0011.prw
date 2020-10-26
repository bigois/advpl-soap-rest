#Include "TOTVS.ch"
#Include "RESTFUL.ch"

/*/{Protheus.doc} WS0011
	Servi�o b�sico contendo um m�todo em branco
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3085/rest/index/WS0011
/*/

WSRESTFUL WS0011 DESCRIPTION "Estrutura b�sica de servi�o REST em branco" 
	WSMETHOD GET DESCRIPTION "M�todo GET simples"
END WSRESTFUL

WSMETHOD GET WSSERVICE WS0011
	Local lOK := .T.
Return (lOK)
