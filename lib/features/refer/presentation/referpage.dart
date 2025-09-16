import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:referpage/features/refer/presentation/widgets/invitewidget.dart';
import 'package:referpage/features/refer/controllers/providers.dart';
import 'package:referpage/features/refer/presentation/widgets/referrallist.dart';

class Referpage extends ConsumerWidget {
  Referpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(referralCodeprovider);
    final contacts = ref.watch(contactsProvider);
    final selected = ref.watch(selectedButtonProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 232, 243),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Text(
                    'Refer and Earn',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 21, 77, 122),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 12.r),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Referral Code',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: TextEditingController(text: code),
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromARGB(
                                255,
                                227,
                                236,
                                250,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  await Clipboard.setData(
                                    ClipboardData(text: code),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Text Copied")),
                                  );
                                },
                                icon: Icon(Icons.copy),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    MaterialButton(
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      color: const Color.fromARGB(255, 8, 79, 138),
                      onPressed: () {},
                      child: Text(
                        "Share and Earn",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 12.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Invitewidget(
                    color: Colors.white,
                    icon: Icons.help,
                    label: 'How to',
                    sublabel: 'Refer',
                  ),
                  Invitewidget(
                    color: Colors.white,
                    icon: Icons.call,
                    label: 'Invite via',
                    sublabel: 'Whatsapp',
                  ),
                  Invitewidget(
                    color: Colors.white,
                    icon: Icons.qr_code,
                    label: 'Invite via',
                    sublabel: 'referral QR',
                  ),
                  Invitewidget(
                    color: Colors.white,
                    icon: Icons.copy,
                    label: 'Referral',
                    sublabel: 'Code',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  ),
                ),
                padding: EdgeInsets.all(16.r),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MaterialButton(
                          minWidth: 50.w,
                          onPressed: () {
                            ref.read(selectedButtonProvider.notifier).state =
                                "All";
                          },
                          color: selected == "All"
                              ? const Color.fromARGB(255, 21, 77, 122)
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.r),
                            side: BorderSide(
                              color: Color.fromARGB(255, 21, 77, 122),
                            ),
                          ),
                          child: Text(
                            'All',
                            style: TextStyle(
                              color: selected == "All"
                                  ? Colors.white
                                  : const Color.fromARGB(255, 21, 77, 122),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        MaterialButton(
                          minWidth: double.minPositive,
                          onPressed: () {
                            ref.read(selectedButtonProvider.notifier).state =
                                "Recent";
                          },
                          color: selected == "Recent"
                              ? const Color.fromARGB(255, 21, 77, 122)
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.r),
                            side: BorderSide(
                              color: const Color.fromARGB(255, 21, 77, 122),
                            ),
                          ),
                          child: Text(
                            'Recently Transacted ',
                            style: TextStyle(
                              color: selected == "Recent"
                                  ? Colors.white
                                  : const Color.fromARGB(255, 21, 77, 122),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Expanded(
                      child: ListView.separated(
                        itemCount: contacts.length,
                        itemBuilder: (context, i) =>
                            Referrallist(contact: contacts[i], id: i),
                        separatorBuilder: (context, index) =>
                            const Divider(thickness: 1, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
