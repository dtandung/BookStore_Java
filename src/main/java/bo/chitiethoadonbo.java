package bo;

import dao.chitiethoadondao;

public class chitiethoadonbo {
	chitiethoadondao cthddao = new chitiethoadondao();
	public int ThemChiTietHoaDon(String maSach, long soLuongMua, long maHoaDon, boolean daMua) throws Exception{
		return cthddao.ThemChiTietHoaDon(maSach, soLuongMua, maHoaDon, daMua);
	}
}
