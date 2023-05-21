package com.stf.page.util;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.SignatureException;
import io.jsonwebtoken.UnsupportedJwtException;

@Component
public class JwtUtil {
//	private static final String SALT = "SSAFIT";
	private static final String SALT = "STF";

	
	//토큰 생성
	//인자로 키와 벨류가 넘어왔다고 생각하고 처리
	public String createToken(String claimId, String data) throws UnsupportedEncodingException {
	//테스트하는데 방해되는 유효기간은 잠시 지웠다
		return Jwts.builder()
				.setHeaderParam("alg", "HS256")
				.setHeaderParam("typ", "JWT")
				.claim(claimId, data)
				.claim("age", "25")
				.claim("담아보자", "한글도가능?")
				.claim("user_name", "donghyun")
				.signWith(SignatureAlgorithm.HS256, SALT.getBytes("UTF-8"))
				.compact();
	}
	
	//유효성 검사
	public void valid(String token) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException, UnsupportedEncodingException {
		Jwts.parser().setSigningKey("STF".getBytes("UTF-8")).parseClaimsJws(token);
	}
	
	// 헤더에서 토큰 정보 가져오기
	public Claims parseToken(String token) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException, UnsupportedEncodingException {
	    return Jwts.parser().setSigningKey(SALT.getBytes("UTF-8")).parseClaimsJws(token).getBody();
	}
}
