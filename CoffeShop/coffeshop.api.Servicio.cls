Class coffeshop.api.Servicio Extends %CSP.REST
{

XData UrlMap
{
<Routes>
<Route Url="/pedidos" 
      Method="GET" 
       Call="coffeshop.servicio.PedidoREST:obtenerPedidos"/>
<Route Url="/pedidos" 
      Method="POST" 
       Call="coffeshop.servicio.PedidoREST:crearPedido"/>
<Route Url="/pedidos/:idpedido" 
      Method="DELETE" 
       Call="coffeshop.servicio.PedidoREST:borrarPedido"/>       
</Routes>
}

}
