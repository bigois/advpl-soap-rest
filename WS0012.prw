#Include "TOTVS.ch"
#Include "RESTFUL.ch"

/*/{Protheus.doc} WS0012
	Alterando a estrutura de resposta para JSON
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3085/rest/index/WS0012
/*/

WSRESTFUL WS0012 DESCRIPTION "Alterando a estrutura de resposta para JSON" FORMAT "APPLICATION_JSON"
	WSMETHOD GET DESCRIPTION "Método GET simples" WSSYNTAX "/WS0012"
END WSRESTFUL

WSMETHOD GET WSSERVICE WS0012
	Local lOK := .T.
	Local oResponse := JSONObject():New()

	oResponse["code"] := "CLT024"
	oResponse["name"] := "Maximus Trade Corporation"

	::SetContentType("application/json")
	::SetResponse(oResponse:ToJSON())
Return (lOK)
