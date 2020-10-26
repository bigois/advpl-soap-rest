#Include "TOTVS.ch"
#Include "APWEBSRV.ch"

/*/{Protheus.doc} WS0010
	Serviço para exemplificação de CRUD SOAP
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3075/ws/WS0010.apw?WSDL
/*/

WSSTRUCT guess
	WSDATA name AS STRING
	WSDATA age AS INTEGER
ENDWSSTRUCT

WSSERVICE WS0010 DESCRIPTION "Serviço para exemplificação de CRUD SOAP"
	WSDATA id AS STRING
	WSDATA guess AS GUESS
	WSDATA status AS STRING

	WSMETHOD getguess DESCRIPTION "Simula a operação de visualização"
	WSMETHOD addguess DESCRIPTION "Simula a operação de inclusão"
	WSMETHOD updateguess DESCRIPTION "Simula a operação de alteração"
	WSMETHOD deleteguess DESCRIPTION "Simula a operação de deleção"
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
		// REALIZA A INCLUSÃO
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
		// REALIZA A ALTERAÇÃO
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
		// DELETA O USUÁRIO
		::status := "Operation successful"
	Else
		lOK := .F.
		SetSoapFault("Invalid argument", "Guess not found", SOAPFAULT_SENDER)
	EndIf
Return (lOK)
