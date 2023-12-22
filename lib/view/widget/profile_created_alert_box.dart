import 'package:flutter/material.dart';

class ProfileCreatedAlertBox extends StatelessWidget {
  const ProfileCreatedAlertBox({super.key, required this.onTab});

  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: 260,
      height: 240,
      padding: const EdgeInsets.all(13),
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/user.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Create Profile",
            style: TextStyle(
              color: Color(0xFF1D2939),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(
            width: 219,
            child: Text(
              "Update your name, profile images and additional number",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF475467),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4378FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  onPressed: onTab,
                  child: const Text(
                    "update",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                hoverColor: const Color(0xFFD0D5DD),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Skip",
                      style: TextStyle(
                        color: Color(0xFF4378FF),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
