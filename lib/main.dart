
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oktoast/oktoast.dart';
import 'package:quickservice/src/core/constant/color_constant.dart';
import 'package:quickservice/src/features/provider_list_screen/screen/provider_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: QuickService()
      ));
}

class QuickService extends StatelessWidget {
  const QuickService({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(
      context,
    ).textTheme.bodyLarge!.copyWith(color: Colors.white);
    return OKToast(
      textStyle: textStyle,
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'QuickService',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(useMaterial3: true).copyWith(
              scaffoldBackgroundColor: Colors.black,
              primaryColor: ColorConstant.primaryColor,
              buttonTheme: ButtonThemeData(
                buttonColor:  ColorConstant.primaryColor,
                height: 55,
              ),
            ),

            home: ProviderListScreen(),
          );
        },
      ),
    );
    ;
  }
}
