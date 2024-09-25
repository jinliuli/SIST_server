package com.test.java;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Ex04 {
	
	public static void main(String[] args) {
		
		//셀레니움(자동화 테스트 도구 + 크롤링)
		m1();
		
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
