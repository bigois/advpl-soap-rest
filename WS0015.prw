#Include "TOTVS.ch"
#Include "RESTFUL.ch"

/*/{Protheus.doc} WS0015
	Versionando requisições
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3085/rest/index/WS0015
/*/

WSRESTFUL WS0015 DESCRIPTION "Versionando requisições" FORMAT "APPLICATION_JSON"
	WSMETHOD GET v1_database DESCRIPTION "Método GET simples versão 1.0" WSSYNTAX "/V1/WS0015" PATH "/V1/WS0015" PRODUCES APPLICATION_JSON
	WSMETHOD GET v2_database DESCRIPTION "Método GET simples versão 2.0" WSSYNTAX "/V2/WS0015" PATH "/V2/WS0015" PRODUCES APPLICATION_JSON
END WSRESTFUL

WSMETHOD GET v1_database WSSERVICE WS0015
	Local lOK := .T.
	Local oResponse := JSONObject():New()

	oResponse["code"] := "CLT024"
	oResponse["name"] := "Maximus Trade Corporation"
	oResponse["version"] := "1.0"

	::SetResponse(oResponse:ToJSON())
Return (lOK)

WSMETHOD GET v2_database WSSERVICE WS0015
	Local lOK := .T.
	Local oResponse := JSONObject():New()

	oResponse["code"] := "CLT024"
	oResponse["name"] := "Maximus Trade Corporation"
	oResponse["version"] := "2.0"

	::SetResponse(oResponse:ToJSON())
Return (lOK)
