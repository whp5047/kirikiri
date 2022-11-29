package com.kiri.auth;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.kiri.utills.SecurityInfo;

@Component
public class NaverLogin {
    private final static String naverClientId = SecurityInfo.naverId;
    private final static String naverClientSecret = SecurityInfo.naverSecret;
    private final static String naverRedirectUri = "http://192.168.20.21/auth/naverCallback";
    private final static String sessionState = "oauth_state";
    private final static String naverProfileApiUri = "https://openapi.naver.com/v1/nid/me";
    
    public String getAuthorizationUrl(HttpSession session) {
        String state = generateRandomString();
        setSession(session, state);
        OAuth20Service oauthService = new ServiceBuilder()
        		.apiKey(naverClientId)
        		.apiSecret(naverClientSecret)
                .callback(naverRedirectUri)
                .state(state).build(NaverLoginApi.instance());
        return oauthService.getAuthorizationUrl();
    }
    
    /* 네이버아이디로 Callback 처리 및 AccessToken 획득 Method */
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
        /* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
        String sessionState = getSession(session);
        if (StringUtils.pathEquals(sessionState, state)) {
            OAuth20Service oauthService = new ServiceBuilder().apiKey(naverClientId).apiSecret(naverClientSecret)
                    .callback(naverRedirectUri).state(state).build(NaverLoginApi.instance());
            /* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }
    
    /* 세션 유효성 검증을 위한 난수 생성기 */
    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }
    
    /* http session에 데이터 저장 */
    private void setSession(HttpSession session, String state) {
        session.setAttribute(sessionState, state);
    }
    
    /* http session에서 데이터 가져오기 */
    private String getSession(HttpSession session) {
        return (String) session.getAttribute(sessionState);
    }
    
    /* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
        OAuth20Service oauthService = new ServiceBuilder()
        		.apiKey(naverClientId)
        		.apiSecret(naverClientSecret)
                .callback(naverRedirectUri).build(NaverLoginApi.instance());
        OAuthRequest request = new OAuthRequest(Verb.GET, naverProfileApiUri, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
    }
}
