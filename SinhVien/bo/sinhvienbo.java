package bo;

import java.util.ArrayList;


import bean.sinhvienbean;
import dao.sinhviendao;



public class sinhvienbo {
	sinhviendao  sdao = new sinhviendao();
	ArrayList<sinhvienbean> ds;
	public ArrayList<sinhvienbean> getsinhvien(){
		ds = sdao.getsinhvien();
		return ds;
	}
	 public ArrayList<sinhvienbean> TimMa(String mamon){
		   ArrayList<sinhvienbean> tam= new ArrayList<sinhvienbean>();
		   for(sinhvienbean s: ds)
			   if(s.getMamon().equals(mamon))
				   tam.add(s);
		   return tam;
	   }
	   public ArrayList<sinhvienbean> Tim(String key){
		   ArrayList<sinhvienbean> tam= new ArrayList<sinhvienbean>();
		   for(sinhvienbean s: ds)
			   if(s.getHoten().toLowerCase().contains(
			   key.toLowerCase())||
			   s.getMasinhvien().toLowerCase().contains(
			   key.toLowerCase())||s.getDiachi().toLowerCase().contains(key.toLowerCase()))			   				   
				   tam.add(s);
		   return tam;
	   }
}
