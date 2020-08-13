

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:finalProject/data/model/product.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class HomeLoadEvent extends HomeEvent {
  @override
  String toString() => 'Home is Loaded';
}

class HomeAddToFavoriteEvent extends HomeEvent {
  final bool isFavorite;
  final Product product;

  HomeAddToFavoriteEvent({this.isFavorite, this.product});

  @override
  List<Object> get props => [isFavorite, product];
}
