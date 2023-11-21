import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/orders/cubit/orders_cubit.dart';
import 'package:medlife_v2/features/orders/cubit/orders_state.dart';
import 'package:medlife_v2/features/orders/ui/screens/new_orders.dart';
import 'package:medlife_v2/features/orders/ui/screens/delivered_orders.dart';
import 'package:medlife_v2/features/orders/ui/screens/current_orders.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        print("state is: $state");
        if (state is GetOrdersSuccess) {
          OrdersCubit.get(context).getAcceptedOrder();
          OrdersCubit.get(context).getPendingOrders();
          OrdersCubit.get(context).getDeliveredOrders();
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 47.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello ${ProfileCubit.get(context).vendor.firstName},",
                style: openSans18W500(color: const Color(0xff576A69)),
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                "Request",
                style: openSans16W500(color: AppColors.primary),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: const Color(0xfff1f4f6),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 0;
                          });
                        },
                        child: Container(
                          color: currentIndex == 0
                              ? AppColors.primary
                              : const Color(0xfff1f4f6),
                          height: 40.h,
                          width: 90.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New",
                                style: currentIndex == 0
                                    ? openSans12W600(color: Colors.white)
                                    : openSans12W600(
                                        color: const Color(0xff1E1E1E),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 1;
                          });
                        },
                        child: Container(
                          color: currentIndex == 1
                              ? AppColors.primary
                              : const Color(0xfff1f4f6),
                          height: 40.h,
                          width: 90.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Current",
                                style: currentIndex == 1
                                    ? openSans12W600(color: Colors.white)
                                    : openSans12W600(
                                        color: const Color(0xff1E1E1E),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 2;
                          });
                        },
                        child: Container(
                          color: currentIndex == 2
                              ? AppColors.primary
                              : const Color(0xfff1f4f6),
                          height: 40.h,
                          width: 90.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Completed",
                                style: currentIndex == 2
                                    ? openSans12W600(color: Colors.white)
                                    : openSans12W600(
                                        color: const Color(0xff1E1E1E),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              if (currentIndex == 0)
                const NewOrders()
              else
                currentIndex == 1
                    ? const CurrentOrders()
                    : const CompletedRequests(),
            ],
          ),
        );
      },
    );
  }
}
