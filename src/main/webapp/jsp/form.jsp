<%--
  Created by IntelliJ IDEA.
  User: Chao
  Date: 2018/6/20
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<script type="application/javascript">

    $(function () {

    });

</script>

<form id="ff" method="post">
    <div style="margin-left: 60px;margin-top: 50px;">
        <h3 id="h1"></h3>
    </div>
    <input type="hidden" name="id">
    <div style="margin-left: 60px;">
        <label for="name">UserName:</label>
        <input class="easyui-textbox" data-options="required:true" name="username" style="width:300px;height:40px;">
    </div>
    <div style="margin-left: 60px;">
        <label for="password">PassWord:</label>
        <input class="easyui-passwordbox" data-options="required:true" prompt="Password"name="password" iconWidth="28" style="width:300px;height:40px;margin:10px;padding:10px">
    </div>
    <a id="btnff"></a>
</form>

