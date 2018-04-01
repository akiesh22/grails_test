<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
    <script src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>

</head>

<body>

<g:render template="bookTemplate" model="[message: message]" />
%{--http://localhost:8080/Book/Book/Index?a=something&b=12345--}%
<g:link controller="book" action="index" params="[sort  : 'title', order: 'asc']">  Book List </g:link>

<p>Say ${params.sort}</p>

<p>count to 5, please: ${params.b}</p>

<div id="m">
    ${message}
</div>
<g:if test="${Book != null}">
    <g:select optionKey="id" optionValue="name" name="Book.Name" from="${Book}"/>
</g:if>
<g:form>
    <g:textField name="name"></g:textField>
    <g:textField name="author"></g:textField>
    <g:submitToRemote value="Save" url="[controller: 'book', action: 'save']"
                      onSuccess="fillValue(data)"></g:submitToRemote>
</g:form>

<table id="myTable">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Author</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
</table>

<g:javascript>
    $(document).ready(function(){
            var URL="${createLink(controller: 'book', action: 'index')}";
            $.ajax({
                url:URL,
                success: function(resp){
                    fillValue(resp)
                }
            });
    });
    function fillValue(data) {
        $('#myTable').DataTable({
            "bDestroy": true,
            "order": [[ 1, "desc" ]],
            "aaData" : data,
            "columns" : [ {
                "data" : "id"
            }, {
                "data" : "name"
            }, {
                "data" : "author"
            }]
        })
}

</g:javascript>
</body>
</html>
