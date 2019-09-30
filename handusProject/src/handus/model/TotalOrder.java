package handus.model;

import java.util.Date;

public class TotalOrder {
	private int to_pk ;
	private String to_num;
	private int to_m_pk;
	private int to_p_pk;
	private int to_type;
	private Date to_pay_date;
	private int to_price;
	private String to_pay_method;
	private String to_order_name;
	private String to_tid;
	private Date to_approved_date;
	private int to_count;
	public int getTo_pk() {
		return to_pk;
	}
	public void setTo_pk(int to_pk) {
		this.to_pk = to_pk;
	}
	public String getTo_num() {
		return to_num;
	}
	public void setTo_num(String to_num) {
		this.to_num = to_num;
	}
	public int getTo_m_pk() {
		return to_m_pk;
	}
	public void setTo_m_pk(int to_m_pk) {
		this.to_m_pk = to_m_pk;
	}
	public int getTo_p_pk() {
		return to_p_pk;
	}
	public void setTo_p_pk(int to_p_pk) {
		this.to_p_pk = to_p_pk;
	}
	public int getTo_type() {
		return to_type;
	}
	public void setTo_type(int to_type) {
		this.to_type = to_type;
	}
	public Date getTo_pay_date() {
		return to_pay_date;
	}
	public void setTo_pay_date(Date to_pay_date) {
		this.to_pay_date = to_pay_date;
	}
	public int getTo_price() {
		return to_price;
	}
	public void setTo_price(int to_price) {
		this.to_price = to_price;
	}
	public String getTo_pay_method() {
		return to_pay_method;
	}
	public void setTo_pay_method(String to_pay_method) {
		this.to_pay_method = to_pay_method;
	}
	public String getTo_order_name() {
		return to_order_name;
	}
	public void setTo_order_name(String to_order_name) {
		this.to_order_name = to_order_name;
	}
	public String getTo_tid() {
		return to_tid;
	}
	public void setTo_tid(String to_tid) {
		this.to_tid = to_tid;
	}
	public Date getTo_approved_date() {
		return to_approved_date;
	}
	public void setTo_approved_date(Date to_approved_date) {
		this.to_approved_date = to_approved_date;
	}
	public int getTo_count() {
		return to_count;
	}
	public void setTo_count(int to_count) {
		this.to_count = to_count;
	}
	@Override
	public String toString() {
		return "TotalOrder [to_pk=" + to_pk + ", to_num=" + to_num + ", to_m_pk=" + to_m_pk + ", to_p_pk=" + to_p_pk
				+ ", to_type=" + to_type + ", to_pay_date=" + to_pay_date + ", to_price=" + to_price
				+ ", to_pay_method=" + to_pay_method + ", to_order_name=" + to_order_name + ", to_tid=" + to_tid
				+ ", to_approved_date=" + to_approved_date + ", to_count=" + to_count + ", getTo_pk()=" + getTo_pk()
				+ ", getTo_num()=" + getTo_num() + ", getTo_m_pk()=" + getTo_m_pk() + ", getTo_p_pk()=" + getTo_p_pk()
				+ ", getTo_type()=" + getTo_type() + ", getTo_pay_date()=" + getTo_pay_date() + ", getTo_price()="
				+ getTo_price() + ", getTo_pay_method()=" + getTo_pay_method() + ", getTo_order_name()="
				+ getTo_order_name() + ", getTo_tid()=" + getTo_tid() + ", getTo_approved_date()="
				+ getTo_approved_date() + ", getTo_count()=" + getTo_count() + "]";
	}
	
}
