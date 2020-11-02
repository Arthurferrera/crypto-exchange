package br.unip.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.senai.sp.jdbc.ConexaoMySql;
import br.unip.jdbc.ConnectionFactory;
import br.unip.models.Usuario;


public class UsuarioDAO {

	public Usuario autenticar(String email, String senha) {
		Usuario u = null;
		String sql = "SELECT * FROM clientes " 
				+ "WHERE email = ? AND senha = ? AND ativo = 1";

		try {
			new ConnectionFactory();
			Connection con = ConnectionFactory.getConnection();
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, email);
			stm.setString(2, senha);
 
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				u = new Usuario();
				u.setId(rs.getInt("id"));
				u.setNome(rs.getString("nome"));
				u.setSobrenome(rs.getString("sobrenome"));
				u.setDtNasc(rs.getString("data_nascimento"));
				u.setEmail(rs.getString("email"));
				u.setCidade(rs.getString("cidade"));
				u.setCelular(rs.getString("celular"));
				u.setEstado(rs.getString("estado"));
				u.setAtivo(true);
				u.setSenha("");
			}

			rs.close();
			stm.close();
			ConnectionFactory.closeConnection();			

		} catch (SQLException e) {
			System.out.println("estourou no select");
			throw new RuntimeException(e);
		}
		return u;
	}
	
	public void editar(Usuario usuario){
		new ConnectionFactory();
		Connection con = ConnectionFactory.getConnection();
		
		String sql = "UPDATE clientes set "
				+ "nome = ?, email = ?, cidade = ?, celular = ?, "
				+ "estado = ?, data_nascimento = ?, sobrenome = ? where id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, usuario.getNome());
			stm.setString(2, usuario.getEmail());
			stm.setString(3, usuario.getCidade());
			stm.setString(4, usuario.getCelular());
			stm.setString(5, usuario.getEstado());
			stm.setString(6, usuario.getDtNasc());
			stm.setString(7, usuario.getSobrenome());
			stm.setInt(8, usuario.getId());
			stm.execute();
			
			ConnectionFactory.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void editarSenha(Usuario usuario, String senhaAtual){
		Connection con = ConnectionFactory.getConnection();
		
		String sql = "UPDATE clientes set "
				+ "senha = ? where id = ? and senha = ?";
		
		try {	
			
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, usuario.getSenha());
			stm.setInt(2, usuario.getId());
			stm.setString(3, senhaAtual);
			
//			TODO: VALIDAR A SENHA ATUAL PARA ALTERAR, RETORNAR MENSAGEM PARA O USUARIO CASO ESTEJA ERRADA
			stm.execute();
			ConnectionFactory.closeConnection();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
