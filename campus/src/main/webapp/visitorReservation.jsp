<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>访客预约</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-size: 22px;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 22px;
            width: 400px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
            font-size: 20px;
        }

        button {
            background-color: #0b6ed2;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #0b6ed2;

        }
    </style>
    <script>
        function handleParkingSelection() {
            var parkingSelect = document.getElementById("parking");
            var carPlateInput = document.getElementById("carPlate");

            if (parkingSelect.value === "no") {
                carPlateInput.value = "none";
                carPlateInput.disabled = true;
            } else {
                carPlateInput.value = "";
                carPlateInput.disabled = false;
            }
        }
    </script>
</head>
<body>

    <div class="container">
        <h2 style="font-size: 32px">访客预约</h2>

        <form action="applyservlet" method="post" accept-charset="UTF-8">
            <label for="name">姓名:</label>
            <input type="text" id="name" name="name" required>

            <label for="phone">手机号:</label>
            <input type="tel" id="phone" name="phone" required>

            <label for="startTime">开始时间:</label>
            <input type="datetime-local" id="startTime" name="startTime" required>

            <label for="endTime">结束时间:</label>
            <input type="datetime-local" id="endTime" name="endTime" required>

            <label for="parking">入校停车:</label>
            <select id="parking" name="parking" onchange="handleParkingSelection()">
                <option value="yes">Yes</option>
                <option value="no">No</option>
                
            </select>

            <label for="carPlate">车牌号:</label>
            <input type="text" id="carPlate" name="carPlate">

            <label for="reason">访问事由:</label>
            <textarea id="reason" name="reason" rows="4" required></textarea>

            <button type="submit">提交预约</button>
        </form>
    </div>

</body>
</html>
