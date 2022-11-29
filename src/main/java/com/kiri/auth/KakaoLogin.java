package com.kiri.auth;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
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
public class KakaoLogin {
	private final static String kakaoClientId = SecurityInfo.kakaoId;
	private final static String kakaoClientSecret = SecurityInfo.kakaoSecret;
	private final static String kakaoRedirectUri = "http://192.168.20.21/auth/kakaoCallback"; 
	private final static String sessionState = "kakao_oauth_state";
	private final static String kakaoProfileApiUri = "https://kapi.kakao.com/v2/user/me";

	public String getAuthorizationUrl(HttpSession session) {
		String state = generateRandomString();
		setSession(session, state);
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(kakaoClientId)
				.apiSecret(kakaoClientSecret)
				.callback(kakaoRedirectUri)
				.state(state).build(KakaoLoginApi.instance());
		return oauthService.getAuthorizationUrl();
	}

	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws Exception {
		String sessionState = getSession(session);
		if (StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(kakaoClientId)
					.apiSecret(kakaoClientSecret)
					.callback(kakaoRedirectUri)
					.state(state).build(KakaoLoginApi.instance());
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}

	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}

	private void setSession(HttpSession session, String state) {
		session.setAttribute(sessionState, state);
	}

	private String getSession(HttpSession session) {
		return (String) session.getAttribute(sessionState);
	}

	public String getUserProfile(OAuth2AccessToken oauthToken) throws Exception {
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(kakaoClientId)
				.apiSecret(kakaoClientSecret)
				.callback(kakaoRedirectUri).build(KakaoLoginApi.instance());
		OAuthRequest request = new OAuthRequest(Verb.GET, kakaoProfileApiUri, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}
	
	public void kakaoLogout(String accessToken, String reqURL) throws Exception {
        URL url = new URL(reqURL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
        int responseCode = conn.getResponseCode();
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        System.err.println("responseCode : " + responseCode);
        String result = "";
        String line = "";

        while ((line = br.readLine()) != null) {
            result += line;
        }
        System.out.println(result);
    }
	
	
}
