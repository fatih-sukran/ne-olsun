import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

Future counterOfProducts2(
  OrderDetailStruct product,
  int step,
  List<OrderDetailStruct> productDetails,
) async {
  product.count += step;

  if (product.count == 0) {
    productDetails.remove(product);
    return;
  }
}
