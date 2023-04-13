<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Payment Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
    }
    label {
      display: block;
      margin-bottom: 10px;
      font-weight: bold;
    }
    input[type="text"],
    input[type="submit"] {
      display: block;
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
      box-sizing: border-box;
      font-size: 16px;
      margin-bottom: 20px;
    }
    input[type="submit"] {
      background-color: #4CAF50;
      color: #fff;
      font-weight: bold;
      cursor: pointer;
    }
    input[type="submit"]:hover {
      background-color: #3e8e41;
    }
    .card-type {
      margin-bottom: 20px;
      font-weight: bold;
    }
    .error {
      color: red;
    }
  </style>
  <script>
    function validateCard() {
      var cardNum = document.getElementById('cardNum').value;
      var visaRegex = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
      var mastercardRegex = /^(?:5[1-5][0-9]{14})$/;
      var cardTypeField = document.getElementById('cardType');
      var errorField = document.getElementById('error');
      
      if (visaRegex.test(cardNum)) {
        cardTypeField.innerHTML = "Visa";
        cardTypeField.classList.remove('error');
        return true;
      } else if (mastercardRegex.test(cardNum)) {
        cardTypeField.innerHTML = "Mastercard";
        cardTypeField.classList.remove('error');
        return true;
      } else {
        errorField.innerHTML = 'Please enter a valid Visa or Mastercard card number.';
        cardTypeField.innerHTML = "";
        cardTypeField.classList.add('error');
        return false;
      }
    }
  </script>
</head>
<body>
  <h1 style="text-align:center">Payment Form</h1>
  <form action="order_success.jsp" method="post" onsubmit="return validateCard();">
    <label for="cardNum">Card Number:</label>
    <input type="text" placeholder = "XXXX-XXXX-XXXX-XXXX"id="cardNum" name="cardNum" maxlength="16" required>
    <div class="card-type" id="cardType"></div>
    <div class="error" id="error"></div>
    <label for="expDate">Expiration Date:</label>
    <input type="text" placeholder = "MM/YY"id="expDate" name="expDate" maxlength="5" required>
    <label for="cardholderName">Cardholder Name:</label>
    <input type="text"  placeholder = "Enter your full name" id="cardholderName" name="cardholderName" required>
    <label for="cvv">CVV:</label>
    <input type="text" placeholder = "XXX"id="cvv" name="cvv" maxlength="3" required>
    <input type="submit" value="Make Payment">
    
  </form>
  
</body>
</html>