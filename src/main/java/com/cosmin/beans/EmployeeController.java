package com.cosmin.beans;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cosmin.feign.Micro1FeignClient;

@RestController
public class EmployeeController {

	@Autowired
	private Micro1FeignClient micro1FeignClient;
	
	
//	@GetMapping("/hello-world/restTemplate")
//	public ResponseEntity<String> hello() {
//		System.out.println(this.url);
//		RestTemplate restTemplate = new RestTemplate();
//		ResponseEntity<String> response
//		  = restTemplate.getForEntity(this.url + "/hello-world", String.class);
//		
//		return response;
//	}
	
	@GetMapping("/hello-world")
	public ResponseEntity<String> helloWithFeign() {
		System.out.println("Endpoint with feign.");
		ResponseEntity<String> response = this.micro1FeignClient.getMessageFromMicro2();
		
		return response;
	}
	
}