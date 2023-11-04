import 'package:flutter/material.dart';
import 'package:form_new/final.dart';

import 'package:google_fonts/google_fonts.dart';

class Secon extends StatefulWidget {
  const Secon({super.key});

  @override
  State<Secon> createState() => _SeconState();
}

class _SeconState extends State<Secon> {
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FORM PAGE"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formField,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    "https://phantom-marca.unidadeditorial.es/f979fa3dd3c97e1cbf80dd635b5fe37d/resize/660/f/webp/assets/multimedia/imagenes/2023/10/30/16987023071361.jpg",
                  ),
                ),


                const SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _firstNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your First Name';
                    }
                    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'First Name Should Not Contain Spaces';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _lastNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please  Enter Your last Name';
                    }
                    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'Last Name Should Not Contain Spaces';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _phoneNumberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Enter Invalid Phone Number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Phone Number",
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    bool emailValid = RegExp(r'^[a-zA-Z0-9._-]+@gmail\.com$')
                        .hasMatch(value!);
                    if (value.isEmpty) {
                      return "Enter Email";
                    } else if (!emailValid) {
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  controller: passController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility_off : Icons.visibility),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    } else if (passController.text.length < 8) {
                      return "Password Length Should Not Be Less Than 8 Characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 2,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_4_rounded),
                    labelText: "Enter You Age",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age.';
                    }
                    int age = int.tryParse(value) ?? 0;
                    if (age < 18) {
                      return 'You must be 18 or older.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formField.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FinalPage()));
                        // Validations passed actions here
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.radley(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
