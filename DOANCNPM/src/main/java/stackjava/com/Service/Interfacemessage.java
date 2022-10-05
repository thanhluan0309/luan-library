package stackjava.com.Service;

import org.springframework.stereotype.Service;

import stackjava.com.Entity.message;

@Service
public interface Interfacemessage {
	public message getmeMessageBy_userId_RoomId(long roomId);
	public boolean upDateMessageBy_userId_RoomId(message m);
	public message createMessage(message m);
}
