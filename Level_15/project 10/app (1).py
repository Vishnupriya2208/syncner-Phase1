
from flask import Flask, render_template, request, redirect
from sqlalchemy import create_engine, text
import datetime

app = Flask(__name__)

db_user = 'root'
db_password = 'root'  
db_host = 'localhost'
db_name = 'shopping_db'  

engine = create_engine(f"mysql+pymysql://{db_user}:{db_password}@{db_host}/{db_name}")

@app.route('/')
def home():
    return redirect('/input')

@app.route('/input', methods=['GET', 'POST'])
def input_data():
    if request.method == 'POST':
        customer_name = request.form['customer_name']
        email = request.form['email']
        phone = request.form['phone']
        product_name = request.form['product_name']
        quantity = int(request.form['quantity'])
        price = float(request.form['price'])
        order_date = datetime.date.today()

        with engine.begin() as conn:
            result = conn.execute(
                text("INSERT INTO customers (customer_name, email, phone) VALUES (:customer_name, :email, :phone)"),
                {"customer_name": customer_name, "email": email, "phone": phone}
            )
            customer_id = result.lastrowid 

            conn.execute(
                text("INSERT INTO orders (customer_id, product_name, quantity, price, order_date) VALUES (:customer_id, :product_name, :quantity, :price, :order_date)"),
                {"customer_id": customer_id, "product_name": product_name, "quantity": quantity, "price": price, "order_date": order_date}
            )

        return redirect('/report')

    return render_template('input.html')

@app.route('/report')
def report():
    with engine.connect() as conn:
        result = conn.execute(
            text("""
                SELECT c.customer_id, c.customer_name, c.email, c.phone,
                       o.order_id, o.product_name, o.quantity, o.price, o.order_date
                FROM customers c
                JOIN orders o ON c.customer_id = o.customer_id
                ORDER BY o.order_date DESC
            """)
        )
        data = result.fetchall()

    return render_template('report.html', data=data)

if __name__ == '__main__':
    app.run(debug=True)
