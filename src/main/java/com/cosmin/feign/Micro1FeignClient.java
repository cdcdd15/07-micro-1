package com.cosmin.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@FeignClient(name = "netflix-zuul-api-gateway-server")
//@FeignClient(name = "07-micro-2")
//@FeignClient(name = "micro1-service", url = "${SERVICE_URL:http://localhost:5001}")
public interface Micro1FeignClient {
	
	@GetMapping(value = "/07-micro-2/hello-world")
//	@RequestMapping(value = "/hello-world", method = RequestMethod.GET)
	public ResponseEntity<String> getMessageFromMicro2();

}
