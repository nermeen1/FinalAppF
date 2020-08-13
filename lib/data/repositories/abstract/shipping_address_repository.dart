

import 'package:finalProject/data/model/shipping_address.dart';

abstract class ShippingAddressRepository {
 
  Future<List<ShippingAddressModel>> getShippingAddressList();
  
  Future addShippingAddress(ShippingAddressModel shippingAddress);
  
  Future setDefaultShippingAddress(int shippingAddressId);
  
  Future removeShippingAddress(int shippingAddressId);
 
  Future<ShippingAddressModel> getDefaultShippingAddress();
}

class ShippingAddressDataStorage {
  List<ShippingAddressModel> shippingAddresses;

  ShippingAddressDataStorage(this.shippingAddresses);
}