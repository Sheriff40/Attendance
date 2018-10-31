package org.ocean.json;

import java.util.List;

import org.ocean.dto.Student;
import org.ocean.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RestController
@RequestMapping("/json")
public class JsonController {

	@Autowired
	StudentService serv;
	
	@RequestMapping("/{id}/student")
	public List<Student> studenyByClass(@PathVariable ("id") int id)
	{
		return serv.StudentByClassId(id);
	}
	
}