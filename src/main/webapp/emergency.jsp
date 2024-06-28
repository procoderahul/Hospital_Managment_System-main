<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Emergency Contact Page</title>
    <%@include file="component/allcss.jsp"%>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .contact-info {
            margin: 20px 0;
            padding: 10px;
            border: 1px solid #ddd;
            background-color: #fafafa;
        }
        .contact-info h2 {
            color: #333;
            margin-bottom: 10px;
        }
        .contact-info p {
            color: #555;
            margin: 5px 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
    <div class="container">
        <h1>Emergency Contact Information</h1>
        <div class="contact-info">
            <h2>Ambulance Driver Contact</h2>
            <p><strong>Name: Babar Azam</strong> </p>
            <p><strong>Phone Number:</strong> +91 7564738829</p>
            <p><strong>Vehicle Number:</strong> CH-01-7776</p>
        </div>
        <h2>Basic Illness Information</h2>
        <table>
            <tr>
                <th>Illness</th>
                <th>Precautions</th>
                <th>Prescriptions</th>
            </tr>
            <tr>
                <td>Common Cold</td>
                <td>Stay hydrated, rest, avoid cold drinks</td>
                <td>Paracetamol, Cough Syrup</td>
            </tr>
            <tr>
                <td>Fever</td>
                <td>Stay hydrated, rest, avoid heavy meals</td>
                <td>Paracetamol, Ibuprofen</td>
            </tr>
            <tr>
                <td>Headache</td>
                <td>Avoid bright lights, stay hydrated, rest</td>
                <td>Ibuprofen, Acetaminophen</td>
            </tr>
            <tr>
                <td>Stomach Ache</td>
                <td>Avoid spicy food, stay hydrated, rest</td>
                <td>Antacids, Pain Relievers</td>
            </tr>
            <tr>
                <td>Stomach Ache</td>
                <td>Avoid spicy food, stay hydrated, rest</td>
                <td>Antacids, Pain Relievers</td>
            </tr>
            <tr>
                <td>Allergy</td>
                <td>Avoid allergens, keep surroundings clean</td>
                <td>Antihistamines, Nasal Sprays</td>
            </tr>
            <tr>
                <td>Back Pain</td>
                <td>Avoid heavy lifting, maintain good posture</td>
                <td>Pain Relievers, Muscle Relaxants</td>
            </tr>
            <tr>
                <td>Diarrhea</td>
                <td>Stay hydrated, avoid dairy products</td>
                <td>Oral Rehydration Solution, Anti-diarrheal Medications</td>
            </tr>
            <tr>
                <td>Flu</td>
                <td>Stay hydrated, rest, avoid cold drinks</td>
                <td>Antiviral Medications, Pain Relievers</td>
            </tr>
            <tr>
                <td>Constipation</td>
                <td>Increase fiber intake, stay hydrated</td>
                <td>Laxatives, Fiber Supplements</td>
            </tr>
            <tr>
                <td>High Blood Pressure</td>
                <td>Reduce salt intake, maintain a healthy weight</td>
                <td>Antihypertensive Medications, Lifestyle Changes</td>
            </tr>
        </table>
    </div>
</body>
</html>
