// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CallEndRoute.name: (routeData) {
      final args = routeData.argsAs<CallEndRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CallEndPage(
          key: args.key,
          id: args.id,
          totalSecond: args.totalSecond,
          callerId: args.callerId,
          lawyerImg: args.lawyerImg,
        ),
      );
    },
    CallRoute.name: (routeData) {
      final args =
          routeData.argsAs<CallRouteArgs>(orElse: () => const CallRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CallPage(
          key: args.key,
          lawyers: args.lawyers,
          tariffsId: args.tariffsId,
          serviceId: args.serviceId,
          giftVoucherId: args.giftVoucherId,
        ),
      );
    },
    ChatDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ChatDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChatDetailPage(
          key: args.key,
          userName: args.userName,
        ),
      );
    },
    DeleteAccountRoute.name: (routeData) {
      final args = routeData.argsAs<DeleteAccountRouteArgs>(
          orElse: () => const DeleteAccountRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DeleteAccountPage(key: args.key),
      );
    },
    FaqsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FaqsPage(),
      );
    },
    AboutUsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutUsPage(),
      );
    },
    CreateAccountRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAccountRouteArgs>(
          orElse: () => const CreateAccountRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateAccountPage(key: args.key),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    OtpRoute.name: (routeData) {
      final args =
          routeData.argsAs<OtpRouteArgs>(orElse: () => const OtpRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OtpPage(
          key: args.key,
          isFromForgotPassword: args.isFromForgotPassword,
          model: args.model,
        ),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResetPasswordPage(
          key: args.key,
          arg: args.arg,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignUpPage(key: args.key),
      );
    },
    BaseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BasePage(),
      );
    },
    CallLawyerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CallLawyerPage(),
      );
    },
    ContactUsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactUsPage(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfilePage(),
      );
    },
    GiftVoucherRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GiftVoucherPage(),
      );
    },
    MyCardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyCardPage(),
      );
    },
    InvoiceDetailRoute.name: (routeData) {
      final args = routeData.argsAs<InvoiceDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: InvoiceDetailPage(
          key: args.key,
          invoices: args.invoices,
        ),
      );
    },
    InvoiceReceiptViewRoute.name: (routeData) {
      final args = routeData.argsAs<InvoiceReceiptViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: InvoiceReceiptViewPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    MyInvoiceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyInvoicePage(),
      );
    },
    LawyersDetailRoute.name: (routeData) {
      final args = routeData.argsAs<LawyersDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LawyersDetailPage(
          key: args.key,
          lawyer: args.lawyer,
        ),
      );
    },
    MyLawyerRoute.name: (routeData) {
      final args = routeData.argsAs<MyLawyerRouteArgs>(
          orElse: () => const MyLawyerRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyLawyerPage(
          key: args.key,
          fromNavBar: args.fromNavBar,
          serviceId: args.serviceId,
          voucherId: args.voucherId,
        ),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationPage(),
      );
    },
    NotificationDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationDetailPage(
          key: args.key,
          notifications: args.notifications,
        ),
      );
    },
    OurServicesRoute.name: (routeData) {
      final args = routeData.argsAs<OurServicesRouteArgs>(
          orElse: () => const OurServicesRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OurServicesPage(
          key: args.key,
          fromBasePage: args.fromBasePage,
          voucherId: args.voucherId,
        ),
      );
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailPage(
          key: args.key,
          pages: args.pages,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    SupportTicketRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SupportTicketPage(),
      );
    },
    SupportTicketReplyRoute.name: (routeData) {
      final args = routeData.argsAs<SupportTicketReplyRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SupportTicketReplyPage(
          key: args.key,
          model: args.model,
        ),
      );
    },
    TariffsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TariffsPage(),
      );
    },
    PdfPreviewRoute.name: (routeData) {
      final args = routeData.argsAs<PdfPreviewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PdfPreviewPage(
          key: args.key,
          args: args.args,
        ),
      );
    },
  };
}

/// generated route for
/// [CallEndPage]
class CallEndRoute extends PageRouteInfo<CallEndRouteArgs> {
  CallEndRoute({
    Key? key,
    required String id,
    required int totalSecond,
    required int callerId,
    String? lawyerImg,
    List<PageRouteInfo>? children,
  }) : super(
          CallEndRoute.name,
          args: CallEndRouteArgs(
            key: key,
            id: id,
            totalSecond: totalSecond,
            callerId: callerId,
            lawyerImg: lawyerImg,
          ),
          initialChildren: children,
        );

  static const String name = 'CallEndRoute';

  static const PageInfo<CallEndRouteArgs> page =
      PageInfo<CallEndRouteArgs>(name);
}

class CallEndRouteArgs {
  const CallEndRouteArgs({
    this.key,
    required this.id,
    required this.totalSecond,
    required this.callerId,
    this.lawyerImg,
  });

  final Key? key;

  final String id;

  final int totalSecond;

  final int callerId;

  final String? lawyerImg;

  @override
  String toString() {
    return 'CallEndRouteArgs{key: $key, id: $id, totalSecond: $totalSecond, callerId: $callerId, lawyerImg: $lawyerImg}';
  }
}

/// generated route for
/// [CallPage]
class CallRoute extends PageRouteInfo<CallRouteArgs> {
  CallRoute({
    Key? key,
    Lawyer? lawyers,
    int? tariffsId,
    int? serviceId,
    int? giftVoucherId,
    List<PageRouteInfo>? children,
  }) : super(
          CallRoute.name,
          args: CallRouteArgs(
            key: key,
            lawyers: lawyers,
            tariffsId: tariffsId,
            serviceId: serviceId,
            giftVoucherId: giftVoucherId,
          ),
          initialChildren: children,
        );

  static const String name = 'CallRoute';

  static const PageInfo<CallRouteArgs> page = PageInfo<CallRouteArgs>(name);
}

class CallRouteArgs {
  const CallRouteArgs({
    this.key,
    this.lawyers,
    this.tariffsId,
    this.serviceId,
    this.giftVoucherId,
  });

  final Key? key;

  final Lawyer? lawyers;

  final int? tariffsId;

  final int? serviceId;

  final int? giftVoucherId;

  @override
  String toString() {
    return 'CallRouteArgs{key: $key, lawyers: $lawyers, tariffsId: $tariffsId, serviceId: $serviceId, giftVoucherId: $giftVoucherId}';
  }
}

/// generated route for
/// [ChatDetailPage]
class ChatDetailRoute extends PageRouteInfo<ChatDetailRouteArgs> {
  ChatDetailRoute({
    Key? key,
    required String userName,
    List<PageRouteInfo>? children,
  }) : super(
          ChatDetailRoute.name,
          args: ChatDetailRouteArgs(
            key: key,
            userName: userName,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatDetailRoute';

  static const PageInfo<ChatDetailRouteArgs> page =
      PageInfo<ChatDetailRouteArgs>(name);
}

class ChatDetailRouteArgs {
  const ChatDetailRouteArgs({
    this.key,
    required this.userName,
  });

  final Key? key;

  final String userName;

  @override
  String toString() {
    return 'ChatDetailRouteArgs{key: $key, userName: $userName}';
  }
}

/// generated route for
/// [DeleteAccountPage]
class DeleteAccountRoute extends PageRouteInfo<DeleteAccountRouteArgs> {
  DeleteAccountRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DeleteAccountRoute.name,
          args: DeleteAccountRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DeleteAccountRoute';

  static const PageInfo<DeleteAccountRouteArgs> page =
      PageInfo<DeleteAccountRouteArgs>(name);
}

class DeleteAccountRouteArgs {
  const DeleteAccountRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'DeleteAccountRouteArgs{key: $key}';
  }
}

/// generated route for
/// [FaqsPage]
class FaqsRoute extends PageRouteInfo<void> {
  const FaqsRoute({List<PageRouteInfo>? children})
      : super(
          FaqsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FaqsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AboutUsPage]
class AboutUsRoute extends PageRouteInfo<void> {
  const AboutUsRoute({List<PageRouteInfo>? children})
      : super(
          AboutUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateAccountPage]
class CreateAccountRoute extends PageRouteInfo<CreateAccountRouteArgs> {
  CreateAccountRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CreateAccountRoute.name,
          args: CreateAccountRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreateAccountRoute';

  static const PageInfo<CreateAccountRouteArgs> page =
      PageInfo<CreateAccountRouteArgs>(name);
}

class CreateAccountRouteArgs {
  const CreateAccountRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CreateAccountRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OtpPage]
class OtpRoute extends PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    Key? key,
    bool isFromForgotPassword = false,
    ForgotPassModel? model,
    List<PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(
            key: key,
            isFromForgotPassword: isFromForgotPassword,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const PageInfo<OtpRouteArgs> page = PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    this.isFromForgotPassword = false,
    this.model,
  });

  final Key? key;

  final bool isFromForgotPassword;

  final ForgotPassModel? model;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, isFromForgotPassword: $isFromForgotPassword, model: $model}';
  }
}

/// generated route for
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    Key? key,
    required ResetPassPageArgs arg,
    List<PageRouteInfo>? children,
  }) : super(
          ResetPasswordRoute.name,
          args: ResetPasswordRouteArgs(
            key: key,
            arg: arg,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<ResetPasswordRouteArgs> page =
      PageInfo<ResetPasswordRouteArgs>(name);
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    this.key,
    required this.arg,
  });

  final Key? key;

  final ResetPassPageArgs arg;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, arg: $arg}';
  }
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<SignUpRouteArgs> page = PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [BasePage]
class BaseRoute extends PageRouteInfo<void> {
  const BaseRoute({List<PageRouteInfo>? children})
      : super(
          BaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CallLawyerPage]
class CallLawyerRoute extends PageRouteInfo<void> {
  const CallLawyerRoute({List<PageRouteInfo>? children})
      : super(
          CallLawyerRoute.name,
          initialChildren: children,
        );

  static const String name = 'CallLawyerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContactUsPage]
class ContactUsRoute extends PageRouteInfo<void> {
  const ContactUsRoute({List<PageRouteInfo>? children})
      : super(
          ContactUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactUsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfilePage]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GiftVoucherPage]
class GiftVoucherRoute extends PageRouteInfo<void> {
  const GiftVoucherRoute({List<PageRouteInfo>? children})
      : super(
          GiftVoucherRoute.name,
          initialChildren: children,
        );

  static const String name = 'GiftVoucherRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyCardPage]
class MyCardRoute extends PageRouteInfo<void> {
  const MyCardRoute({List<PageRouteInfo>? children})
      : super(
          MyCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InvoiceDetailPage]
class InvoiceDetailRoute extends PageRouteInfo<InvoiceDetailRouteArgs> {
  InvoiceDetailRoute({
    Key? key,
    required Invoices invoices,
    List<PageRouteInfo>? children,
  }) : super(
          InvoiceDetailRoute.name,
          args: InvoiceDetailRouteArgs(
            key: key,
            invoices: invoices,
          ),
          initialChildren: children,
        );

  static const String name = 'InvoiceDetailRoute';

  static const PageInfo<InvoiceDetailRouteArgs> page =
      PageInfo<InvoiceDetailRouteArgs>(name);
}

class InvoiceDetailRouteArgs {
  const InvoiceDetailRouteArgs({
    this.key,
    required this.invoices,
  });

  final Key? key;

  final Invoices invoices;

  @override
  String toString() {
    return 'InvoiceDetailRouteArgs{key: $key, invoices: $invoices}';
  }
}

/// generated route for
/// [InvoiceReceiptViewPage]
class InvoiceReceiptViewRoute
    extends PageRouteInfo<InvoiceReceiptViewRouteArgs> {
  InvoiceReceiptViewRoute({
    Key? key,
    required Uint8List data,
    List<PageRouteInfo>? children,
  }) : super(
          InvoiceReceiptViewRoute.name,
          args: InvoiceReceiptViewRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'InvoiceReceiptViewRoute';

  static const PageInfo<InvoiceReceiptViewRouteArgs> page =
      PageInfo<InvoiceReceiptViewRouteArgs>(name);
}

class InvoiceReceiptViewRouteArgs {
  const InvoiceReceiptViewRouteArgs({
    this.key,
    required this.data,
  });

  final Key? key;

  final Uint8List data;

  @override
  String toString() {
    return 'InvoiceReceiptViewRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [MyInvoicePage]
class MyInvoiceRoute extends PageRouteInfo<void> {
  const MyInvoiceRoute({List<PageRouteInfo>? children})
      : super(
          MyInvoiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyInvoiceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LawyersDetailPage]
class LawyersDetailRoute extends PageRouteInfo<LawyersDetailRouteArgs> {
  LawyersDetailRoute({
    Key? key,
    required Lawyer lawyer,
    List<PageRouteInfo>? children,
  }) : super(
          LawyersDetailRoute.name,
          args: LawyersDetailRouteArgs(
            key: key,
            lawyer: lawyer,
          ),
          initialChildren: children,
        );

  static const String name = 'LawyersDetailRoute';

  static const PageInfo<LawyersDetailRouteArgs> page =
      PageInfo<LawyersDetailRouteArgs>(name);
}

class LawyersDetailRouteArgs {
  const LawyersDetailRouteArgs({
    this.key,
    required this.lawyer,
  });

  final Key? key;

  final Lawyer lawyer;

  @override
  String toString() {
    return 'LawyersDetailRouteArgs{key: $key, lawyer: $lawyer}';
  }
}

/// generated route for
/// [MyLawyerPage]
class MyLawyerRoute extends PageRouteInfo<MyLawyerRouteArgs> {
  MyLawyerRoute({
    Key? key,
    bool fromNavBar = false,
    int? serviceId,
    int? voucherId,
    List<PageRouteInfo>? children,
  }) : super(
          MyLawyerRoute.name,
          args: MyLawyerRouteArgs(
            key: key,
            fromNavBar: fromNavBar,
            serviceId: serviceId,
            voucherId: voucherId,
          ),
          initialChildren: children,
        );

  static const String name = 'MyLawyerRoute';

  static const PageInfo<MyLawyerRouteArgs> page =
      PageInfo<MyLawyerRouteArgs>(name);
}

class MyLawyerRouteArgs {
  const MyLawyerRouteArgs({
    this.key,
    this.fromNavBar = false,
    this.serviceId,
    this.voucherId,
  });

  final Key? key;

  final bool fromNavBar;

  final int? serviceId;

  final int? voucherId;

  @override
  String toString() {
    return 'MyLawyerRouteArgs{key: $key, fromNavBar: $fromNavBar, serviceId: $serviceId, voucherId: $voucherId}';
  }
}

/// generated route for
/// [NotificationPage]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationDetailPage]
class NotificationDetailRoute
    extends PageRouteInfo<NotificationDetailRouteArgs> {
  NotificationDetailRoute({
    Key? key,
    required NotificationsInfo notifications,
    List<PageRouteInfo>? children,
  }) : super(
          NotificationDetailRoute.name,
          args: NotificationDetailRouteArgs(
            key: key,
            notifications: notifications,
          ),
          initialChildren: children,
        );

  static const String name = 'NotificationDetailRoute';

  static const PageInfo<NotificationDetailRouteArgs> page =
      PageInfo<NotificationDetailRouteArgs>(name);
}

class NotificationDetailRouteArgs {
  const NotificationDetailRouteArgs({
    this.key,
    required this.notifications,
  });

  final Key? key;

  final NotificationsInfo notifications;

  @override
  String toString() {
    return 'NotificationDetailRouteArgs{key: $key, notifications: $notifications}';
  }
}

/// generated route for
/// [OurServicesPage]
class OurServicesRoute extends PageRouteInfo<OurServicesRouteArgs> {
  OurServicesRoute({
    Key? key,
    bool fromBasePage = false,
    int? voucherId,
    List<PageRouteInfo>? children,
  }) : super(
          OurServicesRoute.name,
          args: OurServicesRouteArgs(
            key: key,
            fromBasePage: fromBasePage,
            voucherId: voucherId,
          ),
          initialChildren: children,
        );

  static const String name = 'OurServicesRoute';

  static const PageInfo<OurServicesRouteArgs> page =
      PageInfo<OurServicesRouteArgs>(name);
}

class OurServicesRouteArgs {
  const OurServicesRouteArgs({
    this.key,
    this.fromBasePage = false,
    this.voucherId,
  });

  final Key? key;

  final bool fromBasePage;

  final int? voucherId;

  @override
  String toString() {
    return 'OurServicesRouteArgs{key: $key, fromBasePage: $fromBasePage, voucherId: $voucherId}';
  }
}

/// generated route for
/// [DetailPage]
class DetailRoute extends PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    Key? key,
    required Pages pages,
    List<PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            pages: pages,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static const PageInfo<DetailRouteArgs> page = PageInfo<DetailRouteArgs>(name);
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.pages,
  });

  final Key? key;

  final Pages pages;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, pages: $pages}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SupportTicketPage]
class SupportTicketRoute extends PageRouteInfo<void> {
  const SupportTicketRoute({List<PageRouteInfo>? children})
      : super(
          SupportTicketRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupportTicketRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SupportTicketReplyPage]
class SupportTicketReplyRoute
    extends PageRouteInfo<SupportTicketReplyRouteArgs> {
  SupportTicketReplyRoute({
    Key? key,
    required Support model,
    List<PageRouteInfo>? children,
  }) : super(
          SupportTicketReplyRoute.name,
          args: SupportTicketReplyRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'SupportTicketReplyRoute';

  static const PageInfo<SupportTicketReplyRouteArgs> page =
      PageInfo<SupportTicketReplyRouteArgs>(name);
}

class SupportTicketReplyRouteArgs {
  const SupportTicketReplyRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final Support model;

  @override
  String toString() {
    return 'SupportTicketReplyRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [TariffsPage]
class TariffsRoute extends PageRouteInfo<void> {
  const TariffsRoute({List<PageRouteInfo>? children})
      : super(
          TariffsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TariffsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PdfPreviewPage]
class PdfPreviewRoute extends PageRouteInfo<PdfPreviewRouteArgs> {
  PdfPreviewRoute({
    Key? key,
    required PdfPreviewPageArgs args,
    List<PageRouteInfo>? children,
  }) : super(
          PdfPreviewRoute.name,
          args: PdfPreviewRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'PdfPreviewRoute';

  static const PageInfo<PdfPreviewRouteArgs> page =
      PageInfo<PdfPreviewRouteArgs>(name);
}

class PdfPreviewRouteArgs {
  const PdfPreviewRouteArgs({
    this.key,
    required this.args,
  });

  final Key? key;

  final PdfPreviewPageArgs args;

  @override
  String toString() {
    return 'PdfPreviewRouteArgs{key: $key, args: $args}';
  }
}
