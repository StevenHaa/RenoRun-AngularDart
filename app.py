# Created by Gary O'Rourke for RenoRun Intern Candidate Test

# Imports
from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
import os

# Init app
app = Flask(__name__)
CORS(app)
basedir = os.path.abspath(os.path.dirname(__file__))
# Database
app.config[
    'SQLALCHEMY_DATABASE_URI'] = "mysql://RenoRun:o7feu6hC*3qVnfMsON@candidate.cgaxg1swcr35.us-east-1.rds.amazonaws.com:3306/develop"

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# Init db
db = SQLAlchemy(app)
# Init ma
ma = Marshmallow(app)


# Product class
class Products(db.Model):
    product_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), unique=True)
    description = db.Column(db.String(), unique=False)
    price = db.Column(db.Float, )

    def __init__(self, name, description, price, ):
        self.name = name
        self.description = description
        self.price = price


# Product Schema
class ProductSchema(ma.Schema):
    class Meta:
        fields = ('product_id', 'name', 'description', 'price',)


# Order class

class Product(db.Model):
    product_id = db.Column(db.Integer, primary_key=True)

    def __init(self, product_id, ):
        self.product_id = product_id

class Orders(db.Model):
    order_id = db.Column(db.Integer, primary_key=True)
    product_id = db.Column(db.Integer, db.ForeignKey('product.product_id'))
    color = db.Column(db.String(50), unique=False)
    email = db.Column(db.String(100), unique=True)

    def __init__(self, product_id, color, email, ):
        self.product_id = product_id
        self.color = color
        self.email = email


def row2dict(row):
    return {c.name: str(getattr(row, c.name)) for c in row.__table__.columns}


# Order Schema
class OrderSchema(ma.Schema):
    class Meta:
        fields = ('order_id, product_id', 'color', 'email')


# Init schema
product_schema = ProductSchema(strict=True)
order_schema = OrderSchema(many=True, strict=True)
products_schema = ProductSchema(many=True, strict=True)


# Get All Products
@app.route('/products', methods=['GET'])
def get_all_products():
    all_products = Products.query.all()
    result = products_schema.dump(all_products)
    return jsonify(result.data)


# Get A Product
@app.route('/products/<product_id>', methods=['GET'])
def get_product(product_id):
    product = Products.query.get(product_id)
    result = product_schema.dump(product)
    return jsonify(result.data)


# Get All Orders
@app.route('/orders', methods=['GET'])
def get_all_orders():
    all_orders = Orders.query.all()
    return jsonify([row2dict(order) for order in all_orders])

# Get Order
@app.route('/orders/<order_id>', methods=['GET'])
def get_order(order_id):
    order = Orders.query.get(order_id)
    return jsonify(row2dict(order))


# Post Orders
@app.route('/orders', methods=['POST'])
def post_order():
    product_id = request.json['product_id']
    color = request.json['color']
    email = request.json['email']

    new_order = Orders(product_id, email, color)
    db.session.add(new_order)
    db.session.commit()

    return jsonify(row2dict(new_order))


# Run Server
if __name__ == '__main__':
    app.run(debug=True)
