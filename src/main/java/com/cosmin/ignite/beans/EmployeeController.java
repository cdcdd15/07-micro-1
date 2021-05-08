package com.cosmin.ignite.beans;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class EmployeeController {

	@Value("${service.url}")
	private String url;
	
	@GetMapping("/hello-world")
	public ResponseEntity<String> hello() {
		System.out.println(this.url);
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response
		  = restTemplate.getForEntity(this.url + "/hello-world", String.class);
		
		return response;
	}
	
}