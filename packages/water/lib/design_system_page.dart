import 'package:flutter/material.dart';

import 'water.dart';

class DesignSystemPage extends StatefulWidget {
  const DesignSystemPage({super.key});
  @override
  State<DesignSystemPage> createState() => _DesignSystemPageState();
}

bool reminder = true;

class _DesignSystemPageState extends State<DesignSystemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WAppBar(title: 'Design System'),
      body: Center(
        child: ListView(
          children: [
            WListItem(
              label: 'Drink Log',
              trailing: Text(
                '1ml',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            WListItem(
              label: 'Drink Log',
              onTap: () {},
            ),
            WListItem(
              label: 'Reminders',
              trailing: Switch(
                  value: reminder,
                  onChanged: (val) {
                    setState(() {
                      reminder = val;
                    });
                  }),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 16.0),
              child: ProgressDoughnutChart(
                progress: 0.5,
                radius: 100,
                strokeWidth: 40,
                backgroundColor: const Color(0xFFE0FAFF),
                label: '1200ml / 3500ml',
              ),
            ),
            WTextButton(
              label: 'Done',
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            Center(child: WFloatButton(onPressed: () {})),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
