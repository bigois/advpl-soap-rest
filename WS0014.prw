#Include "TOTVS.ch"
#Include "RESTFUL.ch"

/*/{Protheus.doc} WS0014
	Recupera dados por meio de parâmetro de cabeçalho, corpo, query string e URL
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3085/rest/index/WS0014
/*/

WSRESTFUL WS0014 DESCRIPTION "Recupera dados por meio de parâmetro de cabeçalho, corpo, query string e URL" FORMAT "APPLICATION_JSON"
	WSMETHOD GET DESCRIPTION "Método GET simples" WSSYNTAX "/WS0014"
END WSRESTFUL

WSMETHOD GET WSSERVICE WS0014
	Local lOK := .T.
	Local oResquest := JSONObject():New()
	Local oResponse := JSONObject():New()

	oResquest:FromJSON(::GetContent())

	oResponse["name"] := HTTPHeader("Username")
	oResponse["age"] := oResquest["age"]
	oResponse["university"] := ::aURLParms[1]
	oResponse["page"] := CValToChar(::aQueryString[1][2])

	::SetContentType("application/json")
	::SetResponse(oResponse:ToJSON())
Return (lOK)
