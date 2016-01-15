<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../Common/javaTag.jsp"%>
<%@ include file="../Common/topHeader.jsp"%>


<body class="J_scroll_fixed">
	<div class="wrap jj">
		<ul class="nav nav-tabs">
			<li><a href="${dfn:U('admin/task/index')}">计划任务</a></li>
			<li><a href="${dfn:U('admin/task/add_menu')}">添加新任务 </a></li>
			<li class="active"><a href="${dfn:U('admin/task/exeaction')}">执守程序操作
			</a></li>
		</ul>
		<form method="post" action="${dfn:U('admin/task/exeaction')}" class="form-horizontal J_ajaxForm">
			<div class="common-form cwh">

				<div>
					<span class="red">系统不支持exec函数，请修改系统环境或者在服务器端手动开启执守程序</span>
				</div>

				<div class="table_full">
					<table  class="table_form ">
						<tr>
							<th width="200" class="control-label">开启服务：</th>
							<td><button class="btn" style="margin-top: 5px"
									onClick="doCleanCache('startserver',this);">开启</button> <span></span><span
								class="commonTip">开启服务后，服务器重启系统会自动打开执守程序</span></td>
						</tr>
						<tr>
							<th width="200" class="control-label">开关服务：</th>
							<td><button class="btn" style="margin-top: 5px"
									onClick="doCleanCache('stopserver',this);">关闭</button> <span></span><span
								class="commonTip">开启服务后，服务器重启系统不会自动打开执守程序，需要手动打开执守程序</span></td>
						</tr>
						<tr>
							<th width="200" class="control-label">开启执守程序：</th>
							<td><button class="btn" style="margin-top: 5px"
									onClick="doCleanCache('start',this);">开启</button> <span></span><span
								class="commonTip">开启执守程序后计划任务才会执行</span></td>
						</tr>
						<tr>
							<th width="200" class="control-label">关闭执守程序：</th>
							<td><button class="btn" style="margin-top: 5px"
									onClick="doCleanCache('close',this);">关闭</button> <span></span><span
								class="commonTip">关闭执守程序后计划任务不会执行</span></td>
						</tr>
						<tr>
							<th width="200" class="control-label">查看状态：</th>
							<td><button class="btn" style="margin-top: 5px"
									onClick="doCleanCache('showstatus',this);">查看</button> <span></span><span
								class="commonTip">查看当前服务和执守程序的运行状态</span></td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
	</div>
</body>