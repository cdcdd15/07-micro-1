package com.cosmin.logs;

public class StaticLogs {
	public static void staticLogs(org.slf4j.Logger log, String message) {
		log.info("<info>The application 07-micro-1 - {}.", message);
		log.error("<error>The application 07-micro-1 - {}.", message);
		log.debug("<debug>The application 07-micro-1 - {}.", message);
	}
}
