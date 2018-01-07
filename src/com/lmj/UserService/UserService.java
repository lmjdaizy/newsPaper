package com.lmj.UserService;

import java.sql.SQLException;
import java.util.List;

import com.lmj.dao.UserDao;
import com.lmj.domain.Book;
import com.lmj.domain.Page;
import com.lmj.domain.Take;
import com.lmj.domain.User;

public class UserService {

	UserDao ud=new UserDao();
	public boolean checkLogin(User user) throws SQLException {
		// TODO Auto-generated method stub
		return ud.checkLogin(user);
	}
	public int count() throws SQLException {
		// TODO Auto-generated method stub
		return ud.count();
	}
	public List AllBook(Page page) throws SQLException {
		// TODO Auto-generated method stub
		return ud.AllBook(page);
	}
	public List<Book> findBook(String num, String name, String depart,
			String prize) throws SQLException {
		// TODO Auto-generated method stub
		return ud.findBook(num,name,depart,prize);
	}
	public List AddPeo(String uno, String num) throws SQLException {
		// TODO Auto-generated method stub
		return ud.AddPeo(uno,num);
	}
	public void addNews(Book book) throws SQLException {
		// TODO Auto-generated method stub
		ud.addNews(book);
	}
	public List FindPeo(String uno, String num, String depart) throws SQLException {
		// TODO Auto-generated method stub
		return ud.FindPeo(uno,num,depart);
	}
	public List Total(String total, String txt) throws SQLException {
		// TODO Auto-generated method stub
		return ud.Total(total,txt);
	}
	public List DelAdd(String uno, String num) throws SQLException {
		// TODO Auto-generated method stub
		return ud.DelAdd(uno,num);
	}
	public void DelAddPeo(String num) throws SQLException {
		// TODO Auto-generated method stub
		ud.DelAddPeo(num);
	}

}
