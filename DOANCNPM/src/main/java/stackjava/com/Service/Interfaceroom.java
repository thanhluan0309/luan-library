package stackjava.com.Service;

import org.springframework.stereotype.Service;

import stackjava.com.Entity.room;

@Service
public interface Interfaceroom {
	public room getOneRoomByid(long id);

	public room createRoom(room r);
}
