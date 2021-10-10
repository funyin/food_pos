import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_pos/core/theme/app_colors.dart';
import 'package:food_pos/core/utils/ui_kit.dart';
import 'package:food_pos/generated/assets.dart';
import 'package:food_pos/presentation/widgets/app_button.dart';
import 'package:food_pos/presentation/widgets/app_text_field.dart';
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
  var selectedOrderCategory = ValueNotifier(0);
  var dishCategory = ["Dine In", "To Go", "Delivery"];
  var selectedDishCategory = ValueNotifier(0);
  var selectedPaymentMethod = ValueNotifier(0);
  var paymentMethods = <MapEntry<String, String>>[
    MapEntry("Card", Assets.vectorsCard),
    MapEntry("Paypal", Assets.vectorsPaypal),
    MapEntry("Cash", Assets.vectorsWallet)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: endDrawer(),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 8.w,
              decoration: const BoxDecoration(
                  color: AppColors.backgroundDark,
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(16))),
              child: Column(
                children: [
                  Container(
                    width: 6.5.h,
                    height: 6.5.h,
                    padding: const EdgeInsets.all(11.4),
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
                                    height: 11.3.h,
                                    top: (11.3.h * value).toDouble(),
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
                                          onTap: () =>
                                              selectedTab.value = index,
                                          child: AnimatedContainer(
                                            height: 6.5.h,
                                            width: 6.5.h,
                                            margin: EdgeInsets.all(2.4.h)
                                                .copyWith(left: 12),
                                            padding: EdgeInsets.all(1.8.h),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: selected
                                                    ? AppColors.primary
                                                    : null,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            duration: const Duration(
                                                milliseconds: 400),
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
                  height(2.4.h),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 6.5.h,
                      height: 6.5.h,
                      padding: EdgeInsets.all(1.8.h),
                      margin: const EdgeInsets.all(24).copyWith(bottom: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1),
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
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.5),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff2D303E),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: AppColors.border)),
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
                                              width: 4,
                                              color: AppColors.primary),
                                          insets: EdgeInsets.only(right: 24)),
                                      labelPadding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 13)
                                          .copyWith(right: 32),
                                      automaticIndicatorColorAdjustment: false,
                                      indicatorWeight: 3.5,
                                      unselectedLabelColor: Colors.white,
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.w600),
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
                                          ValueListenableBuilder<int>(
                                            valueListenable:
                                                selectedDishCategory,
                                            builder: (context, value, child) =>
                                                PopupMenuButton<int>(
                                              initialValue: value,
                                              tooltip: "Select category",
                                              onSelected: (value) =>
                                                  selectedDishCategory.value =
                                                      value,
                                              itemBuilder: (context) =>
                                                  List.generate(
                                                dishCategory.length,
                                                (index) => PopupMenuItem(
                                                  value: index,
                                                  child:
                                                      Text(dishCategory[index]),
                                                ),
                                              ),
                                              child: Container(
                                                height: 48,
                                                padding:
                                                    const EdgeInsets.all(14),
                                                decoration: roundedDecoration(
                                                    color: AppColors
                                                        .backgroundDark),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: Colors.white,
                                                    ),
                                                    width(10),
                                                    Text(dishCategory[value]),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
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
                                        itemCount: 30,
                                        itemBuilder: (context, index) => Stack(
                                          alignment: Alignment.topCenter,
                                          children: [
                                            Positioned.fill(
                                                top: 34,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .backgroundDark,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                  padding: EdgeInsets.all(24)
                                                      .copyWith(top: 114),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Spicy seasoned seafood noodles",
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      height(8),
                                                      Text("\$ 2.29"),
                                                      height(4),
                                                      Text(
                                                        "20 Bowls available",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .textLight),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                            Image.asset(Assets.imagesImage1,
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

  Widget endDrawer() {
    return Container(
      width: 416,
      color: AppColors.backgroundDark,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset(
                Assets.vectorsBack,
                color: Colors.white,
              )),
          Text(
            "Payment",
            style: Theme.of(context).textTheme.headline2,
          ),
          height(8),
          Text("3 payment method available",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textLight)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 24), child: divider()),
          Text(
            "Payment Method",
            style: Theme.of(context).textTheme.headline3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              height: 64,
              child: ListView.separated(
                  itemBuilder: (context, index) => ValueListenableBuilder<int>(
                        valueListenable: selectedPaymentMethod,
                        builder: (context, value, child) {
                          var method = paymentMethods[index];
                          var active = value == index;
                          return InkWell(
                            onTap: () {
                              selectedPaymentMethod.value = index;
                            },
                            child: AnimatedOpacity(
                              opacity: active ? 1 : 0.4,
                              duration: Duration(milliseconds: 300),
                              child: Container(
                                width: 101,
                                decoration: roundedDecoration(
                                    color: Colors.transparent,
                                    borderColor: Colors.white),
                                padding: EdgeInsets.all(6),
                                child: Stack(children: [
                                  if (active)
                                    Positioned(
                                        right: 0,
                                        child: Icon(
                                          Icons.check_circle,
                                          color: AppColors.primary,
                                          size: 16,
                                        )),
                                  Positioned.fill(
                                      child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Column(children: [
                                      SvgPicture.asset(
                                        method.value,
                                        color: Colors.white,
                                      ),
                                      height(2),
                                      Expanded(child: Text(method.key))
                                    ]),
                                  ))
                                ]),
                              ),
                            ),
                          );
                        },
                      ),
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => width(8),
                  itemCount: 3),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Text("Cardholder Name"),
                height(8),
                AppTextField(),
                formSpace(),
                Text("Card Number"),
                height(8),
                AppTextField(),
                height(24),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Text("Expiration Date"),
                          height(8),
                          AppTextField(),
                        ])),
                    width(8),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Text("CVV"),
                          height(8),
                          AppTextField(),
                        ]))
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: divider()),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Text("Order Type"),
                          height(8),
                          AppTextField(),
                        ])),
                    width(8),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Text("Table no."),
                          height(8),
                          AppTextField(),
                        ]))
                  ],
                ),
              ],
            ),
          ),
          height(10.h),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: 'Cancel',
                  buttonType: ButtonType.secondary,
                  onTap: () {},
                ),
              ),
              width(8),
              Expanded(
                child: AppButton(
                  text: 'Confirm Payment',
                  onTap: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
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
                  child: SizedBox(
                    height: 36,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) =>
                          ValueListenableBuilder<int>(
                        valueListenable: selectedOrderCategory,
                        builder: (context, value, child) => AppButton(
                          buttonSize: ButtonSize.small,
                          text: dishCategory[index],
                          onTap: () => selectedOrderCategory.value = index,
                          buttonType: value == index
                              ? ButtonType.primary
                              : ButtonType.secondary,
                        ),
                      ),
                      itemCount: dishCategory.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          width(8),
                    ),
                  )),
              Row(children: [
                Expanded(flex: 4, child: Text("Item")),
                Container(
                    width: 48,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 21),
                    child: Text(
                      "Qty",
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  width: 48,
                  child: Text(
                    "Price",
                    textAlign: TextAlign.end,
                  ),
                )
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
                                      Image.asset(Assets.imagesImage6,
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
                                              maxLines: 1,
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
                              Container(
                                height: 48,
                                width: 48,
                                margin: EdgeInsets.only(left: 2.w, right: 21),
                                padding: const EdgeInsets.all(2),
                                alignment: Alignment.center,
                                decoration: roundedDecoration(),
                                child: const Text(
                                  "9",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 48),
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
                                  child: AppTextField(
                                    hint: "Order Note...",
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
                  Builder(builder: (context) {
                    return AppButton(
                      text: "Continue to Payment",
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    );
                  })
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
