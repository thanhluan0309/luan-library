package stackjava.com.Service;

import org.springframework.stereotype.Service;

import stackjava.com.Entity.participants;

@Service
public interface Interfaceparticipants {
	public boolean checKPariticipants_BY_userID_userIdpart(long userId, long roomId);
	public participants createParticipantsBy_RoomId_UserId_userParts(participants p);
	public participants getParticipantsBy_UserId_userParts(long UserId,long userParts);
}
