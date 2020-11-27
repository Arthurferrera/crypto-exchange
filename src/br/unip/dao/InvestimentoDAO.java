package br.unip.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.unip.jdbc.ConnectionFactory;
import br.unip.models.Extrato;
import br.unip.models.Investimento;

public class InvestimentoDAO {
	public ArrayList<Investimento> listaInvestimentos(int idUsuario){
		ArrayList<Investimento> lista = new ArrayList<>();
		Investimento investimento = null;
		
		new ConnectionFactory();
		Connection con = ConnectionFactory.getConnection();
		
		String sql = "SELECT i.*, i.id as id_investimento, a.name, a.simbolo, a.valor_atual, i.valor_corrente,"
				+ " FORMAT (i.data_criacao, 'dd/MM/yy') as data_criacao, "
				+ " FORMAT (i.data_atualizacao, 'dd/MM/yy') as data_atualizacao "
				+ " FROM investimentos as i"
				+ " INNER JOIN ativos as a ON a.id = i.ativo_id "
				+ "WHERE i.cliente_id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, idUsuario);
			
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()){
				
				investimento = new Investimento();
				investimento.setNomeAtivo(rs.getString("name"));
				investimento.setCodigoAtivo(rs.getString("simbolo"));
				
				investimento.setId(rs.getInt("id_investimento"));
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
	
	public ArrayList<Extrato> getExtrato(int idUsuario){
		ArrayList<Extrato> lista = new ArrayList<>();
		Extrato extrato = null;
		
		new ConnectionFactory();
		Connection con = ConnectionFactory.getConnection();
		
		String sql = "SELECT e.id, 0 as resgatado, e.valor, "
				+ "FORMAT (e.data_criacao, 'dd/MM/yy') as data_criacao "
				+ "FROM entradas as e "
				+ "WHERE e.cliente_id = ?";
		String sqlResgate = "SELECT r.id, 1 as resgatado, r.valor, "
				+ "FORMAT (r.data_criacao, 'dd/MM/yy') as data_criacao "
				+ "FROM resgates as r "
				+ "WHERE r.cliente_id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			PreparedStatement stmResgate = con.prepareStatement(sqlResgate);
			stm.setInt(1, idUsuario);
			stmResgate.setInt(1, idUsuario);
			
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()){
				extrato = new Extrato();
				extrato.setId(rs.getInt("id"));
				extrato.setValor(rs.getInt("valor"));
				extrato.setResgatado(rs.getInt("resgatado"));
				extrato.setData_criacao(rs.getString("data_criacao"));
				lista.add(extrato);
				
			}
			
			ResultSet rsResgate = stmResgate.executeQuery();
			
			while(rsResgate.next()){
				extrato = new Extrato();
				extrato.setId(rsResgate.getInt("id"));
				extrato.setValor(rsResgate.getInt("valor"));
				extrato.setResgatado(rsResgate.getInt("resgatado"));
				extrato.setData_criacao(rsResgate.getString("data_criacao"));
				lista.add(extrato);
				
			}
			
			rs.close();
			stm.close();
			rsResgate.close();
			stmResgate.close();
			ConnectionFactory.closeConnection();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return lista;
	}
}
