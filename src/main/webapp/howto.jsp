<%--
  Created by IntelliJ IDEA.
  User: readmanhe
  Date: 10/10/17
  Time: 8:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Comparison of RNA Expression Gene Group</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
          integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/dropzone.min.css"/>
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
    <div class="jumbotron">
        <div id="pgc-1430-0-1" class="panel-grid-cell">
            <div id="panel-1430-0-1-0"
                 class="so-panel widget widget_siteorigin-panels-builder panel-first-child panel-last-child"
                 data-index="1">
                <div id="pl-w59f34f6ac48c5" class="panel-layout">
                    <div id="pg-w59f34f6ac48c5-0" class="panel-grid panel-has-style">
                        <div class="panel-row-style panel-row-style-for-w59f34f6ac48c5-0">
                            <div id="pgc-w59f34f6ac48c5-0-0" class="panel-grid-cell">
                                <div id="panel-w59f34f6ac48c5-0-0-0"
                                     class="so-panel widget widget_sow-headline panel-first-child" data-index="0">
                                    <div class="so-widget-sow-headline so-widget-sow-headline-default-c9d48890f742 so-widget-fittext-wrapper"
                                         data-fit-text-compressor="0.85">
                                        <div class="sow-headline-container ">
                                            <h1 class="sow-headline" style="font-size: 25.998px;    margin-top: -50px;">Visualize
                                                log-transformed gene group distribution and QQ-plot to examine
                                                normality</h1></div>
                                    </div>
                                </div>
                                <div id="panel-w59f34f6ac48c5-0-0-1" class="so-panel widget widget_sow-editor"
                                     data-index="1">
                                    <div class="so-widget-sow-editor so-widget-sow-editor-base">
                                        <div class="siteorigin-widget-tinymce textwidget">
                                            <p style="text-align: center;"><img class="wp-image-1360 aligncenter"
                                                    src="resources/img/single-group-1024x370.jpeg"
                                                    alt="" width="862" height="312"
                                                    sizes="(max-width: 862px) 100vw, 862px"></p>
                                            <p>After uploading TPM input file, housekeeping gene file, pre-define group
                                                gene file(see file formats on How To link), you should get something
                                                similar to below results:</p>
                                            <p style="text-align: center;"><img class="wp-image-1411 aligncenter"
                                                    src="resources/img/single-sample-result-1024x976.jpeg"
                                                    alt="" width="856" height="816"
                                                    sizes="(max-width: 856px) 100vw, 856px"></p>
                                            <ul>
                                                <li>QQ-plot for all genes from the file you just uploaded</li>
                                                <li>log-transformed expression value distribution for all genes</li>
                                                <li>log-transformed house gene&nbsp;normalized RNA expression value
                                                    distribution for each gene group
                                                </li>
                                            </ul>
                                            <p>Since normality is crucial&nbsp;for downstream analysis, the first thing
                                                to check is if QQ-plot dots for each gene group follow roughly a
                                                straight line.</p>
                                            <p style="text-align: center;"><img class="wp-image-1412 aligncenter"
                                                    src="resources/img/qqplot-for-each-gene.jpeg"
                                                    alt="" width="748" height="798"></p>
                                            <p>Note: a small percentage of genes (&lt;10%) on either tail which does not
                                                strictly form a straight line on QQ-plot is fine.</p>
                                        </div>
                                    </div>
                                </div>
                                <div id="panel-w59f34f6ac48c5-0-0-2" class="so-panel widget widget_sow-headline"
                                     data-index="2">
                                    <div class="so-widget-sow-headline so-widget-sow-headline-default-c9d48890f742 so-widget-fittext-wrapper"
                                         data-fit-text-compressor="0.85">
                                        <div class="sow-headline-container ">
                                            <h1 class="sow-headline" style="font-size: 25.998px; text-align: center">T-test on gene groups
                                                within a sample</h1></div>
                                    </div>
                                </div>
                                <div id="panel-w59f34f6ac48c5-0-0-3" class="so-panel widget widget_sow-editor"
                                     data-index="3">
                                    <div class="so-widget-sow-editor so-widget-sow-editor-base">
                                        <div class="siteorigin-widget-tinymce textwidget">
                                            <p>Pre-defined gene group is a hypothesis you want to test, let's say if two
                                                gene group expression mean values are very close?</p>
                                            <p style="text-align: center;"><img class=" wp-image-1413 aligncenter"
                                                    src="resources/img/single-sample-t-test-1024x309.jpeg"
                                                    alt="" width="885" height="267"
                                                    sizes="(max-width: 885px) 100vw, 885px"></p>
                                        </div>
                                    </div>
                                </div>
                                <div id="panel-w59f34f6ac48c5-0-0-4" class="so-panel widget widget_sow-headline"
                                     data-index="4">
                                    <div class="so-widget-sow-headline so-widget-sow-headline-default-c9d48890f742 so-widget-fittext-wrapper"
                                         data-fit-text-compressor="0.85">
                                        <div class="sow-headline-container ">
                                            <h1 class="sow-headline" style="font-size: 25.998px; text-align: center">T-test on gene groups
                                                across samples</h1></div>
                                    </div>
                                </div>
                                <div id="panel-w59f34f6ac48c5-0-0-5"
                                     class="so-panel widget widget_sow-editor panel-last-child" data-index="5">
                                    <div class="so-widget-sow-editor so-widget-sow-editor-base">
                                        <div class="siteorigin-widget-tinymce textwidget">
                                            <p>If you wish to test a hypothesis, for instance, if a certain group of
                                                genes behaves&nbsp;differently under various experimental conditions
                                                (usually control vs stress ), or collected from different tissues.</p>
                                            <p>Then you should probably want to upload two files which contain TPM
                                                values for each gene group.</p>
                                            <p>Note: If your experiment results contained within a single file, you
                                                might simply upload twice the same file and indicate column number
                                                corresponding specific sample.</p>
                                            <p>Out method is powerful to enable comparison across species, such as if
                                                two orthologs gene groups from two closely related species respond to
                                                certain stress. In that case, you need two housekeeping gene files for
                                                each species of interest.</p>
                                            <p  style="text-align: center"><img class="wp-image-1476 aligncenter"
                                                    src="resources/img/across_tests-1024x803.png"
                                                    alt="" width="866" height="679"
                                                    sizes="(max-width: 866px) 100vw, 866px"></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <h4 style="text-align: center">About inputs</h4>
        <p>We accept FPKM, our pipeline will automatically transform FPKM to TPM</p>
        <p>Transcripts Per Kilobase Million(TPM) file format</p>
        <table style="width:100%">
            <tr>
                <th>column 0</th>
                <th>column 1</th>
                <th>column 2</th>
                <th>etc ...</th>
            </tr>
            <tr>
                <td>Gene_ID 0</td>
                <td>TPM_values</td>
                <td>TPM_values</td>
                <td>etc ...</td>
            </tr>
            <tr>
                <td>Gene_ID 1</td>
                <td>TPM_values</td>
                <td>TPM_values</td>
                <td>etc ...</td>
            </tr>
        </table>
        <p>
            <a href="resources/examples/upload_TPM_file">Example download TPM.txt</a>
        </p>
        <p>
            pre-defined gene group format
            Gene_ID, gene group name <a href="resources/examples/upload_pre-defined_gene_group_file">download
            pre-defined_gene_group.csv</a>
        </p>
        <p>
            Additional file
            If compare two gene groups from different samples, then additional file, such as housekeeping genes need to
            be uploaded
            housekeeping gene file format <a href="resources/examples/maize_house_keeping_gene_rnaseq">download
            maize housekeeping gene.txt</a>
        </p>
        <h4 style="text-align: center">About results</h4>
        <p>
            This method based on the assumption that each group of gene TPM values follow normal distribution. You
            should check this assumption before conducting any statistics test!
        </p>
    </div>
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
</body>
</html>
