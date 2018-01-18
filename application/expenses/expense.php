<?php include "../../library/config.php"; ?>
<?php $titlepage="Expenses"; ?>
<?php
require_once("../model/dbconn.php");
require_once("../model/pos.php");
include "../layout/top-header.php"; 
include "../../library/check_login.php";

include "../layout/header.php"; 

//$connector = PhpConsole\Connector::getInstance();
?>

<div class="container-fluid">


    <div class="row">
        <div class="col-md-12 box box-info">
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
                    <h2>
                        Expenses
                    </h2>
                    <p>
                        Please enter your daily expenses in the form below.
                    </p>
                    <p>
                        
                    </p>
                   
                    <form role="form">
                        <div class="form-group">
                            <div class="dropdown">
                              <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                Expense Type
                                <span class="caret"></span>
                              </button>
                              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a href="#">Electricity</a></li>
                                <li><a href="#">Shop Rent</a></li>
                                <li><a href="#">Tax</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Others</a></li>
                              </ul>
                            </div>
                        </div>

                        <div class="form-group">
                             <label for="txtExpenseName">
                                Amount (PKR):
                            </label>
                            <input type="text" class="form-control" id="txtExpenseAmount" placeholder="300"/>
                        </div>
                        <div class="form-group">
                             <label for="txtExpenseComments">
                                Comments / Detail:
                            </label>
                            <input type="text" class="form-control" id="txtExpenseComments" placeholder="Details about this expense."/>
                        </div>
                        <div class="form-group">
                             
                            <label for="txtExpenseDate">
                                Date:
                            </label>
                            <input type="password" class="form-control" id="txtExpenseDate" placeholder="31.01.1990"/>
                        </div>
                        <div class="checkbox">
                             
                            <label>
                                <input type="checkbox" /> is Signed ?
                            </label>
                        </div>
                        <button type="submit" class="btn btn-default">
                            Submit
                        </button>
                    </form>
                </div>
                <div class="col-md-2">
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>
                                    #
                                </th>
                                <th>
                                    Type
                                </th>
                                <th>
                                    Comments
                                </th>
                                <th>
                                    Date
                                </th>
                               
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    1
                                </td>
                                <td>
                                    Electricity
                                </td>
                                <td>
                                    Default
                                </td>
                                <td>
                                    01.04.2012
                                </td>
                            </tr>
                            <tr class="active">
                                <td>
                                    1
                                </td>
                                <td>
                                    Electricity
                                </td>
                                <td>
                                    Default
                                </td>
                                <td>
                                    01.04.2012
                                </td>
                            </tr>
                            <tr class="success">
                                <td>
                                    1
                                </td>
                                <td>
                                    Electricity
                                </td>
                                <td>
                                    Default
                                </td>
                                <td>
                                    01.04.2012
                                </td>
                            </tr>
                            <tr class="warning">
                                <td>
                                    1
                                </td>
                                <td>
                                    Electricity
                                </td>
                                <td>
                                    Default
                                </td>
                                <td>
                                    01.04.2012
                                </td>
                            </tr>
                            <tr class="danger">
                                <td>
                                    1
                                </td>
                                <td>
                                    Electricity
                                </td>
                                <td>
                                    Default
                                </td>
                                <td>
                                    01.04.2012
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-2">
                </div>
            </div>
        </div>
    </div>
</div>