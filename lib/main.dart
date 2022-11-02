import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'Global.dart';
import 'common/langs/translation_service.dart';
import 'common/routes/pages.dart';
import 'common/store/config.dart';
import 'common/style/theme.dart';
import 'common/utils/logger.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context,_) => RefreshConfiguration(
        headerBuilder: () => const MaterialClassicHeader(),
        footerBuilder: () => const ClassicFooter(noDataText: '啥都没啦！',loadingText: '加载更多中～',),
        hideFooterWhenNotFull: true,
        headerTriggerDistance: 80,
        maxOverScrollExtent: 100,
        footerTriggerDistance: 150,
        child: GetMaterialApp(
          title: 'CRM',
          theme: AppTheme.light,
          showPerformanceOverlay: false,
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          defaultTransition: Transition.rightToLeft,
          getPages: AppPages.routes,
          builder: EasyLoading.init(),
          translations: TranslationService(),
          navigatorObservers: [AppPages.observer],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: ConfigStore.to.languages,
          locale: ConfigStore.to.locale,
          fallbackLocale: const Locale('zh', 'US'),
          enableLog: true,
          logWriterCallback: Logger.write,
        ),
      ),
    );
  }
}