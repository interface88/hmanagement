<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
<title>HMS-Login</title>

<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />

</head>
<body>

	<div  >
		<table class="maintble">
			<tr>
				<td align="center"><jsp:include page="common/Header.jsp" /></td>
			</tr>
			<tr style="height: 530px">
				<td
					style="background-image: url('images/bg.jpg'); background-repeat: repeat;  ">

					<div id="wrapper">
						<div id="login">
							<form action="login" method="post" autocomplete="on">
								<h1>Log in</h1>
								<p style="text-align: left;">
									<label for="username" class="uname" data-icon="u"> Your
										User Id </label> <input id="userId" name="userId"
										required="required" type="text" placeholder="username" />
								</p>
								<p style="text-align: left;">
									<label for="password" class="youpasswd" data-icon="p">
										Your password </label> <input id="password" name="password"
										required="required" type="password" placeholder="password" />
								</p >
								<p class="keeplogin" style="text-align: left;">
									<input type="checkbox" name="loginkeeping" id="loginkeeping"
										value="loginkeeping" /> <label for="loginkeeping">Keep
										me logged in</label>
								</p>

								<%
									String userName = (String) session.getAttribute("username");
									String errormsg = (String) session.getAttribute("ErrorMsg");
								%>
								<div style="color: #bb0000">
									<%
										if (errormsg != null) {
									%>
									<%=errormsg%>
									<%
										session.setAttribute("ErrorMsg", "");
										}
									%>
								</div>

								<p class="login button">
									<input type="submit" value="Login" />
								</p>

							</form>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td	><jsp:include
						page="common/Footer.jsp" /></td>
			</tr>

		</table>
	</div>

</body>
</html>