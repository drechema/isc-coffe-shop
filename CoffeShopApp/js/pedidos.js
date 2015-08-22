var restServiceUrlRoot = '/csp/coffeshop/api';

$(function(){
  
  // variables que contienen los objetos visuales
  var $orders = $('#orders');
  var $name = $('#name');
  var $drink = $('#drink');
  
  // plantilla para Mustache
  var orderTemplate = "" +
  "<li><h3><a href='#'>{{nombre}}</a></h3>" +
  "<p class='byline'><span>Posted on Dec 15th, 2007 by <a href='#'>Someone</a></span></p>" +
  "<p>Ha pedido <strong>{{bebida}}</strong></p>" +
  "<a href='#' data-id='{{id}}' class='remove'>Eliminar</a>" +
  "</li>";
  
  // función para añadir al listado
  function addOrder(order){
    $orders.append(Mustache.render(orderTemplate, order));
  }
  
  // recoger pedidos existentes
  // invocación REST
  $.ajax({
    type: 'GET',
    url: restServiceUrlRoot + '/pedidos',
    success: function(respuesta){
      $.each(respuesta.pedidos, function(i,order){
        addOrder(order);
      });
    },
    error: function(){
      alert('error cargando pedidos');
    }
  });
  
  // añadir un nuevo pedido
  $('#add-order').on('click',function(){
    // variable que contiene un objeto 'pedido'
    var order = {
      nombre : $name.val(),
      bebida : $drink.val()
    };
    // invocación REST
    $.ajax({
      type: 'POST',
      url: restServiceUrlRoot + '/pedidos',
      data: JSON.stringify(order),
      processData: false,
      contentType: "application/json",
      dataType: "json",
      success: function(newOrder){
        addOrder(newOrder);
        $name.val("");
        $drink.val("");
      },
      error: function(){
        alert('error al añadir pedido');
      }
    });
  });
  
  $orders.delegate('.remove','click',function(event){
	
    event.preventDefault();
    var $li = $(this).closest('li');
    $.ajax({
      type: 'DELETE',
      url: restServiceUrlRoot + "/pedidos/" + $(this).attr('data-id'),
      success: function(){
        $li.fadeOut(300, function(){
          $(this).remove();
        })
      }
    })
  })

});


