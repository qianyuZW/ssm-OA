<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统之加班</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
<script>
			function back(){
				var con = confirm("确定要离开我么？");
				if (con) {
					location.href="${pageContext.request.contextPath }/overwork/tooverworklist";		
					}
			}				
			$(function() {
				$("#overworkForm").validate({
									rules : {										
										begintime : {
											required:true			
										},											
										endtime: {
											required:true													
											},	
										time: {
											required:true,
											number:true,					
											maxlength:3
										}										
									},
									messages : {
										begintime: {
											required:"加班开始时间不能为空"											
											},
										endtime: {
											required:"加班结束时间不能为空"
												},
										day: {
											required:"加班时间不能为空",
											number:"必须为数字",
											maxlength:"加班时间不能超过24h"
											}
									}
				});
			});				
			$(function(){
				$("#o_endtime").blur(
					function(){
						$.get(
							"${pageContext.request.contextPath}/overwork/process",
							{"endtime":this.value,"begintime":$("#o_begintime").val()},
							function(data){
								if(data!=null){										
									$("#o_time").val(data);
													}	
							},
							"text"
						);						
					}		
				);				
			});
			$(function(){
				$("#o_begintime").blur(
					function(){
						$.get(
							"${pageContext.request.contextPath}/overwork/process",
							{"begintime":this.value,"endtime":$("#o_endtime").val()},
							function(data){
								if(data!=null){										
									$("#o_time").val(data);
													}	
							},
							"text"
						);						
					}		
				);				
			});
						
</script>
</head>	
	<body>
		<div class="top">
			<div class="global-width">
				<img src="${pageContext.request.contextPath}/Images/logo.gif" class="logo" />
			</div>
		</div>
		<div class="status">
			<div class="global-width">
				${sessionUser.name}你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/user/exit" >注销</a>
				&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/toindex" >返回首页</a>
			</div>
		</div>
		<form id="overworkForm" name="overworkForm" action="${pageContext.request.contextPath}/overwork/applyoverwork" method="post">
		<div class="main">
			<div class="global-width"> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	</head>  
  <body>
    <div class="nav" id="nav">
					<div class="t"></div>
					<dl>
							<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息管理 
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/user/toinfo" target="_self">个人信息</a>
						</dd>
					</dl>
					<dl>
						<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							邮件管理
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/mail/towhite" target="_self">写邮件</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/mail/toread" target="_self">收邮件</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/mail/tolitter" target="_self">垃圾邮件</a>
						</dd>
					</dl>
					<dl>
						<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							考勤管理
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/work/toapply" target="_self">每日打卡</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/overwork/tooverworklist" target="_self">加班</a>
						</dd>	
						<dd>
							<a href="${pageContext.request.contextPath}/note/tonotelist" target="_self">休假</a>
						</dd>	
					</dl>					
					<dl>					
						<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							权限管理
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/user/toaccount" target="_self">个人账户</a>
						</dd>						
					</dl>
				</div>
  </body>
</html>
 
					<div class="action">
						<div class="t">
							加班申请
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" width="30%" height="30px">姓名：</td>
								<td align="left">
								<input type="text" name="name" value="${sessionUser.name}"  id="name" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%" height="30px">加班开始时间：</td>
								<td align="left">
									<input type="datetime-local"  name="begintime"  id="o_begintime" />&nbsp;<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%" height="30px">加班结束时间：</td>
								<td align="left">								
									<input type="datetime-local" name="endtime"  id="o_endtime" />&nbsp;<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%" height="30px">加班时间（小时）：</td>
								<td align="left">
									<input type="text" name="time"  id="o_time" />&nbsp;<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td align="right" width="30px" height="40px">加班原因：</td>
								<td align="left">					
									<textarea name="cause" rows="10px" cols="40px"></textarea>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%" height="30px">审批人：</td>
								<td align="left">
								 <select name="reviewer.id" id="ri">
									<option value="">--请选择--</option>
									<c:forEach items="${userList}" var="user">
										<option value="${user.id }">${user.name }</option>
									</c:forEach>
								</select>&nbsp; &nbsp; &nbsp; 		
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">									
									<input type="submit"  id="save" value="提交申请" />
									<button type="button" onclick="back()">返回</button>
								</td>								
							</tr>								
						</table>								
						</div>
					</div>
			</div>
		</div>
		</form>
		<div class="copyright">
			Copyright &nbsp; &copy; &nbsp; 
		</div>
 
	</body>
</html>