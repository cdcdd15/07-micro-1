package com.cosmin.ignite;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class SpringBootMicroApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootMicroApplication.class, args);
	}
}
