package br.unip.models;

import java.time.LocalDateTime;

public class Investimento {
	
	private int id;
	private String nomeAtivo;
	private String codigoAtivo;
	private int cliente_id;
	private int ativo_id;
	private int quantidade;
	private int valor_corrente;
	private int resgatado;
	private String data_criacao;
	private String data_atualizacao;
	
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
	
	public int getCliente_id() {
		return cliente_id;
	}
	public void setCliente_id(int cliente_id) {
		this.cliente_id = cliente_id;
	}
	public int getAtivo_id() {
		return ativo_id;
	}
	public void setAtivo_id(int ativo_id) {
		this.ativo_id = ativo_id;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public int getValor_corrente() {
		return valor_corrente;
	}
	public void setValor_corrente(int valor_corrente) {
		this.valor_corrente = valor_corrente;
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
	public String getData_atualizacao() {
		return data_atualizacao;
	}
	public void setData_atualizacao(String data_atualizacao) {
		this.data_atualizacao = data_atualizacao;
	}
}
