import 'package:flutter/material.dart';
import 'package:my_odc_tasks/view/components/core/custom_appbar.dart';
import 'package:my_odc_tasks/view/components/core/custom_text.dart';
import 'package:my_odc_tasks/view/components/core/scaffold_custom/scaffold_custom.dart';
import 'package:my_odc_tasks/view/screens/quests/widgets/quests_lower_section.dart';
import 'package:my_odc_tasks/view/screens/quests/widgets/quests_upper_section.dart';

import '../../../model/quests_model.dart';

class QuestsScreen extends StatefulWidget {
  const QuestsScreen({super.key});

  @override
  State<QuestsScreen> createState() => _QuestsScreenState();
}

class _QuestsScreenState extends State<QuestsScreen> {

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      backgroundColor: Color(0xFF141316),
      appBarCustom: CustomAppBar(
        title: "My Quests",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          QuestsUpperSection(),
          QuestsLowerSection(),
        ],
      ),
    );
  }
}
