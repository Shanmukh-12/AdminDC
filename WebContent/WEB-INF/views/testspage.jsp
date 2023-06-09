<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*, main.java.spring.mail.orm.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<title>Home</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">


</head>
<body>

	<jsp:include page="nav.jsp" />

		
				
			<div class="col-md-12">
				<table class="table mt-4">
					<thead>
								<h3 align="center">Test Details</h3>
								<tr>
									<th>Test Id</th>
									<th>Test Name</th>
									<th>Test Category</th>
									<th>Test Price</th>
									<th>Test Method</th>
									<th>From Range</th>
									<th>To Range</th>

								</tr>
							</thead>
					<%List<testmodel> slist =(List<testmodel>)request.getAttribute("tests"); %>
					
					<% 
					for(testmodel s:slist){
					%>
					<tbody>
						<tr>
							<td><%=s.getTest_id() %></td>
							<td><%=s.getTest_name() %></td>
							<td><%=s.getTest_category() %></td>
							<td><%=s.getTest_price()%></td>
							<td><%=s.getTest_method()%></td>
								<td><%=s.getTest_fromrange()%></td>
								<td><%=s.getTest_torange()%></td>
							
							<td>
								<button class="btn btn-primary" onclick="getspec('<%=s.getTest_id() %>')">Edit</button>
								<button class="btn btn-danger" onclick="delspec('<%=s.getTest_id() %>')">Delete</button>
							</td>
						</tr>
						<%} %>
						</tbody>
				</table>
			</div>

								<!-- Add more rows here -->
							</tbody>
						</table>
						<center>
						<button id="btn">Add</button>
						<div class="col-md-9">
					
					<form id="testform" style="display: none;" action="savetest"
						method="post">

						<center>
							<h1>New Test Details</h1>
						</center>


						<div class="form-group">
							<label for="test_name" class="form-label">Test Name</label> <input
								type="text" name="test_name" id="test_name" class="form-control"
								required>
						</div>

						<div class="form-group">
							<label for="test_category" class="form-label">Test
								category</label> <input type="text" name="test_category"
								id="test_category" class="form-control" required>
						</div>

						<div class="form-group">
							<label for="test_price" class="form-label">Test Price</label> <input
								type="text" name="test_price" id="test_price"
								class="form-control" required>
						</div>

						<div class="form-group">
							<label for="test_method" class="form-label">Method</label> <input
								type="text" name="test_method" id="test_method"
								class="form-control" required>
						</div>

						<div class="form-group">
							<label for="test_fromrange" class="form-label">Normal
								Range From</label> <input type="text" name="test_fromrange"
								id="test_fromrange" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="test_torange" class="form-label">Normal Range
								To</label> <input type="text" name="test_torange" id="test_torange"
								class="form-control" required>
						</div>

						<button type="submit" class="btn btn-primary btn-block">Add</button>

					</form>


				</div>

						
					</center>

					

			</div>
		</div>
	</div>
	</div>

	<script>
		const btn = document.getElementById('btn');

		btn.addEventListener('click', () => {
		  const form = document.getElementById('testform');

		  if (form.style.display === 'none') {
		   
		    form.style.display = 'block';
		  } else {
		  
		    form.style.display = 'none';
		  }
		});</script>
		
	<button type="button" class="btn btn-primary" id="show-btn" onclick="showForm()">Add
		Specialization</button>
	<div id="specializationForm" style="display:none;">
		<form>
			<div class="form-group">
				<label for="idInput">ID</label> <input type="text"
					class="form-control" id="idInput" required>
			</div>
			<div class="form-group">
				<label for="titleInput">Title</label> <input type="text"
					class="form-control" id="titleInput" required>
			</div>
			<div class="form-group">
				<label for="descriptionInput">Description</label> <input type="text"
					class="form-control" id="descriptionInput" required>
			</div>
			<button type="submit" id="updatebtn" class="btn btn-primary">Add</button>
		</form>
	</div>

</body>
<script>

	$('#show-btn').click(function()
			{
		$('#idInput').val('');
		$('#titleInput').val('');
		$('#descriptionInput').val('');

		$('#specializationForm').toggle();
			});
	
	function getspec(specid)
	{
		$.ajax({
			url : "./getspec",
			method:"post",
			data:{
				id:specid
			},
			success : function(spec) {
				spec=JSON.parse(spec);
				console.log(typeof(spec));
				$('#idInput').val(spec.test_id);
				$('#titleInput').val(spec.test_name);
				$('#descriptionInput').val(spec.test_category);
				$('#specializationForm').show();
				$('#updatebtn').text('update');
			}
		});
	}
	</script>
</html>