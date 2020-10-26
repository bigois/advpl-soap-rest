#Include "TOTVS.ch"
#Include "APWEBSRV.ch"

/*/{Protheus.doc} WS0009
	Serviço com método contendo todos os tipos de dados
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3075/ws/WS0009.apw?WSDL
/*/

WSSTRUCT actor
	WSDATA id AS INTEGER
	WSDATA title AS STRING
	WSDATA wonoscar AS BOOLEAN
	WSDATA patrimony AS FLOAT
	WSDATA recdate AS DATE
	WSDATA token AS BASE64BINARY
ENDWSSTRUCT

WSSTRUCT actress
	WSDATA id AS INTEGER
	WSDATA title AS STRING
	WSDATA wonoscar AS BOOLEAN
	WSDATA patrimony AS FLOAT
	WSDATA recdate AS DATE
	WSDATA token AS BASE64BINARY
ENDWSSTRUCT

WSSERVICE WS0009 DESCRIPTION "Serviço com método contendo todos os tipos de dados"
	WSDATA actor AS ACTOR
	WSDATA actress AS ACTRESS

	WSMETHOD MTD001 DESCRIPTION "Recebe e retorna todos os tipos de dados"
ENDWSSERVICE

WSMETHOD MTD001 WSRECEIVE actor WSSEND actress WSSERVICE WS0009
	Local lOK := .T.

	::actress:id := 5646
	::actress:title := "Black Widow"
	::actress:wonOscar := .T.
	::actress:patrimony := 35165.23
	::actress:recdate := CTOD("04/11/2005")
	::actress:token := "TOKEN_OK"
Return (lOK)
