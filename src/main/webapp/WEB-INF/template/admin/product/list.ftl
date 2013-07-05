<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Gebo Admin Panel</title>
    
        <!-- Bootstrap framework -->
            <link rel="stylesheet" href="${base}/resources/admin/bootstrap/css/bootstrap.min.css"  />
            <link rel="stylesheet" href="${base}/resources/admin/bootstrap/css/bootstrap-responsive.min.css"  />
        <!-- jQuery UI theme -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/jquery-ui/css/Aristo/Aristo.css"  />
        <!-- theme color-->
            <link rel="stylesheet" href="${base}/resources/admin/css/blue.css"  id="link_theme" />
        <!-- tooltips-->
            <link rel="stylesheet" href="${base}/resources/admin/lib/jBreadcrumbs/css/BreadCrumb.css"  />
        <!-- tooltips-->
            <link rel="stylesheet" href="${base}/resources/admin/lib/qtip2/jquery.qtip.min.css"  />
		<!-- colorbox -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/colorbox/colorbox.css"  />
        <!-- code prettify -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/google-code-prettify/prettify.css"  />    
        <!-- notifications -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/sticky/sticky.css"  />    
        <!-- aditional icons -->
            <link rel="stylesheet" href="${base}/resources/admin/img/splashy/splashy.css"  />
		<!-- flags -->
            <link rel="stylesheet" href="${base}/resources/admin/img/flags/flags.css"  />	
		<!-- calendar -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/fullcalendar/fullcalendar_gebo.css"  />	
		<!-- datepicker -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/datepicker/datepicker.css"  />
        <!-- tag handler -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/tag_handler/css/jquery.taghandler.css"  />
        <!-- uniform -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/uniform/Aristo/uniform.aristo.css"  />
		<!-- multiselect -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/multi-select/css/multi-select.css"  />
		<!-- enhanced select -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/chosen/chosen.css"  />
        <!-- wizard -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/stepy/css/jquery.stepy.css"  />
        <!-- upload -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/plupload/js/jquery.plupload.queue/css/plupload-gebo.css"  />
		<!-- CLEditor -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/CLEditor/jquery.cleditor.css"  />
		<!-- colorpicker -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/colorpicker/css/colorpicker.css"  />
		<!-- smoke_js -->
            <link rel="stylesheet" href="${base}/resources/admin/lib/smoke/themes/gebo.css"  />
	
		<!-- video player -->
			<link rel="stylesheet" href="../../vjs.zencdn.net/c/video-js.css"  />
			
        <!-- main styles -->
            <link rel="stylesheet" href="${base}/resources/admin/css/style.css"  />
			
            <link href="../../fonts.googleapis.com/css-family=PT+Sans.css"  rel='stylesheet' type='text/css'>
	
        <!-- favicon -->
            <link rel="shortcut icon" href="favicon.ico" />
		
        <!--[if lte IE 8]>
            <link rel="stylesheet" href="${base}/resources/admin/css/ie.css"  />
        <![endif]-->
        	
        <!--[if lt IE 9]>
			<script src="${base}/resources/admin/js/ie/html5.js" ></script>
			<script src="${base}/resources/admin/js/ie/respond.min.js" ></script>
			<script src="${base}/resources/admin/lib/flot/excanvas.min.js" ></script>
        <![endif]-->
		<script>
			//* hide all elements & show preloader
			document.documentElement.className += 'js';
		</script>
    </head>
    <body>
        <div id="loading_layer" style="display:none"><img src="${base}/resources/admin/img/ajax_loader.gif"  alt="请稍后..." /></div>
           
                    <div class="row-fluid">
					    <div class="span12">
					        <h3 class="heading">
								<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.product.list")} <span>(${message("admin.page.total", page.total)})</span>
							</h3>
							<div class="btn-group sepH_b">
								<button class="btn"><i class="splashy-add_small"></i> 添加</button>
								<button class="btn"><i class="splashy-refresh"></i> 刷新</button>
								<button class="btn"><i class="icon-trash"></i> 删除</button>
						        <button data-toggle="dropdown" class="btn dropdown-toggle">每页显示条数 <span class="caret"></span></button>
									<ul class="dropdown-menu">
										<li><a href="#">10</a></li>
										<li><a href="#">20</a></li>
										<li><a href="#">30</a></li>
										<li><a href="#">50</a></li>
									</ul>
					        </div>
					        
							<table class="table table-bordered table-striped table_vam" id="smpl_tbl">
								<thead>
									<tr>
										<th class="table_checkbox">
											<input type="checkbox" id="selectAll" class="select_rows" data-tableid="dt_gal" />
										</th>
										<th>
											<a href="javascript:;" class="sort" name="sn">${message("Product.sn")}</a>
										</th>
										<th>
											<a href="javascript:;" class="sort" name="name">${message("Product.name")}</a>
										</th>
										<th>
											<a href="javascript:;" class="sort" name="productCategory">${message("Product.productCategory")}</a>
										</th>
										<th>
											<a href="javascript:;" class="sort" name="price">${message("Product.price")}</a>
										</th>
										<th>
											<a href="javascript:;" class="sort" name="cost">${message("Product.cost")}</a>
										</th>
										<th>
											<a href="javascript:;" class="sort" name="stock">${message("Product.stock")}</a>
										</th>
										<th>
											<a href="javascript:;" class="sort" name="isMarketable">${message("Product.isMarketable")}</a>
										</th>
										<th>
											<a href="javascript:;" class="sort" name="createDate">${message("admin.common.createDate")}</a>
										</th>
										<th>
											<span>${message("admin.common.handle")}</span>
										</th>
									</tr>
								</thead>
								<tbody>
									[#list page.content as product]
										<tr>
											<td>
												<input type="checkbox" name="ids" value="${product.id}" />
											</td>
											<td>
												${product.sn}
											</td>
											<td>
												<span title="${product.fullName}">
													${abbreviate(product.fullName, 30, "...")}
													[#if product.isGift]
														<span class="gray">[${message("admin.product.gifts")}]</span>
													[/#if]
												</span>
												[#list product.validPromotions as promotion]
													<span class="promotion">${promotion.name}</span>
												[/#list]
											</td>
											<td>
												${product.productCategory.name}
											</td>
											<td>
												${currency(product.price)}
											</td>
											<td>
												${currency(product.cost)}
											</td>
											<td>
												[#if product.stock??]
													[#if product.allocatedStock == 0]
														<span[#if product.isOutOfStock] class="red"[/#if]>${product.stock}</span>
													[#else]
														<span[#if product.isOutOfStock] class="red"[/#if] title="${message("Product.allocatedStock")}: ${product.allocatedStock}">${product.stock}</span>
													[/#if]
												[/#if]
											</td>
											<td>
												<span class="${product.isMarketable?string("true", "false")}Icon">&nbsp;</span>
											</td>
											<td>
												<span title="${product.createDate?string("yyyy-MM-dd HH:mm:ss")}">${product.createDate}</span>
											</td>
											<td>
												<a href="edit.jhtml?id=${product.id}">[${message("admin.common.edit")}]</a>
												[#if product.isMarketable]
													<a href="${base}${product.path}" target="_blank">[${message("admin.common.view")}]</a>
												[#else]
													[${message("admin.product.notMarketable")}]
												[/#if]
											</td>
										</tr>
									[/#list]
								</tbody>
							</table>
							
						</div>
					</div>	   

    <script src="${base}/resources/admin/js/jquery.min.js" ></script>
    <script src="${base}/resources/admin/lib/jquery-ui/jquery-ui-1.8.23.custom.min.js" ></script>
    <!-- touch events for jquery ui-->
	<script src="${base}/resources/admin/js/forms/jquery.ui.touch-punch.min.js" ></script>
    <!-- easing plugin -->
	<script src="${base}/resources/admin/js/jquery.easing.1.3.min.js" ></script>
    <!-- smart resize event -->
	<script src="${base}/resources/admin/js/jquery.debouncedresize.min.js" ></script>
    <!-- js cookie plugin -->
	<script src="${base}/resources/admin/js/jquery.cookie.min.js" ></script>
    <!-- main bootstrap js -->
	<script src="${base}/resources/admin/bootstrap/js/bootstrap.min.js" ></script>
    <!-- bootstrap plugins -->
	<script src="${base}/resources/admin/js/bootstrap.plugins.min.js" ></script>
    <!-- code prettifier -->
	<script src="${base}/resources/admin/lib/google-code-prettify/prettify.min.js" ></script>
    <!-- sticky messages -->
	<script src="${base}/resources/admin/lib/sticky/sticky.min.js" ></script>
    <!-- tooltips -->
	<script src="${base}/resources/admin/lib/qtip2/jquery.qtip.min.js" ></script>
    <!-- lightbox -->
	<script src="${base}/resources/admin/lib/colorbox/jquery.colorbox.min.js" ></script>
    <!-- jBreadcrumbs -->
	<script src="${base}/resources/admin/lib/jBreadcrumbs/js/jquery.jBreadCrumb.1.1.min.js" ></script>
	<!-- hidden elements width/height -->
	<script src="${base}/resources/admin/js/jquery.actual.min.js" ></script>
	<!-- scroll -->
	<script src="${base}/resources/admin/lib/antiscroll/antiscroll.js" ></script>
	<script src="${base}/resources/admin/lib/antiscroll/jquery-mousewheel.js" ></script>
	<!-- fix for ios orientation change -->
	<script src="${base}/resources/admin/js/ios-orientationchange-fix.js" ></script>
	<!-- to top -->
	<script src="${base}/resources/admin/lib/UItoTop/jquery.ui.totop.min.js" ></script>
	<!-- mobile nav -->
	<script src="${base}/resources/admin/js/selectNav.js" ></script>

	<!-- common functions -->
	<script src="${base}/resources/admin/js/gebo_common.js" ></script>

	<!-- datatable -->
	<script src="${base}/resources/admin/lib/datatables/jquery.dataTables.min.js" ></script>
	<!-- additional sorting for datatables -->
    <script src="${base}/resources/admin/lib/datatables/jquery.dataTables.sorting.js" ></script>
    <!-- tables functions -->
    <script src="${base}/resources/admin/js/gebo_tables.js" ></script>	

	
	
    <script>
        $(document).ready(function() {
			//* jQuery.browser.mobile (http://detectmobilebrowser.com/)
			//* jQuery.browser.mobile will be true if the browser is a mobile device
			(function(a){jQuery.browser.mobile=/android.+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))})(navigator.userAgent||navigator.vendor||window.opera);
			//replace themeforest iframe
			if(jQuery.browser.mobile) {
				if (top !== self) top.location.href = self.location.href;
			}
			//* show all elements & remove preloader
            setTimeout('$("html").removeClass("js")',500);
        });
    </script>
	
	<script type="text/javascript">

		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-32339645-1']);
		_gaq.push(['_trackPageview']);
	  
		(function() {
		  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();
	  
	  </script>
	  
		</div>	
	</body>
</html>
