import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/common/button.dart';
import '../../../config/validator.dart';
import '../../../config/widgets/app_text_field.dart';
import '../../notifier/auth_notifier.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  bool _isPasswordVisible = false;
  bool _isConfrmPassVisible=false;
   final _fkey=GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final validate = ref.read(validatorsProvider);
    final auth=ref.read(authNotifierProvider.notifier);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      body: SingleChildScrollView(
        child: Form(
          key: _fkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'SIGN UP',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              125.verticalSpace,
              AppTextField(
                label: 'EMAIL ID',
                hint: 'Enter your email',
                iconPath: 'assets/images/email.png',
                validator: (val) =>validate.validateEmail(val!),
                onChanged: (val)=>auth.updateEmail(email: val),
              ),
              37.verticalSpace,
              AppTextField(
                  validator: (value) => validate.validatePassword(value ?? ''),
                  label: 'PASSWORD',
                  controller: _passwordController,
                  hint: 'Enter Password',
                  isPassword: true,
                  obscureText: !_isPasswordVisible,
                  toggle: () {
                    setState(() => _isPasswordVisible = !_isPasswordVisible);
                  },
                  onChanged: (val) =>auth.updatePassword(password: val)),
              37.verticalSpace,
              AppTextField(
                  validator: (value) => validate.validateConfirmPassword(
                    _passwordController.text,
                    value ?? '',
                  ),
                  label: 'CONFIRM PASSWORD',
                  controller: _confirmPasswordController,
                  hint: 'Confirm Password',
                  isPassword: true,
                  obscureText: !_isConfrmPassVisible,
                  toggle: () {
                    setState(() => _isConfrmPassVisible = !_isConfrmPassVisible);
                  },
                  onTapOutside: (val) {
                    FocusScope.of(context).unfocus();
                  }),

            ],
          ),
        ),
      ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 70, right: 40),
          child: SizedBox(
            width: 55,
            height: 53,
            child: PrimaryButton(
              isLoading: ref.watch(authNotifierProvider).isLoading,
              backgroundColor: const Color(0xFFC0987C),
              onClick: () {
              if(_fkey.currentState!.validate()){
                _fkey.currentState!.save();
                ref.read(authNotifierProvider.notifier).signUp();
              }
              },
              isIconButton: true,
            ),
          ),
        )
    );
  }
}
