package bo;

import java.util.Date;

import dao.hoadondao;

public class hoadonbo {
	hoadondao hddao = new hoadondao();
	public int ThemHoadon(long makh, Date NgayMua, boolean damua) throws Exception{
		return  hddao.ThemHoaDon(makh, NgayMua, damua);
	}
}
