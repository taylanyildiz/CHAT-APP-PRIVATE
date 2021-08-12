import '/controllers/controllers.dart';
import '/routers/routers.dart';
import 'package:get/get.dart';
import '/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends GetView<LoginScreenController> {
  LoginScreen({Key? key}) : super(key: key);

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
              _buildLoginOptionButton(),
              _buildInputForm(),
              _buildLoginButton(context),
              AccountTextButton(onTap: () => Get.toNamed(Routers.REGISTER)),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildLoginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: LoginButton(
        onPressed: controller.onLogin,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            'Login',
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

  Widget _buildInputForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          LogInput(
            maxLength: 15,
            onCheck: controller.onNameCheck,
            inputType: InputType.USERNAME,
            textController: controller.nameController,
            hint: 'Enter Your Name',
            explain: 'Name',
          ),
          LogInput(
            maxLength: 15,
            onCheck: controller.onPasswordCheck,
            inputType: InputType.PASSWORD,
            isPassword: true,
            textController: controller.passwordController,
            hint: 'Enter Your Password',
            explain: 'Password',
          ),
        ],
      ),
    );
  }

  Padding _buildAppBar() {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, top: 60.0, right: 10.0),
      child: Row(
        children: [
          // BarButton(
          //   onPressed: () => Get.back(),
          //   child: Padding(
          //     padding: EdgeInsets.only(left: 5.0),
          //     child: Icon(
          //       Icons.arrow_back_ios,
          //       color: Colors.white,
          //       size: 20.0,
          //     ),
          //   ),
          // ),
          SizedBox(width: 15.0),
          Text(
            'Log in',
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

  Widget _buildLoginOptionButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login with one of the following options',
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
}
