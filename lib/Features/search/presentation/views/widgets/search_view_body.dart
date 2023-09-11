import 'package:books_app/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:books_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'custom_text_form_field.dart';
class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, });
  

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Column(
        children: [
          CustomTextFormField(),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Result', style: Styles.textStyle18),
          ),
          SizedBox(height: 16),
          Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}
