$(document)
		.ready(
				function() {

					var json = window.contextRoot + '/json/' + window.stdId
							+ '/student';

					var table = $("#viewClass");
					if (table.length) {

						table.DataTable({
							lengthMenu : [ [ 3, 5, 10, -1 ],
									[ "Three", "Five", "Ten", "All" ] ],
							ajax : {
								url : json,
								dataSrc : ''
							},
							columns : [ {
								data : 'rollNo'
							}, {

								data : 'fname'

							}, {
								data : 'tempAddress'
							}, 
							{
								data : 'id',
								mRender : function(data,type,row)
								{
									var str = '';
									var link = window.contextRoot + "/view/student" + data;
									str += '<a class = "btn btn-danger" href= " '+window.contextRoot+'/admin/view/student/'+data+'  " >View </a> ';
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

													str += "<button attId = '0' data-number = '0' class='btn btn-default btn-sm' id = 'btnPresent_"
															+ row.id
															+ "'>"
															+ "Present</button>&nbsp;"

//													str += "<button attId = '0' data-number = '0' class='btn btn-default btn-sm' id = 'btnAbsent_"
//															+ row.id
//															+ "'>"
//															+ "Absent</button>&nbsp;"

													var btnPresent = $('#btnPresent_'
															+ row.id);
													var btnAbsent = $('#btnAbsent_'
															+ row.id);

													
													btnPresent
													.on('click',function() {
																
														
														if(btnPresent.attr('data-number') == 0)
															{
																setToPresent(row.id,function(data)
																		{
																			btnPresent.attr('attId',data);
																			alert(data);
																		});
																btnPresent.attr('data-number',1); 
																btnPresent.text('Absent');
																
															}
														else if(btnPresent.attr('data-number') == 1)
																{
																	updateAttendance(btnPresent.attr('attId'),function(data)
																			{
																				alert(data);
																			});
																	btnPresent.attr('data-number',2); 
																	btnPresent.text('Present');
																	
																}
														else if(btnPresent.attr('data-number') == 2)
														{
															updateAttendance(btnPresent.attr('attId'),function(data)
																	{
																		alert(data);
																	});
															btnPresent.attr('data-number',1); 
															btnPresent.text('Absent');
															
														}
																	
																
															})
													
													
													btnAbsent
															.on('click',function() {
																	
																	if(btnAbsent.attr('data-number') == 0)
																		{
																			setToAbsent(row.id);
																			btnAbsent.attr("disabled",true);
																			
																		}
																	
																	})

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
								rollNo:
									{
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
								fatherName :
									{
										required : true,
										minlength : 3
									},
									motherName :
									{
										required : true,
										minlength : 3
									},
									tempAddress :
									{
										required : false,
										minlength : 3
									},
									permAddress :
									{
										required : true,
										minlength : 3
									},
									localGuardian :
									{
										required : true,
										minlength : 3
									},localNumber : {
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
								fatherName :
								{
									required : "* Last Name is required",
									minlength : "The minimum length is 3"
								},
								motherName :
								{
									required : "* Last Name is required",
									minlength : "The minimum length is 3"
								},
								tempAddress :
								{
									required : "* Last Name is required",
									minlength : "The minimum length is 3"
								},
								permAddress :
								{
									required : "* Last Name is required",
									minlength : "The minimum length is 3"
								},
								localGuardian :
								{
									required : "* Last Name is required",
									minlength : "The minimum length is 3"
								},number : {
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

					
					function setToPresent(row_id,callback)
					{
						$.post(window.contextRoot+ "/add/attendance/" + row_id +"?abs=false",
								function(data) 
								{
									if(data == "can't save")
										{
											alert("Could not save data");
										}
									else
										{
											callback(data);
										}
								
								});
					}
					
					
					function updateAttendance(attId)
					{
						$.post(window.contextRoot+ "/update/attendance/" + attId ,
								function(data) 
								{
									alert(data);
								});
					}
					
					
					function setToAbsent(row_id,callback)
					{
						$.post(window.contextRoot+ "/add/attendance/" + row_id+"?abs=true",
								function(data) 
								{
									callback();
									
								});
					}
					
				});