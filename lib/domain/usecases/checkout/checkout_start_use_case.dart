import 'package:flutter/material.dart';
import 'package:finalProject/data/model/cart_item.dart';
import 'package:finalProject/data/model/payment_method.dart';
import 'package:finalProject/data/model/shipping_address.dart';
import 'package:finalProject/data/repositories/abstract/cart_repository.dart';
import 'package:finalProject/data/repositories/abstract/payment_method_repository.dart';
import 'package:finalProject/data/repositories/abstract/shipping_address_repository.dart';
import 'package:finalProject/domain/usecases/base_use_case.dart';
import 'package:finalProject/locator.dart';




abstract class CheckoutStartUseCase
  implements BaseUseCase<ChekcoutStartResult, ChekcoutStartParams> {}

    
class CheckoutStartUseCaseImpl implements CheckoutStartUseCase {
  @override
  Future<ChekcoutStartResult> execute(ChekcoutStartParams params) async {
    
    try {
      ShippingAddressRepository shippingAddressRepository = sl();
      PaymentMethodRepository paymentMethodRepository = sl();
      CartRepository cartRepository = sl();
      
      const double deliveryPrice = 10;
      final double calculatedPrice = cartRepository.getCalculatedPrice();
      return ChekcoutStartResult(
        result: true,
        paymentMethods: await paymentMethodRepository.getPaymentMethodList(),
        shippingAddress: await shippingAddressRepository.getShippingAddressList(),
        cartItems: await cartRepository.getCartContent(),
        currentPaymentMethod:  await paymentMethodRepository.getDefaultPaymentMethod(),
        currentShippingAddress: await shippingAddressRepository.getDefaultShippingAddress(),
        totalCalculatedPrice: calculatedPrice,
        deliveryPrice: deliveryPrice, 
        summaryPrice: calculatedPrice + deliveryPrice
      );
    } catch (e) {
      return ChekcoutStartResult(  
        result: false,
        exception: CheckoutStartException(), 
        currentPaymentMethod: null, 
        deliveryPrice: null, 
        totalCalculatedPrice: null
      );
    }
  }
}

class ChekcoutStartResult extends UseCaseResult {
  final List<PaymentMethodModel> paymentMethods;
  final List<ShippingAddressModel> shippingAddress;
  final List<CartItem> cartItems;
  final ShippingAddressModel currentShippingAddress;
  final PaymentMethodModel currentPaymentMethod;
  final double totalCalculatedPrice;
  final double deliveryPrice;
  final double summaryPrice;

  ChekcoutStartResult({
    this.paymentMethods,
    this.shippingAddress,
    this.cartItems,
    this.currentShippingAddress,
    @required this.currentPaymentMethod,
    @required this.totalCalculatedPrice,
    @required this.deliveryPrice,
    this.summaryPrice,
    Exception exception, bool result}) 
    : super(exception: exception, result: result);
}

class ChekcoutStartParams{ }

class CheckoutStartException implements Exception { }