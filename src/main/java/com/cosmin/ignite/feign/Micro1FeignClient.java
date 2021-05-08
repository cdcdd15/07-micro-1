package com.cosmin.ignite.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@FeignClient(name = "micro1-service", url = "${SERVICE_URL:http://localhost:5001}")
public interface Micro1FeignClient {
	
	@RequestMapping(value = "/hello-world", method = RequestMethod.GET)
	public ResponseEntity<String> getMessageFromMicro2();

}
