

(function ($) {
    "use strict";

    // Stick Sidebar

    if ($(window).width() > 767) {
        if ($('.theiaStickySidebar').length > 0) {
            $('.theiaStickySidebar').theiaStickySidebar({
                // Settings
                additionalMarginTop: 30
            });
        }
    }

// Sidebar
    if ($(window).width() <= 991) {
        var Sidemenu = function () {
            this.$menuItem = $('.main-nav a');
        };

        function init() {
            var $this = Sidemenu;
            $('.main-nav a').on('click', function (e) {
                if ($(this).parent().hasClass('has-submenu')) {
                    e.preventDefault();
                }
                if (!$(this).hasClass('submenu')) {
                    $('ul', $(this).parents('ul:first')).slideUp(350);
                    $('a', $(this).parents('ul:first')).removeClass('submenu');
                    $(this).next('ul').slideDown(350);
                    $(this).addClass('submenu');
                } else if ($(this).hasClass('submenu')) {
                    $(this).removeClass('submenu');
                    $(this).next('ul').slideUp(350);
                }
            });
            //$('.main-nav li.has-submenu a.active').parents('li:last').children('a:first').addClass('active').trigger('click');
        }

        // Sidebar Initiate
        init();
    }

    // Textarea Text Count

    var maxLength = 100;
    $('#review_desc').on('keyup change', function () {
        var length = $(this).val().length;
        length = maxLength - length;
        $('#chars').text(length);
    });

    // Select 2

    if ($('.select').length > 0) {
        $('.select').select2({
            minimumResultsForSearch: -1,
            width: '100%'
        });
    }

    // Date Time Picker

    if ($('.datetimepicker').length > 0) {
        $('.datetimepicker').datetimepicker({
            format: 'DD/MM/YYYY',
            icons: {
                up: "fas fa-chevron-up",
                down: "fas fa-chevron-down",
                next: 'fas fa-chevron-right',
                previous: 'fas fa-chevron-left'
            }
        });
    }

    // Fancybox Gallery

    if ($('.clinic-gallery a').length > 0) {
        $('.clinic-gallery a').fancybox({
            buttons: [
                "thumbs",
                "close"
            ],
        });
    }

    // Floating Label

    if ($('.floating').length > 0) {
        $('.floating').on('focus blur', function (e) {
            $(this).parents('.form-focus').toggleClass('focused', (e.type === 'focus' || this.value.length > 0));
        }).trigger('blur');
    }

    // Mobile menu sidebar overlay

    $('body').append('<div class="sidebar-overlay"></div>');
    $(document).on('click', '#mobile_btn', function () {
        $('main-wrapper').toggleClass('slide-nav');
        $('.sidebar-overlay').toggleClass('opened');
        $('html').addClass('menu-opened');
        return false;
    });

    $(document).on('click', '.sidebar-overlay', function () {
        $('html').removeClass('menu-opened');
        $(this).removeClass('opened');
        $('main-wrapper').removeClass('slide-nav');
    });

    $(document).on('click', '#menu_close', function () {
        $('html').removeClass('menu-opened');
        $('.sidebar-overlay').removeClass('opened');
        $('main-wrapper').removeClass('slide-nav');
    });

    // Mobile Menu

    /*if($(window).width() <= 991){
     mobileSidebar();
     } else {
     $('html').removeClass('menu-opened');
     }*/

    /*function mobileSidebar() {
     $('.main-nav a').on('click', function(e) {
     $('.dropdown-menu').each(function() {
     if($(this).hasClass('show')) {
     $(this).slideUp(350);
     }
     });
     if(!$(this).next('.dropdown-menu').hasClass('show')) {
     $(this).next('.dropdown-menu').slideDown(350);
     }
     
     });
     }*/

    // Tooltip

    if ($('[data-toggle="tooltip"]').length > 0) {
        $('[data-toggle="tooltip"]').tooltip();
    }

    // Add More Hours

    $(".hours-info").on('click', '.trash', function () {
        $(this).closest('.hours-cont').remove();
        return false;
    });

    $(".add-hours").on('click', function () {

        var hourscontent = '<div class="row form-row hours-cont">' +
                '<div class="col-12 col-md-10">' +
                '<div class="row form-row">' +
                '<div class="col-12 col-md-6">' +
                '<div class="form-group">' +
                '<label>Start Time</label>' +
                '<select class="form-control">' +
                '<option>-</option>' +
                '<option>12.00 am</option>' +
                '<option>12.30 am</option>' +
                '<option>1.00 am</option>' +
                '<option>1.30 am</option>' +
                '</select>' +
                '</div>' +
                '</div>' +
                '<div class="col-12 col-md-6">' +
                '<div class="form-group">' +
                '<label>End Time</label>' +
                '<select class="form-control">' +
                '<option>-</option>' +
                '<option>12.00 am</option>' +
                '<option>12.30 am</option>' +
                '<option>1.00 am</option>' +
                '<option>1.30 am</option>' +
                '</select>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="col-12 col-md-2"><label class="d-md-block d-sm-none d-none">&nbsp;</label><a href="#" class="btn btn-danger trash"><i class="far fa-trash-alt"></i></a></div>' +
                '</div>';

        $(".hours-info").append(hourscontent);
        return false;
    });

    // Content div min height set

    function resizeInnerDiv() {
        var height = $(window).height();
        var header_height = $(".header").height();
        var footer_height = $(".footer").height();
        var setheight = height - header_height;
        var trueheight = setheight - footer_height;
        $(".content").css("min-height", trueheight);
    }

    if ($('.content').length > 0) {
        resizeInnerDiv();
    }

    $(window).resize(function () {
        if ($('.content').length > 0) {
            resizeInnerDiv();
        }
        /*if($(window).width() <= 991){
         mobileSidebar();
         } else {
         $('html').removeClass('menu-opened');
         }*/
    });

    // Slick Slider

    if ($('.specialities-slider').length > 0) {
        $('.specialities-slider').slick({
            dots: true,
            autoplay: false,
            infinite: true,
            variableWidth: true,
            prevArrow: false,
            nextArrow: false
        });
    }

    if ($('.doctor-slider').length > 0) {
        $('.doctor-slider').slick({
            dots: false,
            autoplay: false,
            infinite: false,
            swipe: true,
            variableWidth: true,
            // draggable: true,
            slidesToScroll: 2,
            arrows: true,
            initialSlide: 0


        });
    }
    if ($('.features-slider').length > 0) {
        $('.features-slider').slick({
            dots: true,
            infinite: true,
            centerMode: true,
            slidesToShow: 3,
            speed: 500,
            variableWidth: true,
            arrows: false,
            autoplay: false,
            responsive: [{
                    breakpoint: 992,
                    settings: {
                        slidesToShow: 1
                    }

                }]
        });
    }

    // Date Time Picker

    if ($('.datepicker').length > 0) {
        $('.datepicker').datetimepicker({
            viewMode: 'years',
            showTodayButton: true,
            format: 'DD-MM-YYYY',
            // minDate:new Date(),
            widgetPositioning: {
                horizontal: 'auto',
                vertical: 'bottom'
            }
        });
    }

    // Chat

    var chatAppTarget = $('.chat-window');
    (function () {
        if ($(window).width() > 991)
            chatAppTarget.removeClass('chat-slide');

        $(document).on("click", ".chat-window .chat-users-list a.media", function () {
            if ($(window).width() <= 991) {
                chatAppTarget.addClass('chat-slide');
            }
            return false;
        });
        $(document).on("click", "#back_user_list", function () {
            if ($(window).width() <= 991) {
                chatAppTarget.removeClass('chat-slide');
            }
            return false;
        });
    })();

    // Circle Progress Bar

    function animateElements() {
        $('.circle-bar1').each(function () {
            var elementPos = $(this).offset().top;
            var topOfWindow = $(window).scrollTop();
            var percent = $(this).find('.circle-graph1').attr('data-percent');
            var animate = $(this).data('animate');
            if (elementPos < topOfWindow + $(window).height() - 30 && !animate) {
                $(this).data('animate', true);
                $(this).find('.circle-graph1').circleProgress({
                    value: percent / 100,
                    size: 400,
                    thickness: 30,
                    fill: {
                        color: '#da3f81'
                    }
                });
            }
        });
        $('.circle-bar2').each(function () {
            var elementPos = $(this).offset().top;
            var topOfWindow = $(window).scrollTop();
            var percent = $(this).find('.circle-graph2').attr('data-percent');
            var animate = $(this).data('animate');
            if (elementPos < topOfWindow + $(window).height() - 30 && !animate) {
                $(this).data('animate', true);
                $(this).find('.circle-graph2').circleProgress({
                    value: percent / 100,
                    size: 400,
                    thickness: 30,
                    fill: {
                        color: '#68dda9'
                    }
                });
            }
        });
        $('.circle-bar3').each(function () {
            var elementPos = $(this).offset().top;
            var topOfWindow = $(window).scrollTop();
            var percent = $(this).find('.circle-graph3').attr('data-percent');
            var animate = $(this).data('animate');
            if (elementPos < topOfWindow + $(window).height() - 30 && !animate) {
                $(this).data('animate', true);
                $(this).find('.circle-graph3').circleProgress({
                    value: percent / 100,
                    size: 400,
                    thickness: 30,
                    fill: {
                        color: '#1b5a90'
                    }
                });
            }
        });
    }

    if ($('.circle-bar').length > 0) {
        animateElements();
    }
    $(window).scroll(animateElements);

})(jQuery);
//
//$(document).ready(function() {
//	// When the user selects a specialty
//	$("#specialty-selector").on("change", function() {
//	  var selectedSpecialty = $(this).val();
//	  
//	  if(selectedSpecialty == 'general'){
//		
//		$(".doctor-slider").slick('slickUnfilter');
//		
//		$(".doctor-slider").slick('slickFilter','.general');
//		$('.doctor-slider').slick({			
//			infinite: false
//		});
//	  }
//	  else if(selectedSpecialty == 'genetics'){
//		$(".slider").slick('slickUnfilter');
//		$(".slider").slick('slickFilter','.genetics');
//		$('.doctor-slider').slick({			
//			infinite: false
//		});
//	  }
//	  else if(selectedSpecialty == 'resuscitation'){
//		$(".slider").slick('slickUnfilter');
//		$(".slider").slick('slickFilter','.resuscitation');
//		$('.doctor-slider').slick({			
//			infinite: false
//		});
//	  }
//	  else if(selectedSpecialty == 'beautify'){
//		$(".slider").slick('slickUnfilter');
//		$(".slider").slick('slickFilter','.beautify');
//		$('.doctor-slider').slick({			
//			infinite: false
//		});
//	  }
//	  else if(selectedSpecialty == 'surgery'){
//		$(".slider").slick('slickUnfilter');
//		$(".slider").slick('slickFilter','.surgery');
//		$('.doctor-slider').slick({			
//			infinite: false
//		});
//	  }
//          else if(selectedSpecialty == 'image analysation'){
//		$(".slider").slick('slickUnfilter');
//		$(".slider").slick('slickFilter','.image analysation');
//		$('.doctor-slider').slick({			
//			infinite: false
//		});
//	  }
//	  else if(selectedSpecialty == 'all'){
//		
//		$(".slider").slick('slickUnfilter');
//		$('.doctor-slider').slick({			
//			infinite: true
//		});
//	  }
//	});
//  });
$('#specialty-selector').change(function () {
    var selectedSpecialty = $(this).val();

    if (selectedSpecialty === 'all') {
        // Show all doctors
        $('.profile-widget').parent().parent().show();
    } else {
        // Hide all doctors
        $('.profile-widget').parent().parent().hide();

        // Show doctors with the selected specialty
        $('.profile-widget[data-specialty="' + selectedSpecialty + '"]').parent().parent().show();
    }
});
// Filter doctor by specialty
// $(document).ready(function() {
// 	// When the specialty selector changes
// 	$('#specialty-selector').on('change', function() {
// 	  var selectedSpecialty = $(this).val();

// 	  // Show all doctors if no specialty is selected
// 	  if (selectedSpecialty === '') {
// 		$('.profile-widget').show();
// 	  } else {
// 		// Filter the doctors by specialty and show only those that match
// 		$('.profile-widget').filter(function() {
// 		  return $(this).data('specialty') === selectedSpecialty;
// 		}).show();

// 		// Hide the doctors that don't match
// 		$('.profile-widget').not('[data-specialty="' + selectedSpecialty + '"]').hide();
// 	  }
// 	});
//   });



//confirm deletion
function confirmDelete() {
    var result = confirm("Are you sure you want to delete?");
    if (result) {
        // User clicked 'OK', perform deletion here
        alert("Deleted successfully!");
    } else {
        // User clicked 'Cancel', do nothing or handle accordingly
        alert("Deletion canceled.");
    }
}

function toLowerCaseNonAccentVietnamese(str) {
    str = str.toLowerCase();
//     We can also use this instead of from line 11 to line 17
//     str = str.replace(/\u00E0|\u00E1|\u1EA1|\u1EA3|\u00E3|\u00E2|\u1EA7|\u1EA5|\u1EAD|\u1EA9|\u1EAB|\u0103|\u1EB1|\u1EAF|\u1EB7|\u1EB3|\u1EB5/g, "a");
//     str = str.replace(/\u00E8|\u00E9|\u1EB9|\u1EBB|\u1EBD|\u00EA|\u1EC1|\u1EBF|\u1EC7|\u1EC3|\u1EC5/g, "e");
//     str = str.replace(/\u00EC|\u00ED|\u1ECB|\u1EC9|\u0129/g, "i");
//     str = str.replace(/\u00F2|\u00F3|\u1ECD|\u1ECF|\u00F5|\u00F4|\u1ED3|\u1ED1|\u1ED9|\u1ED5|\u1ED7|\u01A1|\u1EDD|\u1EDB|\u1EE3|\u1EDF|\u1EE1/g, "o");
//     str = str.replace(/\u00F9|\u00FA|\u1EE5|\u1EE7|\u0169|\u01B0|\u1EEB|\u1EE9|\u1EF1|\u1EED|\u1EEF/g, "u");
//     str = str.replace(/\u1EF3|\u00FD|\u1EF5|\u1EF7|\u1EF9/g, "y");
//     str = str.replace(/\u0111/g, "d");
    str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
    str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
    str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
    str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
    str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
    str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
    str = str.replace(/đ/g, "d");
    // Some system encode vietnamese combining accent as individual utf-8 characters
    str = str.replace(/\u0300|\u0301|\u0303|\u0309|\u0323/g, ""); // Huyền sắc hỏi ngã nặng 
    str = str.replace(/\u02C6|\u0306|\u031B/g, ""); // Â, Ê, Ă, Ơ, Ư
    return str;
}

// This function keeps the casing unchanged for str, then perform the conversion
function toNonAccentVietnamese(str) {
      str = str.replace(/A|Á|À|Ã|Ạ|Â|Ấ|Ầ|Ẫ|Ậ|Ă|Ắ|Ằ|Ẵ|Ặ/g, "A");
      str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
      str = str.replace(/E|É|È|Ẽ|Ẹ|Ê|Ế|Ề|Ễ|Ệ/, "E");
      str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
      str = str.replace(/I|Í|Ì|Ĩ|Ị/g, "I");
      str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
      str = str.replace(/O|Ó|Ò|Õ|Ọ|Ô|Ố|Ồ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ỡ|Ợ/g, "O");
      str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
      str = str.replace(/U|Ú|Ù|Ũ|Ụ|Ư|Ứ|Ừ|Ữ|Ự/g, "U");
      str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
      str = str.replace(/Y|Ý|Ỳ|Ỹ|Ỵ/g, "Y");
      str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
      str = str.replace(/Đ/g, "D");
      str = str.replace(/đ/g, "d");
      // Some system encode vietnamese combining accent as individual utf-8 characters
      str = str.replace(/\u0300|\u0301|\u0303|\u0309|\u0323/g, ""); // Huyền sắc hỏi ngã nặng 
      str = str.replace(/\u02C6|\u0306|\u031B/g, ""); // Â, Ê, Ă, Ơ, Ư
      return str;
}

//blog
//$('.summernote').summernote({ dialogsInBody: true, });