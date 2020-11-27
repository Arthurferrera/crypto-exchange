package br.unip.models;

public class Extrato {

	private int id;
	private String nomeAtivo;
	private String codigoAtivo;
	private int valor;
	private int resgatado;
	private String data_criacao;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNomeAtivo() {
		return nomeAtivo;
	}
	public void setNomeAtivo(String nomeAtivo) {
		this.nomeAtivo = nomeAtivo;
	}
	public String getCodigoAtivo() {
		return codigoAtivo;
	}
	public void setCodigoAtivo(String codigoAtivo) {
		this.codigoAtivo = codigoAtivo;
	}
	public int getValor() {
		return valor;
	}
	public void setValor(int valor) {
		this.valor = valor;
	}
	public int getResgatado() {
		return resgatado;
	}
	public void setResgatado(int resgatado) {
		this.resgatado = resgatado;
	}
	public String getData_criacao() {
		return data_criacao;
	}
	public void setData_criacao(String data_criacao) {
		this.data_criacao = data_criacao;
	}
	
	
	
}
