import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soheel_app/core/router/router.dart';
import 'package:soheel_app/views/shared/auth/forget_password/cubit/cubit.dart';
import 'package:soheel_app/views/shared/auth/forget_password/cubit/states.dart';
import 'package:soheel_app/views/shared/auth/otp/view.dart';

import '../../../../constants.dart';
import '../../../../core/validator/validation.dart';
import '../../../../widgets/confirm_button.dart';
import '../../../../widgets/logo.dart';
import '../../../../widgets/text_form_field.dart';


class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPassCubit()..resetPassword(),
      child: Scaffold(
        body:BlocBuilder<ForgetPassCubit,ForgetPassStates>(
          builder: (context, state) {
            final cubit = ForgetPassCubit.of(context);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
              child: Form(
                key: cubit.formKey,
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Logo(heightFraction: 4),
                      ),),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text('نسيت كلمه المرور  ',style: getTextTheme.headline6!.copyWith(color: kPrimaryColor),),
                    ),
                    InputFormField(
                      fillColor: kWhiteColor,
                      validator: Validator.number,
                      onPressed: (){},
                      isNext: true,
                      maxLength: 10,
                      verticalMargin: 10,
                      hint: 'رقم الجوال',
                      onSave: (v)=>cubit.telephone = v,
                      icon: FontAwesomeIcons.mobileAlt,
                    ),
                    ConfirmButton(
                      title: 'استرجاع كلمه المرور',
                      border: false,
                      verticalMargin: 10,
                      onPressed: (){
                        cubit.resetPassword();
                      },
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
        ) ,
      ),
    );
  }
}
