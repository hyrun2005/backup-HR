from django.shortcuts import redirect
from cloudipsp import Api, Checkout

def test_payment(request):
    api = Api(merchant_id=1396424, secret_key='test')  # Використовуйте тестовий merchant_id і ключ
    checkout = Checkout(api=api)
    data = {
        "currency": "USD",  # Валюта оплати
        "amount": 10000,    # Сума в копійках (тобто 100 USD)
        "order_id": "test_order_12345",  # Унікальний ID замовлення
        "order_desc": "Тестова оплата Fondy"
    }
    payment_url = checkout.url(data).get('checkout_url')
    return redirect(payment_url)
