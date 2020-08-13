
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OpenFlutterProductRating extends StatelessWidget {
  
  final double rating;
  final int ratingCount;
  final int starCount;
  final MainAxisAlignment alignment;
  final double iconSize;
  final double spacing;
  final bool rtl;

  final bool showLabel;

  final double labelFontSize;

  final bool editable;

  final bool showDefaultStar;

  final Function(double rating) onRatingSelected;

  const OpenFlutterProductRating({
    Key key,
    this.rating,
    this.ratingCount,
    this.alignment = MainAxisAlignment.center,
    this.starCount = 5,
    this.iconSize = 24.0,
    this.spacing = 2.0,
    this.onRatingSelected,
    this.rtl = false,
    this.showLabel = true,
    this.labelFontSize = 14.0,
    this.editable = false,
    this.showDefaultStar = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: alignment,
      children: <Widget>[
        _buildStars(context, rating),
        _buildRatingLabel(context),
      ],
    );
  }

  Widget _buildStars(BuildContext context, double rating) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: spacing,
      children: List.generate(starCount, (index) => _buildStar(index)),
    );
  }

  Widget _buildStar(int index) {
    return GestureDetector(
      onTap: editable
          ? () {
              onRatingSelected(_calculateRatingSelected(index));
            }
          : null,
      child: Container(
        width: iconSize + 2.0,
        height: iconSize + 2.0,
        child: Center(
          child: _buildStarIcon(index),
        ),
      ),
    );
  }
  Widget _buildStarIcon(int index) {
    var isSelected = _isStarSelected(index);

    if (isSelected || showDefaultStar) {
      return SvgPicture.asset(
          'assets/icons/products/star' + (isSelected ? '_fav' : '') + '.svg',
          width: iconSize,
          height: iconSize);
    }

    return Container(
      width: iconSize,
      height: iconSize,
    );
  }

  double _calculateRatingSelected(int index) {
    if (!rtl) {
      return index + 1.0;
    }

    return starCount - (index + 1.0);
  }

  bool _isStarSelected(int index) {
    if (!rtl) {
      return rating > index;
    }

    return rating > (starCount - (index + 1));
  }

  Widget _buildRatingLabel(BuildContext context) {
    return showLabel && ratingCount > 0 ? _buildLabel(context) : Container();
  }

  Widget _buildLabel(BuildContext context) {
    return SizedBox(
      height: iconSize,
      child: Center(
        child: Text(
          ' (' + ratingCount.toInt().toString() + ')',
          style: Theme.of(context)
              .textTheme
              .body1
              .copyWith(fontSize: labelFontSize),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
