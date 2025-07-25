import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/config/common/extensions.dart';
import 'package:java_go/config/widgets/app_text_field.dart';
import 'package:java_go/config/widgets/page_loading_widget.dart';
import 'package:java_go/home/notifier/cafe_info_notifier/cafe_info_notifier.dart';
import 'package:java_go/home/notifier/subscription_notifier/subscription_notifier.dart';

class SubscriptionPlansPage extends ConsumerStatefulWidget {
  const SubscriptionPlansPage(
      {super.key,
      this.isFromExpiredPage = false,
      this.oldPromoCode=null,
      this.canOfferApply = false});
  final bool isFromExpiredPage;
  final String? oldPromoCode;
  final bool canOfferApply;
  @override
  ConsumerState createState() => _SubscriptionPlansPageState();
}

class _SubscriptionPlansPageState extends ConsumerState<SubscriptionPlansPage> {
  final promoCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final subscriptionState = ref.watch(cafeInfoNotifierProvider);
    return Material(
      color: Color(0xffF5F3F0),
      child: SingleChildScrollView(
        padding: widget.isFromExpiredPage
            ? const EdgeInsets.all(0)
            : const EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              children: [
                if (widget.isFromExpiredPage) ...[
                  AppBar(
                    backgroundColor: Color(0xffF5F3F0),
                    title: Text("Choose your subscription plan"),
                  ),
                  30.verticalSpace
                ],
                if (widget.oldPromoCode != null)
                  AsyncWidget(
                      value: ref.watch(getPromoCodeDetailsProvider(
                          promoCode: widget.oldPromoCode!)),
                      data: (promoCodeData) {
                        return Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.center,
                          children: [
                            // Early Adopters Box
                            Opacity(
                              opacity: 0.5,
                              child: AbsorbPointer(
                                absorbing: true,
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  width: 300,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 12,
                                        offset: Offset(0, 6),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Text("Early Adopters",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      SizedBox(height: 70),
                                      Text(
                                        "If you've received an early access code, enter it below to unlock your exclusive discount.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      SizedBox(height: 30),
                                      AppTextField(
                                          controller: promoCodeController,
                                          height: 50,
                                          hint: 'Enter code'),
                                      SizedBox(height: 70),
                                      SizedBox(
                                        width: 150,
                                        child: PrimaryButton(
                                          borderRadius: 40,
                                          title: 'Apply Code',
                                          onClick: () {
                                            if (promoCodeController
                                                .text.isEmpty) {
                                              context.showSnackBar(
                                                  "Please enter a promo code");
                                            }
                                            final code =
                                                promoCodeController.text.trim();
                                            ref
                                                .read(cafeInfoNotifierProvider
                                                    .notifier)
                                                .applyPromoCode(code);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // Annual Plan
                            _PlansCard(
                              discountPercentage: widget.canOfferApply
                                  ? promoCodeData.discount
                                  : "0",
                              plan: planList[0],
                            ),

                            // Monthly Plan
                            _PlansCard(
                              discountPercentage: widget.canOfferApply
                                  ? promoCodeData.discount
                                  : "0",
                              plan: planList[1],
                            ),
                          ],
                        );
                      })
                else
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      // Early Adopters Box
                      Container(
                        padding: const EdgeInsets.all(16),
                        width: 300,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 12,
                              offset: Offset(0, 6),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Text("Early Adopters",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            SizedBox(height: 70),
                            Text(
                              "If you've received an early access code, enter it below to unlock your exclusive discount.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(height: 30),
                            AppTextField(
                                controller: promoCodeController,
                                height: 50,
                                hint: 'Enter code'),
                            SizedBox(height: 70),
                            SizedBox(
                              width: 150,
                              child: PrimaryButton(
                                borderRadius: 40,
                                title: 'Apply Code',
                                onClick: () {
                                  if (promoCodeController.text.isEmpty) {
                                    context.showSnackBar(
                                        "Please enter a promo code");
                                  }
                                  final code = promoCodeController.text.trim();
                                  ref
                                      .read(cafeInfoNotifierProvider.notifier)
                                      .applyPromoCode(code);
                                },
                              ),
                            )
                          ],
                        ),
                      ),

                      // Annual Plan
                      _PlansCard(
                        discountPercentage:"0",
                        plan: planList[0],
                      ),

                      // Monthly Plan
                      _PlansCard(
                        discountPercentage:"0",
                        plan: planList[1],
                      ),
                    ],
                  ),
              ],
            ),
            if (widget.isFromExpiredPage)
              if (subscriptionState.isLoading) PageLoadingWidget()
          ],
        ),
      ),
    );
  }

  String promoCode = '';
  bool isPromoApplied = false;

  List<PlanModel> planList = [
    PlanModel(
      title: "Annual Plan",
      description: "Save money with our discounted annual subscription.",
      planPrice: 276.0,
      priceText: "£23/Month Billed Annually",
      subText: "£276/Year",
    ),
    PlanModel(
        title: "Monthly Plan",
        description:
            "Subscribe now at the regular rate with flexibility to cancel anytime.",
        planPrice: 28.0,
        priceText: "£28/month"),
  ];
}

class _PlansCard extends ConsumerStatefulWidget {
  const _PlansCard({required this.plan, this.discountPercentage});
  final PlanModel plan;
  final String? discountPercentage;
  @override
  ConsumerState<_PlansCard> createState() => _PlansCardState();
}

class _PlansCardState extends ConsumerState<_PlansCard> {
  @override
  Widget build(BuildContext context) {
    final plan = widget.plan;
    final discount =
        double.tryParse(widget.discountPercentage?.toString() ?? '0') ?? 0;
    final finalAmount = plan.discountedPrice(discount);
    return Container(
      padding: const EdgeInsets.all(16),
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 12,
            offset: Offset(0, 6),
          )
        ],
      ),
      child: Column(
        children: [
          Text(plan.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          SizedBox(height: 70),
          Text(plan.description,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
          SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("£${plan.planPrice}",
                  style: TextStyle(
                      decoration: widget.discountPercentage != "0"
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              if (widget.discountPercentage != "0") 10.horizontalSpace,
              if (widget.discountPercentage != "0")
                Text('£${finalAmount.toStringAsFixed(2)}',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              if (plan.title == "Monthly Plan")
                Text("/month",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
              else
                Text("/year",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            ],
          ),
          // if (plan.subText != null)
          //   Text(plan.subText!,
          //       style: TextStyle(fontSize: 12, color: Color(0xff461C10))),
          // if (plan.subText == null)
          10.verticalSpace,
          SizedBox(height: 55),
          SizedBox(
            width: 150,
            child: PrimaryButton(
              borderRadius: 40,
              title: 'Select',
              onClick: () {
                ref
                    .read(cafeInfoNotifierProvider.notifier)
                    .purchaseSubscription(
                        amount: finalAmount,
                        planType: plan.title == "Monthly Plan"
                            ? "Monthly"
                            : "Yearly");
              },
            ),
          )
        ],
      ),
    );
  }
}

class PlanModel {
  final String title;
  final String description;
  final double planPrice;
  final String priceText;
  final String? subText;

  PlanModel({
    required this.title,
    required this.description,
    required this.planPrice,
    this.subText,
    required this.priceText,
  });

  double discountedPrice(double discountPercentage) {
    if (discountPercentage <= 0) return planPrice;
    return planPrice * (1 - discountPercentage / 100);
  }
}
