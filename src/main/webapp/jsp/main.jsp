<%--
  Created by IntelliJ IDEA.
  User: Chao
  Date: 2018/6/24
  Time: 13:29
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
            $('#tree_data').tree({
                url: "${pageContext.request.contextPath}/json/tree_data.json",
                onClick:function (node) {
                    //console.log($(node.target).text());
                    var nodeText = $(node.target).text();
                    if(nodeText == "用户信息") {
                        console.log($(node.target));
                        addTab($(node.target));
                    }
                }

//                loadFilter: function(data){
//                if (data.d){
//                    return data.d;
//                } else {
//                    return data;
//                }
//            }

            });
        });


        function addTab(res) {
//            console.log(res);
//            console.log(res.text());
            var exists = $("#tt").tabs("exists",res.text());
//            console.log(exists);
            if(!exists){
                $("#tt").tabs("add",{
                    iconCls:"icon-ok",
                    title:res.text(),
                    closable:true,
                    href:"${pageContext.request.contextPath}/jsp/datagrid.jsp",
                });
            }else {
                $("#tt").tabs("select",res.text);
            }
        }

    </script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',title:'North Title',split:true" style="height:150px;"></div>
    <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>
    <div data-options="region:'west',title:'菜单',split:true" style="width:200px;">
        <ul id="tree_data"></ul>
    </div>
    <div data-options="region:'center',title:'内容'" style="padding:5px;background:#eee;">
        <div id="tt"class="easyui-tabs" data-options="fit:true" style="width:500px;height:250px;">
            <div title="主页" style="padding:20px;display:none;"></div>
        </div>
    </div>
</body>
</html>