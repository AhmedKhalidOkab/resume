import 'package:flutter/material.dart';
import 'package:resumekhalid/presntaion/screens/auth/login.dart';
import 'package:resumekhalid/presntaion/screens/home/upload_resume.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreem extends StatefulWidget {
  const HomeScreem({super.key});

  @override
  State<HomeScreem> createState() => _HomeScreemState();
}

// sginou
Future<void> signOut(BuildContext context) async {
  await Supabase.instance.client.auth.signOut();
  final session = Supabase.instance.client.auth.currentSession;
  if (session == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sign out successful!'),
      ),
    );
    print('Sign out successful!');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sign out failed!'),
      ),
    );
  }
}

// get data
final resumetream =
    Supabase.instance.client.from('resume').stream(primaryKey: ['id']);

class _HomeScreemState extends State<HomeScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                signOut(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: StreamBuilder(
            stream: resumetream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              if (!snapshot.hasData) {
                return Center(
                  child: Text('No data'),
                );
              }
              final data = snapshot.data;
              return data!.isEmpty
                  ? Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Uploadresume()));
                          },
                          child: Text('Create you awsome Cv')),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20.0, right: 20.0, bottom: 200.0),
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 65.0,
                                  ),
                                  // Text(
                                  //   data[0]['fname'],
                                  //   style: TextStyle(
                                  //       fontSize: 20.0,
                                  //       fontWeight: FontWeight.bold

                                  //       ),
                                  // ),
                                  Center(
                                    child: Text(
                                      '       ${data[0]['fname'] + ' ' + data[0]['lname']}',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple),
                                    ),
                                  ),
                                ],
                              )
                              // Text(data[0]['fname']),
                              ,
                              Center(
                                child: Text(
                                  data[0]['job'],
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  data[0]['decs'],
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 40.0),
                                child: Text(
                                  'Country :   ${data[0]['country']}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 40.0),
                                child: Text(
                                  'City :   ${data[0]['city']}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 40.0),
                                child: Text(
                                  'E-mail :   ${data[0]['email']}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 40.0),
                                child: Text(
                                  'Phone:   ${data[0]['phone']}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Center(
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    final deleteResponse = await Supabase
                                        .instance.client
                                        .from('resume')
                                        .delete()
                                        .eq('id', data[0]['id']);
                                    if (deleteResponse.error != null) {
                                      print(
                                          'Delete failed: ${deleteResponse.error!.message}');
                                    } else {
                                      print('Deleted successfully.');
                                      // Refresh the data
                                      setState(() {
                                        resumetream;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.deepPurple,
                                  ),
                                  label: Text('Delete'),
                                ),
                              ),
                            ],
                          )),
                    );
            }));
  }
}
//Text(data[0]['fname'])
