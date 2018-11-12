package org.ocean.dao;

import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

import org.ocean.dto.Attendance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface AttendanceDAO extends JpaRepository<Attendance, Integer>
{

	@Transactional
	@Modifying
	@Query(value = "UPDATE Attendance SET status = ? WHERE id = ?",nativeQuery = true)
	public int updateAttendance (Boolean present, int id);
	
	public Attendance findByStudentId(int id);
	
//	@Query(value = "",nativeQuery = true)
//	public List<Attendance> searchDate(LocalDate date1,LocalDate date2);
	
//	@Query(value = "SELECT * FROM Attendance WHERE date between ?1 AND ?2 ",nativeQuery = true)
//  public List<Attendance> findByStudentClassId(int id);
	
	
//	@Query(value = "SELECT * FROM Attendance a WHERE a.class_Id = ?1 AND date between ?2 AND ?3  ",nativeQuery = true)
//	public List<Attendance> searchByDateAndId(int id,LocalDate date1, LocalDate date2);
   
	@Query(value = "SELECT * FROM Attendance a WHERE a.class_Id = ?1 AND date between ?2 AND ?3  ",nativeQuery = true)
	public List<Attendance> searchByDateAndId(int id,LocalDate date1, LocalDate date2);
	
	@Query(value = "SELECT * FROM Attendance WHERE student_id = ?1 AND date >= ?2 AND date < ?3  ",nativeQuery = true)
	public Attendance searchByDateAndStudentId(int id,LocalDate date1, LocalDate date2);
	
//	@Query(value = "SELECT * FROM Attendance WHERE date >= ?1 AND date < ?2" ,nativeQuery = true)
//	public List<Attendance> searchByDate(LocalDate date1, LocalDate date2);
//	
//	@Query(value = "SELECT * FROM Attendance WHERE date between '2018-11-12' AND '2018-11-13'" ,nativeQuery = true)
//	public List<Attendance> searchByDate2();
}
