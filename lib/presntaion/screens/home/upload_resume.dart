import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resumekhalid/presntaion/screens/home/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Uploadresume extends StatefulWidget {
  const Uploadresume({super.key});

  @override
  State<Uploadresume> createState() => _UploadresumeState();
}

TextEditingController fnameController = TextEditingController();
TextEditingController lnameController = TextEditingController();
TextEditingController jobController = TextEditingController();
TextEditingController jobDescController = TextEditingController();
TextEditingController countryController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();

// create resume
Future<void> createResume(
  BuildContext context, {
  required String fname,
  required String lname,
  required String job,
  required String country,
  required String decs,
  required String city,
  required String email,
  required String phone,
}) async {
  try {
    final response = await Supabase.instance.client.from('resume').insert([
      {
        'fname': fname,
        'lname': lname,
        'decs': decs,
        'job': job,
        'country': country,
        'city': city,
        'email': email,
        'phone': phone,
      },
    ]);
    if (response == null) {
      print('Response is null');
    } else if (response.error != null) {
      print('Insert failed: ${response.error!.message}');
      print(response);
    } else {
      print('Inserted successfully.');
      print(response);
    }
  } catch (e) {
    print(e);
  }
}

var formKey = GlobalKey<FormState>();

class _UploadresumeState extends State<Uploadresume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Upload Resume'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
                child: Column(
              children: [
                Text('Upload Your Resume Data',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    )),
                SizedBox(
                  height: 20,
                ),
                // First Name
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: fnameController,
                        decoration: InputDecoration(
                          // labelText: 'First Name',
                          hintText: 'First Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter First Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // Last Name
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: TextFormField(
                          controller: lnameController,
                          decoration: const InputDecoration(
                            // labelText: 'First Name',
                            hintText: 'Last Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Last Name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // Job title
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    controller: jobController,
                    decoration: const InputDecoration(
                      hintText: 'Job title',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Job title';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    maxLines: 3,
                    maxLength: 200,
                    controller: jobDescController,
                    decoration: const InputDecoration(
                      hintText: 'Job Description',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Job Description';
                      }
                      return null;
                    },
                  ),
                ),
                // Country
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    controller: countryController,
                    decoration: InputDecoration(
                      // labelText: 'First Name',
                      hintText: 'Country',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter First Country';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      // labelText: 'First Name',
                      hintText: 'City',
                      border: OutlineInputBorder(),
                    ),
                    controller: cityController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter City';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      // labelText: 'First Name',
                      hintText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter E-mail';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      // labelText: 'First Name',
                      hintText: 'Phone',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Phone';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      createResume(context,
                          fname: fnameController.text,
                          lname: lnameController.text,
                          country: countryController.text,
                          city: cityController.text,
                          email: emailController.text,
                          job: jobController.text,
                          decs: jobDescController.text,
                          // 'i passionate about flutter and dart and i love to work with it and i have 4 years of experience',
                          phone: phoneController.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreem(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.deepPurple,
                    ),
                    width: double.infinity,
                    child: Text(
                      'Upload Resume',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     createResume(context);
                //   },
                //   child: Text('Upload'),
                // ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
