import 'package:dsw_51762/utils/my_colors.dart';
import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  const NoteFormWidget({
    required this.onChangedTitle, required this.onChangedDescription, super.key,
    this.title = '',
    this.description = '',
  });

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          const SizedBox(height: 4),
          buildDescription(),
        ],
      ),
  );

  Widget buildTitle() => TextFormField(
    initialValue: title,
    style: TextStyle(
      color: MyColors.darkPurpleColor,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Title',
      hintStyle: TextStyle(color: MyColors.darkPurpleColor),
    ),
    validator: (title) =>
    title != null && title.isEmpty ? 'The title cannot be empty' : null,
    onChanged: onChangedTitle,
  );

  Widget buildDescription() => TextFormField(
    maxLines: 5,
    initialValue: description,
    style: TextStyle(color: MyColors.darkPurpleColor, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Type something...',
      hintStyle: TextStyle(color: MyColors.darkPurpleColor),
    ),
    validator: (title) => title != null && title.isEmpty
        ? 'The description cannot be empty'
        : null,
    onChanged: onChangedDescription,
  );
}
