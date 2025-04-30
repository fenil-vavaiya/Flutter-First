import 'package:example_learning/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: profileScreen(), backgroundColor: Colors.white);
  }

  Widget profileScreen() {
    return Column(children: [topBar(), mainBody()]);
  }

  Widget topBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/ic_back.svg', height: 24, width: 24),
          const Spacer(),
          SvgPicture.asset(
            'assets/icons/ic_setting.svg',
            height: 24,
            width: 24,
          ),
        ],
      ),
    );
  }

  Widget mainBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [profileImage(), formBody()],
      ),
    );
  }

  Widget profileImage() {
    return Column(
      children: [
        Center(
          child: Stack(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/img_profile_picture.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                bottom: 0,
                right: 15,
                child: SvgPicture.asset(
                  'assets/icons/ic_edit.svg',
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16), // Add this right before the Text
        Text(
          'GFXAgency',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        Text(
          'UI UX DESIGN',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget formBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Email',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        emailInputField(),
        Text(
          'Password',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        PasswordInputField(),
      ],
    );
  }

  TextFormField normalTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'example@email.com',
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty || !value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget emailInputField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'xxx@gmail.com',
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: Colors.grey[500],
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            'assets/icons/ic_email.svg',
            width: 20,
            height: 20,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.textFieldBorder, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
      ),
      style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({super.key});

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: 'xxx@gmail.com',
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: Colors.grey[500],
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            'assets/icons/ic_password.svg', // 👈 your custom lock icon
            width: 20,
            height: 20,
            color: Colors.grey[500],
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              _obscureText
                  ? 'assets/icons/ic_hide_password.svg' // 👁️ eye closed
                  : 'assets/icons/ic_eye_open.svg', // 👁️ eye open
              width: 20,
              height: 20,
              color: Colors.grey[500],
            ),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
      ),
      style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
    );
  }
}
