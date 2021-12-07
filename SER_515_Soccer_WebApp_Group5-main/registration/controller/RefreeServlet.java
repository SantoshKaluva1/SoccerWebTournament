package com.referee.registration.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.referee.registration.model.Referee;

/**
 * Servlet implementation class RefreeServlet
 */ 											
@WebServlet("/register")
public class RefreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private Referee referee = new Referee();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefreeServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zip = request.getParameter("zip");
		String email = request.getParameter("email");
		String phone = request.getParameter("mobile");
		String grade = request.getParameter("grade");
		
		HttpSession session = request.getSession();
		session.setAttribute("firstName", firstName);
		session.setAttribute("lastName", lastName);

		
		RequestDispatcher req = request.getRequestDispatcher("/WEB-INF/views/refereeRegister.jsp");
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
		req.forward(request, response);
		
		
	}

}
