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
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${baseUrl}">Starter Web Apps</a>
                </div>
            </div>
            <ul class="nav justify-content-end">
                <li class="nav-item">
                    <a class="nav-link" href="" title="Home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="profile" title="Profile">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="gallery" title="Gallery">Gallery</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact" title="Contact">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-primary btn-sm" href="login" title="Login">Log In</a>
                </li>
            </ul>
        </nav>
        
        <div class="jumbotron">
            <div class="container">
                <h1>${title}</h1>
                <p>
                    <c:if test="${not empty name}">
                            Hello ${name}
                    </c:if>

                    <c:if test="${empty name}">
                            Welcome Welcome!
                    </c:if>
                </p>
            <p>
                <a class="btn btn-primary btn-lg" id="generatePdf" href="javascript:void(0)" role="button">Save As PDF</a>
                <a class="btn btn-warning btn-lg" id="saveAsPng" href="javascript:void(0)" role="button">Save As PNG</a>
            </p>
          </div>
        </div>
                
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h2>News 1</h2>
                    <p>ABC</p>
                    <p><a class="btn btn-default" href="#" role="button">View details</a></p>
                </div>
                <div class="col-md-4">
                    <h2>News 2</h2>
                    <p>ABC</p>
                    <p><a class="btn btn-default" href="#" role="button">View details</a></p>
                </div>
                <div class="col-md-4">
                    <h2>News 3</h2>
                    <p>ABC</p>
                    <p><a class="btn btn-default" href="#" role="button">View details</a></p>
                </div>
            </div>

            <hr>
            <footer>
                <p>&copy; Firman Qodry</p>
            </footer>
            <p id="notRender">don't print this to pdf</p>

            <canvas id="drawCanvas"></canvas>
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
        <script>
            $(document).ready(function(){
                $('#generatePdf').click(function(){
                    saveAsPdf();
                });

                $('#saveAsPng').click(function(){
                    saveAsPng();
                });
            });

            function saveAsPdf(){
                var doc = new jsPDF();

                // We'll make our own renderer to skip this editor
                var specialElementHandlers = {
                    '#notRender': function(element, renderer){
                        return true;
                    }
                };

                // All units are in the set measurement for the document
                // This can be changed to "pt" (points), "mm" (Default), "cm", "in"
                doc.fromHTML($('body').get(0), 15, 15, {
                    //'width': 1024, 
                    'elementHandlers': specialElementHandlers
                });

                doc.save("helloWorld.pdf");
            }

            function saveAsPng(){
                html2canvas(document.body).then(function(canvas) {
                    document.body.appendChild(canvas);
                });
            }
        </script>
    </body>
</html>
