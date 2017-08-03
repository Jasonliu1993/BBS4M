package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.entities.UserAttribute;
import com.bbs4m.forum.services.WebSocketService;
import com.bbs4m.utilities.GetHttpSessionConfigurator;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * Created by Jason on 02/08/2017.
 */
@Component
@ServerEndpoint(value = "/MessageRemind" ,configurator=GetHttpSessionConfigurator.class)
public class WebSocketServiceImpl implements WebSocketService{
    public static CopyOnWriteArraySet<WebSocketServiceImpl> webSocketSet = new CopyOnWriteArraySet<WebSocketServiceImpl>();

    private Session session;

    private HttpSession httpSession;

    /**
     * 连接建立成功调用的方法
     *
     * @param session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(Session session,EndpointConfig config) {
        this.session = session;
        webSocketSet.add(this);     //加入set中
        System.out.println("有新连接加入");
        httpSession= (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        webSocketSet.remove(this);  //从set中删除
        System.out.println("有一连接关闭");
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息
     * @param session 可选的参数
     */
    @OnMessage
    public void onMessage(String message, Session session) {

    }

    /**
     * 发生错误时调用
     *
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {

    }

    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     *
     * @param message
     * @throws IOException
     */
    public void sendMessage(String message) throws IOException {
        this.session.getBasicRemote().sendText(message);
    }

    public void sendMsg(String userid) {
        for (WebSocketServiceImpl item : webSocketSet) {
            String getUserId = ((UserAttribute)item.httpSession.getAttribute("UserAttr")).getUserid();
            if (userid.equals(getUserId)) {
                try {
                    item.sendMessage(userid);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
