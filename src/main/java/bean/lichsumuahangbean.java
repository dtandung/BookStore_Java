package bean;

import java.util.Date;

public class lichsumuahangbean {
	private String tensach;
	private int SoLuongMua;
	private Date NgayMua;
	private long gia;
	private boolean DaMua;
	private long makh;
	private long ThanhTien;
	public lichsumuahangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public lichsumuahangbean(String tensach, int soLuongMua, Date ngayMua, long gia, boolean daMua, long makh,
			long thanhTien) {
		super();
		this.tensach = tensach;
		SoLuongMua = soLuongMua;
		NgayMua = ngayMua;
		this.gia = gia;
		DaMua = daMua;
		this.makh = makh;
		ThanhTien = thanhTien;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public int getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(int soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public boolean isDaMua() {
		return DaMua;
	}
	public void setDaMua(boolean daMua) {
		DaMua = daMua;
	}
	public long getMakh() {
		return makh;
	}
	public void setMakh(long makh) {
		this.makh = makh;
	}
	public long getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(long thanhTien) {
		ThanhTien = thanhTien;
	}
	
}
