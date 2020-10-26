#Include "TOTVS.ch"
#Include "RESTFUL.ch"

/*/{Protheus.doc} WS0017
	Definindo uma mensagem de erro
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3085/rest/index/WS0017
/*/

WSRESTFUL WS0017 DESCRIPTION "Definindo uma mensagem de erro" FORMAT "APPLICATION_JSON"
	WSMETHOD GET DESCRIPTION "Método GET simples" WSSYNTAX "/WS0017" PATH "/WS0017" PRODUCES APPLICATION_JSON
END WSRESTFUL

WSMETHOD GET WSSERVICE WS0017
	Local lOK := .T.
	Local cAgent := HTTPHeader("Username")
	Local oResponse := JSONObject():New()

	If (cAgent == "USR0001")
		oResponse["operation"] := "User confirmed!"
		::SetResponse(oResponse:ToJSON())
	Else
		lOK := .F.
		SetRestFault(001, "Access denied", .T., 403)
	EndIf
Return (lOK)
