package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import bean.hoadonbean;

public class hoadondao {
	public int ThemHoaDon(long makh, Date NgayMua, boolean damua) throws Exception {
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			int lastInsertId = 0;
			String sql = "insert into hoadon values(?,?,?) ";
			 PreparedStatement cmd = kn.cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			 cmd.setLong(1, makh);
			 cmd.setDate(2, new java.sql.Date((NgayMua).getTime()));
			 cmd.setBoolean(3, damua);
			 cmd.executeUpdate();
			 
			 ResultSet rs = cmd.getGeneratedKeys();
			 if (rs.next()) {
			     lastInsertId = rs.getInt(1);
			 }
			 
			 return lastInsertId;
	}
}
