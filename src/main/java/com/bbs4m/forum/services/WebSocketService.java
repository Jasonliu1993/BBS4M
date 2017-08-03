package com.bbs4m.forum.services;

import javax.websocket.*;
import java.io.IOException;

/**
 * Created by Jason on 02/08/2017.
 */
public interface WebSocketService {
    void onOpen(Session session,EndpointConfig config);
    void onClose();
    void onMessage(String message, Session session);
    void onError(Session session, Throwable error);
    void sendMessage(String message) throws IOException;
    void sendMsg(String userid);
}
