#Include "TOTVS.ch"
#Include "APWEBSRV.ch"

/*/{Protheus.doc} WS0004
	Servi�o com m�todo e par�metros definidos erro
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3075/ws/WS0004.apw?WSDL
/*/

WSSERVICE WS0004 DESCRIPTION "Servi�o com m�todo e par�metros definidos"
	WSDATA code AS STRING
	WSDATA description AS STRING

	WSMETHOD MTD001 DESCRIPTION "M�todo apenas com par�metros de entrada e sa�da"
ENDWSSERVICE

WSMETHOD MTD001 WSRECEIVE code WSSEND description WSSERVICE WS0004
	Local lOK := .T.

	If (::code == "PRDT0001")
		::description := "Notebook Gamer"
	Else
		::description := "Description not found"
	EndIf
Return (lOK)
