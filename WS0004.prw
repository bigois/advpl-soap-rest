#Include "TOTVS.ch"
#Include "APWEBSRV.ch"

/*/{Protheus.doc} WS0004
	Serviço com método e parâmetros definidos erro
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3075/ws/WS0004.apw?WSDL
/*/

WSSERVICE WS0004 DESCRIPTION "Serviço com método e parâmetros definidos"
	WSDATA code AS STRING
	WSDATA description AS STRING

	WSMETHOD MTD001 DESCRIPTION "Método apenas com parâmetros de entrada e saída"
ENDWSSERVICE

WSMETHOD MTD001 WSRECEIVE code WSSEND description WSSERVICE WS0004
	Local lOK := .T.

	If (::code == "PRDT0001")
		::description := "Notebook Gamer"
	Else
		::description := "Description not found"
	EndIf
Return (lOK)
