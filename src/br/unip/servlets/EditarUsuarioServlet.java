package br.unip.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.unip.dao.UsuarioDAO;
import br.unip.models.Usuario;

/**
 * Servlet implementation class EditarUsuarioServlet
 */
@WebServlet("/EditarUsuarioServlet")
public class EditarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		String tipo = request.getParameter("modo");
		
		if(tipo.equals("alterarSenha")){
			
			Usuario usuario = new Usuario();
			String senhaAtual = request.getParameter("senha");
			usuario.setSenha(request.getParameter("novaSenha"));
			usuario.setId(Integer.parseInt(request.getParameter("txtId")));
			
			UsuarioDAO usuarioDao = new UsuarioDAO();
			usuarioDao.editarSenha(usuario, senhaAtual);
			
		} else{
			
			Usuario usuario = new Usuario();
		
			usuario.setNome(request.getParameter("nome"));
			usuario.setSobrenome(request.getParameter("sobrenome"));
			usuario.setEmail(request.getParameter("email"));
			usuario.setCidade(request.getParameter("cidade"));
			usuario.setCelular(request.getParameter("celular"));
			usuario.setEstado(request.getParameter("estado"));
			usuario.setDtNasc(request.getParameter("data_nascimento"));
			usuario.setId(Integer.parseInt(request.getParameter("txtId")));
			
			UsuarioDAO usuarioDao = new UsuarioDAO();
			usuarioDao.editar(usuario);
			
			HttpSession sessao = request.getSession();
			
			sessao.removeAttribute("usuario");
			sessao.setAttribute("usuario", usuario);		
		}
		
		response.sendRedirect("Home.jsp");	
	}

}
