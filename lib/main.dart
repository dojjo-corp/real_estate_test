import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_test/authentication/gates/auth_gate.dart';
import 'package:real_estate_test/authentication/pages/my_bookings_page.dart';
import 'package:real_estate_test/authentication/pages/notifications_page.dart';
import 'package:real_estate_test/authentication/pages/payment/add_card_page.dart';
import 'package:real_estate_test/authentication/pages/agent_review_page.dart';
import 'package:real_estate_test/authentication/pages/payment/e_receipt_page.dart';
import 'package:real_estate_test/authentication/pages/property/book_tour_page.dart';
import 'package:real_estate_test/authentication/pages/property/booking_page.dart';
import 'package:real_estate_test/authentication/pages/regular_search_page.dart';
import 'package:real_estate_test/authentication/pages/user_authentication/complete_profile_page.dart';
import 'package:real_estate_test/authentication/pages/homepage.dart';
import 'package:real_estate_test/authentication/pages/user_authentication/login_page.dart';
import 'package:real_estate_test/authentication/pages/onboarding_page.dart';
import 'package:real_estate_test/authentication/pages/payment/payment_page.dart';
import 'package:real_estate_test/authentication/pages/property/property_detail_page.dart';
import 'package:real_estate_test/authentication/pages/property/property_listing_page.dart';
import 'package:real_estate_test/authentication/pages/property/property_review_page.dart';
import 'package:real_estate_test/authentication/pages/user_authentication/register_page.dart';
import 'package:real_estate_test/authentication/pages/search_map.dart';
import 'package:real_estate_test/authentication/pages/swipe_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF2F60E3)),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const AuthGate(),
        "/home": (context) => const MyHomePage(),
        "/onboarding": (context) => const OnboardingPage(),
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
        "/complete-profile": (context) => const CompleteProfilePage(),
        "/swipe": (context) => const SwipePage(),
        "/listing": (context) => const PropertyListingPage(),
        "/search-map": (context) => const SearchMap(),
        "/regular_search": (context) => const RegularSearchPage(),
        "/notifications": (context) => const NotificationsPage(),
        "/my-bookings": (context) => const MyBookingsPage(),
        "/add-card": (context) => const AddCardPage(),

      },
      onGenerateRoute: (settings) {
        final name = settings.name;
        final args = settings.arguments as Map<String, dynamic>;

        // todo: Property Details
        if (name == "/property-detail") {
          return MaterialPageRoute(
            builder: (context) =>
                PropertyDetailPage(propertyID: args["property-id"]),
          );
        }

        // todo: Property Review
        if (name == "/property-review") {
          return MaterialPageRoute(
            builder: (context) =>
                PropertyReviewPage(propertyID: args["property-id"]),
          );
        }

        // todo: Agent Review
        if (name == "/agent-review") {
          return MaterialPageRoute(
            builder: (context) =>
                AgentReviewPage(agentID: args["agent-id"]),
          );
        }

        // todo: Property Booking
        if (name == "/booking") {
          return MaterialPageRoute(
            builder: (context) =>
                BookingPage(propertyID: args["property-id"]),
          );
        }

        // todo: Book Tour
        if (name == "/book-tour") {
          return MaterialPageRoute(
            builder: (context) =>
                BookTourPage(propertyID: args["property-id"]),
          );
        }

        // todo: Payment
        if (name == "/payment") {
          return MaterialPageRoute(
            builder: (context) =>
                PaymentPage(propertyID: args["property-id"]),
          );
        }

        // todo: E-Receipt
        if (name == "/e-receipt") {
          return MaterialPageRoute(
            builder: (context) =>
                EReceiptPage(receiptID: args["receipt-id"]),
          );
        }

        // todo: rdirect to homepage 
        return MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        );
      },
    );
  }
}
