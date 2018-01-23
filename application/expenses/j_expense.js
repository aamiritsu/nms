$(document).on( "click","#btnAddExpense", function() {
  $("#modalAddExpense").modal('show');
  $("#txtiduser").val(0);
  $("#txtusername").val("");
  $("#inputcrud").val("N");
  set_focus("#txtusername");
});