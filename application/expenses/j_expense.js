   

$(document).ready( function () 
{
  var value = {
    method : "getExpenses"
  };
  $('#table_expense').DataTable({
    "paging": false,
    "lengthChange": false,
    "searching": false,
    "ordering": false,
    "info": false,
    "responsive": true,
    "autoWidth": false,
    "pageLength": 50,
    "dom": '<"top"f>rtip',
    "ajax": {
      "url": "c_expense.php",
      "type": "POST",
      "data":value,
    },
    "columns": [
    { "data": "id" },
    { "data": "etype" },
    { "data": "amount" },
    { "data": "description" },
    { "data": "created_on" },
    { "data": "created_by" },
    { "data": "buttons" },
    ]
  });


	$(document).on( "click","#btnOpenAddExpenseModal", function() {
	  
	  $("#btnAddExpense").text("Add");	
	  $("#txtExpenseAmount").val("");
	  $("#txtExpenseDescription").val("");
	  $("#modalAddExpense").modal('show');
	  set_focus("#txtExpenseAmount");
	});


});








// ---------------------- Add / Edit Expense     --------------


$(document).on( "click","#btnAddEditExpense", function() {
  
  var ExpenseId = $("#eid").val();
  var ExpenseAmount=$("#txtExpenseAmount").val();
  var ExpenseDescription=$("#txtExpenseDescription").val();
  var ExpenseType=$("#ddExpenseType").val();
  var crud = $("#inputcrud").val();

  if(ExpenseAmount == '' || ExpenseAmount== null ){
    $.notify({
      message: "Please fill out ExpenseAmount!"
    },{
      type: 'warning',
      delay: 10000,
    });
    $("#txtExpenseAmount").focus();
    return;
  }
  if(ExpenseDescription == '' || ExpenseDescription == null ){
    $.notify({
      message: "Please fill out ExpenseDescription"
    },{
      type: 'warning',
      delay: 10000,
    });
    $("#txtExpenseDescription").focus();
    return;
  }

  
  var value = {
  	ExpenseId : ExpenseId,
    ExpenseAmount: ExpenseAmount,
    ExpenseDescription:ExpenseDescription,
    ExpenseType : ExpenseType,
    crud:crud,
    method : "save_expense"
  };

  $("#btnAddEditExpense").prop('disabled', true);
  proccess_waiting("#infoproses");
  $.ajax(
  {
    url : "c_expense.php",
    type: "POST",
    data : value,
    success: function(data, textStatus, jqXHR)
    {
      $("#btnAddEditExpense").prop('disabled', false);
      $("#infoproses").html("");
      var data = jQuery.parseJSON(data);
      if(data.crud == 'C'){
        if(data.result == true){
          $.notify("New Expense Added Successfully");
          $("#eid").val("");
          $("#txtExpenseAmount").val("");
  		  $("#txtExpenseDescription").val("");
          $("#modalAddExpense").modal("hide");

          var table = $('#table_expense').DataTable(); 
          table.ajax.reload( null, false );
          
        }else{
          $.notify({
            message: "Error save new Expense , Error : "+data.error 
          },{
            type: 'danger',
            delay: 10000,
          });
          set_focus("#txtExpenseAmount");
        }

      }else if(data.crud == 'U'){
      	if(data.result == true){
          $.notify("New Expense Updated Successfully");
          var table = $('#table_expense').DataTable(); 
          table.ajax.reload( null, false );
          $("#eid").val("");
          $("#txtExpenseAmount").val("");
  		  $("#txtExpenseDescription").val("");
          $("#modalAddExpense").modal("hide");

        }else{
          $.notify({
            message: "Error save new expense , Error : "+data.error 
          },{
            type: 'danger',
            delay: 10000,
          });
          set_focus("#txtExpenseAmount");
        }
      }else{
        $.notify({
          message: "Invalid Operation!" 
        },{
          type: 'danger',
          delay: 10000,
        });
      }
    },
    error: function(jqXHR, textStatus, errorThrown)
    {
      $("#btnAddEditExpense").prop('disabled', false);
      
    }
  });
});






$(document).on( "click",".btneditexpense", function() {
 
  var p_id = $(this).attr("p_id");
  var oldExpenseAmount = $(this).attr("p_amount");
  var oldExpenseDesc = $(this).attr("p_desc");

  $("#eid").val(p_id);
  $("#btnAddEditExpense").text("Edit");
  $("#txtExpenseAmount").val(oldExpenseAmount);
  $("#txtExpenseDescription").val(oldExpenseDesc);
  $("#inputcrud").val("U");
  $("#modalAddExpense").modal('show');
  set_focus("#txtExpenseAmount");
});




$(document).on( "click",".btndeleteexpense", function() {
  var p_id = $(this).attr("p_id");
  var p_desc = $(this).attr("p_desc");
  
  swal({   
    title: "Delete ",   
    text: "Delete ["+p_desc+"] Expense ?",   
    type: "warning",   
    showCancelButton: true,   
    confirmButtonColor: "#DD6B55",   
    confirmButtonText: "Delete",   
    closeOnConfirm: true }, 
    function(){   
      var value = {
        p_id: p_id,
        crud:'D',
        method : "delete_expense"
      };
      $.ajax(
      {
        url : "c_expense.php",
        type: "POST",
        data : value,
        success: function(data, textStatus, jqXHR)
        {
          var data = jQuery.parseJSON(data);
          if(data.result == true){
            $.notify("Delete Expense successfully");
            var table = $('#table_expense').DataTable(); 
            table.ajax.reload( null, false );
          }else{
            $.notify({
              message: "Error delete Expense , Error : "+data.error 
            },{
              type: 'danger',
              delay: 10000,
            });
          }
          
        },
        error: function(jqXHR, textStatus, errorThrown)
        {
          $.notify({
            message:  "Error : "+textStatus
          },{
            type: 'danger',
            delay: 10000,
          });
        }
      });
    });
});

function getExpensesForChart(){
	var chart = Morris.Bar({
	    // ID of the element in which to draw the chart.
	    element: 'chart-container',
	    data: [0,0], // Set initial data (ideally you would provide an array of default data)
	    xkey: ['type'], // Set the key for X-axis
	    ykeys: ['amount'], // Set the key for Y-axis
	    labels: ['Amount']
	    
  	});

	var value = { method : "getExpensesForChart", };
	$.ajax({
	    url : "c_expense.php",
	    type: "POST",
	    data : value,
	    success: function(data, textStatus, jqXHR)
	    {
	    	var data = jQuery.parseJSON(data);
	    	chart.setData(data);
	    },
	    error: function(jqXHR, textStatus, errorThrown)
	    { console.log("Error while fetching expneses for chart"); return;}
	});
}