package br.unip.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import br.unip.jdbc.ConnectionFactory;
import br.unip.models.DashboardInvestimentos;
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

	public DashboardInvestimentos pegarValoresInvestimento(int id) {
		DashboardInvestimentos dados = new DashboardInvestimentos();
		Double caixa = 0.00;
		Double investido = 0.00;
		
		String dataSQL = Calendar.getInstance().get(Calendar.MONTH)+"/"+Calendar.getInstance().get(Calendar.YEAR);

		String sqlEntradas = "SELECT sum(valor) as somaEntradas FROM entradas " 
				+ "WHERE cliente_id = ? AND FORMAT(data_criacao, 'MM/yyyy') = ?";
		
		String sqlInvestido = "SELECT sum(valor_corrente) as somaInvestimento FROM investimentos " 
				+ "WHERE cliente_id = ? AND FORMAT(data_criacao, 'MM/yyyy') = ?";
		
		String sqlSaldo = "SELECT saldo FROM clientes " 
				+ "WHERE id = ? AND ativo = 1";
		
		new ConnectionFactory();
		Connection con = ConnectionFactory.getConnection();
//		PreparedStatement stm;
		try (
			PreparedStatement stm = con.prepareStatement(sqlEntradas);
			PreparedStatement stmInvestido = con.prepareStatement(sqlInvestido);
			PreparedStatement stmSaldo = con.prepareStatement(sqlSaldo);
		) {
			// Pegando valores que foram aportados 
			stm.setInt(1, id);
			stm.setString(2, dataSQL);
            try (ResultSet rs = stm.executeQuery()) {
            	while (rs.next()) {
            		if (rs.getString("somaEntradas") == null) {
            			dados.setAportesMes("R$ 0,00");
            		} else {
            			dados.setAportesMes(rs.getString("somaEntradas"));
            		}
            	}
            }
			
			// Pegando valores que estão investidos
            stmInvestido.setInt(1, id);
			stmInvestido.setString(2, dataSQL);
            try (ResultSet rs = stmInvestido.executeQuery()) {
            	while (rs.next()) {
            		System.out.println(rs.getString("somaInvestimento"));
    				if (rs.getString("somaInvestimento") == null) {
    					dados.setInvestido("R$ 0,00");
    				} else {
    					investido =  Double.parseDouble(rs.getString("somaInvestimento"));
    					dados.setInvestido(rs.getString("somaInvestimento"));
    				}
    			}
            }
            
			// Pegando valores que disponiveis no caixa(saldo)
            stmSaldo.setInt(1, id);
            try (ResultSet rs = stmSaldo.executeQuery()) {
            	while (rs.next()) {
            		System.out.println(rs.getString("saldo"));
    				if (rs.getString("saldo") == null) {
    					dados.setCaixa("R$ 0,00");
    				} else {
    					caixa =  Double.parseDouble(rs.getString("saldo"));
    					dados.setCaixa(rs.getString("saldo"));
    				}
    			}
            }
//			ResultSet rs = stm.executeQuery();

			
			//stm.close();
			//rs.close();
			
//			PreparedStatement stmInvestido;
//			stmInvestido = con.prepareStatement(sqlInvestido);
//			stmInvestido.setInt(1, id);
//			stmInvestido.setString(2, dataSQL);
////			
//			ResultSet rsInvestido = stmInvestido.executeQuery();
////
//			while (rsInvestido.next()) {
//				System.out.println(rsInvestido.getString("somaInvestimento"));
//				if (rsInvestido.getString("somaInvestimento") == null) {
//					dados.setInvestido("0,00");
//				} else {
//					dados.setInvestido(rsInvestido.getString("somaInvestimento"));
//				}
//			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		Double soma = caixa + investido;
		dados.setTotal(soma.toString());
		return dados;
		
		
	}
}
