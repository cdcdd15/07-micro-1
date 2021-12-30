package com.cosmin.beans;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cosmin.feign.Micro1FeignClient;
import com.cosmin.logs.StaticLogs;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class MicroOneController {

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
//		System.out.println("Endpoint with feign.");
//		StaticLogs.staticLogs(log, "from REST endpoint");
		ResponseEntity<String> response = this.micro1FeignClient.getMessageFromMicro2();
		
		return response;
	}
	
}