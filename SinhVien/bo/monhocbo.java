package bo;

import java.util.ArrayList;

import bean.monhocbean;
import dao.monhocdao;



public class monhocbo {
	monhocdao  mdao = new monhocdao();
	ArrayList<monhocbean> ds;
	public ArrayList<monhocbean> getmon(){
		ds = mdao.getmon();
		return ds;
	}
}
