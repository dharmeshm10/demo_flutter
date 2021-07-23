import 'package:flutter/material.dart';

import 'package:flutter_app_widget/widgets/multi_selection_checkbox_constant.dart';
import 'package:flutter_app_widget/widgets/week_enum.dart';
import 'widgets/layout_constants.dart';
import 'widgets/multi_selection_checkbox.dart';

void main() {
  runApp(MyApp());
}

Container get _getSpecificDayOfWeekWidget {
  final Map<String, bool> _weekDays = {
    WeeksEnum.sunday.getString(): false,
    WeeksEnum.monday.getString(): true,
    WeeksEnum.tuesday.getString(): false,
    WeeksEnum.wednesday.getString(): false,
    WeeksEnum.thursday.getString(): false,
    WeeksEnum.friday.getString(): false,
    WeeksEnum.saturday.getString(): false,
  };
  return Container(
    key: MultiSelectionCheckBoxConstants.specificDayOfWeekMultiSelectionBoxKey,
    child: Container(
      child: MultiSelectionCheckBox(
        checkBoxListWithLabel: _weekDays,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CheckBox Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.height / 2,
          height: MediaQuery.of(context).size.height / 3,
          child: _getSpecificDayOfWeekWidget,
        ),
      ),
    );
  }
}
