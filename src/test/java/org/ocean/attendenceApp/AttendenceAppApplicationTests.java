package org.ocean.attendenceApp;




import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.ocean.dao.StudentDAO;
import org.ocean.dto.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest
public class AttendenceAppApplicationTests {
	
	@Autowired
	private StudentDAO dao;
	
	@BeforeClass
	public static void init()
	{
		
	}
	
	@Test
	public void contextLoads() {
		
//		Student std = new Student();
//		std.setFname("uttsikha");
//		std.setLname("adhikari");
//		std.setNumber("919191291");
//		std.setTotalAbsentDay(80);
//		std.setTotalPresentDay(5);
//		std.setClassId(8);
//		dao.save(std);
//		assertEquals("failed insert",true, dao.save(std));
		
		
//		Student std1 = new Student();
//		std1.setFname("william");
//		std1.setLname("rai");
//		std1.setNumber("9112312391");
//		std1.setTotalAbsentDay(20);
//		std1.setTotalPresentDay(50);
//		std1.setClassId(8);
//		dao.save(std1);
//		assertEquals("failed insert",true, dao.save(std1));
		
		
//		assertEquals("Wrong information","uttsikha",dao.getOne(1).getFname());
		
//		assertEquals("Wrong information",2,dao.findByClassId(8).size());
		
		
	}
	

}
