import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  Widget sectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );

  Widget bullet(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("• ", style: TextStyle(fontSize: 16)),
            Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: const Text(
                  "Cafe Terms and Conditions – Java Go (Admin Side)",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "By signing up to the Java Go platform, you agree (on behalf of yourself and the cafe you represent) to the following terms and conditions. (“Cafe” refers to any independent food and drink vendor on Java Go, including coffee shops, carts, and similar businesses.)",
              ),
              sectionTitle("1. Use of the Platform"),
              const Text(
                  "Java Go grants your cafe a limited, non-exclusive, non-transferable, and revocable licence to use the Java Go Admin App (iPad version), including any authorised third-party integrations such as Square, for:"),
              10.verticalSpace,
              bullet("Managing and fulfilling customer orders"),
              bullet("Uploading and displaying menu items"),
              bullet("Participating in the digital loyalty scheme"),
              bullet("Receiving payments and updating store details"),
              10.verticalSpace,
              const Text(
                  "You agree to use the platform only for its intended business purposes and in accordance with these Terms. Any misuse may result in suspension or termination."),
              const Divider(),
              sectionTitle("2. Account Responsibility"),
              const Text(
                  "The individual creating the cafe account is responsible for the accuracy and completeness of all submitted information, including:"),
              10.verticalSpace,
              bullet("Menu item names, descriptions, and prices"),
              bullet("Allergen information"),
              bullet("Category tags (e.g., “halal”, “vegan”)"),
              bullet("Opening hours and contact details"),
              bullet("Coffee blend and origin, where applicable"),
              10.verticalSpace,
              const Text(
                  "Java Go reserves the right to remove or withhold listings if they are misleading, incomplete, or violate community standards."),
              const Divider(),
              sectionTitle("3. Account Approval"),
              const Text(
                  "Your cafe’s profile and menu will only go live on the Java Go platform after review and approval by a Java Go super admin. Submission of your information does not guarantee publication. We reserve the right to delay or reject listings that do not meet platform standards."),
              const Divider(),
              sectionTitle("4. Platform Integration and Menu Upload"),
              const Text(
                  "Your cafe may manage orders and update menu items through:"),
              bullet("The Java Go Admin iPad app, or"),
              bullet("An integration with Square (if enabled)"),
              const Text(
                  "Cafes may also upload their menu via spreadsheet. You are responsible for ensuring menu accuracy and consistency with in-store offerings. "),
              const Text(
                  "Java Go is not liable for issues arising from spreadsheet formatting or sync errors with Square."),
              const Divider(),
              sectionTitle("5. Click and Collect Orders"),
              const Text("Cafes that opt in to Click and Collect agree to:"),
              10.verticalSpace,
              bullet("Actively monitor and process orders in real-time"),
              bullet(
                  "Check the user’s estimated arrival time before preparing orders"),
              bullet(
                  "Prepare items so they are fresh and ready at the expected collection time"),
              bullet(
                  "Mark orders as “Ready to Collect” only when the full order is complete and properly packaged"),
              10.verticalSpace,
              const Text(
                  "Failure to follow these expectations may result in user complaints or refund requests, for which the cafe will be held responsible."),
              const Divider(),
              sectionTitle("6. Subscription Fees and Payment"),
              sectionTitle("Subscription Model (effective June 2025):"),
              bullet("Cafes 1 to 14: First 12 months free, then £12.99/month"),
              bullet(
                  "Cafes 15 to 25: First month free, then £20/month (save £96/year)"),
              bullet("Cafes 26+: £28/month, or £23/month when billed annually"),
              10.verticalSpace,
              const Text(
                  "By continuing to use Java Go after your free trial, you agree to the applicable subscription fee based on your cafe’s sign-up tier."),
              const Text(
                  "Java Go reserves the right to revise pricing with prior notice."),
              sectionTitle("Customer Payments:"),
              bullet(
                  "Orders placed by users are paid directly into your connected Stripe account."),
              const Text("You are responsible for:"),
              bullet(
                  "Maintaining an active and properly linked Stripe account"),
              bullet("Ensuring compliance with payment regulations"),
              bullet(
                  "Managing any delays, chargebacks, or disputes from Stripe"),
              const Text(
                  "Java Go is not responsible for payment issues caused by Stripe configuration errors or account limitations."),
              const Divider(),
              sectionTitle(
                  "7. Menu Accuracy, Allergens, and Coffee Information"),
              const Text("Cafes are fully responsible for:"),
              bullet("Keeping menus and pricing up to date"),
              bullet("Clearly identifying allergens and dietary categories"),
              bullet(
                  "Accurately stating which blend or origin of coffee is used (where applicable)"),
              bullet(
                  "Updating availability of items by marking them as unavailable or available in the admin panel"),
              const Text(
                  "Users rely on this information to make informed decisions. Any claims or issues resulting from misinformation are the sole responsibility of the cafe."),
              const Divider(),
              sectionTitle("8. Order Issues and Refunds"),
              const Text(
                  "If a customer reports a missing, incorrect, or unsatisfactory item, Java Go may process a refund to the user directly."),
              const Text(
                  "However, it is the cafe’s sole responsibility to accurately mark which item(s) are to be refunded through the admin panel."),
              const Text(
                  "Java Go is not liable for incorrect refund processing due to errors or omissions by the cafe."),
              const Text(
                  "In group orders, once items are handed over in good condition to the designated collector, the cafe’s responsibility is considered fulfilled."),
              const Divider(),
              sectionTitle("9. Order Fulfilment and Visibility"),
              const Text(
                  "Java Go does not guarantee any specific number of orders or listing prominence on the app."),
              const Text("Cafes are responsible for:"),
              bullet("Accurately and promptly fulfilling all accepted orders"),
              bullet(
                  "Training staff to manage orders using the Admin App or Square"),
              bullet(
                  "Maintaining real-time operational readiness during published opening hours"),
              Divider(),
              sectionTitle("10. Loyalty Card Participation"),
              const Text(
                  "If enabled, loyalty stamps will be applied automatically to qualifying user orders. Cafes agree to honour all valid rewards issued by the Java Go platform.\n \nJava Go reserves the right to modify or discontinue the loyalty system at any time, especially in cases of misuse."),
              const Divider(),
              sectionTitle("11. Intellectual Property"),
              const Text(
                  "Java Go, including all app branding, designs, and features, is the property of Java Go Ltd.\nYou retain ownership of your cafe name, branding, and uploaded content, but grant Java Go a\n licence to use and display this content for in-app and promotional purposes."),
              const Divider(),
              sectionTitle("12.  Limitation of Liability"),
              const Text("Java Go is not liable for:"),
              bullet("Technical issues"),
              bullet("Missed, delayed, or incorrect orders"),
              bullet("Stripe or Square integration errors"),
              bullet("Refunds caused by inaccurate admin panel input"),
              bullet(
                  "User dissatisfaction resulting from incorrect information"),
              const Text(
                  "The platform is provided “as is” and “as available”. Use is at your own risk."),
              const Divider(),
              sectionTitle("13. Indemnification"),
              const Text(
                  "You agree to indemnify and hold harmless Java Go, its staff, and affiliates from any claims, disputes, or losses resulting from:"),
              bullet("Inaccurate menu or allergy information"),
              bullet("Breach of these Terms"),
              bullet("Order or refund disputes"),
              bullet("Misuse of the platform or admin tools"),
              const Divider(),
              sectionTitle("14. Termination"),
              const Text(
                  "Java Go may suspend or terminate your account without notice if:"),
              bullet("You breach these Terms"),
              bullet("Fraudulent behaviour is detected"),
              bullet("Payment of fees is not maintained"),
              bullet("Your content violates platform standards"),
              const Divider(),
              sectionTitle("15. Governing Law"),
              const Text(
                  "These Terms are governed by the laws of England and Wales. Any disputes will be resolved in UK courts."),
              Divider(),
              sectionTitle("16. Changes to These Terms"),
              const Text(
                  "Java Go may update these Terms from time to time. Continued use of the platform after changes have been published constitutes acceptance of the revised Terms."),
              sectionTitle("17. Contact Us"),
              const Text("📧 Email: javago@javaapp.co.uk"),
              const SizedBox(height: 8),
              const Text("Last updated: 08/06/2025"),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
