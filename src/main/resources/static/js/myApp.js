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

					default: {
						$('#home').addClass('active');
						break;
					}

					}

					var json = window.contextRoot + '/json/' + window.stdId
							+ '/student';

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
															+ "/view/student"
															+ data;
													str += '<a class = "btn btn-danger" href= " '
															+ window.contextRoot
															+ '/admin/view/student/'
															+ data
															+ '  " >View </a> ';
													return str;

												}

											} ]

								});

					}

					var attendtbl = $("#attendanceTable");
					var jsonURL2 = window.contextRoot + '/json/attendance/'
							+ window.id;

					if (attendtbl.length) {

						attendtbl
								.DataTable({

									ajax : {
										url : jsonURL2,
										dataSrc : ''
									},
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

													str += "<button attId = '0' data-number = '0' class='fa fa-check fa-1x btn btn-default btn-sm' id = 'btnPresent_"
															+ row.id
															+ "'>"
															+ " Present</button>&nbsp;"

													str += "<button attId = '0' data-number = '0' class='fa fa-times fa-1x btn btn-default btn-sm' id = 'btnAbsent_"
															+ row.id
															+ "'>"
															+ " Absent</button>&nbsp;"

													str += "<button attId = '0' data-number = '0' class = 'fa fa-edit fa-1x btn btn-default btn-sm' id = 'btnEdit_"
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

																		// else
																		// if(btnPresent.attr('data-number')
																		// == 1)
																		// {
																		// updateAttendance(btnPresent.attr('attId'),function(data)
																		// {
																		// alert(data);
																		// });
																		// btnPresent.attr('data-number',2);
																		// btnPresent.text('Present');
																		//																	
																		// }
																		// else
																		// if(btnPresent.attr('data-number')
																		// == 2)
																		// {
																		// updateAttendance(btnPresent.attr('attId'),function(data)
																		// {
																		// alert(data);
																		// });
																		// btnPresent.attr('data-number',1);
																		// btnPresent.text('Absent');
																		//															
																		// }

																	})

													/*
													 * When ABSENT button is
													 * clicked
													 */

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
										window.contextRoot + "/add/attendance/"
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
												+ "/update/attendance/" + attId,
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
										window.contextRoot + "/add/attendance/"
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
																		});
																
															});
														
													
													absTeacher.on('click',function()
																{
																		teacherAbsent(row.id,function(data)
																				{
																					absTeacher.attr("btn_attid",data);
																					absTeacher.prop("disabled",true);
																					presentTeacher.prop("disabled",true);
																				});
																});
														
													editTeacher.on('click',function()
															{
																alert ("edited");
															});
													
													
													
													return str;
											}
										}
									]
								
							});
							
							function teacherPresent(taId,callback)
							{
								var url = window.contextRoot + "/add/teacher/attendance/" + taId + "?abs=false";
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
								var url = window.contextRoot + "/add/teacher/attendance/" + taId + "?abs=true";
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
							
						}

					
					
					
					
				});