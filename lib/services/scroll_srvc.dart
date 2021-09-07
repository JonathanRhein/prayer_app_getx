import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:prayer_app_getx/controllers/agpeya_hour_ctl.dart';

// This app uses ScrollablePositionedList for its ListViews which contain the
// prayer texts. As ScrollablePositionedList did not support the regular scroll
// direction detection, this service class implements it.

class ScrollService {
  var itemOffsetTrailing;
  var itemOffsetLeading;
  var itemOffsetLeadingNew;
  var itemIndex;

  var scrollPosition = 0.0;
  var scrollDirection;

  ScrollDirection determineScrollDirection(item) {
    itemOffsetTrailing = item.itemTrailingEdge;
    itemIndex = item.index;
    // index as well as offset are multiplied to determine the total scroll
    // offset within the list. Since index is initially 0, some positive value
    // (0.00001) is added as the result of the multiplication will otherwise
    // be 0. Subtracting a large value from the offset made it more robust to
    // "flickering" in situations where scrolling is "fading out"
    var currentScrollPosition =
        (itemIndex + 0.000001) * (itemOffsetTrailing - 10000000000);
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

  bool reachedTop(item) {
    itemOffsetLeading = item.itemLeadingEdge;
    // make sure true gets returned only one time and not each and every time
    // when the screen is tapped and the scroll position has not changed
    if (itemOffsetLeadingNew != itemOffsetLeading) {
      itemOffsetLeadingNew = itemOffsetLeading;
      return itemIndex ==
              Get.find<AgpeyaHourController>(tag: Get.arguments[0].hour)
                  .indexOfFirstVisibleItem() &&
          itemOffsetLeading == 0;
    } else {
      return false;
    }
  }
}
