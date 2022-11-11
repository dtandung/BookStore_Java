package dao;

import java.sql.PreparedStatement;
import java.util.Date;

public class chitiethoadondao {
	public int ThemChiTietHoaDon(String maSach, long soLuongMua, long maHoaDon, boolean daMua) throws Exception {
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		
		String sql = "insert into ChiTietHoaDon values(?,?,?,?) ";
		 PreparedStatement cmd = kn.cn.prepareStatement(sql);
		 cmd.setString(1, maSach);
		 cmd.setLong(2, soLuongMua);
		 cmd.setLong(3, maHoaDon);
		 cmd.setBoolean(4, daMua);
     return cmd.executeUpdate();
	}
}
