
class ProductModel {
  int? orderId;
  String? productId;
  String? priceId;
  String? paymentIntentId;

  ProductModel({this.orderId, this.productId, this.priceId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    productId = json['product_id'];
    priceId = json['price_id'];
    paymentIntentId=json['payment_intent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['product_id'] = productId;
    data['price_id'] = priceId;
    return data;
  }
}