package com.lmj.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;



import com.lmj.domain.Book;
import com.lmj.domain.Page;
import com.lmj.domain.Take;
import com.lmj.domain.User;
import com.lmj.util.C3P0Util;

public class UserDao {

	public boolean checkLogin(User user) throws SQLException {
		// TODO Auto-generated method stub
		boolean flag=false;
		QueryRunner qr=new QueryRunner(C3P0Util.getDataSource());
		String sql="select * from user where uno=? and password=?";
		List<User> list=qr.query(sql, new BeanListHandler<User>(User.class),user.getUno(),user.getPassword());
		if(list.size()!=0){
			flag=true;
			//System.out.println(list.size());
		}
		//System.out.println(flag);
		return flag;
	}

	public int count() throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr=new QueryRunner(C3P0Util.getDataSource());
		long l=(Long) qr.query("select count(*) from newspaper", new ScalarHandler(1));
		return (int)l;
	}

	public List AllBook(Page page) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr=new QueryRunner(C3P0Util.getDataSource());
		//System.out.println(page.getCurrentPage());
		String sql="SELECT * FROM newspaper limit ?,?";		
		List list=(List) qr.query(sql,new BeanListHandler<Book>(Book.class),(page.getCurrentPage()-1)*page.getPageSize(),page.getPageSize());
		//System.out.println(list.size());
		return list;
	}

	public List<Book> findBook(String num, String name, String depart,
			String prize) throws SQLException {
		 QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
	        String sql = "select * from newspaper where 1=1 ";
	        List<String> list = new ArrayList<String>();
	         //多条件查询 拼接sql语句时要在and 前加 空格  不然 没有空格 识别不成功
	        System.out.println(prize);
	        if(!"".equals(num)){
	            sql+=" and num like ?";
	            list.add("%"+num.trim()+"%");
	        }
	        if(!"".equals(name)){
	            sql+=" and name like ?";
	            list.add("%"+name.trim()+"%");
	        }
	        if(!"".equals(depart)){
	            sql+=" and depart=?";
	            list.add(depart);
	        }
	        if(!"".equals(prize)){
	        	if(prize.equals("100")){
	        		sql+=" and prize<? and prize>0 ";
	        	}else if(prize.equals("200")){
	        		sql+=" and prize<? and prize>100 ";
	        	}else if(prize.equals("300")){
	        		sql+=" and prize<? and prize>200 ";
	        	}else{
	        		sql+=" and prize<? and prize>300 ";
	        	}
	            list.add(prize);
	        }
	       
	        //List<Book> query = qr.query(sql,new BeanListHandler<Book>(Book.class), pname);
	        
	        return qr.query(sql, new BeanListHandler<Book>(Book.class),list.toArray());  //list变成数组 就能被该方法识别，该方法有很多重载 方法，接收数组就是其中之一
	}

	public List AddPeo(String uno, String num) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr=new QueryRunner(C3P0Util.getDataSource());
		String sql="insert into buy(uno,num) values(?,?)";
	//	String sql3="select * from "
		qr.update(sql,uno,num);
		String sql2="SELECT buy.uno,uname,udepart,buy.num,NAME,TIME FROM USER,newspaper,buy WHERE user.uno=buy.uno AND newspaper.num=buy.num ";
		List list= qr.query(sql2, new BeanListHandler<Take>(Take.class));
		//System.out.println(list.size());
		return list;
	}

	public void addNews(Book book) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr=new QueryRunner(C3P0Util.getDataSource());
//		String time="";String depart="";
//		if(book.getTime().equals("week")){
//			time="周刊";
//		}else if(book.getTime().equals("mouth")){
//			time="月刊";
//		}else if(book.getTime().equals("other")){
//			time="其他";
//		}
//		if(book.getDepart().equals("news")){
//			depart="报纸";
//		}else if(book.getDepart().equals("magin")){
//			depart ="杂志";
//		}else if(book.getDepart().equals("other")){
//			depart ="其他";
//		}
		String sql="insert into newspaper(num,name,time,prize,depart) values(?,?,?,?,?)";
	//	System.out.println(book.getNum()+book.getName()+book.getTime()+book.getPrize()+book.getDepart());
		 qr.update(sql,book.getNum(),book.getName(),book.getTime(),book.getPrize(),book.getDepart());
	}

	public List FindPeo(String uno, String num, String depart) throws SQLException {
		// TODO Auto-generated method stub
		 QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
	        String sql = " SELECT buy.uno,uname,udepart,buy.num,NAME,TIME FROM USER,newspaper,buy WHERE user.uno=buy.uno AND newspaper.num=buy.num ";
	        List<String> list = new ArrayList<String>();
	         //多条件查询 拼接sql语句时要在and 前加 空格  不然 没有空格 识别不成功

	        if(!"".equals(uno)){
	            sql+=" and user.uno=?";
	            list.add(uno);
	        }
	        if(!"".equals(num)){
	        	sql+=" and newspaper.num=?";
	            list.add(num);
	        }
	        if(!"".equals(depart)){
	        	sql+=" and user.udepart=(SELECT dname FROM depart WHERE dno=?)";
	            list.add(depart);
	        }
	
	        List list2= qr.query(sql, new BeanListHandler<Take>(Take.class),list.toArray());
	       
	        return list2;
	}

	public List Total(String total, String txt) throws SQLException {
		// TODO Auto-generated method stub
		 QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		 List list=null;
		 if(total.equals("news")){
			String sql="SELECT buy.uno,uname,udepart,buy.num,NAME,TIME FROM USER,newspaper,buy "
		+"WHERE user.uno=buy.uno AND newspaper.num=buy.num and newspaper.num=? ";
			list= qr.query(sql, new BeanListHandler<Take>(Take.class),txt);
		}else if(total.equals("uno")){
			String sql="SELECT buy.uno,uname,udepart,buy.num,NAME,TIME FROM USER,newspaper,buy "
		+"WHERE user.uno=buy.uno AND newspaper.num=buy.num and user.uno=? ";
			list= qr.query(sql, new BeanListHandler<Take>(Take.class),txt);
		}else if(total.equals("depart")){
			String sql="SELECT buy.uno,uname,udepart,buy.num,NAME,TIME FROM USER,newspaper,buy "
		+"WHERE user.uno=buy.uno AND newspaper.num=buy.num and user.udepart=(SELECT  dname FROM depart WHERE dno=?) ";
			list= qr.query(sql, new BeanListHandler<Take>(Take.class),txt);
		}
		return list;
	}

	public List DelAdd(String uno, String num) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr=new QueryRunner(C3P0Util.getDataSource());
		String sql="DELETE FROM buy WHERE uno=? AND num=?";
	//	String sql3="select * from "
		qr.update(sql,uno,num);
		String sql2="SELECT buy.uno,uname,udepart,buy.num,NAME,TIME FROM USER,newspaper,buy WHERE user.uno=buy.uno AND newspaper.num=buy.num ";
		List list= qr.query(sql2, new BeanListHandler<Take>(Take.class));
		return list;
	}

	public void DelAddPeo(String num) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr=new QueryRunner(C3P0Util.getDataSource());
		String sql="DELETE FROM newspaper WHERE num=?";
		qr.update(sql,num);
	}



}
