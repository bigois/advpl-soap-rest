#Include "TOTVS.ch"
#Include "RESTFUL.ch"

/*/{Protheus.doc} WS0013
	Alterando a estrutura de resposta para XML
	@author Guilherme Bigois
	@since 23/10/2020
	@version 12.1.25
	@link http://spon019400135:3085/rest/index/WS0013
/*/

WSRESTFUL WS0013 DESCRIPTION "Alterando a estrutura de resposta para XML" FORMAT "APPLICATION_XML"
	WSMETHOD GET DESCRIPTION "Método GET simples" WSSYNTAX "/WS0013
END WSRESTFUL

WSMETHOD GET WSSERVICE WS0013
	Local lOK := .T.
	Local oResponse := TXMLManager():New()

	// ADICIONA O NÓ <PARAM>
	oResponse:Parse("<root></root>")

	// ADICIONA ATRIBUITOS EM <PARAM>
	oResponse:XPathAddNode("/root", "code", "CLT024")
	oResponse:XPathAddNode("/root", "name", "Maximus Trade Corporation")

	::SetContentType("application/xml")
	::SetResponse(oResponse:Save2String())
Return (lOK)
