<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="utility.Connectionutility"%>
<%@page import="java.sql.Connection"%>
<%@page import="loginservlet.TwoFAServlet"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>HR Panel</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="assets/vendors/jvectormap/jquery-jvectormap.css">
    <link rel="stylesheet" href="assets/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/vendors/owl-carousel-2/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/vendors/owl-carousel-2/owl.theme.default.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="assets/images/favicon.png" />
  </head>
  <body>
 <% 
 Connectionutility.check(request, response);
 
 try {
	 Object Name = session.getAttribute("Username");
	
	Connection con = Connectionutility.getconnection2();
 	Statement stmt = con.createStatement();
 	String strQuery = "select * from loginid where User='"+Name+"'";
 	
 	 ResultSet rs = stmt.executeQuery(strQuery);
 	    if(rs.next()) {
	
%>	
    <div class="container-scroller">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
          <a class="sidebar-brand brand-logo"><img src="assets/images/logo.svg" alt="logo" /></a>
          <a class="sidebar-brand brand-logo-mini"><img src="assets/images/logo-mini.svg" alt="logo" /></a>
        </div>
        <ul class="nav">
          <li class="nav-item profile">
            <div class="profile-desc">
              <div class="profile-pic">
                <div class="count-indicator">
                  <img class="img-xs rounded-circle " src="assets/images/faces/<%=Name%>.jpg" alt="profile">
                  <span class="count bg-success"></span>
                </div>
                <div class="profile-name">
                  <h5 class="mb-0 font-weight-normal"><%=Name%></h5>
                  <span><%=rs.getString(5)%></span>
                </div>
              </div>
              
          <li class="nav-item nav-category">
            <span class="nav-link">Navigation</span>
          </li>
		  
       	  
		  <li class="nav-item menu-items">
            <a class="nav-link" href="../EmployeeAllowance/UserSearch.jsp">
              <span class="menu-icon">
                <i class="mdi mdi-speedometer"></i>
              </span>
              <span class="menu-title">Assign Allowance</span>
            </a>
            </li>
		  
          <li class="nav-item menu-items">
            <a class="nav-link" href="../EmployeeDeduction/UserSearch.jsp">
              <span class="menu-icon">
                <i class="mdi mdi-laptop"></i>
              </span>
              <span class="menu-title">Assign Deduction</span>
            </a>
            </li>
			
			<li class="nav-item menu-items">
            <a class="nav-link" href="../Employee/DataEntryForLetters.jsp">
              <span class="menu-icon">
                <i class="mdi mdi-table-large"></i>
              </span>
              <span class="menu-title">Generate Letters</span>
            </a>
            </li>
			
			<li class="nav-item menu-items">
            <a class="nav-link" href="../Salary_Slip_Generate">
              <span class="menu-icon">
                <i class="mdi mdi-chart-bar"></i>
              </span>
              <span class="menu-title">Generate Salary Slip</span>
            </a>
            </li>
			
			<li class="nav-item menu-items">
            <a class="nav-link" href="../Leaves/SearchPage.jsp">
              <span class="menu-icon">
                <i class="mdi mdi-contacts"></i>
              </span>
              <span class="menu-title">Add Leaves</span>
            </a>
            </li>
			</ul>
      </nav>
          
          
          
          
          
        
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_navbar.html -->
        <nav class="navbar p-0 fixed-top d-flex flex-row">
          <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
            <a class="navbar-brand brand-logo-mini"><img src="assets/images/logo-mini.svg" alt="logo" /></a>
          </div>
          <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
              <span class="mdi mdi-menu"></span>
            </button>
            
            <ul class="navbar-nav navbar-nav-right">
              
              <div></div>                                          
                
              <li class="nav-item dropdown">
                <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
                  <div class="navbar-profile">
                    <img class="img-xs rounded-circle" src="assets/images/faces/<%=Name%>.jpg" alt="">
                    <p class="mb-0 d-none d-sm-block navbar-profile-name"><%=Name%></p>
                    <i class="mdi mdi-menu-down d-none d-sm-block"></i>
                  </div>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="profileDropdown">
                  <h6 class="p-3 mb-0">Profile</h6>
                  <div class="dropdown-divider"></div>
                  
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item preview-item" href="../login/login.jsp">
                    <div class="preview-thumbnail">
                      <div class="preview-icon bg-dark rounded-circle">
                        <i class="mdi mdi-logout text-danger"></i>
                      </div>
                    </div>
                    <div class="preview-item-content">
                      <p class="preview-subject mb-1">Log out</p>
                    </div>
                  </a>
                 </li>
            </ul> 
              
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
              <span class="mdi mdi-format-line-spacing"></span>
            </button>
          </div>
        </nav>
        
	 <%
	 int empcount=0;
	 int logintime=0;
	 int loginsavailabe=0;
   try {
	   
		Connection con1 = Connectionutility.getconnection2();
	 	Statement stmt1 = con1.createStatement();
	 	Statement stmt2 = con1.createStatement();
	 	Statement stmt3 = con1.createStatement();
	 	
	 	String StrQuery1 = "select count(*) from loginid";
	 	String StrQuery2 = "select * from otplogin";
	 	String StrQuery3 = "select count(*) from employee";
	 	
	 	 ResultSet rs1 = stmt1.executeQuery(StrQuery3);
	 	    if(rs1.next()) {
	 	    	empcount=rs1.getInt(1);
	 	    }
	 	    	
	 	   ResultSet rs2 = stmt2.executeQuery(StrQuery2);
	 	   if(rs2.next())
	 	   {
	 		  logintime=rs2.getInt(1);
	 	   }
	 	   
	 	  ResultSet rs3 = stmt3.executeQuery(StrQuery1);
	 	   if(rs3.next())
	 	   {
	 		  loginsavailabe=rs3.getInt(1);
	 	   }
	 	    
   
   %> 	
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
  
            
         
            <div class="row">
              <div class="col-sm-4 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h5>Total No Of Employee</h5>
                    <div class="row">
                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                          <h2 class="mb-0"><%=empcount%></h2>
						  
                        </div>
                        <h6 class="text-muted font-weight-normal"> Till Now</h6>
                      </div>
                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-codepen text-primary ml-auto"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-4 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h5>Times Of Logins</h5>
                    <div class="row">
                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                          <h2 class="mb-0"><%=logintime %></h2>
                          
                        </div>
                        <h6 class="text-muted font-weight-normal"> Till Now</h6>
                      </div>
                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-wallet-travel text-danger ml-auto"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-4 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h5>Total Logins Available</h5>
                    <div class="row">
                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
                        <div class="d-flex d-sm-block d-md-flex align-items-center">
                          <h2 class="mb-0"><%=loginsavailabe %></h2>
                          
                        </div>
                        <h6 class="text-muted font-weight-normal"> Till Now</h6>
                      </div>
                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
                        <i class="icon-lg mdi mdi-monitor text-success ml-auto"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row ">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Team Members</h4>
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                            
                            <th> Name </th>
                            <th> Class </th>
                            <th> PRN Number </th>
                            <th> Roll No </th>
                            <th> Mobile No </th>
                            <th> Performance Status </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>
                              <img src="assets/images/faces/Madhav Lonkar.jpg" alt="image" />
                              <span class="pl-2">Madhav Lonkar</span>
                            </td>
                            <td> TE-C </td>
                            <td> 72150463K </td>
                            <td> COTC41 </td>
                            <td> 9370548600 </td>
                            <td>
                              <div class="badge badge-outline-success">Good</div>
                            </td>
                          </tr>
						  
						  <tr>
                            <td>
                              <img src="assets/images/faces/Gururaj Yadav.jpg" alt="image" />
                              <span class="pl-2">Gururaj Yadav</span>
                            </td>
                            <td> TE-C </td>
                            <td> 72150463K </td>
                            <td> COTC41 </td>
                            <td> 9370548600 </td>
                            <td>
                              <div class="badge badge-outline-success">Good</div>
                            </td>
                          </tr>
						  
						  <tr>
                            <td>
                              <img src="assets/images/faces/Nandkumar Chavan.jpg" alt="image" />
                              <span class="pl-2">Nandkumar Chavan</span>
                            </td>
                            <td> TE-C </td>
                            <td> 72150463K </td>
                            <td> COTC41 </td>
                            <td> 9370548600 </td>
                            <td>
                              <div class="badge badge-outline-success">Good</div>
                            </td>
                          </tr>
						  
                          
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
         
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block"></span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Payroll Management System</span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/chart.js/Chart.min.js"></script>
    <script src="assets/vendors/progressbar.js/progressbar.min.js"></script>
    <script src="assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
    <script src="assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <script src="assets/js/settings.js"></script>
    <script src="assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="assets/js/dashboard.js"></script>
    <%  	    	
	    
	    
 } catch(Exception e) {
	 e.printStackTrace();
 }
	    	
%>   
    <!-- End custom js for this page -->
<%  	    	
	    } 
	    
 } catch(Exception e) {
	 e.printStackTrace();
 }
	    	
%>
  </body>
</html>