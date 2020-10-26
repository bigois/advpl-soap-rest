#Include "TOTVS.ch"
#Include "RESTFUL.ch"

/*/{Protheus.doc} WS0016
	Implementando o CRUD básico
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3085/rest/index/WS0016
/*/

WSRESTFUL WS0016 DESCRIPTION "Implementando o CRUD básico" FORMAT "APPLICATION_JSON"
	WSMETHOD GET DESCRIPTION "Método GET simples" WSSYNTAX "/WS0016" PATH "/WS0016" PRODUCES APPLICATION_JSON
	WSMETHOD POST DESCRIPTION "Método POST simples" WSSYNTAX "/WS0016" PATH "/WS0016" PRODUCES APPLICATION_JSON
	WSMETHOD PUT DESCRIPTION "Método PUT simples" WSSYNTAX "/WS0016" PATH "/WS0016" PRODUCES APPLICATION_JSON
	WSMETHOD DELETE DESCRIPTION "Método DELETE simples" WSSYNTAX "/WS0016" PATH "/WS0016" PRODUCES APPLICATION_JSON
END WSRESTFUL

WSMETHOD GET WSSERVICE WS0016
	Local lOK := .T.
	Local oResponse := JSONObject():New()

	oResponse["operation"] := "Read"

	::SetResponse(oResponse:ToJSON())
Return (lOK)

WSMETHOD POST WSSERVICE WS0016
	Local lOK := .T.
	Local oResponse := JSONObject():New()

	oResponse["operation"] := "Create"

	::SetResponse(oResponse:ToJSON())
Return (lOK)

WSMETHOD PUT WSSERVICE WS0016
	Local lOK := .T.
	Local oResponse := JSONObject():New()

	oResponse["operation"] := "Update"

	::SetResponse(oResponse:ToJSON())
Return (lOK)

WSMETHOD DELETE WSSERVICE WS0016
	Local lOK := .T.
	Local oResponse := JSONObject():New()

	oResponse["operation"] := "Delete"

	::SetResponse(oResponse:ToJSON())
Return (lOK)
