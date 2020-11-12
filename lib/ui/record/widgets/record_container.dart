import 'package:flutter/material.dart';
import 'package:akramcalculator/models/record.dart';
import 'package:akramcalculator/providers/animate.dart';
import 'package:akramcalculator/providers/calculate.dart';
import 'package:akramcalculator/ui/widgets/shadows.dart';
import 'package:akramcalculator/utils/utilities.dart';
import 'package:provider/provider.dart';

import 'record_text.dart';

class RecordContainer extends StatelessWidget {
  final Record record;

  RecordContainer({this.record});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      height: 120,
      width: double.infinity,
      padding: EdgeInsets.all(12.0),
      decoration: outerShadow(context, radius: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                getFormattedDate(date: record.date),
                style: TextStyle(color: _theme.accentColor),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: InkWell(
              onTap: () => _onTap(context),
              child: RecordText(record: record),
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context) {
    Navigator.pop(context);
    context.read<Animate>().start();
    context.read<Calculate>().updateDisplayValues(
      result: record.result,
      expression: record.expression,
      date: record.date,
    );
  }
}