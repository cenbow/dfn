package com.dfp2p.other.message;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

public interface getReceiver {
	public  List<HashMap<String, String>> getReceiverList(String event,HashMap<String, String>map,Connection conn) ;
}
