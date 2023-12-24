import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../providers/restaurant_provider.dart';
import '../../utils/responsive.dart';
import '../../widgets/pinned_searchbar.dart';
import '../main_page/widgets/custom_sliver_appbar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              _appBar(context, screenHeight),
              PinnedSearchBar(
                onChanged: (String queryParam) => Provider.of<RestaurantProvider>(context, listen: false).searchRestaurant(queryParam),
                width: Responsive.adjust(
                  screenSize: screenWidth,
                  percentage: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context, double screenHeight) =>
      CustomSliverAppBar(
        isPinned: false,
        showBackNav: true,
        maxHeight: Responsive.adjust(
          screenSize: screenHeight,
          percentage: 16,
        ),
        widget: const Text(
          'Search Restaurant',
          textScaler: TextScaler.linear(1),
        ),
        isCenter: true,
      );
}
