<%--
  Created by IntelliJ IDEA.
  User: Chao
  Date: 2018/6/24
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<script type="application/javascript">
    $(function () {
        $('#dg').datagrid({
            url:'${pageContext.request.contextPath}/user/queryByPage',
            columns:[[
                {field:'id',title:'ID',width:10},
                {field:'username',title:'名称',width:10},
                {field:'password',title:'密码',width:10}
            ]],
            striped:true,
            singleSelect:true,
            pagination:true,
            pageSize:3,
            pageList:[3,5,7,9,11],
            fitColumns:true,
            toolbar:"#search",
        });

        $("#add").linkbutton({
            text:"添加",
            iconCls: 'icon-add',
            width:80,
            height:30,
            onClick: function(){
                /* alert('添加');*/
                var rowData = $("#dg").datagrid("getSelected");
                $("#dialog").dialog({
                    title: "添加用户",
                    width: 500,
                    height: 350,
                    closed: false,
                    cache: false,
                    modal: true,
                    href: "${pageContext.request.contextPath}/jsp/form.jsp",
                    buttons:[{
                        text:'提交',
                        handler:function(){
                            $("#ff").form("submit", {
                                url:"${pageContext.request.contextPath}/user/add",
                                onSubmit: function(){
                                    //验证表单
                                    var isValid = $(this).form('validate');
                                    if(!isValid){
                                        return false;
                                    }
                                    // do some check
                                    // return false to prevent submit;
                                },
                                success:function(data){
                                    $("#dialog").dialog("close",{
                                    });
                                }
                            });
                        }
                    },{
                        text:'关闭',
                        handler:function(){
                            $("#dialog").dialog("close",{
                            });
                        }
                    }],
                    onLoad:function(){
                        $("#h1").text("用户信息");
                    }
                });
            }
        });

        $("#delete").linkbutton({
            text:"删除",
            iconCls: 'icon-cancel',
            width:80,
            height:30,
            onClick: function(){
                /*  alert('删除');*/
                var rowData = $("#dg").datagrid("getSelected");
                if(rowData==null) {
                    alert("请选择一条数据...");
                }else {
                    console.log(rowData.id);
                    $.ajax({
                        url:"${pageContext.request.contextPath}/user/removeById",
                        type:"POST",
                        data:{"id":rowData.id}
                    })
                }

            }
        });

        $("#update").linkbutton({
            text:"修改",
            iconCls: 'icon-edit',
            width:80,
            height:30,
            onClick: function(){
                var rowData = $("#dg").datagrid("getSelected");
                if(rowData==null) {
                    alert("请选择一条数据...");
                }else {
                    $("#dialog").dialog({
                        title: rowData.username + " 的信息",
                        width: 500,
                        height: 350,
                        closed: false,
                        cache: false,
                        modal: true,
                        href: "${pageContext.request.contextPath}/jsp/form.jsp",
                        buttons:[{
                            text:'提交',
                            handler:function(){
                                $("#ff").form("submit", {
                                    url:"${pageContext.request.contextPath}/user/modify",
                                    onSubmit: function(){
                                        //验证表单
                                        var isValid = $(this).form('validate');
                                        if(!isValid){
                                            return false;
                                        }
                                        // do some check
                                        // return false to prevent submit;
                                    },
                                    success:function(data){
                                        $("#dialog").dialog("close",{

                                        });
                                    }
                                });
                            }
                        },{
                            text:'关闭',
                            handler:function(){
                                $("#dialog").dialog("close",{

                                });
                            }
                        }],
                        onLoad:function(){
                            $("#h1").text(rowData.username + " 的信息");
                            //表单中 回显数据
                            $("#ff").form("load",rowData);
                        }

                    });
                }

            }
        });

        $('#ss').searchbox({
            searcher:function(value,name){
                /*   alert(value + "," + name)*/
                $("#dg").datagrid({
                    url:"${pageContext.request.contextPath}/user/queryByPage"
                }),
                    $("#dg").datagrid("load",{
                        "key":name,
                        "value":value
                    })
            },
            menu:'#mm',
            prompt:'请输入值',
            width:300,
            height:30
        });

    })

</script>

<table id="dg"></table>

<di id="search">

    <a id="add"></a>
    <a id="delete"></a>
    <a id="update"></a>

    <input id="ss"></input>
    <div id="mm" style="width:120px">
        <div data-options="name:'id',iconCls:'icon-ok'">ID</div>
        <div data-options="name:'username'">UserName</div>
    </div>
    </div>

    <div id="dialog"></div>