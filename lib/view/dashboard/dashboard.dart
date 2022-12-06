import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:web_monitor/Style/font_style.dart';

import '../../Style/color_style.dart';
import 'component/dash_component.dart';
import 'service/service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<ChartData> chartData = [];

  int view = 0;
  String viewDate = "";
  int linkedin = 0;
  int linkedinHero = 0;
  String linkedinDate = "";
  int github = 0;
  int githubHero = 0;
  String githubDate = "";
  int email = 0;
  String emailDate = "";
  int wa = 0;
  String waDate = "";

  void getData() async {
    setState(() {
      chartData = [];
    });
    DashboardService.getData().then((value) {
      value.data.forEach((e) {
        setState(() {
          chartData.add(
            ChartData(
              e.action,
              e.count.toDouble(),
            ),
          );

          if (e.action == "view") {
            view = e.count;
            viewDate = e.date.substring(4, 25);
            // print(e.date.substring(0, 28));
          } else if (e.action == "clickGithubHero") {
            githubHero = e.count;
            githubDate = e.date.substring(4, 16);
          } else if (e.action == "clickLinkedinHero") {
            linkedinHero = e.count;
            linkedinDate = e.date.substring(4, 16);
          } else if (e.action == "clickLinkedinFooter") {
            linkedin = e.count;
            linkedinDate = e.date.substring(4, 16);
          } else if (e.action == "clickGithubFooter") {
            github = e.count;
            githubDate = e.date.substring(4, 16);
          } else if (e.action == "clickEmailFooter") {
            email = e.count;
            emailDate = e.date.substring(4, 16);
          } else if (e.action == "clickWhatsappFooter") {
            wa = e.count;
            waDate = e.date.substring(4, 16);
          }
        });
      });
    });
  }

  Future<dynamic> _refresh() async {
    setState(() {
      getData();
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Scaffold(
        backgroundColor: Color(0xffEFF3F6),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 18, left: 18, top: 24),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icon-view.png",
                              width: 35,
                              height: 35,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total View",
                                  style: FontsStyle.fontMedium500
                                      .copyWith(fontSize: 14),
                                ),
                                Text(
                                  "$view",
                                  style: FontsStyle.fontSwmiBild700.copyWith(
                                      fontSize: 35, color: Color(0xff338DF5)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "$viewDate",
                                  style: FontsStyle.fontMedium500.copyWith(
                                      fontSize: 12, color: Color(0xffB9B9B9)),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 12,
                                      width: 12,
                                      decoration: BoxDecoration(
                                          color: Color(0xff97E075),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "fahronona.github.io",
                                      style: FontsStyle.fontMedium500
                                          .copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  cardComp(
                      assetsL: "assets/icon-linkedin.png",
                      assetsR: "assets/icon-git.png",
                      dateL: "$linkedinDate",
                      dateR: "$githubDate",
                      labelL: "Linkedin click",
                      labelR: "Github click",
                      totalL: "${linkedin + linkedinHero}",
                      totalR: "${github + githubHero}"),
                  cardComp(
                      assetsL: "assets/icon-email.png",
                      assetsR: "assets/icon-wa.png",
                      dateL: "$emailDate",
                      dateR: "$waDate",
                      labelL: "Email click",
                      labelR: "Whatsapp click",
                      totalL: "$email",
                      totalR: "$wa"),
                  Padding(
                      padding: EdgeInsets.only(
                          top: 21, bottom: 20, right: 18, left: 18),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 20),
                              child: Row(
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                        color: Color(0xff338DF5),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Action chart",
                                    style: FontsStyle.fontBold600
                                        .copyWith(fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: SfCircularChart(
                                  tooltipBehavior: TooltipBehavior(
                                      textStyle: FontsStyle.fontMedium500,
                                      enable: true),
                                  legend: Legend(
                                      textStyle: FontsStyle.fontMedium500,
                                      isVisible: true,
                                      position: LegendPosition.left),
                                  series: <CircularSeries>[
                                    DoughnutSeries<ChartData, String>(
                                        dataLabelSettings: DataLabelSettings(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 1, 1, 1),
                                          textStyle: FontsStyle.fontMedium500
                                              .copyWith(color: Colors.white),
                                          isVisible: true,
                                        ),
                                        dataSource: chartData,
                                        xValueMapper: (ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (ChartData data, _) =>
                                            data.y)
                                  ]),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Designed & Build by Fahron\nCopyright © 2022",
                  textAlign: TextAlign.center,
                  style: FontsStyle.fontMedium500
                      .copyWith(color: Color(0xffA4A4A4), fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
