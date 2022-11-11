package dao;

import java.util.ArrayList;

import bean.sinhvienbean;



public class sinhviendao {
	public ArrayList<sinhvienbean> getsinhvien(){
		ArrayList<sinhvienbean> ds = new ArrayList<sinhvienbean>();
		ds.add(new sinhvienbean("19T1021044","Tấn Dũng", "Quảng Trị","dtdung2411@gmail.com", "..\\zunx.jpg", "CNTT"));
		ds.add(new sinhvienbean("19T1021044","Quỳnh Trang", "Quảng Bình","dtdung2411@gmail.com", "..\\1.jpg", "BC"));
		ds.add(new sinhvienbean("19T1021044","Gia Bảo", "Huế","dtdung2411@gmail.com", "..\\1.jpg", "CNTT"));
		ds.add(new sinhvienbean("19T1021044","Lê Cường", "Quảng Trị","dtdung2411@gmail.com", "..\\1.jpg", "KT"));
		ds.add(new sinhvienbean("19T1021044","Phú Quốc", "Đắk Knông","dtdung2411@gmail.com", "..\\1.jpg", "CNTT"));
		ds.add(new sinhvienbean("19T1021044","Nguyễn A", "Quảng Trị","dtdung2411@gmail.com", "..\\1.jpg", "BC"));
		return ds;
	}
}
