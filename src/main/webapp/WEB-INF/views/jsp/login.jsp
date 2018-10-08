<%@ include file="/common/customtag.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Firman Qodry - Starter Web Apps</title>
        
        <spring:url value="/resources/core/css/hello.css" var="coreCss" />
        <spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
        <link href="${bootstrapCss}" rel="stylesheet" />
        <link href="${coreCss}" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    login
                    <form method="post" action="" id="formLogin">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control"  id="username" name="username" placeholder="Enter username">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                        </div>
                          <button type="submit" class="btn btn-primary">Log In</button>
                    </form>
                </div>
            </div>
        </div>
        
        <spring:url value="/resources/core/js/hello.js" var="coreJs" />
        <spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs" />
        <spring:url value="/resources/extras/jspdf/js/jspdf.min.js" var="jsPdf" />
        <spring:url value="/resources/extras/html2canvas/js/html2canvas.min.js" var="html2canvas" />

        <script src="${coreJs}"></script>
        <script src="${bootstrapJs}"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="${jsPdf}"></script>
        <script src="${html2canvas}"></script>
    </body>
</html>
