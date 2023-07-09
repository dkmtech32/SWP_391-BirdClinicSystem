<%-- 
    Document   : add-blog
    Created on : Jul 9, 2023, 5:17:47 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../Common/head.jsp"/>
    <body>
        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <!-- Header -->
            <jsp:include page="../Common/header.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="../Common/breadcrumb.jsp"/>
            <!-- /Breadcrumb -->
            <div class="container-fluid">
                <div class="row flex-nowrap">
                    <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                        <section class="form-head">
                            <div class="heading d-flex align-items-center">
                                <svg
                                    width="40"
                                    height="40"
                                    viewBox="0 0 19 19"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                                    >
                                <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M18.136 1.91515C18.136 1.57682 17.9538 1.25189 17.6299 1.01251C17.3061 0.773121 16.8665 0.638428 16.4087 0.638428C13.0993 0.638428 5.90001 0.638428 2.59055 0.638428C2.13283 0.638428 1.69323 0.773121 1.36937 1.01251C1.04551 1.25189 0.863281 1.57682 0.863281 1.91515C0.863281 5.12099 0.863281 13.4995 0.863281 16.9715C0.863281 17.2294 1.07401 17.4624 1.39615 17.5613C1.71915 17.6596 2.09051 17.6054 2.33751 17.4228C2.81855 17.0672 3.32637 16.6919 3.70724 16.4104C4.04405 16.1614 4.5916 16.1614 4.92842 16.4104C5.34124 16.7155 5.88533 17.1177 6.29814 17.4228C6.63496 17.6718 7.18251 17.6718 7.51933 17.4228C7.93387 17.1164 8.48056 16.7123 8.89425 16.4065C9.22934 16.1589 9.77255 16.1569 10.1102 16.4027C10.5343 16.711 11.0974 17.1202 11.5223 17.4286C11.8617 17.675 12.4058 17.6724 12.7409 17.4228C13.1485 17.1196 13.684 16.7206 14.0933 16.4155C14.2557 16.2948 14.4759 16.2272 14.7065 16.2272C14.9362 16.2265 15.1573 16.2948 15.3188 16.4155C15.6936 16.6938 16.1885 17.0628 16.6592 17.4132C16.9062 17.5971 17.2776 17.652 17.6014 17.5537C17.9253 17.4554 18.136 17.2224 18.136 16.9632C18.136 13.4873 18.136 5.11843 18.136 1.91515Z"
                                    fill="white"
                                    />
                                <path
                                    fill-rule="evenodd"
                                    clip-rule="evenodd"
                                    d="M4.31818 16.8616L5.68791 17.8741C6.36241 18.3726 7.45577 18.3726 8.13027 17.8741L9.50519 16.8578L10.9172 17.8836C11.5952 18.3765 12.6842 18.3713 13.3544 17.8728L14.7069 16.8655L16.0472 17.8632C16.5404 18.2303 17.2839 18.3407 17.9308 18.1441C18.5777 17.9468 19 17.4808 19 16.9631V1.91508C19 1.40694 18.7271 0.919874 18.2409 0.561116C17.7555 0.20172 17.0965 0 16.4091 0C13.0996 0 5.90036 0 2.59091 0C1.90345 0 1.2445 0.20172 0.759134 0.561116C0.272907 0.919874 0 1.40694 0 1.91508V16.9714C0 17.4879 0.420578 17.9532 1.06658 18.1511C1.71171 18.3484 2.45446 18.2392 2.94846 17.8741L4.31818 16.8616ZM17.2727 16.9638L15.9324 15.9654C15.6076 15.7241 15.1663 15.5881 14.706 15.5887C14.2457 15.5887 13.8044 15.7247 13.4805 15.966L12.128 16.9733L10.716 15.9475C10.0398 15.456 8.95419 15.4598 8.28401 15.9552L6.90909 16.9714L5.53936 15.959C4.86486 15.4604 3.7715 15.4604 3.097 15.959L1.72727 16.9714C1.72727 13.4994 1.72727 5.12092 1.72727 1.91508C1.72727 1.74591 1.81795 1.58313 1.98032 1.46376C2.14182 1.34375 2.36205 1.27672 2.59091 1.27672H16.4091C16.638 1.27672 16.8582 1.34375 17.0197 1.46376C17.182 1.58313 17.2727 1.74591 17.2727 1.91508V16.9638ZM4.31818 12.7672H5.18182C5.65855 12.7672 6.04545 12.4812 6.04545 12.1288C6.04545 11.7765 5.65855 11.4905 5.18182 11.4905H4.31818C3.84145 11.4905 3.45455 11.7765 3.45455 12.1288C3.45455 12.4812 3.84145 12.7672 4.31818 12.7672ZM8.63636 12.7672H14.6818C15.1585 12.7672 15.5455 12.4812 15.5455 12.1288C15.5455 11.7765 15.1585 11.4905 14.6818 11.4905H8.63636C8.15964 11.4905 7.77273 11.7765 7.77273 12.1288C7.77273 12.4812 8.15964 12.7672 8.63636 12.7672ZM4.31818 8.93703H5.18182C5.65855 8.93703 6.04545 8.65105 6.04545 8.29867C6.04545 7.9463 5.65855 7.66031 5.18182 7.66031H4.31818C3.84145 7.66031 3.45455 7.9463 3.45455 8.29867C3.45455 8.65105 3.84145 8.93703 4.31818 8.93703ZM8.63636 8.93703H14.6818C15.1585 8.93703 15.5455 8.65105 15.5455 8.29867C15.5455 7.9463 15.1585 7.66031 14.6818 7.66031H8.63636C8.15964 7.66031 7.77273 7.9463 7.77273 8.29867C7.77273 8.65105 8.15964 8.93703 8.63636 8.93703ZM4.31818 5.10687H5.18182C5.65855 5.10687 6.04545 4.82089 6.04545 4.46852C6.04545 4.11614 5.65855 3.83016 5.18182 3.83016H4.31818C3.84145 3.83016 3.45455 4.11614 3.45455 4.46852C3.45455 4.82089 3.84145 5.10687 4.31818 5.10687ZM8.63636 5.10687H14.6818C15.1585 5.10687 15.5455 4.82089 15.5455 4.46852C15.5455 4.11614 15.1585 3.83016 14.6818 3.83016H8.63636C8.15964 3.83016 7.77273 4.11614 7.77273 4.46852C7.77273 4.82089 8.15964 5.10687 8.63636 5.10687Z"
                                    fill="black"
                                    />
                                </svg>
                                <span style="padding-left: 2rem">Blogs</span>
                            </div>
                        </section>
                        <div class="container-fluid" style="padding: 0 2.5%">
                            <div class="forms-container">
                                <div class="forms-header">
                                    <div class="left-side"><b>Add new Blog</b></div>
                                </div>
                                <form class="addForm" action="AddBlogServlet" method="POST" enctype="multipart/form-data">
                                    <div class="form-formDetails">
                                        <div class="form-name">
                                            <div class="name">Blog Detail</div>
                                        </div>
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-lg-7">
                                                    <div class="mb-5">
                                                        <label for="title" class="form-label">Title:</label>
                                                        <input
                                                            type="text"
                                                            class="form-control"
                                                            id="title"
                                                            name="title"
                                                            placeholder="Enter title"
                                                            required
                                                            />
                                                    </div>
                                                </div>
                                                <div class="col-lg-5">
                                                    <div class="mb-5">
                                                        <label for="date" class="form-label">Date:</label>
                                                        <input type="date"
                                                               id="date"
                                                               name="date"
                                                               class="form-control"
                                                               placeholder="Enter date"
                                                               required
                                                               />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-7">
                                                    <div class="mb-5">
                                                        <label for="author" class="form-label">Author:</label>
                                                        <input type="text"
                                                               id="author"
                                                               name="author"
                                                               class="form-control"
                                                               placeholder="Enter author"
                                                               required
                                                               />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="mb-5">
                                                    <label for="briefinfo" class="form-label">Brief Info:</label>
                                                    <textarea id="briefinfo"
                                                              name="briefinfo"
                                                              class="form-control long-input"
                                                              placeholder="Enter brief info"
                                                              oninput="adjustTextareaHeight(this)"
                                                              onblur="trimTrailingSpaces(this)"
                                                              required
                                                              ></textarea>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="mb-5">
                                                    <label for="introduction" class="form-label">Introduction:</label>
                                                    <textarea id="introduction"
                                                              name="introduction"
                                                              class="form-control long-input"
                                                              placeholder="Enter introduction"
                                                              oninput="adjustTextareaHeight(this)"
                                                              onblur="trimTrailingSpaces(this)"
                                                              required></textarea>
                                                </div>
                                            </div>
                                            <div class="row mb-5">
                                                <div class="col-lg-5 mb-5">
                                                    <label for="thumbnail" class="form-label">Thumbnail:</label>
                                                    <input type="file"
                                                           id="thumbnail"
                                                           name="thumbnail"
                                                           class="form-control imgInput"
                                                           accept="image/*"
                                                           onchange="updateThumbnail(this)"
                                                           required/>
                                                </div>
                                                <div class="img-container d-flex justify-content-center">
                                                    <img class="showImg" src="" alt="">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="mb-5">
                                                    <label for="content1" class="form-label">Content 1:</label>
                                                    <textarea id="content1"
                                                              name="content1"
                                                              class="form-control long-input"
                                                              placeholder="Enter content 1"
                                                              oninput="adjustTextareaHeight(this)"
                                                              onblur="trimTrailingSpaces(this)"
                                                              required></textarea>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="mb-5">
                                                    <label for="content2" class="form-label">Content 2:</label>
                                                    <textarea id="content2"
                                                              name="content2"
                                                              class="form-control long-input"
                                                              placeholder="Enter content 2"
                                                              oninput="adjustTextareaHeight(this)"
                                                              onblur="trimTrailingSpaces(this)"
                                                              required></textarea>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="mb-5">
                                                    <label for="inconclusion" class="form-label">Conclusion:</label>
                                                    <textarea id="inconclusion"
                                                              name="inconclusion"
                                                              class="form-control long-input"
                                                              placeholder="Conclusion"
                                                              oninput="adjustTextareaHeight(this)"
                                                              onblur="trimTrailingSpaces(this)"
                                                              required></textarea>
                                                </div>
                                            </div>
                                            <div class="row mb-5">
                                                <div class="col-lg-5 mb-5">
                                                    <label for="contentIMG" class="form-label">Content Image:</label>
                                                    <input type="file"
                                                           id="contentIMG"
                                                           name="contentIMG"
                                                           class="form-control imgInput"
                                                           accept="image/*"
                                                           onchange="updateThumbnail(this)"
                                                           required>
                                                </div>
                                                <div class="img-container d-flex justify-content-center">
                                                    <img class="showImg" src="" height="50px" width="50px" alt="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="forms-footer">
                                        <div>
                                            <button type="submit" name="action" value="add_blog" class="btn update">Submit</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Main Wrapper -->

        <script>
            window.addEventListener('DOMContentLoaded', function () {
                var headerWidth = document.getElementById('headerPage').offsetWidth;
                var container = document.getElementById('containerPage');
                container.style.maxWidth = 'calc(100% - ' + headerWidth + 'px)';
            });
        </script>
        <!--show toast on forms-->
        <script>
            // Get all form elements using querySelectorAll
            var forms = document.querySelectorAll(".addForm");
            // Attach an event listener to each form's submit event
            forms.forEach(function (form) {
                form.addEventListener("submit", function (event) {
                    // Prevent the default form submission behavior
                    event.preventDefault();
                    // Show success toast
                    Toastify({
                        text: "Submit success",
                        position: "center",
                        close: true,
                        gravity: "top",
                        duration: 3000,
                        style: {
                            fontSize: "2rem",
                            background: "linear-gradient(to right, #00b09b, #96c93d)"
                        },
                        onClick: function () {
                            form.submit();
                        }
                    }).showToast();
                    setTimeout(function () {
                        form.submit();
                    }, 1000);
                });
            });
        </script>
        <!--update image-->
        <script>
            function updateThumbnail(input) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    var showImg = input.parentNode.parentNode.querySelector('.img-container').querySelector('.showImg');
                    showImg.src = e.target.result;
                };

                if (input.files && input.files[0]) {
                    reader.readAsDataURL(input.files[0]);
                }
            }

            var imgInputs = document.getElementsByClassName("imgInput");
            for (var i = 0; i < imgInputs.length; i++) {
                var imgInput = imgInputs[i];
                imgInput.onchange = function () {
                    updateThumbnail(this);
                };
            }
        </script>
        <!--adjust textrea height-->
        <script>
            function adjustTextareaHeight(textarea) {
                textarea.style.height = "auto";
                textarea.style.height = textarea.scrollHeight + "px";
            }

            var textareas = document.getElementsByClassName("long-input");
            for (var i = 0; i < textareas.length; i++) {
                adjustTextareaHeight(textareas[i]);
            }
        </script>
        <!--remove trailing space-->
        <script>
            function trimTrailingSpaces(textarea) {
                textarea.value = textarea.value.trim();
                adjustTextareaHeight(textarea);
            }
        </script>
        <!--toast-->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <!--bs5-->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
        <!-- Script -->
        <jsp:include page="../Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
