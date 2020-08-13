

import 'package:finalProject/data/model/payment_method.dart';


abstract class PaymentMethodRepository {
 
  Future<List<PaymentMethodModel>> getPaymentMethodList();
  
  Future addPaymentMethod(PaymentMethodModel shippingAddress);
 
  Future setDefaultPaymentMethod(int paymentMethodId);
  
  Future removePaymentMethod(int paymentMethodId);
  
  Future<PaymentMethodModel> getDefaultPaymentMethod();
}

class PaymentMethodDataStorage {
  List<PaymentMethodModel> paymentMethods;

  PaymentMethodDataStorage(this.paymentMethods);
}