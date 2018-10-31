package org.ocean.attendenceApp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication()
@ComponentScan(basePackages = "org.ocean")
@EnableJpaRepositories("org.ocean.dao")
@EntityScan(basePackages = {"org.ocean.dto"})
public class AttendenceAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(AttendenceAppApplication.class, args);
	}
}
