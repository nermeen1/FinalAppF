import 'package:finalProject/config/theme.dart';

import '../../model/user_order.dart';

abstract class OrderRepository {
 
  Future<List<UserOrder>> getMyOrders(
      {int pageIndex = 0, int pageSize = AppConsts.page_size});

  Future<UserOrder> getOrderDetails(int orderId);

  
  Future placeNewOrder(UserOrder order);


  Future updateOrder(UserOrder order);
}
