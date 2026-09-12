import 'package:bkash_dummy_app/core/app_colors.dart';
import 'package:bkash_dummy_app/core/app_strings.dart';
import 'package:bkash_dummy_app/presentation/screens/home/view/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _accountController.dispose();
    _pinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Icon(Icons.arrow_back, color: AppColors.primary),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.bangla,
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Image(
                    image: AssetImage('assets/bkash.png'),
                    height: 50,
                    color: AppColors.primary,
                  ),
                  Icon(Icons.qr_code_2, color: AppColors.primary, size: 50),
                ],
              ),

              Text(
                AppStrings.logIn,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                AppStrings.loginSubtitle,
                style: TextStyle(fontSize: 15, color: AppColors.textDark),
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
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: Text(
                    AppStrings.logIn,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
