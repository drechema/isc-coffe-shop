Class coffeshop.servicio.PedidoREST Extends %RegisteredObject
{

/// REQUEST vacio
/// RESPONSE con objeto JSON con este formato
/// {
///  "pedidos":[ {	
///    "bebida" : "test",
///    "nombre" : "test"
///    },
///    {..}]
/// }
ClassMethod obtenerPedidos() As %Status
{
	set responseProxy = ##class(%ZEN.proxyObject).%New()
    set pedidos = ##class(%ListOfObjects).%New()
    
    &sql(declare c1 cursor for select ID, nombre, bebida into :id, :nombre, :bebida from coffeshop_model.Pedido)
    &sql(open c1)
    for {
        &sql(fetch c1)
        quit:SQLCODE'=0
    	set pedido = ##class(%ZEN.proxyObject).%New()
    	set pedido.id = id
    	set pedido.nombre = nombre
    	set pedido.bebida = bebida
    	do pedidos.Insert(pedido)
    }
    
    if SQLCODE = 100 {
	    set responseProxy.pedidos = pedidos
	} else {
		set responseProxy.error = 1
		set responseProxy.type = "SQLCODE"
		set responseProxy.value = SQLCODE
		set responseProxy.detail = %msg
	}
	
    &sql(close c1)    
    
    set %response.ContentType="application/json; charset=utf-8"
    do responseProxy.%ToJSON(,"aelotwu")
    
    return $$$OK
}

/// REQUEST con objeto JSON con este formato
/// {
///  "bebida" : "test",
///  "nombre" : "test"
/// }
/// RESPONSE con objeto JSON con este formato
/// {
///  "id" : "1",
///  "bebida" : "test",
///  "nombre" : "test"
/// }
ClassMethod crearPedido() As %Status
{
	set jsonstring = $ZCONVERT(%request.Content.Read(),"I","UTF8")
	set tSC = ##class(%ZEN.Auxiliary.jsonProvider).%ParseJSON(jsonstring,
	                                                          "%ZEN.proxyObject",
	                                                          .requestProxy)
	if $$$ISERR(tSC) return tSC
	
	set nuevoPedido = ##class(coffeshop.model.Pedido).%New()
	set nuevoPedido.nombre = requestProxy.nombre
	set nuevoPedido.bebida = requestProxy.bebida
	set tSC = nuevoPedido.%Save()
	if $$$ISERR(tSC) return tSC
	
	set responseProxy = requestProxy
	set responseProxy.id = nuevoPedido.%Id()
	
    set %response.ContentType="application/json; charset=utf-8"
    do responseProxy.%ToJSON(,"aelotwu")
    // a - output null arrays/objects
    // e - output empty object properties
    // l - output empty lists
    // o - output empty arrays/objects
    // t - indent with tab character
    // w - Windows-style cr/lf newline
    // u - output pre-converted to UTF-8 instead of in native internal format
	
	return $$$OK
}

/// URL: /pedidos/:idpedido
/// REQUEST vacio
/// RESPONSE vacio
ClassMethod borrarPedido(idpedido As %String) As %Status
{
	
	return ##class(coffeshop.model.Pedido).%DeleteId(idpedido)
}

}
