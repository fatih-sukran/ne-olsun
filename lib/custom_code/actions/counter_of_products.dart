import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';

Future counterOfProducts(
  ProductsRecord product,
  int step,
) async {
  print('product: ${product.name}');
  print('step: $step');

  var orderDetailStructs = FFAppState().orderProducts.where(
      (element) => element.product.productId?.id == product.reference.id);

  if (orderDetailStructs.isEmpty) {
    print('orders is empty');
    print(product.reference);
    print(product.name);
    print(product.description);
    print(product.imageUrl);
    ProductStruct productStruct = ProductStruct(
      productId: product.reference,
      name: product.name,
      description: product.description,
      imageUrl: product.imageUrl,
      price: product.price,
    );

    OrderDetailStruct orderDetail = OrderDetailStruct(
      completedCount: 0,
      count: step,
      product: productStruct,
    );
    FFAppState().orderProducts.add(orderDetail);
    return;
  }

  print('count: ${orderDetailStructs.first.count}');
  orderDetailStructs.first.count += step;
}
