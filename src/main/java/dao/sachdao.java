package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;
import bean.sachbean;

public class sachdao {
	public ArrayList<sachbean> getsach(){
		ArrayList<sachbean> ds = new ArrayList<sachbean>();
		try {
			//b1: ket noi vao csdl
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			//b2: lay du lieu ve
			String sql = "select * from sach";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			//b3: luu all du lieu vao mang ds
			while(rs.next()) {
				String masach = rs.getString("masach");
				String tensach= rs.getString("tensach");
				String tacgia = rs.getString("tacgia");
				int soluong = rs.getInt("soluong"); 
				int gia= rs.getInt("gia");
				String anh = rs.getString("anh"); 
				String maloai = rs.getString("maloai");
				ds.add(new sachbean(masach, tensach,tacgia,soluong,gia,anh,maloai));
			}
			//b4: dong ket noi
			rs.close();
			kn.cn.close();
			return ds;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
}	
