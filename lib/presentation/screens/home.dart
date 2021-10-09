import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_pos/core/theme/app_colors.dart';
import 'package:food_pos/core/utils/ui_kit.dart';
import 'package:food_pos/generated/assets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with UIKit, SingleTickerProviderStateMixin {
  late var tabController = TabController(length: 6, vsync: this);
  var dishes = [
    "Hot Dishes",
    "Cold dishes",
    "Soup",
    "Grill",
    "Appetizer",
    "Desert"
  ];

  var actions = [
    Assets.vectorsHome,
    Assets.vectorsDiscount,
    Assets.vectorsDashboard,
    Assets.vectorsMessage,
    Assets.vectorsNotification,
    Assets.vectorsSetting
  ];

  var selectedTab = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: 148,
          decoration: const BoxDecoration(
              color: AppColors.backgroundDark,
              borderRadius:
                  BorderRadius.horizontal(right: Radius.circular(16))),
          child: Column(
            children: [
              Container(
                width: 56,
                height: 56,
                padding: EdgeInsets.all(11.4),
                margin: const EdgeInsets.all(24).copyWith(bottom: 16),
                decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.23),
                    borderRadius: BorderRadius.circular(12)),
                child: SvgPicture.asset(Assets.vectorsStoreIcon),
              ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: ValueListenableBuilder<int>(
                        valueListenable: selectedTab,
                        builder: (context, value, child) => Stack(
                          children: [
                            AnimatedPositioned(
                                left: 0,
                                right: -2,
                                height: 104,
                                top: (104 * value).toDouble(),
                                duration: Duration(milliseconds: 300),
                                child: SvgPicture.asset(
                                  Assets.vectorsSelection,
                                  fit: BoxFit.fill,
                                )),
                            Positioned.fill(
                              child: Column(
                                children: List.generate(
                                  actions.length,
                                  (index) {
                                    var selected = index == value;
                                    return InkWell(
                                      onTap: () => selectedTab.value = index,
                                      child: AnimatedContainer(
                                        height: 56,
                                        width: 56,
                                        margin: const EdgeInsets.all(24)
                                            .copyWith(left: 12),
                                        padding: const EdgeInsets.all(16),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: selected
                                                ? AppColors.primary
                                                : null,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        duration: Duration(milliseconds: 400),
                                        child: FittedBox(
                                            child: SvgPicture.asset(
                                          actions[index],
                                          color: selected
                                              ? Colors.white
                                              : AppColors.primary,
                                        )),
                                        // )
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))),
              height(24),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 56,
                  height: 56,
                  padding: EdgeInsets.all(11.4),
                  margin: const EdgeInsets.all(24).copyWith(bottom: 16),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: SvgPicture.asset(
                    Assets.vectorsLogOut,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Jaegar Resto",
                                    style:
                                        Theme.of(context).textTheme.headline1),
                                const SizedBox(height: 4),
                                Text(
                                  "Tuesday, 2 Feb 2021",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textLight),
                                )
                              ],
                            ),
                            const Spacer(),
                            Container(
                                width: 15.w,
                                height: 48,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: const Color(0xff2D303E),
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: AppColors.border)),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText:
                                          "Search for food, coffee, etc..",
                                      prefixIcon: Icon(Icons.search),
                                      contentPadding: EdgeInsets.all(14),
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: AppColors.textLight)),
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 1,
                                  child: divider()),
                              TabBar(
                                  controller: tabController,
                                  labelColor: AppColors.primary,
                                  indicatorColor: AppColors.primary,
                                  enableFeedback: false,
                                  isScrollable: true,
                                  indicator: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                          width: 4, color: AppColors.primary),
                                      insets: EdgeInsets.only(right: 24)),
                                  labelPadding: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 13)
                                      .copyWith(right: 32),
                                  automaticIndicatorColorAdjustment: false,
                                  indicatorWeight: 3.5,
                                  unselectedLabelColor: Colors.white,
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.w600),
                                  // indicatorSize: TabBarIndicatorSize.label,
                                  tabs: List.generate(
                                      6,
                                      (index) => Tab(
                                            text: dishes[index],
                                          ))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    controller: tabController,
                    children: List.generate(
                        6,
                        (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Choose Dishes",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                      ),
                                      Container(
                                        height: 48,
                                        padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                            color: AppColors.backgroundDark,
                                            border: Border.all(
                                                color: const Color(0xff393C49)),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: DropdownButton(
                                          value: 0,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          items: List.generate(
                                              3,
                                              (index) => DropdownMenuItem(
                                                  value: index,
                                                  child:
                                                      const Text("Dine in"))),
                                          onChanged: (value) {},
                                          underline: Container(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                height(12),
                                Expanded(
                                    child: Scrollbar(
                                  isAlwaysShown: true,
                                  child: GridView.builder(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 24),
                                    itemBuilder: (context, index) => Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Positioned.fill(
                                            top: 34,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      AppColors.backgroundDark,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              padding: EdgeInsets.all(24)
                                                  .copyWith(top: 114),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Spicy seasoned seafood noodles",
                                                    maxLines: 2,
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  height(8),
                                                  Text("\$ 2.29"),
                                                  height(4),
                                                  Text(
                                                    "20 Bowls available",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .textLight),
                                                  )
                                                ],
                                              ),
                                            )),
                                        Image.asset(Assets.imagesDishb,
                                            width: 132, height: 132),
                                      ],
                                    ),
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 192,
                                            mainAxisExtent: 260,
                                            crossAxisSpacing: 28,
                                            mainAxisSpacing: 24),
                                  ),
                                ))
                              ],
                            )),
                  ))
                ],
              ),
            ),
            rightBar(context)
          ],
        ))
      ],
    ));
  }

  Container rightBar(BuildContext context) {
    return Container(
      width: 26.w,
      color: AppColors.backgroundDark,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(24).copyWith(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Orders #34562",
                style: Theme.of(context).textTheme.headline2,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(children: const [])),
              Row(children: const [
                Expanded(flex: 4, child: Text("Item")),
                Expanded(
                    flex: 3,
                    child: Text(
                      "Qty",
                      textAlign: TextAlign.center,
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      "Price",
                      textAlign: TextAlign.end,
                    ))
              ]),
              height(24),
              divider(),
            ],
          ),
        ),
        Expanded(
            child: Scrollbar(
          isAlwaysShown: true,
          child: ListView.separated(
              itemCount: 20,
              padding: const EdgeInsets.all(24),
              separatorBuilder: (context, index) => height(24),
              itemBuilder: (context, index) => Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 48,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    children: [
                                      Image.asset(Assets.imagesDishc,
                                          height: 40, width: 40),
                                      width(8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Spicy seasoned sea...",
                                              maxLines: 1,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            height(4),
                                            const Text(
                                              "\$ 2.29",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.textLight),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Container(
                                    height: 48,
                                    width: 48,
                                    padding: const EdgeInsets.all(2),
                                    alignment: Alignment.center,
                                    decoration: roundedDecoration(),
                                    child: const Text(
                                      "9",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(
                                flex: 2,
                                child: Text(
                                  "\$ 4,58",
                                  maxLines: 1,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                        height(10),
                        SizedBox(
                            height: 48,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: roundedDecoration(),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          hintText: "Order Note...",
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.all(14),
                                          hintStyle: TextStyle(
                                            color: AppColors.textGrey,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                          )),
                                    ),
                                  ),
                                ),
                                width(16),
                                Container(
                                  width: 48,
                                  height: 48,
                                  alignment: Alignment.center,
                                  decoration: roundedDecoration(
                                      color: Colors.transparent,
                                      borderColor: AppColors.primary),
                                  child: const Icon(
                                    Icons.delete_outlined,
                                    color: AppColors.primary,
                                    size: 20,
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  )),
        )),
        Padding(
          padding: const EdgeInsets.all(24).copyWith(top: 0),
          child: Column(
            children: [
              divider(),
              height(24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  cartFooterItem(),
                  height(16),
                  cartFooterItem(title: "Sub total", value: 2103),
                  height(24),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        primary: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 16)),
                    onPressed: () {},
                    child: const Text("Continue to Payment"),
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }

  Row cartFooterItem({String title = "Discount", num value = 0}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 14,
                color: AppColors.textLight,
                fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          "\$$value",
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
