import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../utils/constants/color_constants.dart';
import '../../../../../utils/validators/validators.dart';
import '../../../../componenets/custom_bottom_btn.dart';
import '../../../../componenets/custom_inputfield.dart';
import '../../../../componenets/custom_inputfield_label.dart';
import '../../../../componenets/custom_scaffold.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  SignupViewState createState() => SignupViewState();
}

class SignupViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  late bool passwordVisible;
  late bool confirmPasswordVisible;
  bool _formCompleted = false;

  @override
  void initState() {
    _formCompleted = false;
    passwordVisible = true;
    confirmPasswordVisible = true;
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _emailFocusNode.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordController.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: const Text(
          'Create Account',
          style: TextStyle(
            color: ColorConstants.textHeader,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConstants.white,
        foregroundColor: ColorConstants.black,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorConstants.textHeader,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'We need your personal information',
                    style: TextStyle(
                      color: ColorConstants.textBody,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Gap(20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const CustomInputFieldLabel(
                          label: 'First name',
                        ),
                        const Gap(5),
                        CustomInputField(
                          controller: _firstNameController,
                          currentFocus: _firstNameFocus,
                          nextFocus: _lastNameFocus,
                          hintText: 'Place|holder',
                          action: TextInputAction.next,
                          validator: (value) =>
                              Validators.validateFirstName(value),
                          onChanged: (value) => checkValidity(),
                        ),
                        const Gap(20),
                        const CustomInputFieldLabel(
                          label: 'Last name',
                        ),
                        const Gap(5),
                        CustomInputField(
                          controller: _lastNameController,
                          currentFocus: _lastNameFocus,
                          nextFocus: _emailFocusNode,
                          hintText: 'Place|holder',
                          action: TextInputAction.next,
                          validator: (value) =>
                              Validators.validateLastName(value),
                          onChanged: (value) => checkValidity(),
                        ),
                        const Gap(20),
                        const CustomInputFieldLabel(
                          label: 'Email address',
                        ),
                        const Gap(5),
                        CustomInputField(
                          controller: _emailController,
                          currentFocus: _emailFocusNode,
                          hintText: 'e.g user@email.com',
                          prefixIconPath: Assets.icons.mail01.path,
                          action: TextInputAction.done,
                          validator: (value) => Validators.validateEmail(value),
                          onChanged: (value) => checkValidity(),
                        ),
                        const Gap(20),
                        const CustomInputFieldLabel(
                          label: 'Password',
                        ),
                        const Gap(5),
                        CustomInputField(
                          controller: _passwordController,
                          currentFocus: _passwordFocusNode,
                          nextFocus: _confirmPasswordFocusNode,
                          hintTextColor: ColorConstants.grey400,
                          hintText: '● ● ● ● ● ● ● ●',
                          prefixIconPath: Assets.icons.lock03.path,
                          isPasswordfield: true,
                          obscureText: passwordVisible,
                          onSuffixIconTap: () => setState(() {
                            passwordVisible = !passwordVisible;
                          }),
                          action: TextInputAction.next,
                          onChanged: (value) => checkValidity(),
                          validator: (value) => Validators.validatePassword(
                              _passwordController.text),
                        ),
                        const Gap(15),
                        const CustomInputFieldLabel(
                          label: 'Confirm Password',
                        ),
                        const Gap(5),
                        CustomInputField(
                          controller: _confirmPasswordController,
                          currentFocus: _confirmPasswordFocusNode,
                          hintTextColor: ColorConstants.grey400,
                          hintText: '● ● ● ● ● ● ● ●',
                          prefixIconPath: Assets.icons.lock03.path,
                          isPasswordfield: true,
                          obscureText: confirmPasswordVisible,
                          onSuffixIconTap: () => setState(() {
                            confirmPasswordVisible = !confirmPasswordVisible;
                          }),
                          action: TextInputAction.done,
                          validator: (value) =>
                              Validators.validateConfirmPassword(
                                  _passwordController.text, value!),
                          onChanged: (value) => checkValidity(),
                        ),
                      ],
                    ),
                  ),
                  const Gap(193),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBtn(
        text: 'Continue',
        textColor: ColorConstants.white,
        backgroundColor:
            _formCompleted ? ColorConstants.primary : ColorConstants.neutral300,
        onPressed: _formCompleted ? () => onContinue() : null,
        isLoading: false,
      ),
    );
  }

  onContinue() async {
    if (_formKey.currentState!.validate()) {
      // context.read<AuthProvider>().setUserDetails(
      //       firstName: _firstNameController.text,
      //       lastName: _lastNameController.text,
      //       email: _emailController.text,
      //       phone: _phoneController.text,
      //     );
      // Helpers.navigateToPage(RoutesManager.signinPasswordRoute);
    }
  }

  checkValidity() {
    if (_firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty) {
      setState(() {
        _formCompleted = true;
      });
    } else {
      setState(() {
        _formCompleted = false;
      });
    }
  }
}
