package bo;

import java.util.ArrayList;

import bean.lichsumuahangbean;
import dao.lichsumuahangdao;

public class lichsumuahangbo {
	lichsumuahangdao lsd = new lichsumuahangdao();
	public ArrayList<lichsumuahangbean> getlichsumuahang(int makh) throws Exception{
		return lsd.getlichsumuahang(makh);
	}
}
