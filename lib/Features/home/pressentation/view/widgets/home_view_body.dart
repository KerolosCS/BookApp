import 'package:books_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'best_seller_listview.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  FeaturedBooksListView(),
                  Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 16),
                    child: Text(
                      'Best Seller',
                      style: Styles.textStyle18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: BestSellerListView(),
            ),
          ),
        ],
      ),
    );
  }
}
