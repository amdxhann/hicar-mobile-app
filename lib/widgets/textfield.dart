import 'package:flutter/material.dart';

class firstname extends StatelessWidget {
  const firstname({
    super.key,
    required this.firstNameEditingController,
  });

  final TextEditingController firstNameEditingController;

  @override
  Widget build(BuildContext context) {
    String capitalize(String value) {
      if (value.trim().isEmpty) return "";
      return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
    }

    return TextFormField(
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        onChanged: (value) {
          firstNameEditingController.value = TextEditingValue(
              text: value.toUpperCase(),
              selection: firstNameEditingController.selection);
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class confirmPassword extends StatelessWidget {
  const confirmPassword({
    super.key,
    required this.confirmPasswordEditingController,
    required this.passwordEditingController,
  });

  final TextEditingController confirmPasswordEditingController;
  final TextEditingController passwordEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class password extends StatelessWidget {
  const password({
    super.key,
    required this.passwordEditingController,
  });

  final TextEditingController passwordEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class email extends StatelessWidget {
  const email({
    super.key,
    required this.emailEditingController,
  });

  final TextEditingController emailEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class secondName extends StatelessWidget {
  const secondName({
    super.key,
    required this.secondNameEditingController,
  });

  final TextEditingController secondNameEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Second Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        onChanged: (value) {
          secondNameEditingController.value = TextEditingValue(
              text: value.toUpperCase(),
              selection: secondNameEditingController.selection);
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class emailLogin extends StatelessWidget {
  const emailLogin({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class passLogin extends StatelessWidget {
  const passLogin({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final obstext = true;
    return TextFormField(
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: passwordController,
        obscureText: obstext,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {},
            child: IconButton(
              onPressed: () {
                if (obstext == false) {
                  obstext == true;
                } else {
                  obstext == false;
                }
              },
              icon: Icon(Icons.remove_red_eye),
              color: Colors.white,
            ),
          ),
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class telepon extends StatelessWidget {
  const telepon({
    super.key,
    required this.teleponEditingController,
  });

  final TextEditingController teleponEditingController;

  @override
  Widget build(BuildContext context) {
    String capitalize(String value) {
      if (value.trim().isEmpty) return "";
      return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
    }

    return TextFormField(
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: teleponEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          teleponEditingController.text = value!;
        },
        onChanged: (value) {
          teleponEditingController.value = TextEditingValue(
              text: value.toUpperCase(),
              selection: teleponEditingController.selection);
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class alamat extends StatelessWidget {
  const alamat({
    super.key,
    required this.alamatEditingController,
  });

  final TextEditingController alamatEditingController;

  @override
  Widget build(BuildContext context) {
    String capitalize(String value) {
      if (value.trim().isEmpty) return "";
      return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
    }

    return TextFormField(
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: alamatEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          alamatEditingController.text = value!;
        },
        onChanged: (value) {
          alamatEditingController.value = TextEditingValue(
              text: value.toUpperCase(),
              selection: alamatEditingController.selection);
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class noKTP extends StatelessWidget {
  const noKTP({
    super.key,
    required this.noKTPEditingController,
  });

  final TextEditingController noKTPEditingController;

  @override
  Widget build(BuildContext context) {
    String capitalize(String value) {
      if (value.trim().isEmpty) return "";
      return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
    }

    return TextFormField(
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: noKTPEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          noKTPEditingController.text = value!;
        },
        onChanged: (value) {
          noKTPEditingController.value = TextEditingValue(
              text: value.toUpperCase(),
              selection: noKTPEditingController.selection);
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class noSIM extends StatelessWidget {
  const noSIM({
    super.key,
    required this.noSIMEditingController,
  });

  final TextEditingController noSIMEditingController;

  @override
  Widget build(BuildContext context) {
    String capitalize(String value) {
      if (value.trim().isEmpty) return "";
      return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
    }

    return TextFormField(
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: Colors.white),
        autofocus: false,
        controller: noSIMEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          noSIMEditingController.text = value!;
        },
        onChanged: (value) {
          noSIMEditingController.value = TextEditingValue(
              text: value.toUpperCase(),
              selection: noSIMEditingController.selection);
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
