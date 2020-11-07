package br.unip.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.unip.jdbc.ConnectionFactory;
import br.unip.models.Investimento;

public class InvestimentoDAO {
	public ArrayList<Investimento> listaInvestimentos(int idUsuario){		
		ArrayList<Investimento> lista = new ArrayList<>();
		Investimento investimento = null;
		
		new ConnectionFactory();
		Connection con = ConnectionFactory.getConnection();
		
		String sql = "SELECT *, FORMAT (data_criacao, 'dd/MM/yy') as data_criacao, FORMAT (data_atualizacao, 'dd/MM/yy') as data_atualizacao FROM investimentos "
				+ "WHERE cliente_id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, idUsuario);
			
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()){
				
				investimento = new Investimento();
				
				investimento.setId(rs.getInt("id"));
				investimento.setCliente_id(rs.getInt("cliente_id"));
				investimento.setAtivo_id(rs.getInt("ativo_id"));
				investimento.setQuantidade(rs.getInt("quantidade"));
				investimento.setValor_corrente(rs.getInt("valor_corrente"));
				investimento.setResgatado(rs.getInt("resgatado"));
				investimento.setData_criacao(rs.getString("data_criacao"));
				investimento.setData_atualizacao(rs.getString("data_atualizacao"));
				lista.add(investimento);
				
			}
			
			rs.close();
			stm.close();
			ConnectionFactory.closeConnection();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return lista;
	}
}
