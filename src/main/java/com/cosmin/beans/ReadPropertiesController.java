package com.cosmin.beans;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ReadPropertiesController {
	@Value("${07-micro-1.val}")
	private String val;
	
	@PostConstruct
	private void init() {
		log.info("07-micro-1.val=" + val);
	}
	
	@GetMapping("/config")
	public ResponseEntity<String> config(@Value("${07-micro-1.val}") String val)
	{
		String resp = "07-micro-1.val=" + val;
		log.info("07-micro-1.val=" + resp);
	    return new ResponseEntity<>(resp, HttpStatus.OK);
	}
}
