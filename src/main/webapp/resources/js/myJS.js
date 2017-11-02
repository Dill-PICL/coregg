//session
var session;
var session2;
var hostName = "http://"+window.location.hostname;
function setSession() {
    do {
        session = Math.floor(Math.random() * 100000); // random number
    } while (session >= 10000 || session <= 5000) // random number
    do {
        session2 = Math.floor(Math.random() * 100000); // random number
    } while (session2 >= 10000 || session2 <= 5000)
}

$(document).ready(function () {
    setSession();
    $('[data-toggle="tooltip"]').tooltip();
});
//checkbox
$('.sev_check').click(function () {
    $('.sev_check').not(this).prop('checked', false);
});

//single sample
Dropzone.autoDiscover = false;
var tpm = new Dropzone(document.querySelector('#upload_file'), {
    url: "uploadFile",
    uploadMultiple: false,
    parallelUploads: 1,
    addRemoveLinks: true,
    autoProcessQueue: false,
    maxFiles: 1
});
tpm.on('sending', function (file, xhr, formData) {
    if ($("input[name=tmp_column]").val() != "" && $("input[name=sample_name]").val() != "") {
        formData.append('from', "tpm");
        formData.append('column', $("input[name=tmp_column]").val());
        formData.append('sampleName', $("input[name=sample_name]").val());
        formData.append('session', session);
    }
});
tpm.on('removedfile', function (file, xhr, formData) {
    jQuery.ajax({
        type: "POST",
        url: 'deleteFile',
        data: {session: session},
        success: function () {
            setSession();
            tpm1.removeAllFiles();
            tpm2.removeAllFiles();
            prefile.removeAllFiles();
            $("input[name=tmp_column_2]").val("");
            $("input[name=sample_name_2]").val("");
            $("input[name=tmp_column_1]").val("");
            $("input[name=sample_name_1]").val("");
        }
    });
});
//dropzone hkg1
var hkg = new Dropzone(document.querySelector('#hkg_upload_file'), {
    url: "uploadFile",
    uploadMultiple: false,
    parallelUploads: 1,
    addRemoveLinks: true,
    autoProcessQueue: false,
    maxFiles: 1
});
hkg.on('sending', function (file, xhr, formData) {
    if ($("input[name=tmp_column]").val() != "" && $("input[name=sample_name]").val() != "") {
        formData.append('from', "hkg");
        formData.append('column', $("input[name=tmp_column]").val());
        formData.append('sampleName', $("input[name=sample_name]").val());
        formData.append('session', session);
    }
});

//cross samples
var tpm1 = new Dropzone(document.querySelector('#upload_file1'), {
    url: "uploadFile",
    uploadMultiple: false,
    parallelUploads: 1,
    addRemoveLinks: true,
    autoProcessQueue: false,
    maxFiles: 1
});
tpm1.on('sending', function (file, xhr, formData) {
    if ($("input[name=tmp_column_1]").val() != "" && $("input[name=sample_name_1]").val() != "") {
        formData.append('from', "tpm");
        formData.append('column', $("input[name=tmp_column_1]").val());
        formData.append('sampleName', $("input[name=sample_name_1]").val());
        formData.append('session', session);
    }
});
tpm1.on('removedfile', function (file, xhr, formData) {
    jQuery.ajax({
        type: "POST",
        url: 'deleteFile',
        data: {session: session},
        success: function () {
            setSession();
            tpm1.removeAllFiles();
            tpm2.removeAllFiles();
            prefile.removeAllFiles();
            $("input[name=tmp_column_2]").val("");
            $("input[name=sample_name_2]").val("");
            $("input[name=tmp_column_1]").val("");
            $("input[name=sample_name_1]").val("");
        }
    });
});
//dropzone hkg1
var hkg1 = new Dropzone(document.querySelector('#hkg_upload_file1'), {
    url: "uploadFile",
    uploadMultiple: false,
    parallelUploads: 1,
    addRemoveLinks: true,
    autoProcessQueue: false,
    maxFiles: 1
});
hkg1.on('sending', function (file, xhr, formData) {
    if ($("input[name=tmp_column_1]").val() != "" && $("input[name=sample_name_1]").val() != "") {
        formData.append('from', "hkg");
        formData.append('column', $("input[name=tmp_column_1]").val());
        formData.append('sampleName', $("input[name=sample_name_1]").val());
        formData.append('session', session);
    }
});
//dropzone tpm2
var tpm2 = new Dropzone(document.querySelector('#upload_file2'), {
    url: "uploadFile",
    uploadMultiple: false,
    parallelUploads: 1,
    addRemoveLinks: true,
    autoProcessQueue: false,
    maxFiles: 1
});
tpm2.on('sending', function (file, xhr, formData) {
    if ($("input[name=tmp_column_2]").val() != "" && $("input[name=sample_name_2]").val() != "") {
        formData.append('from', "tpm");
        formData.append('column', $("input[name=tmp_column_2]").val());
        formData.append('sampleName', $("input[name=sample_name_2]").val());
        formData.append('session', session2);
    }
});
tpm2.on('removedfile', function (file, xhr, formData) {
    jQuery.ajax({
        type: "POST",
        url: 'deleteFile',
        data: {session: session},
        success: function () {
            setSession();
            tpm1.removeAllFiles();
            tpm2.removeAllFiles();
            prefile.removeAllFiles();
            $("input[name=tmp_column_2]").val("");
            $("input[name=sample_name_2]").val("");
            $("input[name=tmp_column_1]").val("");
            $("input[name=sample_name_1]").val("");
        }
    });
});
//dropzone hkg1
var hkg2 = new Dropzone(document.querySelector('#hkg_upload_file2'), {
    url: "uploadFile",
    uploadMultiple: false,
    parallelUploads: 1,
    addRemoveLinks: true,
    autoProcessQueue: false,
    maxFiles: 1
});
hkg2.on('sending', function (file, xhr, formData) {
    if ($("input[name=tmp_column_1]").val() != "" && $("input[name=sample_name_2]").val() != "") {
        formData.append('from', "hkg");
        formData.append('column', $("input[name=tmp_column_2]").val());
        formData.append('sampleName', $("input[name=sample_name_2]").val());
        formData.append('session', session2);
    }
});
//dropzone pre-define file
var prefile = new Dropzone(document.querySelector('#pre-defined-file'), {
    url: "uploadFile",
    uploadMultiple: false,
    parallelUploads: 1,
    addRemoveLinks: true,
    autoProcessQueue: false,
    maxFiles: 1
});
prefile.on('sending', function (file, xhr, formData) {
    formData.append('from', "prefile");
    formData.append('column', -1);
    formData.append('sampleName', "");
    formData.append('session', session);
    if (tpm2.files.length != 0)
        formData.append('session2', session2);
});
prefile.on('success', function (file, responseText) {
    $("#resFrame").parent().hide();
    $("#resFrame2").parent().hide();
    $("#qFrameFormlabel").parent().hide();
    $("#resFrameFormlabel").hide();
    $("#resFrameFormlabel1").hide();
    $("#resFrameForm").hide();
    $("#resFrameForm1").hide();
    $("#resFrameName").hide();
    $("#resFrameText").hide();
    $("#qqFrameForm").hide();
    $("#qqFrame").parent().hide();
    $("#reset").parent().parent().parent().show();
    if (tpm.files.length != 0 || tpm1.files.length != 0) {
        setTimeout(function () {
            $("#resFrame2Name").hide();
            $("#resFrameForm").show();
            $("#qFrameFormlabel").parent().show();
            $("#qqFrameForm").show();
            $("#resFrameFormlabel").show();
            $("#resFrameName").text("Sample: " + $("input[name=sample_name_1]").val());
            $("#resFrameName").show();
            $("#resFrame").parent().show();
            $("#resFrame").attr("src", "/files/"+session+"/tpmimg.png?"+new Date());
            var f = document.getElementById('resFrame');
            f.src = f.src;
            jQuery.ajax({
                type: "POST",
                url: 'getGroupNameFile',
                data: {session: session},
                success: function (a, b, c) {
                    $("#GroupA").html("");
                    $("#GroupB").html("");
                    $("#qqGroup").html("");
                    json = JSON.parse(a);
                    for (j in json) {
                        v = json[j];
                        $("#GroupA").append('<option value=' + v + ' ">' + j + '</option>');
                        $("#GroupB").append('<option value=' + v + ' ">' + j + '</option>');
                        $("#qqGroup").append('<option value=' + v + ' ">' + j + '</option>');
                    }
                }
            });
        }, 5000); //wait for startup of shiny
    }
    if (tpm1.files.length != 0&&tpm2.files.length != 0) {
        setTimeout(function () {
            $("#resFrameFormlabel").hide();
            $("#resFrameForm").hide();
            $("#resFrame2").parent().show();
            $("#resFrameFormlabel1").show();
            $("#resFrameForm1").show();
            $("#qFrameFormlabel").hide();
            $("#qqFrameForm").hide();
            $("#qqFrame").parent().hide();
            $("#resFrame2Name").text("Sample: " + $("input[name=sample_name_2]").val());
            $("#resFrame2Name").show();
            $("#resFrame2").attr("src", "/files/"+session2+"/tpmimg.png?"+new Date());
            var f = document.getElementById('resFrame2');
            f.src = f.src;
            jQuery.ajax({
                type: "POST",
                url: 'getGroupNameFile',
                data: {session: session},
                success: function (a, b, c) {
                    $("#Group1A").html("");
                    json = JSON.parse(a);
                    for (j in json) {
                        v = json[j];
                        $("#Group1A").append('<option value=' + v + ' ">' + j + '</option>');
                    }
                }
            });
            jQuery.ajax({
                type: "POST",
                url: 'getGroupNameFile',
                data: {session: session2},
                success: function (a, b, c) {
                    $("#Group1B").html("");
                    json = JSON.parse(a);
                    for (j in json) {
                        v = json[j];
                        $("#Group1B").append('<option value=' + v + ' ">' + j + '</option>');
                    }
                }
            });
        },5000);
    }
});
//tab
$("#myTab li:not(.Step1)").hide();// hide other tabs at beginning
// button binding
function processUpload() {
    if (tpm.files.length != 0) {
        tpm.processQueue();
        hkg.processQueue();
    }
    else {
        if (tpm1.files.length != 0) {
            tpm1.processQueue();
            hkg1.processQueue();
        }
        if (tpm2.files.length != 0) {
            tpm2.processQueue();
            hkg2.processQueue();
        }
    }
}

$("#GotoFile").click(function (event, h, z) {
    processUpload();
    $("#myTab li").show()
    $("#myTab li:not(.Step2file)").hide();
    $("#pre-file-tab").trigger("click");
});
$("#GotoPaste").click(function (event, h, z) {
    processUpload();
    $("#myTab li").show()
    $("#myTab li:not(.Step2paste)").hide();
    $("#pre-paste-tab").trigger("click");
});
//text validation
// $("input[type=number]").onblur(function(){
//
// });
//step2 paste page
i = 1;
$("#add_row_pd").click(function () {
    $('#addr' + i).html("<td>" +
        "<input name='label" + i + "' type='text' placeholder='Gene Label' class='form-control' style='text-align: center;margin-top: 25%;'  /> " +
        "<button type='button' id='delete" + i + "' style='float: left;margin-left: 50px;' class='close delete' aria-label='Close'>\n" +
        "<span aria-hidden='true\'>&times;</span>\n" +
        "</button>" +
        "</td>" +
        "<td>" +
        "<input name='data" + i + "' type='text' placeholder='Genes Data' style='text-align: center;height: 100px;' class='form-control'>" +
        "</td>");

    $('#tab_logic').append('<tr id="addr' + (i + 1) + '"></tr>');

    $(".delete").click(function (a, h, z) {
        a.currentTarget.parentNode.parentNode.remove();
    });
    i++;
});
$(".delete_pd").click(function (a, h, z) {
    a.currentTarget.parentNode.parentNode.remove();
});
//step2 file upload
$(".backToStep1").click(function (event, h, z) {
    $("#myTab li").show()
    $("#myTab li:not(.Step1)").hide();
    $("#tpm-tab").trigger("click");
});

function reset() {
    //hide form 1
    $("#resFrame").parent().hide();
    $("#qqFrame").parent().hide();
    $("#qFrameFormlabel").parent().hide();
    $("#resFrameFormlabel").hide();
    $("#resFrameForm").hide();
    $("#resFrameText").hide();
    $("#resFrameName").hide();
    //hide form 2
    $("#resFrame2").parent().hide();
    $("#resFrame2Name").hide();
    $("#myTab li").show();
    $("#myTab li:not(.Step1)").hide();
    $("#tpm-tab").trigger("click");
    //reset button
    $("#reset").parent().parent().parent().hide();
    //textarea
    $("#resFrameText").hide();
    //delete files and reset inputs.
    if (tpm.files.length != 0) {
        jQuery.ajax({
            type: "POST",
            url: 'deleteFile',
            data: {session: session},
            success: function () {
                do {
                    session = Math.floor(Math.random() * 100000); // random number
                } while (session >= 49152 || session <= 10000) // random number
                tpm.removeAllFiles();
                hkg.removeAllFiles();
                prefile.removeAllFiles();
                $("input[name=tmp_column]").val("");
                $("input[name=sample_name]").val("");
            }
        });
    }
    if (tpm1.files.length != 0) {
        jQuery.ajax({
            type: "POST",
            url: 'deleteFile',
            data: {session: session},
            success: function () {
                do {
                    session = Math.floor(Math.random() * 100000); // random number
                } while (session >= 49152 || session <= 10000) // random number
                tpm.removeAllFiles();
                tpm.removeAllFiles();
                tpm1.removeAllFiles();
                tpm2.removeAllFiles();
                hkg1.removeAllFiles();
                hkg2.removeAllFiles();
                prefile.removeAllFiles();
                $("input[name=tmp_column_2]").val("");
                $("input[name=sample_name_2]").val("");
                $("input[name=tmp_column_1]").val("");
                $("input[name=sample_name_1]").val("");
            }
        });
    }
    if (tpm2.files.length != 0) {
        jQuery.ajax({
            type: "POST",
            url: 'deleteFile',
            data: {session: session2},
            success: function () {
                do {
                    session = Math.floor(Math.random() * 100000); // random number
                } while (session >= 49152 || session <= 10000) // random number
                tpm.removeAllFiles();
                tpm.removeAllFiles();
                tpm1.removeAllFiles();
                tpm2.removeAllFiles();
                prefile.removeAllFiles();
                hkg1.removeAllFiles();
                hkg2.removeAllFiles();
                $("input[name=tmp_column_2]").val("");
                $("input[name=sample_name_2]").val("");
                $("input[name=tmp_column_1]").val("");
                $("input[name=sample_name_1]").val("");
            }
        });
    }
}

$(window).bind('beforeunload', function () {
    reset();
});

$("#reset").click(function (event, h, z) {
    reset();
});

$("#processUL").click(function (event, h, z) {
    $("#myTab li").show();
    $("#myTab li:not(.Res)").hide();
    var res = "";
    if ($("#checkbox_sd").prop('checked')) {
        for (var k = 0; k < i; k++) {
            var key = $("input[name='label" + k + "']").val();
            var val = $("input[name='data" + k + "']").val();
            var vals = val.split(' ');
            vals.forEach(function (t) {
                res += t + ',' + key + '\n';
            });
        }
    }
    else {
        for (var k = 0; k < i; k++) {
            var key = $("input[name='label" + k + "']").val();
            var val = $("input[name='data" + k + "']").val();
            var vals = val.split(',');
            vals.forEach(function (t) {
                res += t + ',' + key + '\n';
            });
        }
    }
    if (tpm1.files.length != 0) {
        if (tpm2.files.length != 0) {
            jQuery.ajax({
                type: "POST",
                url: 'uploadString',
                data: {file: res,session: session, session: session2},
                success: function (a, b, c) {

                    tpm1.removeAllFiles();
                    tpm2.removeAllFiles();
                }
            });
        }
        else {
            jQuery.ajax({
                type: "POST",
                url: 'uploadString',
                data: {file: res, session: session},
                success: function (a, b, c) {
                    tpm1.removeAllFiles();
                    tpm2.removeAllFiles();
                }
            });
        }
    }

    $("#result-tab").trigger("click");
});

$("#processFile").click(function (event, h, z) {
    $("#myTab li").show();
    $("#myTab li:not(.Res)").hide();
    $("#result-tab").trigger("click");
    if (prefile.files.length != 0)
        prefile.processQueue();
});

//compare1
$("#Compare").click(function (event, h, z) {
    event.preventDefault();
    $("#resFrameText").show();
    jQuery.ajax({
        type: "POST",
        url: 'getCompareText',
        data: {session: session, group1: $("#GroupA").val(), group2: $("#GroupB").val()},
        success: function (a, b, c) {
            $("#resFrameText").text(a);
            return false;
        }
    });
});
//compare2
$("#Compare1").click(function (event, h, z) {
    event.preventDefault();
    $("#resFrameText").show();
    jQuery.ajax({
        type: "POST",
        url: 'getCompareText',
        data: {session: session, session1: session2, group1: $("#Group1A").val(), group2: $("#Group1B").val()},
        success: function (a, b, c) {
            $("#resFrameText").text(a);
            return false;
        }
    });
});

$("#qqplot").click(function (event, h, z) {
        event.preventDefault();
        jQuery.ajax({
            type: "POST",
            url: 'qqplot',
            data: {session: (session + 1), group: $("#qqGroup").val()},
            success: function (a, b, c) {
                setTimeout(function () {
                    $("#qqFrame").parent().show();
                    $("#qqFrame").attr("src", "/files/"+session+"/qqplotimg.png?"+new Date());//prevent cacahing
                    var f = document.getElementById('qqFrame');
                    f.src = f.src;
                }, 5000);
            }
        });
    }
);


