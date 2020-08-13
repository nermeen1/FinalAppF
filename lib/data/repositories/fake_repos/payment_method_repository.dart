
import 'package:finalProject/data/model/payment_method.dart';
import 'package:finalProject/data/repositories/abstract/payment_method_repository.dart';

class FakePaymentMethodRepository implements PaymentMethodRepository{

  final PaymentMethodDataStorage dataStorage = PaymentMethodDataStorage([
    PaymentMethodModel(
      id: 1,
      nameOnCard: 'Andrew Poteryahin',
      cardNumber: '4000 0000 0000 0001',
      expiryDateMonth: 12,
      expiryDateYear: 2025,
      cvv: 111,
      isDefault: true
    ),
    PaymentMethodModel(
      id: 2,
      nameOnCard: 'Andrew Poteryahin',
      cardNumber: '4000 0000 0000 0002',
      expiryDateMonth: 12,
      expiryDateYear: 2025,
      cvv: 111,
      isDefault: true
    )
  ]);


  @override
  Future addPaymentMethod(PaymentMethodModel shippingAddress) {
    
    throw UnimplementedError();
  }

  @override
  Future<List<PaymentMethodModel>> getPaymentMethodList() async {
    return dataStorage.paymentMethods;
  }

  @override
  Future removePaymentMethod(int paymentMethodId) {
    
    throw UnimplementedError();
  }

  @override
  Future setDefaultPaymentMethod(int paymentMethodId) {
    
    throw UnimplementedError();
  }

  @override
  Future<PaymentMethodModel> getDefaultPaymentMethod() {
    
    throw UnimplementedError();
  }
}