import 'package:fit/presentation/global_components/cloth_table_row_content.dart';
import 'package:fit/presentation/top_list/top_list_view_model.dart';
import 'package:fit/util/string_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/cloth/top.dart';
import '../../../util/colors.dart';
import '../../global_components/trash_can_button.dart';

class TopItem extends StatelessWidget {
  static const double _tablePadding = 4;
  static const double _tableFontSize = 14;

  final Top top;

  /// 테이블 열 색 구분용
  final int index;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  late final String name;
  late final double total;
  late final double shoulder;
  late final double chest;
  late final double sleeve;

  TopItem({
    required this.top,
    required this.index,
    required this.onTap,
    required this.onLongPress,
    Key? key,
  }) : super(key: key) {
    name = top.name;
    total = top.totalLength;
    shoulder = top.shoulderWidth;
    chest = top.chestWidth;
    sleeve = top.sleeveLength;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TrashCanButton(onTap: () {
          context.read<TopListViewModel>().deleteTop(top);
        }),
        ClothTableRowContent(
            onTap: onTap,
            onLongPress: onLongPress,
            isLongPressed: context.read<TopListViewModel>().isLongPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: _tableFontSize,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.mainBlue),
                    )),
                const VerticalDivider(
                  color: Colors.transparent,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(_tablePadding),
                    child: Text(
                      total.toNoDotZeroNumString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: _tableFontSize),
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.transparent,
                ),
                Expanded(
                  child: Text(
                    shoulder.toNoDotZeroNumString(),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: _tableFontSize),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.transparent,
                ),
                Expanded(
                  child: Text(
                    chest.toNoDotZeroNumString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: _tableFontSize),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.transparent,
                ),
                Expanded(
                  child: Text(
                    sleeve.toNoDotZeroNumString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: _tableFontSize),
                  ),
                ),
                const SizedBox(
                  width: 7.5,
                ),
              ],
            )),
      ],
    );
  }
}
