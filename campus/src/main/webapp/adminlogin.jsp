<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<title>管理端</title>
<style>
    div {
        color: #d6d6d6;
        width: 790px;
        margin: 100px auto;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        display: flex;
        justify-content: center; /* 在水平方向上居中对齐 */
        align-items: center; /* 在垂直方向上居中对齐 */
        height: 300px;  /*设置容器高度为视口高度，实现垂直居中 */
        border-radius: 20px; /* 设置按钮为圆角 */
    }

    input[type="button"] {
        width: 245px; /* 设置按钮宽度为150像素 */
        height: 260px; /* 设置按钮高度为50像素 */
        background-color: #6195c9; /* 设置按钮背景颜色为蓝色 */
        color: #ffffff; /* 设置按钮文字颜色为白色 */
        font-size: 45px;
        border-radius: 20px; /* 设置按钮为圆角 */
        margin-right: 10px; /* 设置右边距，调整按钮之间的距离 */
        display: block; /* 将按钮设置为块级元素，竖列对齐 */
        vertical-align: top; /* 设置按钮的垂直对齐方式为顶部 */
    }

    h1 {
        margin-top: 150px; /* 距离顶部的上边距 */
        color: #fcf8f8;
        text-align: center; /* 文字居中对齐 */
        font-size: 55px;
    }
</style>
</head>
<h1 style="font-size: 55px;text-align: center; ">欢迎进入管理端</h1>

<body style="background-image: url('login1.png'); background-size: cover;">
    <div id="sidebar">
        <input type="button" value="审批管理" onclick="location.href='admin.jsp'" />
        <input type="button" value="今日访客" onclick="location.href='today.jsp'" />
        <input type="button" value="地点管理" onclick="location.href='local.jsp'" />
        <input type="button" value="公告管理" onclick="location.href='noticemanagement.jsp'" />
    </div>
</body>
</html>