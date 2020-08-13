

import 'package:flutter/material.dart';
import 'package:finalProject/data/model/app_user.dart';

abstract class UserRepository {
 
  Future<String> signIn({
    @required String email,
    @required String password,
  });


  Future<String> signUp({
    @required String name,
    @required String email,
    @required String password,
  });

  
  Future<AppUser> getUser();

 
  Future<void> forgotPassword({
    @required String email,
  });
}
