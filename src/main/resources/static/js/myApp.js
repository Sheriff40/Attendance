$(document)
		.ready(
				function() {

					var menu = window.menu;

					switch (menu) {

					case 'attendance': {
						$('#att_attendance').addClass('active');
						break;
					}
					case 'Class': {
						$('#att_class').addClass('active');
						break;
					}
					case 'Teacher': {
						$('#att_teacher').addClass('active');
						break;
					}
					case 'Profile': 
						{
						 $('#navbarDropdown').addClass('active');
						 break;
						}
					case 'Add User': 
					{
					 $('#navbarDropdown').addClass('active');
					 break;
					}
					default: {
						$('#home').addClass('active');
						break;
					}

					}

					var json = window.contextRoot + '/json/get/student?name=' + window.className ;

					var table = $("#viewClass");
					if (table.length) {

						table
								.DataTable({
									lengthMenu : [ [ 3, 5, 10, -1 ],
											[ "Three", "Five", "Ten", "All" ] ],
									ajax : {
										url : json,
										dataSrc : ''
									},
									bSort: false,
									columns : [
											{
												data : 'rollNo'
											},
											{

												data : 'fname'

											},
											{
												data : 'tempAddress'
											},
											{
												data : 'id',
												mRender : function(data, type,
														row) {
													var str = '';
													var link = window.contextRoot
															+ "/user/view/student"
															+ data;
													
													str += '<a class = "btn fa fa-eye "  style = "color:black;font-size:18px;" href= " '
														+ window.contextRoot
														+ '/user/view/student/'
														+ data
														+ '  " ></a> ';
													
													
													str += '<a class = "btn fa fa-trash-alt" style = "color:green;font-size:18px;" href= " '
														+ window.contextRoot
														+ '/user/delete/student/'
														+ data
														+ '  " > </a> ';
													
													str += '<a class = "btn fa fa-user-edit" style = "color:purple;font-size:18px;" href= " '
														+ window.contextRoot
														+ '/user/edit/student/'
														+ data
														+ '  " > </a>  ';
													return str;

												}

											} ]

								});

					}

					var attendtbl = $("#attendanceTable");
					var jsonURL2 = window.contextRoot + '/json/attendance?name='
							+ window.id ;

					if (attendtbl.length) {

						attendtbl
								.DataTable({

									ajax : {
										url : jsonURL2,
										dataSrc : ''
									},
									bSort: false,
									columns : [
											{
												data : 'id'
											},
											{
												data : 'fname'
											},
											{
												data : 'number'
											},
											{

												mRender : function(data, type,
														row) {

													var str = '';

													str += "<button attId = '0' data-number = '0' class='fa fa-check' id = 'btnPresent_"
															+ row.id
															+ "'>"
															+ " Present</button>&nbsp;"

													str += "<button attId = '0' data-number = '0' class='fa fa-times' id = 'btnAbsent_"
															+ row.id
															+ "'>"
															+ " Absent</button>&nbsp;"

													str += "<button attId = '0' data-number = '0' class = 'fa fa-edit' id = 'btnEdit_"
															+ row.id
															+ "'> Edit</button>";
													var btnPresent = $('#btnPresent_'
															+ row.id);
													var btnAbsent = $('#btnAbsent_'
															+ row.id);
													var btnEdit = $('#btnEdit_'
															+ row.id);

													btnPresent
															.on(
																	'click',
																	function() {

																		/*
																		 * When
																		 * Present
																		 * button
																		 * is
																		 * clicked
																		 */

																		if (btnPresent
																				.attr('data-number') == 0) {
																			setToPresent(
																					row.id,
																					function(
																							data) {
																						btnPresent
																								.attr(
																										'attId',
																										data);
																						alert("The attendance id is: "
																								+ data);
																						btnPresent
																								.attr(
																										'data-number',
																										1);
																						btnPresent
																								.prop(
																										'disabled',
																										true);
																						btnAbsent
																								.prop(
																										'disabled',
																										true);
																						btnEdit
																								.attr(
																										'data-number',
																										1);
																						btnEdit
																								.attr(
																										'attId',
																										data);
																					});

																		}

																	

																	})

													/* When ABSENT button is clicked */

													btnAbsent
															.on(
																	'click',
																	function() {

																		if (btnAbsent
																				.attr('data-number') == 0) {
																			setToAbsent(
																					row.id,
																					function(
																							data) {
																						btnAbsent
																								.attr(
																										'attId',
																										data);
																						alert("The attendance id is: "
																								+ data);
																						btnAbsent
																								.attr(
																										'data-number',
																										1);
																						btnAbsent
																								.prop(
																										'disabled',
																										true);
																						btnPresent
																								.prop(
																										'disabled',
																										true);
																						btnEdit
																								.attr(
																										'data-number',
																										1);
																						btnEdit
																								.attr(
																										'attId',
																										data);
																					});

																		}

																	})

													/*
													 * When EDIT button is
													 * clicked
													 */

													btnEdit
															.on(
																	'click',
																	function() {

																		var attrId = btnEdit
																				.attr("attId")

																		if (btnEdit
																				.attr("data-number") == 0) {
																			alert("Atendance saved for today. Cannot be edited from here. Please use the Edit button below");
																		} else if (btnEdit
																				.attr("data-number") == 1) {
																			updateAttendance(attrId);
																		}

																	});

													return str;

												}

											}

									]

								});

					}

					var stdForm = $("#stdForm");
					if (stdForm.length) {

						stdForm.validate({
							rules : {
								rollNo : {
									required : true,
									minlength : 5
								},
								fname : {
									required : true,
									minlength : 3
								},
								lname : {
									required : true,
									minlength : 3
								},
								number : {
									required : true,
									minlength : 10
								},
								fatherName : {
									required : true,
									minlength : 3
								},
								motherName : {
									required : true,
									minlength : 3
								},
								tempAddress : {
									required : false,
									minlength : 3
								},
								permAddress : {
									required : true,
									minlength : 3
								},
								localGuardian : {
									required : true,
									minlength : 3
								},
								localNumber : {
									required : true,
									minlength : 7,
									maxLength : 10

								},
								classId : {
									required : true,
									min : 1
								}

							},
							messages : {
								fname : {
									required : "* First Name is required",
									minlength : "The minimum length is 3"
								},
								lname : {
									required : "* Last Name is required",
									minlength : "The minimum length is 3"
								},
								fatherName : {
									required : "* Last Name is required",
									minlength : "The minimum length is 3"
								},
								motherName : {
									required : "* Last Name is required",
									minlength : "The minimum length is 3"
								},
								tempAddress : {
									required : "* Last Name is required",
									minlength : "The minimum length is 3"
								},
								permAddress : {
									required : "* Last Name is required",
									minlength : "The minimum length is 3"
								},
								localGuardian : {
									required : "* Last Name is required",
									minlength : "The minimum length is 3"
								},
								number : {
									required : true,
									minlength : 7,
									maxLength : 10

								},
								localNumber : {
									required : true,
									minlength : 7,
									maxLength : 10
								},
								classId : {
									required : "* Class Id is required",

								}

							},
							errorElement : "em",
							errorClass : "error-class"
						});
					}

					function setToPresent(row_id, callback) {
						$
								.post(
										window.contextRoot + "/user/add/attendance/"
												+ row_id + "?abs=false",
										function(data) {
											if (data === 'error') {
												alert("Could not save the attendance, attendance for this date and class already exists");
												return;
											} else {
												callback(data);
											}

										});
					}

					function updateAttendance(attId) {
						$
								.post(
										window.contextRoot
												+ "/user/update/attendance/" + attId,
										function(data) {
											if (data == "present") {
												alert("The attendance has been set to present");
											} else if (data == "absent") {
												alert("The attendance has been set to absent")
											}
										});
					}

					function setToAbsent(row_id, callback) {
						$
								.post(
										window.contextRoot + "/user/add/attendance/"
												+ row_id + "?abs=true",
										function(data) {
											if (data === 'error') {
												alert("Could not save the attendance, attendance for this date and class already exists");
												return;
											} else {
												callback(data);
											}

										});
					}

					/* Validation for teacher Form */

					var teacherForm = $("#teacherForm");
					if (teacherForm.length > 0) {
						teacherForm.validate({

							rules : {
								staffId : {
									required : true,
									minlength : 2
								},
								name : {
									required : true,
									minlength : 3
								},
								address : {
									required : true,
									minlength : 3
								},
								number : {
									required : true,
									maxlength : 10,
									minlength : 7
								},
								subject : {
									required : true,
									minlength : 3
								}
							},
							messages : {
								staffId : {
									required : "*Required field",
									minlength : "The minimum length is 2"
								},
								name : {
									required : "*Required field",
									minlength : "The minimum length is 3"
								},
								address : {
									required : "*Required field",
									minlength : "The minimum length is 3"
								},
								number : {
									required : "*Required field",
									minlength : "The minimum length is 10"
								},
								subject : {
									required : "*Required field",
									minlength : "The minimum length is 3"
								}
							},
							errorClass : 'error-class'
						});
					}

					var teacherTable = $('#teacherTable');
					var url = window.contextRoot + "/json/get/teachers";
					if (teacherTable.length > 0) {
						teacherTable.DataTable({

							ajax : {
								url : url,
								dataSrc : ''
							},
							bSort: false,
							columns : [

							{
								data : 'staffId'
							},
							{
								data : 'name'
							},
							{
								data : 'address'
							},
							{
								data : 'number'
							},
							{
								data : 'subject'
							},
							{
								data: 'id',
								mRender : function(data,type,row)
								{
									var str = '';
									str += "<a class = 'btn fa fa-trash-alt' href = '"+window.contextRoot+ "/admin/delete/teacher/" + data +"' style = 'font-size:18px;border-radius:10px;color:green;'></a> ";
									str += "<a class = 'btn fa fa-user-edit' href = '"+window.contextRoot+ "/admin/edit/teacher/" + data +"' style = 'font-size:18px;border-radius:10px;color:purple;'></a> ";
									return str;
								}
							}
							
							]

						});
					}
					
					var attendanceTeacher = $("#teacherAttendance");
					if(attendanceTeacher.length > 0)
						{
						var url = window.contextRoot + "/json/get/teachers";
							attendanceTeacher.DataTable({
								
								ajax:
									{
										url : url,
										dataSrc : ''
									},
									bSort: false,
							columns :
									[
										{
											data : 'staffId'
										},
										{
											data : 'name'
										},
										{
											
											mRender : function(data,type,row){
														
													var str = '';
													str  += '<button class="fa fa-check" btn_attid = "0" id = "presentTeacher_'+row.id+'">Present </button> &nbsp';
													
													str += '<button class="fa fa-times" btn_attid = "0" id = "absentTeacher_'+row.id+'">Absent </button> &nbsp';
													str += '<button class="fa fa-times" btn_attid = "0" id = "editTeacher_'+row.id+'">Edit </button>';
													
												
													var presentTeacher = $('#presentTeacher_' + row.id);
													var absTeacher = $('#absentTeacher_' + row.id);
													var editTeacher = $('#editTeacher_' + row.id);
													
													
													presentTeacher.on('click',function()
															{
																teacherPresent(row.id,function(data)
																		{
																			presentTeacher.attr("btn_attid",data);
																			absTeacher.prop("disabled",true);
																			presentTeacher.prop("disabled",true);
																			editTeacher.attr("btn_attid",data);
																		});
																
															});
														
													
													absTeacher.on('click',function()
																{
																		teacherAbsent(row.id,function(data)
																				{
																					absTeacher.attr("btn_attid",data);
																					absTeacher.prop("disabled",true);
																					presentTeacher.prop("disabled",true);
																					editTeacher.attr("btn_attid",data);
																				});
																});
														
													editTeacher.on('click',function()
															{
																	var attId = editTeacher.attr("btn_attid");
																	teacherUpdate(attId);
															});
													
													
													
													return str;
											}
										}
									]
								
							});
							
							function teacherPresent(taId,callback)
							{
								var url = window.contextRoot + "/admin/add/teacher/attendance/" + taId + "?abs=false";
								$.post(url,{},function(data){
									if (data == "error")
										{
											alert ("The attendance for the date exists");
											return null;
										}
									else
										{
											callback(data);
										}
									
								})
							}
							
							function teacherAbsent(taId,callback)
							{
								var url = window.contextRoot + "/admin/add/teacher/attendance/" + taId + "?abs=true";
								$.post(url,{},function(data){
									if (data == "error")
									{
										alert ("The attendance for the date exists");
										return null;
									}
									else
										{
											callback(data);
										}
									
								})
							}
							
							function teacherUpdate(taId)
							{
								$.post(window.contextRoot + "/admin/update/teacher/attendance/" + taId,function(data)
										{
											alert(data);
										});
							}
							
						}

					
					var classesTable = $("#classesTable");
					if(classesTable.length > 0){
						classesTable.DataTable({
							ajax:
								{
									url: window.contextRoot + "/json/get/classes",
									dataSrc : ''
								},
								bSort: false,
							columns :
								[
									{
										data: 'name'
									},
									{
										
										mRender : function(data,type,row)
										{
											var str = '';
											str += "<a class = 'btn fa fa-trash-alt' href = '"+window.contextRoot+ "/admin/delete/class/" + row.id +"' style = 'font-size:18px;border-radius:10px;color:green;'></a> ";
											str += "<a class = 'btn fa fa-user-edit'  href = '"+window.contextRoot+ "/admin/edit/class/" + row.id +"' style = 'font-size:18px;border-radius:10px;color:purple;'></a> ";
											return str;
										}
									}
									
									
										
								]
						})
					}
						
				
					
					
				});