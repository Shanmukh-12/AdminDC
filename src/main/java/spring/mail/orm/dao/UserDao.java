package main.java.spring.mail.orm.dao;

import java.util.List;

import main.java.spring.mail.orm.model.DoctorModel;
import main.java.spring.mail.orm.model.UserPass;
import main.java.spring.mail.orm.model.testmodel;

public interface UserDao {
	public UserPass getUserDetails(String s);

	public boolean saveUser(String ottps, int time);

	public void updateUser(String lcpass, String uname);

	public void changeUser(String lcpass, String uname);

	public void registeruser(String name, String pass, String mail, String role);

	public DoctorModel getdocspecdetails();

	public void savedoc(String doc_name, String doc_qual, int spec_id, String doc_exp, byte[] doc_photo, int doc_cfee);

	public void savetest(String test_name, String test_category, int test_price, String test_method,
			String test_fromrange, String test_torange);

	public List<testmodel> gettests();

	public testmodel gettestbyid(int id);
}