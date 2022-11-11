package bo;

import java.util.ArrayList;

import bean.khachhangbean;
import dao.khachhangdao;

public class khachhangbo {
	khachhangdao khdao = new khachhangdao();
	public khachhangbean ktdn(String tendn, String pass) throws Exception{
		return khdao.ktdn(tendn, pass);
	}
	public int ktdk(String hoten, String diachi, String sdt, String email, String tendn, String pass) throws Exception{
		return khdao.ktdk(hoten, diachi, sdt, email, tendn, pass);
	}
}
