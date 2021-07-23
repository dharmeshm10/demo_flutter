import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_widget/Widgets/layout_constants.dart';

import 'package:flutter_app_widget/widgets/multi_selection_checkbox_constant.dart';
import 'package:flutter_app_widget/Widgets/theme_text.dart';

class MultiSelectionCheckBox extends StatefulWidget {
  final Map<String, bool> checkBoxListWithLabel;
  const MultiSelectionCheckBox({
    Key key,
    @required this.checkBoxListWithLabel,
  })  : assert(checkBoxListWithLabel != null,
            'checkBoxListWithLabel cannot be null'),
        super(key: key);

  @override
  _MultiSelectionCheckBoxState createState() => _MultiSelectionCheckBoxState();
}

class _MultiSelectionCheckBoxState extends State<MultiSelectionCheckBox> {
  @override
  Widget build(BuildContext context) => Container(
        key: MultiSelectionCheckBoxConstants.gridViewKey,
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: GridView.builder(
          padding: const EdgeInsets.all(LayoutConstants.dimen_8),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MultiSelectionCheckBoxConstants.numberOfColumnForWeek,
            childAspectRatio: LayoutConstants.dimen_4.toDouble(),
          ),
          itemBuilder: (context, index) => checkBoxWithLabel(
            widget.checkBoxListWithLabel.keys.elementAt(index).toString(),
            '${MultiSelectionCheckBoxConstants.checkBoxWithLabelKey}_$index',
            widget.checkBoxListWithLabel.values.elementAt(index),
          ),
          itemCount: widget.checkBoxListWithLabel.length,
        ),
      );

  Widget checkBoxWithLabel(String title, String key, bool isChecked) {
    final ValueNotifier<bool> _valueNotifier = ValueNotifier<bool>(isChecked);
    return Container(
      key: ValueKey(key),
      padding: const EdgeInsets.all(LayoutConstants.dimen_10),
      child: Row(
        children: <Widget>[
          const SizedBox(width: LayoutConstants.dimen_60),
          Expanded(
            flex: MultiSelectionCheckBoxConstants.flexForCheckBox,
            child: ValueListenableBuilder<bool>(
              valueListenable: _valueNotifier,
              builder: (BuildContext context, dynamic value, Widget child) =>
                  Checkbox(
                value: _valueNotifier.value,
                onChanged: (bool value) {
                  widget.checkBoxListWithLabel[title] = value;
                  _valueNotifier.value = value;
                },
              ),
            ),
          ),
          const SizedBox(width: LayoutConstants.dimen_25),
          Flexible(
            flex: MultiSelectionCheckBoxConstants.flexForText,
            child: Container(
              padding: const EdgeInsets.all(LayoutConstants.dimen_5),
              child: Text(
                title,
                style: ThemeText.body1,
                textAlign: TextAlign.justify,
                textScaleFactor: LayoutConstants.dimen_0p90,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> getAllSelectedDateList() {
    final List<String> _selectedList = [];
    for (var i = 0; i < widget.checkBoxListWithLabel.length; i++) {
      if (widget.checkBoxListWithLabel.values.elementAt(i) == true) {
        _selectedList
            .add(widget.checkBoxListWithLabel.keys.elementAt(i).toString());
      }
    }
    return _selectedList;
  }
}
