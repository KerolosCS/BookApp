import 'package:books_app/Features/home/pressentation/view/widgets/recommended_books_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class SimularBooksSection extends StatelessWidget {
  const SimularBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle15.copyWith(
            fontWeight: FontWeight.bold,
          ),
          // textAlign: TextAlign.left,
        ),
        const SizedBox(height: 8),
        const RecommendedBooksListView(),
        const SizedBox(height: 16),
      ],
    );
  }
}
