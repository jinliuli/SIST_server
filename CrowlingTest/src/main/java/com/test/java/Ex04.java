package com.test.java;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Ex04 {
	
	public static void main(String[] args) {
		
		//셀레니움(자동화 테스트 도구 + 크롤링)
		//m1();
		m2();
		
	}

	private static void m2() {
		
		//http://lms1.sist.co.kr/
		String url = "http://lms1.sist.co.kr/worknet/SLogin.asp";
		
		//드라이버 불러오는 고정 코드
		String webDriverID = "webdriver.chrome.driver";
		String path = "C:\\class\\dev\\chromedriver.exe";
		System.setProperty(webDriverID, path);
		WebDriver driver = new ChromeDriver();
		
		//get메서드로 url 가져오기
		driver.get(url);
		
		//strLoginID
		WebElement strLoginID = driver.findElement(By.id("strLoginID"));
		strLoginID.sendKeys("김유리"); //타이핑(텍스트 입력)
		
		//strLoginPwd
		WebElement strLoginPwd = driver.findElement(By.id("strLoginPwd"));
		strLoginPwd.sendKeys("5960"); //타이핑(텍스트 입력)
		
		//.login-btn > input > 로그인버튼
		WebElement btn = driver.findElement(By.cssSelector(".login-btn > input"));
		//System.out.println(btn.getAttribute("value")); //로그인
		btn.click();
		
		//#content > div > div > div > div.panel-body > div.popbtmbtn_section > div > a:nth-child(10)
		WebElement a = driver.findElement(By.cssSelector("#content > div > div > div > div.panel-body > div.popbtmbtn_section > div > a:nth-child(10)"));
		
		a.click();
		
		//컴퓨터의 행동은 바로 이어져서 창을 열면서 찾기 때문에 못찾는거임 그래서 예외처리해줘야됨 
		try {
			//잠시 기다림
			Thread.sleep(1000);
		} catch (Exception e) {
			System.out.println("Ex04.m2");
			e.printStackTrace();
		}
		
		//#modalContent > div > div.panel-body > div.row > table > tbody > tr > td:nth-child(2)
		List<WebElement> list = driver.findElements(By.cssSelector("#modalContent > div > div.panel-body > div.row > table > tbody > tr > td:nth-child(2)"));
		
		System.out.println(list.size());
		
		for (WebElement td : list) {
			System.out.println(td.getText());
		}
		
	}

	private static void m1() {
		
		//크롬 드라이버
		//https://googlechromelabs.github.io/chrome-for-testing/
		//셀레니움 라이브러리
		//https://www.selenium.dev/downloads/
		
		String webDriverID = "webdriver.chrome.driver";
		String path = "C:\\class\\dev\\chromedriver.exe";
		System.setProperty(webDriverID, path);
		
		WebDriver driver = new ChromeDriver();
		
		//String url = "https://naver.com";
		String url = "http://localhost:8090/crowling/list.jsp";
		driver.get(url);
		
		WebElement h1 = driver.findElement(By.tagName("h1"));
		System.out.println(h1.getText());
		
		List<WebElement> list = driver.findElements(By.cssSelector(".item div:nth-child(1)"));
		
		list.forEach(item -> {
			System.out.println(item.getText());
		});
		
	}
}
