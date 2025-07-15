import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/auth/notifier/auth_notifier.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/config/common/extensions.dart';
import 'package:java_go/config/validator.dart';
import 'package:java_go/config/widgets/app_text_field.dart';
import 'package:java_go/home/account.dart';

import '../auth/state/auth_state/auth_state.dart';

class ChangePassword extends ConsumerStatefulWidget {
  const ChangePassword({super.key});

  @override
  ConsumerState<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends ConsumerState<ChangePassword> {
  final newPass = TextEditingController();
  final _fKey = GlobalKey<FormState>();
  bool isPassShow = false;
  bool isPassShow1 = false;
  bool isPassShow2 = false;

  @override
  void initState() {
    super.initState();
    ref.listenManual(authNotifierProvider, (previous, next) async {
      switch (next) {
        case AsyncData<AuthState?> data when data.value != null:
          if (data.value?.authEvent == AuthEvent.updatePassword) {
            if (data.value != null) {
              context.pop();
              context.showSnackBar(data.value!.response!);
            }
          }

        case AsyncError error:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.error.toString())),
          );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final validator = ref.watch(validatorsProvider);
    return Scaffold(
      backgroundColor: Color(0xFFF5F3F0),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Change Password',
          )),
      body: SingleChildScrollView(
        child: Form(
          key: _fKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              100.verticalSpace,
              Center(
                child: AppTextField(
                  obscureText: !isPassShow,
                  toggle: () {
                    setState(() {
                      isPassShow = !isPassShow;
                    });
                  },
                  validator: (val) => validator.validatePassword(val),
                  isPassword: true,
                  label: "Current Password",
                  hint: "Current Password",
                  onSaved: (val) {
                    ref
                        .read(authNotifierProvider.notifier)
                        .updatePassword(password: val);
                  },
                ),
              ),
              40.verticalSpace,
              Center(
                child: AppTextField(
                  obscureText: !isPassShow1,
                  toggle: () {
                    setState(() {
                      isPassShow1 = !isPassShow1;
                    });
                  },
                  validator: (val) => validator.validatePassword(val),
                  controller: newPass,
                  isPassword: true,
                  label: "New Password",
                  hint: "New Password",
                  onSaved: (val) {
                    ref
                        .read(authNotifierProvider.notifier)
                        .newPassword(password: val);
                  },
                ),
              ),
              40.verticalSpace,
              Center(
                child: AppTextField(
                  obscureText: !isPassShow2,
                  toggle: () {
                    setState(() {
                      isPassShow2 = !isPassShow2;
                    });
                  },
                  validator: (val) =>
                      validator.validateConfirmPassword(newPass.text, val),
                  isPassword: true,
                  label: "Confirm Password",
                  hint: "Confirm Password",
                ),
              ),
              80.verticalSpace,
              SizedBox(
                width: 345.w,
                height: 50.h,
                child: PrimaryButton(
                    isLoading: ref.watch(authNotifierProvider).isLoading,
                    title: "Update Password",
                    onClick: () {
                      if (_fKey.currentState!.validate()) {
                        _fKey.currentState!.save();
                        ref
                            .read(authNotifierProvider.notifier)
                            .updateNewPassword();
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
