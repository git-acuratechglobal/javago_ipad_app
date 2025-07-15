import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/config/widgets/app_text_field.dart';
import 'package:java_go/home/notifier/cafe_info_notifier/cafe_info_notifier.dart';

class SubscriptionPlansPage extends ConsumerStatefulWidget {
  const SubscriptionPlansPage({super.key});

  @override
  ConsumerState createState() => _SubscriptionPlansPageState();
}

class _SubscriptionPlansPageState extends ConsumerState<SubscriptionPlansPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Wrap(
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 70),
                Text(
                  "If you've received an early access code, enter it below to unlock your exclusive discount.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 30),
                AppTextField(height: 50, hint: 'Enter code'),
                SizedBox(height: 70),
                SizedBox(
                  width: 150,
                  child: PrimaryButton(
                    borderRadius: 40,
                    title: 'Apply Code',
                    onClick: () {},
                  ),
                )
              ],
            ),
          ),

          // Annual Plan
          _PlansCard(
            plan: planList[0],
          ),

          // Monthly Plan
          _PlansCard(
            plan: planList[1],
          ),
        ],
      ),
    );
  }

  String promoCode = '';
  bool isPromoApplied = false;
  void applyPromoCode() {
    if (promoCode.trim().toLowerCase() == 'earlybird2025') {
      setState(() {
        isPromoApplied = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Promo code applied! Discount unlocked."),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid promo code"),
        backgroundColor: Colors.red,
      ));
    }
  }

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
  const _PlansCard({
    required this.plan,
  });
  final PlanModel plan;

  @override
  ConsumerState<_PlansCard> createState() => _PlansCardState();
}

class _PlansCardState extends ConsumerState<_PlansCard> {
  @override
  Widget build(BuildContext context) {
    final plan = widget.plan;
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
          Text(plan.priceText,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          if (plan.subText != null)
            Text(plan.subText!,
                style: TextStyle(fontSize: 12, color: Color(0xff461C10))),
          if (plan.subText == null) 10.verticalSpace,
          SizedBox(height: 55),
          SizedBox(
            width: 150,
            child: PrimaryButton(
              borderRadius: 40,
              title: 'Select',
              onClick: () {
                ref
                    .read(cafeInfoNotifierProvider.notifier)
                    .purchaseSubscription(amount: plan.planPrice);
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
  PlanModel(
      {required this.title,
      required this.description,
      required this.planPrice,
      this.subText,
      required this.priceText});
}
