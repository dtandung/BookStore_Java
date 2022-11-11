package dao;

import java.util.ArrayList;

import bean.monhocbean;


public class monhocdao {
	public ArrayList<monhocbean> getmon(){
		ArrayList<monhocbean> ds = new ArrayList<monhocbean>();
		ds.add(new monhocbean("CNTT", "Công Nghệ Thông Tin"));
		ds.add(new monhocbean("BC", "Báo Chí"));
		ds.add(new monhocbean("KT", "Kiến Trúc"));
		return ds;
	}
}
