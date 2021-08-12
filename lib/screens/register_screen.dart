import '/controllers/controllers.dart';
import 'package:get/get.dart';
import '/constants/constants.dart';
import '/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends GetView<RegisterScreenController> {
  RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              _buildRegisterOptionButton(),
              _buildInputForm(),
              _buildSingInButton(context),
              _buildLoginTextButton(),
            ],
          ),
        ),
      ),
    );
  }

  AccountTextButton _buildLoginTextButton() {
    return AccountTextButton(
      onTap: () {},
      explain: 'Already have an account?',
      button: 'Log in',
    );
  }

  Padding _buildAppBar() {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, top: 60.0, right: 10.0),
      child: Row(
        children: [
          BarButton(
            onPressed: () => Get.back(),
            child: Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ),
          SizedBox(width: 15.0),
          Text(
            'Sign up',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          Spacer(),
          CircleAppIcon(
            margin: 0.0,
            width: 60.0,
            height: 60.0,
            iconSize: 20.0,
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterOptionButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign up with one of the following options',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: BarButton(
                  height: 70.0,
                  onPressed: () {},
                  // backgroundColor: CustomColors.options,
                  radius: 10.0,
                  child: Icon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: BarButton(
                  onPressed: () {},
                  height: 70.0,
                  // backgroundColor: CustomColors.options,
                  radius: 10.0,
                  child: Icon(
                    FontAwesomeIcons.apple,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          LogInput(
            onCheck: controller.onNameCheck,
            inputType: InputType.USERNAME,
            textController: controller.nameController,
            hint: 'Enter Your Name',
            maxLength: 15,
            explain: 'Name',
          ),
          LogInput(
            onCheck: controller.onPhoneCheck,
            inputType: InputType.PHONE,
            maxLength: 15,
            textController: controller.phoneController,
            hint: 'Enter Your Phone Number',
            explain: 'Phone',
          ),
          LogInput(
            isPassword: true,
            onCheck: controller.onPasswordCheck,
            inputType: InputType.PASSWORD,
            maxLength: 15,
            textController: controller.passwordController,
            hint: 'Pick a strong password',
            explain: 'Password',
          ),
        ],
      ),
    );
  }

  Padding _buildSingInButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: LoginButton(
        onPressed: controller.onRegister,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            'Create Account',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
