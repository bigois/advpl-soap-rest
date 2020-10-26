#Include "TOTVS.ch"
#Include "APWEBSRV.ch"

/*/{Protheus.doc} WS0002
	Serviço com método, mas sem parâmetros definidos
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3075/ws/WS0002.apw?WSDL
/*/

WSSERVICE WS0002 DESCRIPTION "Serviço com método, mas sem parâmetros definidos"
	WSMETHOD MTD001 DESCRIPTION "Método sem parâmetros de entrada e saída definidos"
ENDWSSERVICE

WSMETHOD MTD001 WSSERVICE WS0002
	Local lOK := .T.
Return (lOK)
