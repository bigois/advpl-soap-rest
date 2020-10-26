#Include "TOTVS.ch"
#Include "APWEBSRV.ch"

/*/{Protheus.doc} WS0008
	Serviço com método retornando estruturas aninhadas
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3075/ws/WS0008.apw?WSDL
/*/

WSSTRUCT ORDER
	WSDATA number AS STRING
	WSDATA items AS ARRAY OF COMPONENT
ENDWSSTRUCT

WSSTRUCT COMPONENT
	WSDATA code AS STRING
	WSDATA type AS STRING
	WSDATA description AS STRING
ENDWSSTRUCT

WSSERVICE WS0008 DESCRIPTION "Serviço com método retornando estruturas aninhadas"
	WSDATA code AS STRING
	WSDATA branch AS STRING
	WSDATA order AS ORDER

	WSMETHOD MTD001 DESCRIPTION "Retorna uma estrutura com mais de uma informação"
ENDWSSERVICE

WSMETHOD MTD001 WSRECEIVE code, branch WSSEND order WSSERVICE WS0008
	Local lOK := .T.
	Local nX := 0

	If (::code == "ORD0001" .And. ::branch == "01")
		::order:number := ::code

		For nX := 1 To 10
			AAdd(::order:items, WSClassNew("COMPONENT"))

			::order:items[nX]:code := "PRDT" + StrZero(nX, 4)
			::order:items[nX]:description := "Product nº " + StrZero(nX, 4)
			::order:items[nX]:type := "PA"
		Next nX
	Else
		lOK := .F.
		SetSoapFault("Invalid argument", "Order nº " + ::code + " not found on branch " + ::branch, SOAPFAULT_SENDER)
	EndIf
Return (lOK)
