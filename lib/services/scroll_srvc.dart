import 'package:flutter/rendering.dart';

// This app uses ScrollablePositionedList for its ListViews which contain the
// prayer texts. As ScrollablePositionedList did not support the regular scroll
// direction detection, this service class implements it.

class ScrollService {
  var scrollPosition = 0.0;
  var scrollDirection;

  ScrollDirection determineScrollDirection(item) {
    var itemOffset = item.itemTrailingEdge;
    var itemIndex = item.index;
    // index as well as offset are multiplied to determine the total scroll
    // offset within the list. Since index is initially 0, some positive value
    // (0.00001) is added as the result of the multiplication will otherwise
    // be 0. Subtracting a large value from the offset made it more robust to
    // "flickering" in situations where scrolling is "fading out"
    var currentScrollPosition =
        (itemIndex + 0.000001) * (itemOffset - 10000000000);
    if (currentScrollPosition != scrollPosition) {
      if (currentScrollPosition < scrollPosition &&
          scrollDirection != ScrollDirection.forward) {
        scrollDirection = ScrollDirection.forward;
      } else if (currentScrollPosition > scrollPosition &&
          scrollDirection != ScrollDirection.reverse) {
        scrollDirection = ScrollDirection.reverse;
      }
      scrollPosition = currentScrollPosition;
    }
    return scrollDirection;
  }
}
