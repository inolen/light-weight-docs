<html>
	<head>
		<title>example docs</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<style>
			body { padding-top: 50px; }
			h2, h3 { margin-top: -50px; padding-top: 50px; } /* fixed navbar anchor hack */
			#toc { position: fixed; }
			#toc ul { padding: 0 8px; }
			#toc ul ul { margin-left: 5px; padding: 0 8px; border-left: 1px solid #eee; }
			#content { margin-left: 180px; }
		</style>
	</head>
	<body>
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<a href="index.html" class="brand">example docs</a>
					<ul class="nav">
						<li><a href="index.html">Overview</a></li>
						<li><a href="standards.html">Standards</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div id="toc" class="span2">
					<%= toc %>
				</div>
				<div id="content" class="span10">
					<%= content %>
				</div>
			</div>
		</div>
	</body>
</html>