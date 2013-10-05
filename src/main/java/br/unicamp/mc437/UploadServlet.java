package br.unicamp.mc437;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xml.internal.serialize.Printer;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/uploadArquivo"})
public class UploadServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet()
    {
        super();
    }

    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		final String filePath = request.getParameter("filePath");
		System.out.println("file path: "+filePath);
		// TODO Auto-generated method stub
	}
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();
		out.println("<html><body>Texto aqui</body></html>");
	}
	
}
