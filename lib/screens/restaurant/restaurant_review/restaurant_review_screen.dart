import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../component_widgets/custom_sliver_appbar.dart';
import '../../../component_widgets/scroll_when_list_changed.dart';
import '../../../data/enums/restaurant_review_state.dart';
import '../../../providers/restaurant_review_provider.dart';
import '../../../utils/responsive.dart';
import '../../widgets/empty_item.dart';
import '../../widgets/no_internet.dart';
import 'widgets/restaurant_review_list.dart';
import 'widgets/review_comment_box.dart';

class RestaurantReviewScreen extends StatelessWidget {
  const RestaurantReviewScreen({super.key, required this.restaurantName});
  final String restaurantName;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: (Theme.of(context).brightness == Brightness.light)
          ? Colors.grey[200]
          : Theme.of(context).primaryColorDark,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          statusBarBrightness: Theme.of(context).brightness,
          statusBarIconBrightness:
          (Theme.of(context).brightness == Brightness.light)
              ? Brightness.dark
              : Brightness.light,
        ),
        child: Stack(
          children: [
            CustomScrollView(
              physics: const ScrollWhenListChanged(),
              slivers: [
                _appBar(context, screenHeight),
                Consumer<RestaurantReviewProvider>(
                  builder: (
                    BuildContext context,
                    RestaurantReviewProvider provider,
                    _,
                  ) {
                    if (provider.state == RestaurantReviewState.hasData) {
                      return RestaurantReviewList(reviews: provider.reviews);
                    } else if (provider.state == RestaurantReviewState.noData) {
                      return const EmptyItem(itemName: 'customer reviews');
                    }
                    else if (provider.state == RestaurantReviewState.noInternet) {
                      return _noInternetAlert(context);
                    }
                    return const SliverToBoxAdapter();
                  },
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 96,
                  ),
                )
              ],
            ),
            ReviewCommentBox(
              onTypeName: (name) =>
                  Provider.of<RestaurantReviewProvider>(context, listen: false)
                      .listenTextName(name),
              onTypeReview: (review) =>
                  Provider.of<RestaurantReviewProvider>(context, listen: false)
                      .listenTextReview(review),
              onTapSend: (fieldName, fieldReview)=>
                  Provider.of<RestaurantReviewProvider>(context, listen: false)
                      .writeReview(context, fieldName, fieldReview),
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context, double screenHeight) =>
      CustomSliverAppBar(
        isPinned: true,
        showBackNav: true,
        maxHeight: Responsive.adjust(
          screenSize: screenHeight,
          percentage: 16,
        ),
        widget: Text(
          "$restaurantName Reviews",
          textScaler: const TextScaler.linear(1),
        ),
        isCenter: true,
      );

  SliverToBoxAdapter _noInternetAlert(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 52),
        child: NoInternet(
          onRetry: () => Provider.of<RestaurantReviewProvider>(
            context,
            listen: false,
          ).reload(),
        ),
      ),
    );
  }
}
