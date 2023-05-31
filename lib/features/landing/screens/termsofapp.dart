import 'package:flutter/material.dart';

class Termsandcond extends StatefulWidget {
  const Termsandcond({Key? key}) : super(key: key);

  @override
  State<Termsandcond> createState() => _TermsandcondState();
}

class _TermsandcondState extends State<Termsandcond> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Terms and Conditions",
            style: TextStyle(
                fontWeight: FontWeight.w300, fontStyle: FontStyle.italic),
          ),
          elevation: 10,
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: const [
                Text(
                  '''
        Terms and Conditions for Amistre Users
        
        Please read the following terms and conditions carefully before using our Amistre. These Terms govern your access to and use of the App. By using the App, you agree to be bound by these Terms. If you do not agree to these Terms, please refrain from using the App.
        
        1. Acceptance of Terms
        By accessing or using the App, you acknowledge that you have read, understood, and agree to be bound by these Terms, as well as any additional guidelines, policies, or rules applicable to specific features and services provided within the App. These Terms constitute a legally binding agreement between you and the App's developer.
        \n
        2. Eligibility
        You must be at least 13 years old to use the App. If you are under the age of 13, you are prohibited from accessing or using the App.
        \n
        3. User Account
        a. In order to use certain features of the App, you should have to create a user account. You are responsible for maintaining the confidentiality of your account information and are solely responsible for all activities that occur under your account.
        b. You must provide accurate and up-to-date information during the registration process. You agree not to create an account using a false identity or providing false information.
        c. You are responsible for safeguarding your account credentials and are prohibited from sharing your account with others. You agree to notify us immediately of any unauthorized access or use of your account.
        \n
        4. User Conduct
        a. You agree to use the App in a manner consistent with all applicable laws and regulations.
        b. You are solely responsible for the content you share or transmit through the App. You agree not to use the App for any unlawful, abusive, harassing, defamatory, discriminatory, or otherwise objectionable purpose.
        c. You agree not to impersonate any person or entity, or falsely represent your affiliation with any person or entity.
        d. You acknowledge that the App may contain public forums or chat rooms. You agree not to post, transmit, or distribute any content that violates these Terms or infringes upon the rights of others.
        e. You understand and agree that the App's developer has the right to remove or disable any content that violates these Terms or is deemed inappropriate, without prior notice.
        \n
        5. Intellectual Property Rights
        a. The App and its content, including but not limited to text, graphics, logos, images, audiovisual materials, and software, are protected by intellectual property laws and are the property of the App's developer or its licensors.
        b. You are granted a limited, non-exclusive, non-transferable, revocable license to use the App for personal, non-commercial purposes. You may not copy, modify, distribute, transmit, display, perform, reproduce, publish, license, create derivative works from, transfer, or sell any information, software, products, or services obtained from the App.
        \n
        6. Privacy
        a. The collection and use of personal information through the App are governed by our Privacy Policy. By using the App, you consent to the collection, storage, and processing of your personal information as described in the Privacy Policy.
        b. Your data will not be shared with any Country's government authority or any official.
        \n
        7. Limitation of Liability
        a. To the maximum extent permitted by applicable law, the App's developer shall not be liable for any direct, indirect, incidental, consequential, or special damages arising out of or in connection with your use of the App or its content.
        b. The App's developer does not guarantee the accuracy, completeness, or reliability of any content or information provided through the App.
        c. The App's developer does not endorse, warrant, or assume responsibility for any third-party services or products advertised or offered through the App.
        \n
        8. Modifications to the Terms
        The App's developer reserves the right to modify or amend these Terms at any time. Any changes will be effective immediately upon posting the revised Terms in the App. Your continued use of the App after the posting of any changes constitutes your acceptance of the modified Terms.
        \n
        9. Termination
        The App's developer reserves the right, in its sole discretion, to terminate or suspend your access to the App, without prior notice or liability, for any reason.
        \n
        10. Entire Agreement
        These Terms constitute the entire agreement between you and the App's developer and supersede any prior agreements or understandings, whether written or oral, relating to the App.
        \n
        If you have any questions or concerns regarding these Terms, please contact us at [satjotsingh31@gmail.com].
        
        NOTE :- IF YOU BROKE ANY OF THE RULE, WE SHOULD HAVE TO TAKE A STRICT ACTION ON YOU.''',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
