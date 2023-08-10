// import 'package:lask_client/core/extension/extension.dart';
// import 'package:number_to_words_english/number_to_words_english.dart';
// import '../../../helper/utils/app_utils.dart';
// import '../../profile/model/profile_model.dart';
// import 'invoice_model.dart';
// import 'orgazization_model.dart';
//
// class InvoicePdfModel {
//   final DateTime date;
//   final String companyName;
//   final String email;
//   final String phoneNumber;
//   final String address;
//   final String typeOfInvoice;
//   final String to;
//   final String lawyerLicenseNo;
//   final List<InvoicePaymentDataModel> dataList;
//   final String totalFareInWords;
//   final String description;
//   final String authorName;
//   final String endingGreeting;
//   final String endingCompanyName;
//
//   InvoicePdfModel({
//     required this.date,
//     required this.companyName,
//     required this.email,
//     required this.phoneNumber,
//     required this.address,
//     required this.typeOfInvoice,
//     required this.to,
//     required this.lawyerLicenseNo,
//     required this.dataList,
//     required this.authorName,
//     required this.description,
//     required this.endingCompanyName,
//     required this.endingGreeting,
//     required this.totalFareInWords,
//   });
//
//   factory InvoicePdfModel.fromJson(Invoices model,
//       ProfileModel userProfile, OrganizationModel orgModel) =>
//       InvoicePdfModel(
//         address: orgModel.address ?? "-",
//         authorName: orgModel.name,
//         companyName: orgModel.name,
//         dataList: [
//           InvoicePaymentDataModel(
//             lawyerName: model.call?.lawyer?.user?.fullName ?? "-",
//             refrenceNo: model.referenceNumber??"-",
//             durationOfCall: formatDuration(260)??model.call!.duration!.toInt().formatTimeToMinAndHr,
//             feeAmount: model.amount!.toStringAsFixed(1),
//           ),
//         ],
//         date: DateTime.parse("2050-05-12"??model.call!.createdAt!) ,
//         description:
//         "If you plan / need to follow this lawyer again in future, you need to search for them by the above Lawyer License Number, so we advise you to save this invoice / receipt.",
//         email: orgModel.primaryCompanyEmail,
//         endingCompanyName: orgModel.name,
//         endingGreeting: 'Thank you very much.',
//         lawyerLicenseNo: model.call?.lawyer?.licenseNumber ?? "-",
//         to: userProfile.fullName ?? "-",
//         phoneNumber: orgModel.primaryContactNumber,
//         totalFareInWords: "${NumberToWordsEnglish.convert(model.amount!.toInt())} Euro" ,
//         typeOfInvoice: 'Independent Lawyer employee Payment Note.',
//       );
//
//   // static InvoicePdfModel get demo => InvoicePdfModel(
//   //       address: "Lisbon, Portugal",
//   //       authorName: "Nitesh Neupane",
//   //       companyName: "Atenção & Resolução Lda.",
//   //       dataList: [
//   //         InvoicePaymentDataModel(
//   //           clientName: "Ms. Shreya Shrestha",
//   //           refrenceNo: "89357893475",
//   //           durationOfCall: "5 mins 44 secs",
//   //           feeAmount: "20",
//   //         ),
//   //       ],
//   //       date: DateTime.now(),
//   //       description:
//   //           "As per our agreement you will receive your payment in your bank until on 15 of next month, however you are entitled / liable to pay tax or any kind payment towards Gov. authorities or your association on time.",
//   //       email: "info@lask.com.pt",
//   //       endingCompanyName: 'Atenção & Resolução Lda. (LASK) Admin',
//   //       endingGreeting: 'Thank you very much.',
//   //       lawyerLicenseNo: '3985793748',
//   //       to: 'Mrs. Lawyer Priyanka Karki',
//   //       nipc: '51935735435',
//   //       phoneNumber: '+356-3985793748',
//   //       totalFareInWords: 'Twenty Euro',
//   //       typeOfInvoice: 'Independent Lawyer employee Payment Note.',
//   //     );
// }
//
// class InvoicePaymentDataModel {
//   final String lawyerName;
//   final String refrenceNo;
//   final String durationOfCall;
//   final String feeAmount;
//
//   InvoicePaymentDataModel({
//     required this.lawyerName,
//     required this.refrenceNo,
//     required this.durationOfCall,
//     required this.feeAmount,
//   });
// }
