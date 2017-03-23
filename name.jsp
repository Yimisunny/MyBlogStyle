<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SLinkcloud_网关列表</title>
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>font-awesome/css/font-awesome.css" rel="stylesheet">
    <link rel="shortcut icon" href="<%=basePath%>img/achoose/icon.ico" type="image/x-icon" />
    <link href="<%=basePath%>css/animate.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.css" rel="stylesheet">
    <script src="<%=basePath%>js/echarts.js"></script>
    <link href="<%=basePath%>css/com.css" rel="stylesheet" type="text/css">
    <script src="<%=basePath%>js/bootpack.js"></script>
    <script src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
    <style>
        @media screen and (min-width:780px ){.sidebar-collapse{width:150px !important;}.fixedwra{width:150px !important;}.gray-bg{margin-left:150px !important;}}
        .no-margins{font-size: 15px;}
        .iul li{display:inline-block;margin-right: 80px;}

        @media screen and (max-width:1200px ) {
            .inlineLi li{display: inline-block}
        }
        @media screen and (min-width: 530px){
            .choose1 div{float: left;width: 58px;height: 54px;margin-top:5px;border-radius: 35px;cursor: pointer;background: url("<%=basePath%>img/achoose/onoff2.png");background-size: cover;}
            #choose1{background-position: 0 0;}
            .choose2 div{float: left;width: 77px;height: 33px;cursor: pointer;background: url("<%=basePath%>img/achoose/honoff2.png")}
            #choose2{background-position: 77px 0;}
            .choose3 div{float: left;width: 64px;height: 62px;border-radius: 35px;cursor: pointer;background: url("<%=basePath%>img/achoose/niu2.png")}
            #choose1.selected{background-position: 57px 0;}
            #choose2.selected2{background-position: 0 0;}
            .controlcen{width: 320px; }
            .flot-chart-content{float: left;}
            .b1img p{text-align: center;}
        }
        @media screen and (min-width: 1104px){
            .CChoos{margin-left: 0;}
            .choose2{margin-left:50px;margin-top: 20px;}
            .choose3{margin-left:60px;}
        }
        @media screen and (max-width: 1104px)and (min-width: 1000px){
            .CChoos{margin-left: 0;}
            .choose2{margin-left:50px;margin-top: 20px;}
            .choose3{margin-left:60px;}
            .b1img img{display: none;}
        }
        @media screen and (max-width: 1000px)and (min-width: 530px){
            .CChoos{margin-left: 0;}
            .choose2{margin-left: 50px;margin-top: 20px;}
            .choose3{margin-left: 60px;}
            .b1img img{display: none;}
        }
        @media screen and (max-width: 530px){
            .choose1 div{float: left;width: 64px;height: 62px;border-radius: 35px;cursor: pointer;background: url("<%=basePath%>img/achoose/onoff2.png");background-size: cover;}
            #choose1{background-position: 0 0;}
            .choose2 div{float: left;width: 77px;height: 33px;cursor: pointer;background: url("<%=basePath%>img/achoose/honoff2.png")}
            #choose2{background-position: 77px 0;}
            .choose3 div{float: left;width: 64px;height: 62px;border-radius: 35px;cursor: pointer;background: url("<%=basePath%>img/achoose/niu2.png")}
            #choose1.selected{background-position: 66px 0;}
            #choose2.selected2{background-position: 0 0;}
            .CChoos{margin-left: 0;}
            .choose2{margin-left: 30px;margin-top: 20px;}
            .choose3{margin-left: 10px;}
            .controlcen{width: 260px;}

            .b1img img{display: none;}
            .flot-chart-content{float: left;width: 100%}
            .b1img p{margin-left: -70px;}
        }
       .CChoo div{float:left;width: 90px;height: 30px;cursor:pointer;background-image: url(<%=basePath%>img/off.png);background-size: contain;}
       .control1{border-top:1px solid #eee;border-bottom:none;border-left:none;border-right:none;margin:0 auto;height: auto;margin-top:30px;width: 100%;}
       .control{border-top:1px solid #eee;border-bottom:1px solid #c6c6c6;border-left:none;border-right:none;margin:0 auto;height: auto;margin-top:0px;width: 100%;}
       .control td input{outline:none;width:47px;height:47px;border-radius: 50%;border:2px solid #C5C5C5;}
       .controlcen{width:100%;height:auto;margin: 0 auto;}
    </style>
</head>
<body>
    <div id="wrapper">
        <jsp:include page="../com.jsp"></jsp:include>
        <div id="page-wrapper" class="gray-bg">
        <jsp:include page="../comtop.jsp"></jsp:include>
        <div class="wrapper wrapper-content">
            <div class="row" >
                <div class="col-lg-3 colanal" style="width: 100%;font-size: 20px;">
                    <div class="ibox float-e-margins colanal" >
                        	网关信息:
                        <div class="ibox-title" style="font-size: 14px;" >
                            <ul class="iul">
                                <li>网关名称：<s:property value="#session.gateway.gatewayName"/></li>
                                <li>网关类型：<s:property value="#session.gateway.gatewayType"/></li>
                                <li>通信方式：<s:property value="#session.gateway.pattern"/></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 colanal">
                    <div class="ibox float-e-margins colanal">

                        <div class="ibox-title" style="height: auto">
                            <div class="row" style="margin-bottom: 0" id="isb">
                                <div class="col-lg-3">
                                    <div class="ibox float-e-margins" >
                                        <div class="ibox-title isb" style="height: 180px;border-top:none;">
                                            <div  class="CNTA" style="width:100%;height: 220px;margin: -20px auto;"></div>
                                        </div>
                                        <div class="ibox-content iboxbottom" style="height: 30px;">
                                            <p style="text-align: center;line-height: 10px;">温度</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="ibox float-e-margins">
                                        <div class="ibox-title isb" style="height: 180px;border-top:none;">
                                            <div  class="CNTA" style="height: 220px;margin: -20px auto;"></div>
                                        </div>
                                        <div class="ibox-content iboxbottom" style="height: 30px;">
                                            <p style="text-align: center;line-height: 10px">油压</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="ibox float-e-margins">
                                        <div class="ibox-title isb"  style="height: 180px;border-top:none;">
                                            <div  class="CNTA" style="height: 220px;margin: -20px auto;"></div>
                                        </div>
                                        <div class="ibox-content iboxbottom" style="height: 30px;">
                                            <p style="text-align: center;line-height: 10px">气压</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="ibox float-e-margins">
                                        <div class="ibox-title isb" style="height: 180px;border-top:none;">
                                            <div class="CNTA" style="height: 220px;margin: -20px auto;"></div>
                                        </div>
                                        <div class="ibox-content iboxbottom" style="height: 30px;">
                                            <p style="text-align: center;line-height: 10px">水压</p>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="control1">
                                <div class="controlcen">
                                	<table style="width:90%;margin-left:20px;line-height:50px;">
                                        <tr >
                                            <td >执行器1</td>
                                            <td >ID:0003</td>
                                        </tr>
                                    </table>
                                    </div>
                                    </div>
                            <div class="control">
                                <div class="controlcen">
                                	<table style="width:100%;margin-left:20px;line-height:50px;">
                                        <tr >
                                            <td ><input type="image" src="<%=basePath %>img/kgclose.png" alt="图片" ></td>
                                            <td ><input type="image" src="<%=basePath %>img/kgclose.png" ></td>
                                            <td ><input type="image" src="<%=basePath %>img/kgclose.png" ></td>
                                            <td ><input type="image" src="<%=basePath %>img/kgclose.png" ></td>
                                            <td ><input type="image" src="<%=basePath %>img/kgclose.png" ></td>
                                            <td ><input type="image" src="<%=basePath %>img/kgclose.png" ></td>
                                        </tr>
                                        <tr >
                                            <td >动作一</td>
                                            <td >动作二</td>
                                            <td >动作三</td>
                                            <td >动作四</td>
                                            <td >动作五</td>
                                            <td >动作六</td>
                                        </tr>
                                    </table>
                                 </div>
                            </div>
                            <div class="control1">
                                <div class="controlcen">
                                	<table style="width:90%;margin-left:20px;line-height:50px;">
                                        <tr >
                                            <td >执行器2</td>
                                            <td >ID:0005</td>
                                        </tr>
                                    </table>
                        </div>
                    </div>
                            <div class="control" >
                                <div class="controlcen">
                                	<table style="width:100%;margin-left:20px;line-height:50px;">
                                        <tr >
                                            <td ><input type="image" src="<%=basePath %>img/kgclose.png" ></td>
                                            <td ><input type="image" src="<%=basePath %>img/kgclose.png" ></td>
                                            <td ><input type="image" src="<%=basePath %>img/kgclose.png" ></td>
                                            <td ><input type="image" src="<%=basePath %>img/kgclose.png" ></td>
                                            <td ><input type="image" src="<%=basePath %>img/kgclose.png" ></td>
                                            <td ><input type="image" src="<%=basePath %>img/kgclose.png" ></td>
                                        </tr>
                                        <tr >
                                            <td >动作一</td>
                                            <td >动作二</td>
                                            <td >动作三</td>
                                            <td >动作四</td>
                                            <td >动作五</td>
                                            <td >动作六</td>
                                        </tr>
                                    </table>
							                </div>
							            </div>
							          </div>

                                        </div>
                                    </div>
                                </div>
          
          </div>

        <div class="footer">
            <div style="text-align: center">
                <strong>SLinkcloud</strong> 物联网工作室 &copy; 2016-2017
            </div>
        </div>
        </div>
    </div>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <script src="<%=basePath%>js/navcom.js"></script>
    <script>$(function () {deletegate();})</script>
    <script src="<%=basePath%>js/inspinia.js"></script>
    <script src="<%=basePath%>js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%=basePath%>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="<%=basePath%>js/plugins/pace/pace.min.js"></script>
    <script>
                $(function () {
                    $(".choose1 div").click(function () {
                        $(this).toggleClass("selected");
                    });
                    $(".choose2 div").click(function () {
                        $(this).toggleClass("selected2");
                    });
                    var tagim=$(".controlcen input");
					tagim.each(function(i){
						var t=0;
						var img=$(".controlcen input")[i].src; 
						$(tagim[i]).click(function () {
	                        if(t){
	                        	$(this).css({"border":"2px solid #C5C5C5"})
	                        	$(this).attr('src',img)
	                            t=0;
	                        }else{
	                        	$(this).css({"border":"2px solid #97E2CE"})
	                        	$(this).attr('src',"<%=basePath%>img/kgopen.png")
	                            t=1;
	                        	setTimeout(function(){alert("已开");},100)
	                        }
	                    })
					}) 
                    
                })
    </script>
    <script type="text/javascript">
        /*setInterval(function () {
            var Wid=document.body.offsetWidth;
            var b1W=document.getElementsByClassName("b1img");
            var t1W=document.getElementById("col-lg-3");
            var array=[];
            b1W.each(function () {
                if(Wid<360){
                    b1W[i].style.marginLeft=0;
                }else {
                    b1W.style.marginLeft=70+"px";
                }
            })

            /!*if((Wid>400)&&(Wid<1000)){
                t1W.style.marginTop=0+"px";
            }else {
                t1W.style.marginTop=0;
            }*!/
        },100);*/
        /*function box1() {*/
        	
        	$(document).ready(function(){
                var echar=$(".CNTA")
                echar.each(function(i){
                	$(echar[i]).attr('id',i);
                	var name = $(echar[i]).eq(0).attr('id');   //
                	if(name =="0"){
					    Char({
		            		ID:name,
		            		Name:'温度',
		            		Unit:'℃',
		            		StartA:180,
		            		EndA:0,
		            		split:5,
		            		Max:70
		            	 });
						}else if(name =="1"){
							Char({
				        		ID:name,
				        		Name:'油压',
				        		Unit:'Pa',
				        		StartA:225,
				        		EndA:-45,
				        		split:5,
				        		Max:1000       		
				        	})
						}else if(name=="2"){
							Char({
				        		ID:name,
				        		Name:'气压',
				        		Unit:'Pa',
				        		StartA:225,
				        		EndA:-45,
				        		split:10,
				        		Max:100       		
				        	})
						}else if(name=="3"){
							Char({
				        		ID:name,
				        		Name:'水压',
				        		Unit:'Pa',
				        		StartA:225,
				        		EndA:-45,
				        		split:10,
				        		Max:100       		
				        	})
						}
                	})
			});
        	function Char(agrs){
        		var dom1 = document.getElementById(agrs.ID);
                var myChart1 = echarts.init(dom1);
                var app = {};
                var option1 = null;
                option1 = {
                    tooltip: {
                        formatter: "{a} <br/>{b} : {c}"+agrs.Unit
                    },
                    
                    series: [
                        {
                            name:agrs.Name,
                            type: 'gauge',
                            startAngle:agrs.StartA,
                            endAngle:agrs.EndA,
                            splitNumber:agrs.split,
                            max:agrs.Max,
                            detail: {
                                formatter: '{value}'+agrs.Unit,
                                textStyle: {
                                    color: 'auto',
                                    fontSize: 10
                                }
                            },
                            axisLine: { //仪表盘轴线样式
                                lineStyle: {
                                    color: [[0.2, '#12BC76'], [0.8, 'rgba(140, 174, 248, 0.78)'], [1, '#e6660c']],
                                    width: 20
                                }
                            },
                            splitLine: { //分割线样式
                                length: 20
                            },
                            data: [{value: 20, name: ''}]
                        }
                    ]
                };
                setInterval(function () {
		               option1.series[0].data[0].value = (Math.random() *agrs.Max).toFixed(1) - 0;
		             myChart1.setOption(option1, true);
		           },2000);
           
            if (option1 && typeof option1 === "object") {
                myChart1.setOption(option1, true);
            }
        }
     
    </script>
   
</body>
</html>
