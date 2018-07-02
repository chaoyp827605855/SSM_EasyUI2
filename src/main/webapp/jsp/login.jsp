<%--
  Created by IntelliJ IDEA.
  User: Chao
  Date: 2018/6/24
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/themes/icon.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>

    <script type="application/javascript">

        $(function () {

            $("#dd").dialog({
                buttons:[{
                    text:'保存',
                    width:60,
                    height:40,
                    handler:function(){
                        $("#form").form({
                            url:"",
                            onSubmit:function () {
                                
                            },//onSubmit
                            success:function () {

                            }//success
                        }); //form
                    },//handler
                },{
                    text:'关闭',
                    width:60,
                    height:40,
                    handler:function(){}
                }]
            })
        });

    </script>
    <style type="text/css">
        body{
            margin: auto;
        }
    </style>
</head>
<body>

<div id="dd" class="easyui-dialog" title="登录" style="width:600px;height:400px;"data-options="iconCls:'icon-save',resizable:true,modal:true">
        <div>
            <div style="margin-left: 150px;margin-top:80px;width:400px;height:200px;">
                <form id="form" method="post">
                    <table>
                            <tr>
                                <td colspan="2" style="text-align:center"><span style="font-size: 20px;">&nbsp&nbsp登&nbsp&nbsp录</span></td>

                            </tr>
                            <tr>
                                <td>
                                    <label for="name" data-options="labelAlign:'left'">账号:</label>
                                </td>
                                <td>
                                    <input class="easyui-textbox" data-options="" style="width:200px;height:40px;">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pssword" data-options="labelAlign:'left'">密码:</label>
                                </td>
                                <td>
                                    <input class="easyui-passwordbox" prompt="Password" iconWidth="28" style="width:200px;height:40px;">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
