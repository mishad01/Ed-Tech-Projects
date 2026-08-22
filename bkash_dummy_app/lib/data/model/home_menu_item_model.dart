import 'package:bkash_dummy_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/home_menu_item.dart';
import '../../core/app_strings.dart';

/// Concrete data model that extends the domain entity.
/// Adds serialization logic (fromMap / toMap) and holds static sample data.
class HomeMenuItemModel extends HomeMenuItem {
  const HomeMenuItemModel({
    required super.id,
    required super.label,
    required super.iconData,
    required super.iconColor,
  });

  /// Creates a model from a plain Map (e.g., from JSON / API response).
  /// Note: IconData cannot be serialized from JSON in a real app;
  /// this is simplified for teaching purposes.
  factory HomeMenuItemModel.fromMap(Map<String, dynamic> map) {
    return HomeMenuItemModel(
      id: map['id'] as int,
      label: map['label'] as String,
      iconData: Icons.circle, // placeholder; real apps use asset images
      iconColor: AppColors.primary,
    );
  }

  //

  // ---------------------------------------------------------------------------
  // Static sample data — the 16 bKash home menu items
  // ---------------------------------------------------------------------------

  static List<HomeMenuItemModel> get sampleData => [
    const HomeMenuItemModel(
      id: 1,
      label: AppStrings.sendMoney,
      iconData: Icons.send,
      iconColor: Color(0xFFE2136E),
    ),
    const HomeMenuItemModel(
      id: 2,
      label: AppStrings.mobileRecharge,
      iconData: Icons.phone_android,
      iconColor: Color(0xFF4CAF50),
    ),
    const HomeMenuItemModel(
      id: 3,
      label: AppStrings.cashOut,
      iconData: Icons.account_balance_wallet,
      iconColor: Color(0xFF2196F3),
    ),
    const HomeMenuItemModel(
      id: 4,
      label: AppStrings.makePayment,
      iconData: Icons.shopping_bag_outlined,
      iconColor: Color(0xFFFF9800),
    ),
    const HomeMenuItemModel(
      id: 5,
      label: AppStrings.addMoney,
      iconData: Icons.add_card,
      iconColor: Color(0xFF9C27B0),
    ),
    const HomeMenuItemModel(
      id: 6,
      label: AppStrings.payBill,
      iconData: Icons.bolt,
      iconColor: Color(0xFFFFEB3B),
    ),
    const HomeMenuItemModel(
      id: 7,
      label: AppStrings.savings,
      iconData: Icons.savings,
      iconColor: Color(0xFFE2136E),
    ),
    const HomeMenuItemModel(
      id: 8,
      label: AppStrings.loan,
      iconData: Icons.local_atm,
      iconColor: Color(0xFF795548),
    ),
    const HomeMenuItemModel(
      id: 9,
      label: AppStrings.insurance,
      iconData: Icons.shield_outlined,
      iconColor: Color(0xFF00BCD4),
    ),
    const HomeMenuItemModel(
      id: 10,
      label: AppStrings.bkashToBank,
      iconData: Icons.account_balance,
      iconColor: Color(0xFFE2136E),
    ),
    const HomeMenuItemModel(
      id: 11,
      label: AppStrings.educationFee,
      iconData: Icons.menu_book_outlined,
      iconColor: Color(0xFF3F51B5),
    ),
    const HomeMenuItemModel(
      id: 12,
      label: AppStrings.microfinance,
      iconData: Icons.groups_outlined,
      iconColor: Color(0xFF1976D2),
    ),
    const HomeMenuItemModel(
      id: 13,
      label: AppStrings.toll,
      iconData: Icons.directions_bus_outlined,
      iconColor: Color(0xFF607D8B),
    ),
    const HomeMenuItemModel(
      id: 14,
      label: AppStrings.requestMoney,
      iconData: Icons.person_add_outlined,
      iconColor: Color(0xFFE2136E),
    ),
    const HomeMenuItemModel(
      id: 15,
      label: AppStrings.remittance,
      iconData: Icons.public,
      iconColor: Color(0xFF4CAF50),
    ),
    const HomeMenuItemModel(
      id: 16,
      label: AppStrings.donation,
      iconData: Icons.volunteer_activism,
      iconColor: Color(0xFFE91E63),
    ),
  ];
}

/// Converts to a plain Map (e.g., for JSON serialization).
// Map<String, dynamic> toMap() {
//   return {'id': id, 'label': label};
// }
