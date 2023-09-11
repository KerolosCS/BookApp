import 'package:books_app/Features/search/presentation/manager/cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});
  @override
  Widget build(BuildContext context) {
    var txtController = TextEditingController();
    return TextFormField(
      onChanged: (value) {
        BlocProvider.of<SearchBooksCubit>(context)
            .fetchSearchedBooks(txtController.text);
      },
      controller: txtController,
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<SearchBooksCubit>(context)
                .fetchSearchedBooks(txtController.text);
          },
          icon: const Opacity(
            opacity: 0.8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
            ),
          ),
        ),
        border: buildOutlinedBorder(),
        focusedBorder: buildOutlinedBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlinedBorder() {
    return const OutlineInputBorder(
      // borderSide: BorderSide(
      //   color: Colors.white,
      // ),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    );
  }
}
