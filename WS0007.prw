#Include "TOTVS.ch"
#Include "APWEBSRV.ch"

/*/{Protheus.doc} WS0007
	Serviço com método utilizando estrutura de retorno
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3075/ws/WS0007.apw?WSDL
/*/

WSSTRUCT PRODUCT
	WSDATA type AS STRING
	WSDATA description AS STRING
ENDWSSTRUCT

WSSERVICE WS0007 DESCRIPTION "Serviço com método utilizando estrutura de retorno"
	WSDATA code AS STRING
	WSDATA branch AS STRING
	WSDATA product AS PRODUCT

	WSMETHOD MTD001 DESCRIPTION "Retorna uma estrutura com mais de uma informação"
ENDWSSERVICE

WSMETHOD MTD001 WSRECEIVE code, branch WSSEND product WSSERVICE WS0007
	Local lOK := .T.

	If (::code == "PRDT0001" .And. ::branch == "01")
		::product:description := "Notebook Gamer"
		::product:type := "PA"
	Else
		lOK := .F.
		SetSoapFault("Invalid argument", ::code + " description not found on branch " + ::branch, SOAPFAULT_SENDER)
	EndIf
Return (lOK)
