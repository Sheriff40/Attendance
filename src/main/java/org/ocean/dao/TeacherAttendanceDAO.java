package org.ocean.dao;




import java.time.LocalDate;
import java.util.List;

import org.ocean.dto.TeacherAttendance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository(value = "TeacherAttendanceDAO")
public interface TeacherAttendanceDAO extends JpaRepository<TeacherAttendance, Integer>{

	@Query(value = "SELECT * FROM Teacher_Attendance WHERE teacher_id = ?1 AND date >= ?2 AND date < ?3", nativeQuery = true)
	public TeacherAttendance getTeacherAttendanceList(int id, LocalDate date1, LocalDate date2);
}
