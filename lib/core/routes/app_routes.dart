import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lask_client/features/call_lawyers/pages/call_lawyer_page.dart';
import 'package:lask_client/features/support_ticket/screens/support_ticket_page.dart';
import '../../calls/screens/call_page.dart';
import '../../calls/screens/call_end_page.dart';
import '../../calls/screens/chat_detail_page.dart';
import '../../delete_account/pages/delete_acount_page.dart';
import '../../faqs/pages/faqs_page.dart';
import '../../features/about_us/screen/about_us.dart';
import '../../features/auth/model/forgot_password_model.dart';
import '../../features/auth/screens/create_account_page.dart';
import '../../features/auth/screens/forgot_password_page.dart';
import '../../features/auth/screens/login_page.dart';
import '../../features/auth/screens/otp_page.dart';
import '../../features/auth/screens/reset_password_page.dart';
import '../../features/auth/screens/sign_up_page.dart';
import '../../features/base_page/model/pages_model.dart';
import '../../features/base_page/pages/base_page.dart';
import '../../features/contact_us/pages/contact_us_page.dart';
import '../../features/edit_profile/pages/edit_profile_page.dart';
import '../../features/gift_vouchers/pages/gift_voucher_page.dart';
import '../../features/home_page/model/hompage_model.dart';
import '../../features/my_card/screens/my_card_page.dart';
import '../../features/my_invoices/model/invoice_model.dart';
import '../../features/my_invoices/pages/invoice_detail_page.dart';
import '../../features/my_invoices/pages/invoice_receipt_view_page.dart';
import '../../features/my_invoices/pages/my_invoice_page.dart';
import '../../features/my_lawyers/pages/lawyers_detail_page.dart';
import '../../features/my_lawyers/pages/my_lawyer_page.dart';
import '../../features/notification/model/notification_model.dart';
import '../../features/notification/pages/notification_page.dart';
import '../../features/notification/pages/notificaton_detail_page.dart';
import '../../features/our_services/pages/our_services_page.dart';
import '../../features/pages/pages/detail_page.dart';
import '../../features/profile/pages/profile_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/support_ticket/model/support_model.dart';
import '../../features/support_ticket/screens/support_ticket_reply_page.dart';
import '../../features/tariffs/pages/tariffs_page.dart';
import '../../widgets/pdf_preview_page.dart';

part 'app_routes.gr.dart';

// @AutoRouterConfig(replaceInRouteName: 'Page,Route')
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: BaseRoute.page),
        AutoRoute(page: OurServicesRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: BaseRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: OtpRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: CreateAccountRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: LawyersDetailRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: MyInvoiceRoute.page),
        AutoRoute(page: MyInvoiceRoute.page),
        AutoRoute(page: InvoiceDetailRoute.page),
        AutoRoute(page: TariffsRoute.page),
        AutoRoute(page: NotificationRoute.page),
        AutoRoute(page: NotificationDetailRoute.page),
        AutoRoute(page: ContactUsRoute.page),
        AutoRoute(page: FaqsRoute.page),
        AutoRoute(page: GiftVoucherRoute.page),
        AutoRoute(page: EditProfileRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: MyLawyerRoute.page),
        AutoRoute(page: DeleteAccountRoute.page),
        AutoRoute(page: CallRoute.page),
        AutoRoute(page: CallEndRoute.page),
        AutoRoute(page: DetailRoute.page),
        AutoRoute(page: InvoiceReceiptViewRoute.page),
        AutoRoute(page: PdfPreviewRoute.page),
        AutoRoute(page: ChatDetailRoute.page),
        AutoRoute(page: AboutUsRoute.page),
        AutoRoute(page: MyCardRoute.page),
        AutoRoute(page: CallLawyerRoute.page),
        AutoRoute(page: SupportTicketRoute.page),
        AutoRoute(page: SupportTicketReplyRoute.page)
      ];
}
