package my.model;

import java.util.Date;

public class Payment {
	private int payId;
	private String memberId;
	private String cardCompany;
	private String cardNumber;
	private String cardPassword;
	private Date valideDate;
	private int totalPrice;
	private Date payDate;
	
	public Payment() {}

	public Payment(String memberId, String cardCompany, String cardNumber, String cardPassword, Date valideDate,
			int totalPrice, Date payDate) {
		super();
		this.memberId = memberId;
		this.cardCompany = cardCompany;
		this.cardNumber = cardNumber;
		this.cardPassword = cardPassword;
		this.valideDate = valideDate;
		this.totalPrice = totalPrice;
		this.payDate = payDate;
	}

	
	
	public int getPayId() {
		return payId;
	}

	public void setPayId(int payId) {
		this.payId = payId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getCardCompany() {
		return cardCompany;
	}

	public void setCardCompany(String cardCompany) {
		this.cardCompany = cardCompany;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getCardPassword() {
		return cardPassword;
	}

	public void setCardPassword(String cardPassword) {
		this.cardPassword = cardPassword;
	}

	public Date getValideDate() {
		return valideDate;
	}

	public void setValideDate(Date valideDate) {
		this.valideDate = valideDate;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	
	

}
