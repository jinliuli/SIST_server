package com.test.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

//네이버 검색 API 예제 - 블로그 검색
public class Sample {
	
	 public static void main(String[] args) {
//	        String clientId = "1KsQbSdUJvloFVGU0XHx"; //애플리케이션 클라이언트 아이디
//	        String clientSecret = "L3WB48HGd6"; //애플리케이션 클라이언트 시크릿
//
//
//	        String text = null;
//	        try {
//	            text = URLEncoder.encode("그린팩토리", "UTF-8");
//	        } catch (UnsupportedEncodingException e) {
//	            throw new RuntimeException("검색어 인코딩 실패",e);
//	        }
//
//	        
//	        String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;    // JSON 결과
//	        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // XML 결과
//
//
//	        Map<String, String> requestHeaders = new HashMap<>();
//	        requestHeaders.put("X-Naver-Client-Id", clientId);
//	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
//	        String responseBody = get(apiURL,requestHeaders);
//
//
//	        System.out.println(responseBody);
		 
		 /*
		 	{
		 		"name": "홍길동",
		 		"age": 20,
		 		"nick": ["바보", "멍청이", "천재"]
		 	}
		 */
		 String result = "{\r\n"
		 		+ "		 		\"name\": \"홍길동\",\r\n"
		 		+ "		 		\"age\": 20,\r\n"
		 		+ "		 		\"nick\": [\"바보\", \"멍청이\", \"천재\"]\r\n"
		 		+ "		 	}";
		 
		 //문자열 > 의미있는 단위 변환 >> 파싱(Parsing)
		 JSONParser parser = new JSONParser();
		 
		 try {
			 
			JSONObject obj = (JSONObject)parser.parse(result);
			System.out.println(obj.get("age")); //20
			
			JSONArray arr = (JSONArray)obj.get("nick");
			System.out.println(arr.get(1)); //멍청이
			
			
		} catch (Exception e) {
			System.out.println("Sample.main");
			e.printStackTrace();
		}
		 
		 
	    }


	    private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }


	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 오류 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }


	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }


	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);


	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();


	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }


	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
	        }
	    }
	
	    
}//Sample
