package edu.java.springboottask;

import io.micrometer.core.instrument.Counter;
import io.micrometer.core.instrument.binder.MeterBinder;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class RestTaskApplication {

	public static void main(String[] args) {
		SpringApplication.run(RestTaskApplication.class, args);
	}

	@Bean
	public MeterBinder meterBinder(){
		return meterRegistry -> {
			Counter.builder("login_counter")
					.tag("version", "v1.0")
					.description("Number of logging")
					.register(meterRegistry);
		};
	}

}
