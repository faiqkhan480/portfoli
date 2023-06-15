import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double _screenWidth;
  static late double _screenHeight;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;
  static late double screenWidth;
  static late double screenHeight;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
    }
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    screenWidth = _screenWidth;
    screenHeight = _screenHeight;
    textMultiplier = _blockSizeVertical;
    imageSizeMultiplier = _blockSizeHorizontal;
    heightMultiplier = _blockSizeVertical;

    // print("Image Size\n");
    // print(imageSizeMultiplier);

    // print("Text Size\n");
    // print(textMultiplier);

    // print("Height Size\n");
    // print(heightMultiplier);
  }
}

class EmptySpace extends StatelessWidget {
  const EmptySpace(
      {super.key, this.multiple = 1, this.horizontal = false, this.both = true});
  final num multiple;
  final bool horizontal;
  final bool both;

  const EmptySpace.v2({multiple = 2}) : this(multiple: multiple, both: false);

  const EmptySpace.v3({multiple = 3}) : this(multiple: multiple, both: false);

  const EmptySpace.v4({multiple = 4}) : this(multiple: multiple, both: false);

  const EmptySpace.horizontal({multiple = 1})
      : this(multiple: multiple, horizontal: true, both: false);

  const EmptySpace.h2({multiple = 2})
      : this(multiple: multiple, horizontal: true, both: false);

  const EmptySpace.h3({multiple = 3})
      : this(multiple: multiple, horizontal: true, both: false);

  const EmptySpace.h4({multiple = 4})
      : this(multiple: multiple, horizontal: true, both: false);

  const EmptySpace.all({multiple = 1}) : this(multiple: multiple, both: true);

  const EmptySpace.a2({multiple = 2}) : this(multiple: multiple, both: true);

  const EmptySpace.a3({multiple = 3}) : this(multiple: multiple, both: true);

  const EmptySpace.a4({multiple = 4}) : this(multiple: multiple, both: true);

  @override
  Widget build(BuildContext context) {
    final double size = 8.0 * multiple;
    if (both) {
      return SizedBox(
        height: size,
        width: size,
      );
    }

    return SizedBox(
      height: horizontal ? 0 : size,
      width: horizontal ? size : 0,
    );
  }
}