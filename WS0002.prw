#Include "TOTVS.ch"
#Include "APWEBSRV.ch"

/*/{Protheus.doc} WS0002
	Servi�o com m�todo, mas sem par�metros definidos
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3075/ws/WS0002.apw?WSDL
/*/

WSSERVICE WS0002 DESCRIPTION "Servi�o com m�todo, mas sem par�metros definidos"
	WSMETHOD MTD001 DESCRIPTION "M�todo sem par�metros de entrada e sa�da definidos"
ENDWSSERVICE

WSMETHOD MTD001 WSSERVICE WS0002
	Local lOK := .T.
Return (lOK)
