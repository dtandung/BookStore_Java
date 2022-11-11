package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.lichsumuahangbean;

public class lichsumuahangdao {
	public ArrayList<lichsumuahangbean> getlichsumuahang(int makh) throws Exception{
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		
		ArrayList<lichsumuahangbean> ds = new ArrayList<lichsumuahangbean>();
		
		String sql = "select * from V_LSMH where makh=?\r\n"
				+ "order by MaHoaDon desc";
		
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setLong(1, makh);
		ResultSet rs = cmd.executeQuery();
		lichsumuahangbean lsb = null;
		while(rs.next()) {
			String ts = rs.getString("tensach");
			int slm = rs.getInt("SoLuongMua");
			Date ngaymua = rs.getDate("NgayMua");
			java.util.Date nm =new java.sql.Date((ngaymua).getTime());
			long gia = rs.getLong("gia");
			boolean dm = rs.getBoolean("DaMua");
			long mkh = rs.getLong("makh");
			long tt = rs.getLong("ThanhTien");
			
		lsb = new lichsumuahangbean(ts, slm, nm, gia, dm, makh, tt);
		ds.add(lsb);
		}
		rs.close();
		return ds;
	}
}
