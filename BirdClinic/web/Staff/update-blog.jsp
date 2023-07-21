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
            <div class="container-fluid pt-5">
                <div class="d-flex flex-column text-center mb-5">
                    <h4 class="text-secondary mb-3">Bird Blog</h4>
                    <h1 class="display-4 m-0"><span class="text-primary">Write</span> new Blog</h1>
                </div>
                <form class="row flex-column" id="editorForm" action="<c:url value="/Blog/Update"/>" method="post">
                    <div class="row">
                        <div class="mb-5 form-group col-md-2" >
                            <label for="thumbnail">Thumbnail</label>
                            <input class="form-control-file" type="file" id="thumbnail" value=""/>
                        </div>
                        <div class="mb-5 form-group col-md-7" >
                            <label for="title">Title</label>
                            <input class="form-control" type="text" id="title" name="blog-title" value="${blog.title}"/>
                        </div>
                        <div class="mb-5 form-group col-md-3" >
                            <label for="category">Category</label>
                            <input class="form-control" type="text" id="category" name="category" value="${blog.category}"/>
                        </div>
                    </div>
                    <div class="mb-5 form-group " >
                        <label for="description">Description</label>
                        <textarea class="form-control" rows="3" type="text" id="description" name="_description" >${blog.description}</textarea>
                    </div>
                    <div class="mb-5 form-group ">
                        <label for="editor">Content</label>
                        <textarea id="editor" class="editor" style="" name="blog-content" >${blog.blogContent}</textarea>
                    </div>


                    <input class="btn btn-primary" type="submit" value="Submit" />

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
                                this.submit();
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
