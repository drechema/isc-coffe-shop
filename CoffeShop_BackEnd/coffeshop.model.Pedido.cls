Class coffeshop.model.Pedido Extends %Persistent
{

Property nombre As %String(MAXLEN = 20);

Property bebida As %String(MAXLEN = 20);

Property hora as %TimeStamp[InitialExpression = {$zdt($h,3)}];

Storage Default
{
<Data name="PedidoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>nombre</Value>
</Value>
<Value name="3">
<Value>bebida</Value>
</Value>
<Value name="4">
<Value>hora</Value>
</Value>
</Data>
<DataLocation>^coffeshop.model.PedidoD</DataLocation>
<DefaultData>PedidoDefaultData</DefaultData>
<IdLocation>^coffeshop.model.PedidoD</IdLocation>
<IndexLocation>^coffeshop.model.PedidoI</IndexLocation>
<StreamLocation>^coffeshop.model.PedidoS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}
}
