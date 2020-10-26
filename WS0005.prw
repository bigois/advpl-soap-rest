#Include "TOTVS.ch"
#Include "APWEBSRV.ch"

/*/{Protheus.doc} WS0005
	Servi�o gerador de erro por par�metro n�o mapeado
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3075/ws/WS0005.apw?WSDL
/*/

WSSERVICE WS0005 DESCRIPTION "Servi�o gerador de erro por par�metro n�o mapeado"
	WSDATA code AS STRING
	WSDATA description AS STRING

	WSMETHOD MTD001 DESCRIPTION "Retorna um erro n�o mapeado"
	WSMETHOD MTD002 DESCRIPTION "Retorna um erro mapeado"
ENDWSSERVICE

WSMETHOD MTD001 WSRECEIVE code WSSEND description WSSERVICE WS0005
	Local lOK := .T.

	If (::code == "PRDT0001")
		::description := "Notebook Gamer"
	Else
		::description := "Description not found"
		lOK := .F.
	EndIf
Return (lOK)

WSMETHOD MTD002 WSRECEIVE code WSSEND description WSSERVICE WS0005
	Local lOK := .T.

	If (::code == "PRDT0001")
		::description := "Notebook Gamer"
	Else
		lOK := .F.
		SetSoapFault("Invalid argument", ::code + " description not found", SOAPFAULT_SENDER)
	EndIf
Return (lOK)
