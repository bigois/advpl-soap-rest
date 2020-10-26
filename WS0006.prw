#Include "TOTVS.ch"
#Include "APWEBSRV.ch"

/*/{Protheus.doc} WS0006
	Servi�o com m�todo utilizando mais de um par�metro
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3075/ws/WS0006.apw?WSDL
/*/	
WSSERVICE WS0006 DESCRIPTION "Servi�o com m�todo utilizando mais de um par�metro"
	WSDATA code AS STRING
	WSDATA branch AS STRING
	WSDATA type AS STRING
	WSDATA description AS STRING

	WSMETHOD MTD001 DESCRIPTION "Recebe mais de um par�metro de entrada"
	WSMETHOD MTD002 DESCRIPTION "Recebe e retorna mais de um par�metro"
ENDWSSERVICE

WSMETHOD MTD001 WSRECEIVE code, branch WSSEND description WSSERVICE WS0006
	Local lOK := .T.

	If (::code == "PRDT0001" .And. ::branch == "01")
		::description := "Notebook Gamer"
	Else
		lOK := .F.
		SetSoapFault("Invalid argument", ::code + " description not found on branch " + ::branch, SOAPFAULT_SENDER)
	EndIf
Return (lOK)

WSMETHOD MTD002 WSRECEIVE code, branch WSSEND description WSSERVICE WS0006
// WSMETHOD MTD002 WSRECEIVE code, branch WSSEND description, type WSSERVICE WS0006
	Local lOK := .T.

	If (::code == "PRDT0001" .And. ::branch == "01")
		::description := "Notebook Gamer"
		::type := "PA"
	Else
		lOK := .F.
		SetSoapFault("Invalid argument", ::code + " description not found on branch " + ::branch, SOAPFAULT_SENDER)
	EndIf
Return (lOK)
