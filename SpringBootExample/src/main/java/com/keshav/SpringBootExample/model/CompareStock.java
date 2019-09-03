package com.keshav.SpringBootExample.model;

public class CompareStock {
private String  stock1;
private String stock2;
public CompareStock(String stock1, String stock2) {
	super();
	this.stock1 = stock1;
	this.stock2 = stock2;
}
public String getStock1() {
	return stock1;
}
public void setStock1(String stock1) {
	this.stock1 = stock1;
}
public String getStock2() {
	return stock2;
}
public void setStock2(String stock2) {
	this.stock2 = stock2;
}
public CompareStock() {
	super();
	// TODO Auto-generated constructor stub
}

}
