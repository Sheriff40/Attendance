package org.ocean.attendenceApp;




import static org.junit.Assert.assertEquals;

import java.time.LocalDate;

import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.ocean.dao.AttendanceDAO;
import org.ocean.dao.ClassDAO;
import org.ocean.dao.StudentDAO;
import org.ocean.dao.TeacherAttendanceDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest
public class AttendenceAppApplicationTests {
	
	@Autowired
	private StudentDAO dao;
	
	@Autowired
	private AttendanceDAO Attdao;
	
	@Autowired
	private TeacherAttendanceDAO taDAO;
	
	@Autowired
	private ClassDAO classDAO;
	
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
		
		
//		assertEquals("Wrong information","uttsikha",dao.getById(1).getFname());
		
//		assertEquals("Wrong information",2,dao.findByClassId(8).size());

		//assertEquals("Wrong information",true,dao.updatePresent(false, 1));
		
/* For checking the local DATE */		
		LocalDate date1 = LocalDate.parse("2018-11-14");
		System.out.println("this date is -------------");
		System.out.println(date1);
		LocalDate date2 = date1.plusDays(1);
		System.out.println(date2);
		
		//assertEquals("Wrong information",3,Attdao.searchDate(date1,date2).size());
		
//		assertEquals("Wrong information",3,Attdao.findByStdClass(8).size());
		
//		assertEquals("Wrong information",3,Attdao.searchByDateAndId(8,date1,date2).size());
		
		/* Checking with student id*/
		
		//assertEquals("Wrong information",true,Attdao.searchByDateAndStudentId(1,date1,date2).getStatus());
		
//		assertEquals("Wrong information",3,Attdao.searchByDate2().size());
		
//		assertEquals("Wrong information",false,taDAO.getTeacherAttendanceList(2,date1,date2).getStatus());
		
//		assertEquals("Wrong Info",2,dao.findByStdClassName("8A").size());
		
//		assertEquals("wrong info",3,classDAO.findAll().size());
	}
	

}
