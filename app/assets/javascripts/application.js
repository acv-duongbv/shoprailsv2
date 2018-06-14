//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
function editClick(id_line){
  console.log(id_line);
  row_id  = "#row" + id_line
  var quantity = $(row_id).val();
  $.ajax({
    url : '/line_items',
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data : {id: id_line, quantity: quantity},
    type : 'PATCH',
    dataType: 'json',
    complete: function(){
   
      location.reload();
   }});
}

function search_order(){
  var order_no = $("#txt_order_no").val();
  window.location.href = "/order/"+order_no;

}
