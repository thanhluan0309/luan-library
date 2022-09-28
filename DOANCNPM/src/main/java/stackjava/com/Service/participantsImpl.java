package stackjava.com.Service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stackjava.com.DAO.participantsdao;
import stackjava.com.Entity.participants;
import stackjava.com.Entity.room;

@Service
public class participantsImpl implements Interfaceparticipants{

	@Autowired
	private participantsdao pd;
	
	@Override
	public boolean checKPariticipants_BY_userID_userIdpart(long userId, long roomId) {
		// TODO Auto-generated method stub
		try {
			return pd.checKPariticipants_BY_userID_userIdpart(userId, roomId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public participants createParticipantsBy_RoomId_UserId_userParts(participants p) {
		participants pget =new 	participants();
		try {
			return pget=pd.createParticipantsBy_RoomId_UserId_userParts(p);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public participants getParticipantsBy_UserId_userParts(long UserId, long userParts) {
		participants pget =new 	participants();
		try {
			return pd.getParticipantsBy_UserId_userParts(UserId, userParts);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pget;
	}

	

	


}
