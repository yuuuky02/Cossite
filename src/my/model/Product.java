package my.model;

import java.util.Date;

public class Product {
	private int pid;
	private String pname;
	private int price;
	private String pgender;
	private String pcategory;
	private String psort;
	private String pimage;
	private Date pdate;
	private int pcount;
	
	public Product() {}

	public Product(int pid, String pname, int price, String pgender, String pcategory, String psort, String pimage,
			Date pdate) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.price = price;
		this.pgender = pgender;
		this.pcategory = pcategory;
		this.psort = psort;
		this.pimage = pimage;
		this.pdate = pdate;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPgender() {
		return pgender;
	}

	public void setPgender(String pgender) {
		this.pgender = pgender;
	}

	public String getPcategory() {
		return pcategory;
	}

	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}

	public String getPsort() {
		return psort;
	}

	public void setPsort(String psort) {
		this.psort = psort;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public int getPcount() {
		return pcount;
	}

	public void setPcount(int pcount) {
		this.pcount = pcount;
	}	
	

}
