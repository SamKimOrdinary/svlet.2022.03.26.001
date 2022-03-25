package svc;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.dao.MemberDao;
import jdbc.dto.MemberDto;

/**
 * Servlet implementation class JdbcSvlet
 */
public class JdbcSvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JdbcSvlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); //요청 관련 인코딩 처리
		response.setContentType("text/html;charset=utf-8"); //응답 관련 인코딩 처리
		
		String name = request.getParameter("name");
		String height = request.getParameter("height");
		String weight = request.getParameter("weight");
		String age    = request.getParameter("age");
		String sex    = request.getParameter("sex");
		
		// DAO 객체 생성
		MemberDao memberDao = new MemberDao();

		// Get Connection
		memberDao.getConnection();

		// Insert Data
		int nHeight = Integer.parseInt(height);
		int nWeight = Integer.parseInt(weight);
		int nAge = Integer.parseInt(age);
		
		int nRet = memberDao.setData(name, nHeight, nWeight, nAge, sex);
		System.out.println(nRet + "건의 Transaction이 발생했습니다.");
				
		// Close Connection
		memberDao.closeConnection();
		
		response.getWriter().print("<a href='3.daoEx2.jsp'>전체조회</a>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
