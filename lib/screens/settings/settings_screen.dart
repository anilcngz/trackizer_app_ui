import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer_app/config/colors.dart';
import 'package:trackizer_app/widgets/custom_button.dart';
import 'package:trackizer_app/widgets/info_container.dart';
import 'package:trackizer_app/widgets/info_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset('assets/icons/Back.svg'),
        ),
        title: Text(
          'Settings',
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(color: kGrey30),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
                radius: 36.0,
              ),
              const SizedBox(height: 8.0),
              Text(
                'John Doe',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                    ),
              ),
              Text(
                'j.doe@gmail.com',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: kGrey30,
                    ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: 87,
                height: 32.0,
                child: CustomButton(
                  onTap: () {},
                  mainColor: Colors.white.withOpacity(0.10),
                  child: Text(
                    'Edit Profile',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'General',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8.0),
                  const InfoContainer(
                    children: [
                      InfoItem(
                        leadingIcon: 'assets/icons/FaceID.svg',
                        title: 'Security',
                        value: 'FaceID',
                      ),
                      InfoItem(
                        leadingIcon: 'assets/icons/iCloud.svg',
                        title: 'iCloud Sync',
                        isCheckBox: true,
                        isLastItem: true,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My subscriptions',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8.0),
                  const InfoContainer(
                    children: [
                      InfoItem(
                        leadingIcon: 'assets/icons/Sorting.svg',
                        title: 'Sorting',
                        value: 'Date',
                      ),
                      InfoItem(
                        leadingIcon: 'assets/icons/Chart.svg',
                        title: 'Summary',
                        value: 'Average',
                      ),
                      InfoItem(
                        leadingIcon: 'assets/icons/Money.svg',
                        title: 'Default currency',
                        value: 'USD (\$)',
                        isLastItem: true,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Appearance',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8.0),
                  const InfoContainer(
                    children: [
                      InfoItem(
                        leadingIcon: 'assets/icons/App_icon.svg',
                        title: 'App icon',
                        value: 'Default',
                      ),
                      InfoItem(
                        leadingIcon: 'assets/icons/Light_theme.svg',
                        title: 'Theme',
                        value: 'Dark',
                        isLastItem: true,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
