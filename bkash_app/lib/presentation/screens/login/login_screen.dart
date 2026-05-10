import 'package:bkash_app/core/app_colors.dart';
import 'package:bkash_app/core/app_strings.dart';
import 'package:bkash_app/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _accountController = TextEditingController();
    final TextEditingController _pinController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: AppColors.primary,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(AppStrings.bangla),
                  ),
                ],
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Image(
                    image: AssetImage('assets/bkash.png'),
                    height: 40,
                    color: AppColors.primary,
                  ),
                  Icon(Icons.qr_code_2, size: 40, color: AppColors.primary),
                ],
              ),
              Text(
                'LOG IN ',
                style: TextStyle(fontSize: 18, fontWeight: .w400),
              ),
              Text(
                'To you bKash Account',
                style: TextStyle(fontSize: 22, fontWeight: .w600),
              ),

              TextField(
                controller: _accountController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
                decoration: const InputDecoration(
                  labelText: AppStrings.accountNumber,
                  labelStyle: TextStyle(
                    fontSize: 13,
                    color: AppColors.textGrey,
                  ),
                  border: UnderlineInputBorder(),

                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  enabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 8),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: _pinController,
                readOnly: true,
                obscureText: true,
                obscuringCharacter: '●',
                keyboardType: TextInputType.none,
                style: const TextStyle(
                  fontSize: 17,
                  color: AppColors.textDark,
                  letterSpacing: 4,
                ),
                decoration: InputDecoration(
                  labelText: AppStrings.bkashPin,
                  labelStyle: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textGrey,
                    fontWeight: FontWeight.w600,
                  ),
                  hintText: AppStrings.enterPin,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textGrey,
                    letterSpacing: 0,
                  ),
                  border: const UnderlineInputBorder(),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  enabledBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.only(bottom: 8),
                  suffixIcon: const Icon(
                    Icons.fingerprint,
                    color: AppColors.primary,
                    size: 28,
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text(
                  AppStrings.forgotPin,
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
