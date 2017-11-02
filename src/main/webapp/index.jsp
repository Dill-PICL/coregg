<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Comparison of RNA Expression Gene Group</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
          integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/dropzone.min.css"/>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">

</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg" style="background-color: #c00;">
        <a class="navbar-brand" style="color: white" href="#">Comparison of RNA Expression Gene Group</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto float-right">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp" style="color: white">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="howto.jsp" style="color: white">How To</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="citation.jsp" style="color: white">Citation</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link float-right" href="contact.jsp" style="color: white">Contact</a>
                </li>
            </ul>

        </div>
    </nav>
    <div id="pgc-1366-0-1" class="panel-grid-cell">
        <div id="panel-1366-0-1-0" class="so-panel widget widget_sow-editor panel-first-child" data-index="1">
            <div class="so-widget-sow-editor so-widget-sow-editor-base">
                <div class="siteorigin-widget-tinymce textwidget">
                    <p></p>
                </div>
            </div>
        </div>
        <div id="panel-1366-0-1-1" class="so-panel widget widget_sow-editor" data-index="2">
            <div class="so-widget-sow-editor so-widget-sow-editor-base">
                <div class="siteorigin-widget-tinymce textwidget">
                    <p><a href="http://coregg.dill-picl.org/">COREgg</a>&nbsp;uses housekeeping genes to enable gene
                        groups comparison within or across samples.</p>
                    <p>A quick instance where our method could be helpful:</p>
                    <p>Suppose you have a group of functionally&nbsp;undefined genes, such as a novo family
                        transcription factor (TF) genes.</p>
                    <p>You&nbsp;want to test a&nbsp;hypothesis that whether this novo&nbsp;TF gene group expression
                        could be activated under certain stress, such as heat stress.</p>
                    <p>Our tool provides a data-processing&nbsp;pipeline to enable rigorous statistics&nbsp;test
                        (Student t-test) to see whether their RNA expression patterns are significantly different
                        between control and stress samples.</p>
                </div>
            </div>
        </div>
        <div id="panel-1366-0-1-2" class="so-panel widget widget_sow-editor panel-last-child" data-index="3">
            <div class="so-widget-sow-editor so-widget-sow-editor-base">
                <div class="siteorigin-widget-tinymce textwidget">
                    <div class="mdl-typography--text-center main-content-section">
                        The difference between previous one-to-one gene comparison with our group-to-group gene RNA
                        expression comparison illustrated as below figure.<p></p>
                        <p>Namely, we use a distribution of a group of gene expression values rather than differentially
                            expressed (DE) gene set defined individually.&nbsp;</p>
                        <p style="text-align: center"><img class="alignnone wp-image-1465"
                                                           src="resources/img/Slide1.png" alt="" width="864"
                                                           height="648"
                                                           sizes="(max-width: 864px) 100vw, 864px"></p>
                        <p style="text-align: justify;">&nbsp;The project has three main areas of focus, namely</p>
                        <ol class="mdl-typography--text-left">
                            <li>We provide a webtool to transform your FPKM/TPM RNA dataset into Gassium distributions,
                                which enables student t-test for downstream analysis.
                            </li>
                            <li>Visualization of log-transformed gene group expression distribution and conduct QQ-plot
                                to test normality&nbsp;
                            </li>
                            <li>Use housekeeping gene to normalize across sample gene group expression level</li>
                            <li>&nbsp;T-test on gene groups within a sample or across samples</li>
                        </ol>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="highlight" style="padding-top: 20px">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item Step1">
                <a class="nav-link" id="tpm-tab" data-value="#tpm" data-toggle="tab" href="#tpm" role="tab"
                   aria-controls="tpm">Step 1: Upload FPKM/TPM Files</a>
            </li>
            <li class="nav-item Step2paste">
                <a class="nav-link" id="pre-paste-tab" data-value="#pre-paste-tab" data-toggle="tab"
                   href="#pre-paste" role="tab">Step 2: Paste Pre-defined Gene Group Data</a>
            </li>
            <li class="nav-item Step2file">
                <a class="nav-link" id="pre-file-tab" data-value="#pre-file-tab" data-toggle="tab"
                   href="#pre-file" role="tab">Step 2: Upload Pre-defined Gene Group File</a>
            </li>
            <li class="nav-item ml-auto Res">
                <a class="nav-link " id="result-tab" data-value="#result" data-toggle="tab" href="#result" role="tab"
                   aria-controls="result" style="color: firebrick;">Result</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade active show" id="tpm" role="tabpanel" aria-labelledby="tpm-tab">
                <div id="accordion" role="tablist">
                    <div class="card">
                        <div class="card-header" role="tab" id="headingOne">
                            <h5 class="mb-0">
                                <a data-toggle="collapse" href="#collapseOne" aria-expanded="true"
                                   aria-controls="collapseOne" style="text-align: center">
                                    <h3 class="mx-auto">Single Sample Comparision<img
                                            src="resources/icon/ic_help_outline_black_24px.svg" data-toggle="tooltip"
                                            data-placement="bottom" title="Upload tpm file with
house keeping genes file"/></h3></a>
                            </h5>
                        </div>

                        <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne"
                             data-parent="#accordion">
                            <div class="card-body">
                                <div class="jumbotron row" style="text-align: center">
                                    <div class="col-lg-6">
                                        <div class="row">
                                            <h5>FPKM/TPM File</h5>
                                            <a style="margin-left: 10px;" href="resources/examples/upload_TPM_file.txt">Example.txt</a>
                                        </div>
                                        <div class="row">
                                            <div id="tpm_dropzone_file" style="width: 100%;">
                                                <form data-ajax-method="POST" data-ajax="true" action="/uploadFile"
                                                      class="dropzone needs click dz-clickable"
                                                      id="upload_file" enctype="multipart/form-data">

                                                    <div class="dz-message needsclick">
                                                        <p style="font-size: 16px; ">
                                                            Drop FPKM/TPM files here or click to upload
                                                        </p>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-group">
                                    <span class="input-group-addon" data-toggle="tooltip" data-placement="bottom"
                                          title="The column use in file">Column</span>
                                                <input type="number" name='tmp_column' class="form-control"
                                                       placeholder="">
                                                <span class="input-group-addon" data-toggle="tooltip"
                                                      data-placement="bottom"
                                                      title="The name of sample">Sample Name</span>
                                                <input type="text" class="form-control" name='sample_name'
                                                       placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-1">
                                    </div>
                                    <div class="col-lg-5">
                                        <div class="row">
                                            <h5 style="margin-left: 15px;">House Keeping Genes</h5>
                                            <a style="margin-left: 10px;"
                                               href="resources/examples/maize_house_keeping_gene_rnaseq">Example.txt</a>
                                        </div>
                                        <div class="row">
                                            <div id="hkg_dropzone_file" style="width: 100%;">
                                                <form data-ajax-method="POST" data-ajax="true" action="/uploadFile"
                                                      class="dropzone needs click dz-clickable"
                                                      id="hkg_upload_file" enctype="multipart/form-data">

                                                    <div class="dz-message needsclick">
                                                        <p style="font-size: 16px; ">
                                                            Drop House Keeping Gene files here or click to upload
                                                        </p>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab" id="headingTwo">
                            <h5 class="mb-0">
                                <a class="collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false"
                                   aria-controls="collapseTwo" style="text-align: center">
                                    <h3 class="mx-auto">Cross Samples Comparision<img
                                            src="resources/icon/ic_help_outline_black_24px.svg" data-toggle="tooltip"
                                            data-placement="bottom" title="Upload two tpm file with
house keeping genes file to enable"/></h3></a>
                            </h5>
                        </div>
                        <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo"
                             data-parent="#accordion">
                            <div class="card-body">
                                <div class="jumbotron row ">
                                    <div class="col-lg-6">
                                        <div class="row">
                                            <h5>FPKM/TPM File</h5>
                                            <a style="margin-left: 10px;" href="resources/examples/upload_TPM_file">Example.txt</a>
                                        </div>
                                        <div class="row">
                                            <div id="tpm_dropzone_file1" style="width: 100%;">
                                                <form data-ajax-method="POST" data-ajax="true" action="/uploadFile"
                                                      class="dropzone needs click dz-clickable"
                                                      id="upload_file1" enctype="multipart/form-data">

                                                    <div class="dz-message needsclick">
                                                        <p style="font-size: 16px; ">
                                                            Drop FPKM/TPM files here or click to upload
                                                        </p>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-group">
                                    <span class="input-group-addon" data-toggle="tooltip" data-placement="bottom"
                                          title="The column use in file">Column</span>
                                                <input type="number" name='tmp_column_1' class="form-control"
                                                       placeholder="">
                                                <span class="input-group-addon" data-toggle="tooltip"
                                                      data-placement="bottom"
                                                      title="The name of sample">Sample Name</span>
                                                <input type="text" class="form-control" name='sample_name_1'
                                                       placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-1">
                                    </div>
                                    <div class="col-lg-5">
                                        <div class="row">
                                            <h5>House Keeping Genes</h5>
                                            <a style="margin-left: 10px;"
                                               href="resources/examples/maize_house_keeping_gene_rnaseq">Example.txt</a>
                                        </div>
                                        <div class="row">
                                            <div id="hkg_dropzone_file1" style="width: 100%;">
                                                <form data-ajax-method="POST" data-ajax="true" action="/uploadFile"
                                                      class="dropzone needs click dz-clickable"
                                                      id="hkg_upload_file1" enctype="multipart/form-data">

                                                    <div class="dz-message needsclick">
                                                        <p style="font-size: 16px; ">
                                                            Drop House Keeping Gene files here or click to upload
                                                        </p>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="jumbotron row">
                                    <div class="col-lg-6">
                                        <div class="row">
                                            <h5>FPKM/TPM File</h5>
                                            <a style="margin-left: 10px;" href="resources/examples/upload_TPM_file">Example.txt</a>
                                        </div>
                                        <div class="row">
                                            <div id="tpm_dropzone_file2" style="width: 100%;">
                                                <form data-ajax-method="POST" data-ajax="true" action="/uploadFile"
                                                      class="dropzone needsclick dz-clickable"
                                                      id="upload_file2" enctype="multipart/form-data">

                                                    <div class="dz-message needsclick">
                                                        <p style="font-size: 16px; ">
                                                            Drop FPKM/TPM files here or click to upload
                                                        </p>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-group">
                                            <span class="input-group-addon" data-toggle="tooltip"
                                                  data-placement="bottom" title="The column use in file">Column</span>
                                                <input type="number" name='tmp_column_2' class="form-control"
                                                       placeholder="">
                                                <span class="input-group-addon" data-toggle="tooltip"
                                                      data-placement="bottom"
                                                      title="The name of sample">Sample Name</span>
                                                <input type="text" class="form-control" name='sample_name_2'
                                                       placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-1">
                                    </div>
                                    <div class="col-lg-5">
                                        <div class="row">
                                            <h5>House Keeping Genes</h5>
                                            <a style="margin-left: 10px;"
                                               href="resources/examples/maize_house_keeping_gene_rnaseq">Example.txt</a>
                                        </div>
                                        <div class="row">
                                            <div id="hkg_dropzone_file2" style="width: 100%;">
                                                <form data-ajax-method="POST" data-ajax="true" action="/uploadFile"
                                                      class="dropzone needs click dz-clickable"
                                                      id="hkg_upload_file2" enctype="multipart/form-data">

                                                    <div class="dz-message needsclick">
                                                        <p style="font-size: 16px; ">
                                                            Drop House Keeping Gene files here or click to upload
                                                        </p>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="padding-top: 50px;">
                    <div class="col-12">
                        <div class="dropdown float-right">
                            <button class="btn btn-primary dropdown-toggle" id="step2menu" type="button"
                                    data-toggle="dropdown">Next (Upload
                                Pre-defined Gene Group)
                                <span class="caret"></span></button>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="step2menu">
                                <a class="dropdown-item" id="GotoPaste" href="#">Paste Pre-defined Gene Group Data</a>
                                <a class="dropdown-item" id="GotoFile" href="#">Upload Pre-defined Gene Group File</a>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="pre-paste" role="tabpanel" aria-labelledby="pre-paste-tab">
                <div role="toolbar" aria-label="Toolbar with button groups" style="padding-top: 50px;">
                    <div class="btn-group mr-2" role="group" aria-label="First group">
                        <button type="button" id="add_row_pd" class="btn btn-primary">Add Group</button>
                    </div>
                    <div class="btn-group mr-2 float-right" role="group" aria-label="Second group">
                        <div class="input-group">
                            <span class="input-group-addon" data-toggle="tooltip" data-placement="bottom"
                                  title="comma-separated values file">.csv</span>
                            <span class="input-group-addon">
        <input id="checkbox_csv" type="checkbox" class="sev_check" aria-label="Checkbox for csv file">
      </span>
                            <span class="input-group-addon" data-toggle="tooltip" data-placement="bottom"
                                  title="space-delimite file">space-delimited</span>
                            <span class="input-group-addon">
        <input id="checkbox_sd" type="checkbox" class="sev_check" aria-label="Checkbox for space-delimited file">
                            </span>
                        </div>
                    </div>
                </div>
                <div class="row" style="padding-top: 5px;">
                    <div class="col-md-12 column">
                        <table class="table table-bordered table-hover" id="tab_logic">
                            <thead>
                            <tr>
                                <th class="text-center" style="width: 140px;">
                                    Group Label
                                </th>
                                <th class="text-center">
                                    Genes
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr id='addr0'>
                                <td>
                                    <input type="text" name='label0' placeholder='Gene Label' class="form-control"
                                           style="text-align: center;margin-top: 25%"/>
                                    <button type="button" id="delete0" style="float: left;margin-left: 50px;"
                                            class="close delete_pd" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </td>
                                <td>
                                    <input type="text" name='data0' placeholder='Genes Data'
                                           style="text-align: center;height: 100px;" class="form-control"/>
                                </td>
                            </tr>
                            <tr id='addr1'></tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div role="toolbar" aria-label="Toolbar with button groups">
                    <div class="row" style="padding-top: 20px;">
                        <div class="col-12">
                            <button type="button" class="btn btn-primary backToStep1">Back (Step 1: Upload TPM Files)
                            </button>
                            <button id="processUL" type="button" class="btn btn-danger float-right">Process</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="pre-file" role="tabpanel" aria-labelledby="pre-file-tab">
                <div class="row" style="padding-top: 50px;">
                    <div class="col-lg-12">
                        <div class="row">
                            <h5 data-toggle="tooltip" data-placement="top" title="Tooltip on bottom">Pre-defined Gene
                                Group
                                File</h5>
                            <a style="margin-left: 10px;"  href="resources/examples/upload_pre-defined_gene_group_file">Example.txt</a>
                        </div>
                        <div>
                            <form data-ajax-method="POST" data-ajax="true" action="/uploadFile"
                                  id="pre-defined-file" class="dropzone needsclick dz-clickable"
                                  enctype="multipart/form-data">
                                <div class="dz-message needsclick">
                                    <p style="font-size: 16px; ">
                                        Drop Pre-defined Gene Group File here or click to upload
                                    </p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row" style="padding-top: 20px;">
                    <div class="col-12">
                        <button type="button" class="btn btn-primary backToStep1">Back (Step 1: Upload TPM Files)
                        </button>
                        <button id="processFile" type="button" class="btn btn-danger float-right">Process</button>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="result" role="tabpanel" aria-labelledby="result-tab">
                <!-- result 1 -->
                <h3 id="resFrameName" style="padding-top: 50px;text-align: center;padding-bottom: 10px;"></h3>
                <div class="embed-responsive embed-responsive-16by9"
                     style="min-height: 1000px;border: 1px solid rgba(0,0,0,0.1);">
                    <img id="resFrame" style="width: 100%;height: 100%;" class="embed-responsive-item" src=""></img>
                </div>
                <!-- qqplot -->
                <div class="row" style="padding-top: 20px; display: none">
                    <label for="qqFrameForm" id="qFrameFormlabel">
                        <h5>qqPlot:</h5>
                    </label>
                </div>
                <div class="row col-lg-12">
                    <div class="col-lg-3">
                    </div>
                    <div class="col-lg-6">
                        <form id="qqFrameForm" class="form-inline" style="padding-top: 5px;display: none">
                            <div class="form-group">
                                <label for="GroupA" style="padding-right: 10px;">Group : </label>
                                <select class="custom-select" id="qqGroup">
                                </select>
                            </div>
                            <div class="form-group" style="padding-left: 50px;">
                                <button id="qqplot" class="btn btn-primary float-right">Plot</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-3">
                    </div>
                </div>
                <div class="embed-responsive embed-responsive-16by9"
                     style="min-height: 1000px;border: 1px solid rgba(0,0,0,0.1); padding-top: 5px;">
                    <img id="qqFrame" class="embed-responsive-item" style="width: 100%;height: 100%;" src=""></img>
                </div>
                <!-- result 2 -->
                <h3 id="resFrame2Name" style="padding-top: 50px;text-align: center;padding-bottom: 10px;"></h3>
                <div class="embed-responsive embed-responsive-16by9"
                     style="min-height: 1000px;border: 1px solid rgba(0,0,0,0.1);padding-top: 10px;">
                    <img id="resFrame2" class="embed-responsive-item" style="width: 100%;height: 100%;" src=""></img>
                </div>
                <div class="row" style="padding-top: 30px;">
                    <label for="resFrameForm" id="resFrameFormlabel">
                        <h5>Welch Two Sample t-test:</h5>
                    </label>
                    <label for="resFrameForm" id="resFrameFormlabel1">
                        <h5>Cross Sample t-test:</h5>
                    </label>
                </div>
                <div class="row col-12">
                    <div class="col-1"></div>
                    <div class="col-10">
                        <form id="resFrameForm" class="form-inline" style="padding-top: 5px;">
                            <div class="form-group">
                                <label for="GroupA" style="padding-right: 10px;">Group A: </label>
                                <select class="custom-select" id="GroupA">
                                </select>
                            </div>
                            <div class="form-group" style="padding-left: 20px;">
                                <label for="GroupB" style="padding-right: 10px;">Group B: </label>
                                <select class="custom-select" id="GroupB">
                                </select>
                            </div>
                            <div class="form-group" style="padding-left: 100px;">
                                <button id="Compare" class="btn btn-primary float-right">Compare</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row col-12">
                    <form id="resFrameForm1" class="form-inline" style="padding-top: 5px;">
                        <div class="form-group">
                            <label for="GroupA" style="padding-right: 10px;font-size: 15px;">Group A From TPM file
                                1: </label>
                            <select class="custom-select" id="Group1A">
                            </select>
                        </div>
                        <div class="form-group" style="padding-left: 20px;">
                            <label for="GroupB" style="padding-right: 10px;font-size: 15px;">Group B From TPM file
                                2: </label>
                            <select class="custom-select" id="Group1B">
                            </select>
                        </div>
                        <div class="form-group" style="padding-left: 100px;">
                            <button id="Compare1" class="btn btn-primary float-right">Compare</button>
                        </div>
                    </form>
                </div>
            </div>
            <textarea id="resFrameText"
                      style="font-size: 22px;padding-top:20px;resize: none;width: 100%;height: 280px;border: none;text-align: center;overflow:hidden;display: none;"
                      disabled>
                </textarea>
            <div class="row" style="padding-top: 20px; display: none;">
                <div class="col-lg-2">
                    <div>
                        <button id="reset" type="button" class="btn btn-primary">Back (Step 1: Upload TPM Files)
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <img style="width: 100%;" src="resources/img/footer.png"/>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
        crossorigin="anonymous"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
<script src="resources/js/dropzone.js"></script>
<script src="resources/js/myJS.js"></script>
</body>
</html>