#Include "TOTVS.ch"
#Include "APWEBSRV.ch"

/*/{Protheus.doc} WS0003
	Serviço com método, porém apenas com parâmetros de entrada
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3075/ws/WS0003.apw?WSDL
/*/

WSSERVICE WS0003 DESCRIPTION "Serviço com método, porém apenas com parâmetros de entrada"
	WSDATA code AS STRING

	WSMETHOD MTD001 DESCRIPTION "Método apenas com parâmetros de entrada"
ENDWSSERVICE

WSMETHOD MTD001 WSRECEIVE code WSSERVICE WS0003
	Local lOK := .T.
Return (lOK)
