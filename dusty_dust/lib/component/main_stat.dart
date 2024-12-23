import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/utills/date_utills.dart';
import 'package:dusty_dust/const/color.dart';
import 'package:dusty_dust/const/status_level.dart';
import 'package:dusty_dust/utills/status_utills.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';


class MainStat extends StatelessWidget {
  final Color primaryColor;
  final Region region;
  final bool isExpanded;

  const MainStat({
    super.key,
    required this.region,
    required this.primaryColor,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.white,
      fontSize: 40,
    );

    return SliverAppBar(
      backgroundColor: primaryColor,
      expandedHeight: 500,
      pinned: true,
      title: isExpanded ? null : Text('${region.krName}') ,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: FutureBuilder<StatModel?>(
                future: GetIt.I<Isar>()
                    .statModels
                    .filter()
                    .regionEqualTo(region)
                    .itemCodeEqualTo(ItemCode.PM10)
                    .sortByDateTimeDesc()
                    .findFirst(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (!snapshot.hasData) {
                    return Center(
                      child: Text('데이터가 없습니다.'),
                    );
                  }

                  final statModel = snapshot.data!;

                  final status = StatusUtills.getStatusModelFromStat(
                    statModel: statModel,
                  );

                  return Column(
                    children: [
                      SizedBox(
                        height: kToolbarHeight,
                      ),
                      Text(
                        region.krName,
                        style: ts.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        DateUtills.DateTimeToString(
                          dateTime: statModel.dateTime,
                        ),
                        style: ts.copyWith(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Image.asset(
                        status.imagePath,
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                      SizedBox(height: 20),
                      Text(
                        status.label,
                        style: ts.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        status.comment,
                        style: ts.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
