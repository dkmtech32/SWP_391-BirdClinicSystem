<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <jsp:include page="../Common/head.jsp" />

<body>
    <!-- Main Wrapper -->
    <div class="main-wrapper">
        <!-- Header -->
        <jsp:include page="../Common/header.jsp" />
        <!-- /Header -->

        <!-- Breadcrumb -->
        <jsp:include page="../Common/breadcrumb.jsp" />
        <!-- /Breadcrumb -->

        <!-- Page Content -->
        <div class="container">
            <form id="editorForm" action="<c:url value="/Staff/Blog/Write"/>" method="post">
                <div id="editor" class="editor"></div>
                <input type="submit" value="Submit" />
            </form>
        </div>

        <!-- Footer -->
        <jsp:include page="../Common/footer.jsp" />
        <!-- /Footer -->
    </div>
    <!-- /Main Wrapper -->

    <script>
    // Add a variable to track whether the editor is ready
    let editorReady = false;

    ClassicEditor
        .create(document.querySelector('#editor'))
        .then(editor => {
            // Set the editorReady flag to true when the editor is ready
            editorReady = true;

            // Add an event listener to submit the form when it's ready
            document.getElementById('editorForm').addEventListener('submit', function (event) {
                event.preventDefault(); // Prevent default form submission

                // Check if the editor is ready before proceeding
                if (editorReady) {
                    // Get the editor content
                    const editorData = editor.getData();

                    // Add the editor content to a hidden input field for submission
                    const hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name = 'editorContent'; // Specify the parameter name for the editor content in the servlet
                    hiddenInput.value = editorData;
                    console.log(hiddenInput.value);
                    this.appendChild(hiddenInput);

                    // Now submit the form
//                    this.submit();
                }
            });
        })
        .catch(error => {
            console.error(error);
        });
</script>


    <!-- Script -->
    <jsp:include page="../Common/script.jsp" />
    <!-- /Script -->
</body>
</html>
