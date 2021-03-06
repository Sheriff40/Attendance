



<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<script type="text/javascript">
	
	function pdfGen()
	{
			html2canvas(document.getElementById("pdfTable")).then(function(canvas) 
			{
				var img = canvas.toDataURL("image/png");
				var doc = new jsPDF();
				doc.addImage(img,'JPEG',0,0);
				doc.save('GeneratedPDF.pdf');
				
			});	
		
		
	}
	
	
	
</script>



<table class="table" id="pdfTable">
	<tr>
		<th>Roll No.</th>
		<th>Student Name</th>
		<th>Attendance</th>
		<th>Action</th>
	</tr>

	<c:forEach var="att" items="${attribute}">


		<tr>
			<td>${att.student.rollNo}</td>
			<td>${att.student.fname }</td>
			<td><c:choose>
					<c:when test="${att.status==true}">
						<button class="btn btn-success disabled"
							style="border: 1px solid black; border-radius: 20px; color: white;"
							id="btn_${att.id}">Present</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-danger disabled"
							style="border: 1px solid black; border-radius: 20px; color: white;"
							id="btn_${att.id}">Absent</button>
					</c:otherwise>
				</c:choose></td>
			<td><a href="javascript:void(0)" id="edit_${att.id}"
				class="fa fa-user-edit">Edit</a> <script>
						var edit = $('#edit_'+${att.id});
						
						edit.on('click',function(){
							var attId = ${att.id};
							var btn = $("#btn_"+attId);
							$.post( window.contextRoot + "/user/update/attendance/" + attId,function(data)
									{
										if(data == "present")
											{
											
														btn.removeClass("btn-danger");
														btn.addClass("btn-success");
														btn.text("Present");
														
												
											}
										else if(data == "absent")
											{
														btn.removeClass("btn-success");
														btn.addClass("btn-danger");
														btn.text("Absent");
											}
										
										
									})		
						});
						
					</script></td>
		</tr>
	</c:forEach>

</table>

<a href="javascript:pdfGen()" class="btn btn-danger fa fa-download">
	Download PDF</a>

