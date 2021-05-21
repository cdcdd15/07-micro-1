package com.cosmin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

import com.cosmin.logs.StaticLogs;

import lombok.extern.slf4j.Slf4j;

@SpringBootApplication
@EnableFeignClients
@EnableDiscoveryClient
@Slf4j
public class MicroOneApplication {

	public static void main(String[] args) {
		SpringApplication.run(MicroOneApplication.class, args);
		String message = "is started";
		StaticLogs.staticLogs(log, message);
	}
}
