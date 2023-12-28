import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../component_widgets/custom_sliver_appbar.dart';
import '../../../data/enums/restaurant_review_state.dart';
import '../../../data/models/customer_review.dart';
import '../../../providers/restaurant_review_provider.dart';
import '../../../utils/responsive.dart';

class RestaurantReviewScreen extends StatelessWidget {
  RestaurantReviewScreen({super.key, required this.restaurantName});
  final String restaurantName;

  final TextEditingController reviewTextControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                _appBar(context, screenHeight),
                Consumer<RestaurantReviewProvider>(
                  builder: (
                    BuildContext context,
                    RestaurantReviewProvider provider,
                    _,
                  ) {
                    if (provider.state == RestaurantReviewState.hasData) {
                      return _restaurantReviewList(provider.reviews);
                    } else if (provider.state ==
                        RestaurantReviewState.noData) {}
                    return const SliverToBoxAdapter();
                  },
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 64,
                  ),
                )
              ],
            ),
            _commentBox(context)
          ],
        ),
      ),
    );
  }

  Align _commentBox(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.deepOrangeAccent,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: reviewTextControl,
            minLines: 1,
            maxLines: 10,
            onChanged: (String text) =>
                Provider.of<RestaurantReviewProvider>(context, listen: false)
                    .listenTextReview(text),
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              border: InputBorder.none,
              suffix: TextButton(
                onPressed: () {
                  Provider.of<RestaurantReviewProvider>(context, listen: false)
                      .writeReview();
                  reviewTextControl.text = '';
                },
                child: const Text(
                  'Send Review',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              hintText: 'Write your review...',
              hintStyle: const TextStyle(fontSize: 15),
              isDense: true,
              contentPadding: const EdgeInsets.only(left: 16),
            ),
          ),
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

  Widget _restaurantReviewList(List<CustomerReview> reviews) => SliverPadding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 8,
        ),
        sliver: SliverList.builder(
          itemCount: reviews.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reviews[index].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(reviews[index].review),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(reviews[index].date),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
}
