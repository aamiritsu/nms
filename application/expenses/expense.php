<?php 
$titlepage="Expenses";
$idsmenu=4;
include "../../library/config.php";
require_once("../model/dbconn.php");
require_once("../model/pos.php");
include "../layout/top-header.php"; 
include "../../library/check_login.php";
include "../../library/check_access.php";
include "../layout/header.php"; ?>

<section class="content">
  <div class="box box-success">
    <div class="box-header with-border">
      <h3 class="box-title">Expenses Sheet</h3>
    </div><!--./ box header-->
    <div class="box-body">
      <button type="submit" class="btn btn-primary " id="btnOpenAddExpenseModal" name="btnOpenAddExpenseModal"><i class="fa fa-plus"></i> Add Expense</button>
      <br>
      <div class="box-body table-responsive no-padding">
        <table id="table_expense" class="table  table-bordered table-hover ">
          <thead>
            <tr class="tableheader">
              <th style="width:5%">#</th>
              <th style="width:10%">Type</th>
              <th style="width:10%">Amount</th>
              <th style="width:45%">Description</th>
              <th style="width:10%">Date</th>
              <th style="width:10%">Added By</th>
              <th style="width:10%">Action</th>
              
            </tr>
          </thead>
          <tbody></tbody>
        </table>
      </div>
     </div>
  </div><!-- /.box -->
  <div id="divChartBtn">
    <button type="submit" class="btn btn-primary " id="btnDisplayChart" name="btnDisplayChart" onclick="getExpensesForChart();"><i class="fa fa-bar-chart"></i> Show Chart</button>
  </div>
  <div id="chart-container" style="width: 25%"></div>

</section><!-- /.content -->
<div id="modalAddExpense" class="modal fade ">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h4 class="modal-title">Add Expense Form</h4>
      </div>
      <!--modal header-->
      <div class="modal-body">
        <form id="formNewExpense">
        <div class="form-horizontal">
          <div class="box-body">
            <div class="form-group">
              <label for="ddExpenseType" class="col-sm-2 control-label">Expense Type</label>
              <div class="col-sm-10">
                <select class="form-control" id="ddExpenseType">
                  <?php
                    $pos = new pos();
                    $dbExpenseTypes = $pos->getExpenseTypes();
                    foreach ($dbExpenseTypes[1] as $key) {
                        echo "<option value='".$key['name']."'>".$key['name']." </option>";
                    }
                  ?>
                </select>
               </div> 
            </div>
           
            <div class="form-horizontal " >
              <div class="box-body">
                <div class="form-group">
                  <label for="txtExpenseAmount" class="col-sm-2 control-label">Amount</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control" id="txtExpenseAmount" placeholder="Amount">
                  </div>
                </div>
                <div class="form-group">
                  <label for="txtExpenseDescription" class="col-sm-2 control-label">Description</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="txtExpenseDescription" placeholder="Description">
                  </div>
                </div>

               <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <input type="hidden" id="eid" name="eid" class="" value="">
                  <input type="hidden" id="inputcrud" name="inputcrud" class="" value="C">
                  <button type="Reset" class="btn btn-default"><i class="fa fa-refresh"></i> Reset</button>
                  <button type="submit" class="btn btn-primary" id="btnAddEditExpense"><i class="fa fa-save"></i> Submit</button>
                </div>
              </div>

              </div>
            </div> 

            <!--end form menuk-->
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
          <!--modal footer-->
        </div>
      </form>
        <!--modal-content-->
      </div>
      <!--modal-dialog modal-lg-->
    </div>
    <!--form-kantor-modal-->
  </div>

  <!-- modal dialog untuk password -->
  <div id="passwordmodal" class="modal fade ">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">Reset Password</h4>
        </div><!--modal header--> 
        <div class="modal-body"><div class="form-horizontal"><div class="box-body"><div class="form-group">   <label class="col-sm-3  control-label">Reset Password</label>   <div class="col-sm-9"><input type="password" class="form-control " id="txtresetpass" name="txtresetpass" value="" placeholder=""><input type="hidden" id="txthiduser" name="" class="" value="">    </div>  </div><div class="form-group">   <label class="col-sm-3  control-label"><button type="submit" class="btn btn-primary " id="btnresetpassword" name="btnresetpassword"><i class="fa  fa-key"></i> Reset Password</button> <span id="infopassword"></span></label>   <div class="col-sm-9">    </div>  </div></div></div></div><div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div><!--modal footer-->
    </div><!--modal-content-->
  </div><!--modal-dialog modal-lg-->
</div>
<!-- end modal -->
<?php include "../layout/footer.php"; //footer template ?> 
<?php include "../layout/bottom-footer.php"; //footer template ?> 
<script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="j_expense.js"></script>

</body>
</html>
