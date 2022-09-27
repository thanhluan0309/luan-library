package stackjava.com.Service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stackjava.com.DAO.roomdao;
import stackjava.com.Entity.room;

@Service
public class roomImpl implements Interfaceroom{

	@Autowired
	private roomdao rd;
	
	@Override
	public room getOneRoomByid(long id) {
		try {
			return rd.getOneRoomByid(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public room createRoom(room r) {
		room rget = new room();
		try {
			return rget=rd.createRoom(r);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return r;
	}
	
}
