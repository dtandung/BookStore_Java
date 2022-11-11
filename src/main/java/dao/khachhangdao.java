package dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.khachhangbean;

public class khachhangdao {
	
	public khachhangbean ktdn(String tendn, String pass) throws Exception{
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		

	       String sql="select * from KhachHang where tendn=? and pass= ? " ;
	   
	        PreparedStatement cmd = kn.cn.prepareStatement(sql);
	            cmd.setString(1, tendn);
	            cmd.setString(2, pass);
	        ResultSet rs = cmd.executeQuery();
	       //truyen tham so vao cau lenh
	       khachhangbean khb = null;
	       if(rs.next()){
	        Integer MaKH = rs.getInt("MaKH");
	        String HoTen = rs.getString("HoTen");
	        String DiaChi = rs.getString("DiaChi");
	        String Sdt = rs.getString("sodt");
	        String Email = rs.getString("Email");
	        String TenDn = rs.getString("tendn");
	        String Pass = rs.getString("pass");
	       // String MD5 = getMd5Hash(pass);
	     
	         khb = new khachhangbean(MaKH, HoTen, DiaChi, Sdt, Email, TenDn, pass);
	       }       
	//thuc hien
	        rs.close();
	        kn.cn.close();
	       return khb;
	}
	
	public int ktdk(String hoten, String diachi, String sdt, String email, String tendn, String pass) throws Exception{
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		
		String MD5 = getMd5Hash(pass);
		
		String kt ="select * from KhachHang where tendn=?";
		PreparedStatement ktradki = kn.cn.prepareStatement(kt);
		ktradki.setString(1,tendn);
		ResultSet rs =ktradki.executeQuery();
		String sql = "insert into KhachHang values (?,?,?,?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1,hoten);
		cmd.setString(2,diachi);
		cmd.setString(3,sdt);
		cmd.setString(4,email);
		cmd.setString(5,tendn);
		cmd.setString(6,MD5);
		
		if(cmd.executeUpdate() == 1)
		{
			return 1;
		}else {
			return 0;
		}
	}
		
	public static String getMd5Hash(String input) {
	    try {
	      MessageDigest md = MessageDigest.getInstance("MD5");
	      byte[] messageDigest = md.digest(input.getBytes());
	      BigInteger no = new BigInteger(1, messageDigest);
	      String hashtext = no.toString(16);
	      while (hashtext.length() < 32) {
	        hashtext = "0" + hashtext;
	      }
	      return hashtext;
	    } catch (NoSuchAlgorithmException e) {
	      throw new RuntimeException(e);
	    }
	  }
}
