import '/backend/backend.dart';

int getProductCount(
  List<OrderDetailStruct> orderDetails,
  ProductsRecord product,
) {
  var filteredOrders = orderDetails.where(
      (element) => element.product.productId?.id == product.reference.id);
  if (filteredOrders.isEmpty) return 0;

  return filteredOrders.first.count;
}

double getTotalOrderPrice(List<OrderDetailStruct> orders) {
  if (orders.isEmpty) return 0;
  return orders
      .map((e) => e.product.price * e.count)
      .fold(0, (value, element) => value + element);
}

int getProductCountForHorizantolCounter(
  OrderDetailStruct product,
  List<OrderDetailStruct> orderDetails,
) {
  var num = orderDetails
      .where((e) => e.orderDetailId?.id == product.orderDetailId?.id)
      .toList();

  return num.isEmpty ? 0 : num.first.count;
}
