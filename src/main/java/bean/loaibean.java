package bean;

public class loaibean {
	
	private String maloai;
	private String tenloai;
	//phat sinh 2 ham tao: lo tham so va dau du tham so
	public loaibean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public loaibean(String maloai, String tenloai) {
		super();
		this.maloai = maloai;
		this.tenloai = tenloai;
	}
	
	//phat sinh cac ham get, set
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public String getTenloai() {
		return tenloai;
	}
	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}
}
