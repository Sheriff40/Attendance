package org.ocean.dao;

import org.ocean.dto.Attendance;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AttendanceDAO extends JpaRepository<Attendance, Integer>{

}
