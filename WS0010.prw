#Include "TOTVS.ch"
#Include "APWEBSRV.ch"

/*/{Protheus.doc} WS0010
	Servi�o para exemplifica��o de CRUD SOAP
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3075/ws/WS0010.apw?WSDL
/*/

WSSTRUCT guess
	WSDATA name AS STRING
	WSDATA age AS INTEGER
ENDWSSTRUCT

WSSERVICE WS0010 DESCRIPTION "Servi�o para exemplifica��o de CRUD SOAP"
	WSDATA id AS STRING
	WSDATA guess AS GUESS
	WSDATA status AS STRING

	WSMETHOD getguess DESCRIPTION "Simula a opera��o de visualiza��o"
	WSMETHOD addguess DESCRIPTION "Simula a opera��o de inclus�o"
	WSMETHOD updateguess DESCRIPTION "Simula a opera��o de altera��o"
	WSMETHOD deleteguess DESCRIPTION "Simula a opera��o de dele��o"
ENDWSSERVICE

WSMETHOD getguess WSRECEIVE id WSSEND guess WSSERVICE WS0010
	Local lOK := .T.

	If (::id == "GS0001") 
		// REALIZA A PESQUISA DOS DADOS
		::guess:name := "Paul Marley"
		::guess:age := 31
	Else
		lOK := .F.
		SetSoapFault("Invalid argument", "Guess not found", SOAPFAULT_SENDER)
	EndIf
Return (lOK)

WSMETHOD addguess WSRECEIVE guess WSSEND status WSSERVICE WS0010
	Local lOK := .T.

	If (::guess:name != NIL .And. !Empty(::guess:name) .And. ::guess:age != NIL .And. IsNumeric(::guess:age))
		// REALIZA A INCLUS�O
		::status := "Operation successful"
	Else
		lOK := .F.
		SetSoapFault("Invalid argument", "Missing information", SOAPFAULT_SENDER)
	EndIf
Return (lOK)

WSMETHOD updateguess WSRECEIVE guess WSSEND status WSSERVICE WS0010
	Local lOK := .T.

	If (::guess:name != NIL .And. !Empty(::guess:name) .And. ::guess:age != NIL .And. IsNumeric(::guess:age))
		// REALIZA PESQUISA (POSICIONAMENTO)
		// REALIZA A ALTERA��O
		::status := "Operation successful"
	Else
		lOK := .F.
		SetSoapFault("Invalid argument", "Missing information", SOAPFAULT_SENDER)
	EndIf
Return (lOK)

WSMETHOD deleteguess WSRECEIVE id WSSEND status WSSERVICE WS0010
	Local lOK := .T.

	If (::id == "GS0001") 
		// REALIZA A PESQUISA DOS DADOS
		// DELETA O USU�RIO
		::status := "Operation successful"
	Else
		lOK := .F.
		SetSoapFault("Invalid argument", "Guess not found", SOAPFAULT_SENDER)
	EndIf
Return (lOK)
