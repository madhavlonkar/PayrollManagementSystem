package loginservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmpDeductionDAO;
import dto.EmpDeductionDTO;
import utility.Connectionutility;

/**
 * Servlet implementation class EmployeeAllowanceServlet
 */
public class EditEmployeeDeduction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEmployeeDeduction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
		
			
			String StrEmpid=request.getParameter("empid");
			String StrDeduction=request.getParameter("Deductionname");
			String StrDeductionAMT=request.getParameter("Deductionamt");
			int dedid=0;
			
			Connection con=null;
			ResultSet rs=null;
	        String StrQuery="select * from deduction where Ded_Name='"+StrDeduction+"'";
			
			try
	        {
	  	 		
	        	con=Connectionutility.getconnection2();
				Statement stmt=con.createStatement();
				rs=stmt.executeQuery(StrQuery);
				while(rs.next())
				{
				dedid=rs.getInt(1);
				}
	        }
			catch(Exception e)
			{
				e.printStackTrace();
			}
	   	 
			EmpDeductionDTO adto=new EmpDeductionDTO();
	  	 	adto.setEmpid(Integer.parseInt(StrEmpid));
	  	 	adto.setDeductionid(dedid);
	  	 	adto.setDeductionname(StrDeduction);
	  	 	adto.setDeductionamt(Integer.parseInt(StrDeductionAMT));
	        
	  	 	
	  	 	try {
	     	 EmpDeductionDAO dao = new EmpDeductionDAO ();
	     	 
	     	   int result = dao.update(adto);

	     	   if(result == 1) {
					
	     		   response.sendRedirect("../payrolll2.0/EmployeeDeduction/EmpDeductionMaintainance.jsp?empid="+StrEmpid);
				   } else {
					   
					   out.print("Error Contact Admin");
//					   response.sendRedirect("../payrolll2.0/ErrorPage/SuccessPage.jsp");
				    }
	        }
	        
	        catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("../payrolll2.0/ErrorPage/SuccessPage.jsp");
	        }
		    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
