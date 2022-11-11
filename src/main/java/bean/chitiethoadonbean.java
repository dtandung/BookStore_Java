package bean;

public class chitiethoadonbean {
	private long MaSach;
	private int SoLuongMua;
	private long MaHoaDon;
	private boolean DaMua;
	public chitiethoadonbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public chitiethoadonbean(long maSach, int soLuongMua, long maHoaDon, boolean daMua) {
		super();
		MaSach = maSach;
		SoLuongMua = soLuongMua;
		MaHoaDon = maHoaDon;
		DaMua = daMua;
	}
	public long getMaSach() {
		return MaSach;
	}
	public void setMaSach(long maSach) {
		MaSach = maSach;
	}
	public int getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(int soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public long getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(long maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public boolean isDaMua() {
		return DaMua;
	}
	public void setDaMua(boolean daMua) {
		DaMua = daMua;
	}
	
}
