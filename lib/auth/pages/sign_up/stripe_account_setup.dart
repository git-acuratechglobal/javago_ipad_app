import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/auth/pages/sign_up/subscription_plans_page.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/config/common/extensions.dart';
import 'package:java_go/service/local_storage_service.dart';
import '../../../config/async_widget.dart';
import '../../../config/widgets/page_loading_widget.dart';
import '../../../home/bottombar.dart';
import '../../../home/notifier/cafe_info_notifier/cafe_info_notifier.dart';
import '../../../home/state/cafe_info_state/cafe_info_state.dart';
import '../../notifier/cafe_data_notifier/cafe_data_notifier.dart';
import '../steps/stepper_widget.dart';
import 'connect_strip_web_view.dart';

class StripeAccountSetup extends ConsumerStatefulWidget {
  const StripeAccountSetup({super.key, this.isOnboardingComplete = false});
  final bool isOnboardingComplete;
  @override
  ConsumerState createState() => _StripeAccountSetupState();
}

class _StripeAccountSetupState extends ConsumerState<StripeAccountSetup> {
  final titleTextStyle = TextStyle(
    fontSize: 25,
    color: const Color(0xff461C10),
    fontWeight: FontWeight.w500,
  );
  @override
  void initState() {
    super.initState();
    ref.listenManual(cafeInfoNotifierProvider, (previous, next) async {
      switch (next) {
        case AsyncData<CafeInfoState?> data when data.value != null:
          final cafeState = data.value;
          if (cafeState?.cafeEvent == CafeEvent.stripAccountStatus) {}
          if (cafeState?.cafeEvent == CafeEvent.subscriptionPurchase) {
            context.showSnackBar("Plan purchased successfully",
                barColor: Colors.green);
            if (widget.isOnboardingComplete) {
              ref.read(localStorageServiceProvider).setUserLoginSaved(true);
              context.navigateAndRemoveUntil(CustomBottomNavBar());
              return;
            }
          }
          if (cafeState?.cafeEvent == CafeEvent.createSquareAccount) {
            context.navigateTo(CustomWebView(
              title: "Connect Your Square Account",
              initialUrl: data.value?.response ?? "",
            ));
          }
          if (cafeState?.cafeEvent == CafeEvent.squareAccountCreated) {
            context.pop();
            context.showSnackBar(data.value?.response ?? "",
                barColor: Colors.green);
            final controller = ref.read(cafePageControllerProvider);
            if (controller.hasClients) {
              controller.jumpToPage(7);
            }
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final subscriptionState = ref.watch(cafeInfoNotifierProvider);
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xffF5F3F0),
          body: AsyncWidget(
              value: ref.watch(getCafeInfoProvider),
              data: (data) {
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        50.verticalSpace,
                        if (data?.stripeOnboardingCompleted == 0)
                          Text("SET UP YOUR PAYOUT ACCOUNT",
                              style: titleTextStyle),
                        if (data?.stripeOnboardingCompleted == 1 &&
                            data?.subscriptionStatus == 0)
                          Text("Choose your subscription plan",
                              style: titleTextStyle),
                        if (data?.stripeOnboardingCompleted == 1 &&
                            data?.subscriptionStatus == 1 &&
                            data?.squareOnboardingCompleted == 0)
                          Text("SET UP YOUR SQUARE ACCOUNT",
                              style: titleTextStyle),
                        50.verticalSpace,
                        Visibility(
                            visible: data?.stripeOnboardingCompleted == 0,
                            child: _StripeSetUpWidget(
                              onSetUpPress: () async {
                                ref
                                    .read(cafeInfoNotifierProvider.notifier)
                                    .createStripAccount();
                              },
                            )),
                        Visibility(
                            visible: data?.stripeOnboardingCompleted == 1 &&
                                data?.subscriptionStatus == 0,
                            child: SubscriptionPlansPage()),
                        Visibility(
                            visible: data?.stripeOnboardingCompleted == 1 &&
                                data?.subscriptionStatus == 1 &&
                                data?.squareOnboardingCompleted == 0,
                            child: _SquareWidget()),
                      ],
                    ),
                  ),
                );
              }),
        ),
        if (subscriptionState.isLoading) PageLoadingWidget(),
      ],
    );
  }
}

class _StripeSetUpWidget extends ConsumerStatefulWidget {
  const _StripeSetUpWidget({required this.onSetUpPress});
  final void Function() onSetUpPress;
  @override
  ConsumerState<_StripeSetUpWidget> createState() => _StripeSetUpWidgetState();
}

class _StripeSetUpWidgetState extends ConsumerState<_StripeSetUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        100.verticalSpace,
        Text(
          textAlign: TextAlign.center,
          "To receive payments from customers, you’ll need to create a Stripe\n account. This only takes a couple of minutes.",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        ),
        100.verticalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "• Safe and secure",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            10.verticalSpace,
            Text(
              "• One-time setup",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            10.verticalSpace,
            Text(
              "• Required to receive payouts from orders",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        80.verticalSpace,
        SizedBox(
          height: 50,
          width: 200,
          child: PrimaryButton(
            borderRadius: 40,
            onClick: widget.onSetUpPress,
            title: 'Set Up',
          ),
        )
      ],
    );
  }
}

class _SquareWidget extends ConsumerStatefulWidget {
  const _SquareWidget();

  @override
  ConsumerState createState() => _SquareWidgetState();
}

class _SquareWidgetState extends ConsumerState<_SquareWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.read(cafePageControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Connect your square account "),
        100.verticalSpace,
        SizedBox(
          width: 200,
          child: PrimaryButton(
              title: 'Connect Square',
              onClick: () {
                ref
                    .read(cafeInfoNotifierProvider.notifier)
                    .createSquareAccount();
              }),
        ),
        10.verticalSpace,
        TextButton(
          child: Text("Skip"),
          onPressed: () {
            if (controller.hasClients) {
              controller.jumpToPage(7);
            }
          },
        )
      ],
    );
  }
}
