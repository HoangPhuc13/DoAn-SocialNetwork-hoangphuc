package data_access;

import java.util.ArrayList;

public interface IDataAccess<T> {
	
	public boolean insert(T t);
	
	public boolean delete(T t);
	
	public boolean update(T t);
	
	public T selectById(int id);
	
	public ArrayList<T> selectAll();
	
}
