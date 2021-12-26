import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'widgets.dart';

import 'courses_data.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Course> courses = Course.courses;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[800],
        centerTitle: true,
        title: const AppBarTitle(),
        actions: [
          MenuTextButton(text: 'Courses'),
          MenuTextButton(text: 'About'),
          IconButton(
            icon: const Icon(Icons.mark_email_unread_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          const Center(child: PageHeader()),
          const SizedBox(
            height: 30,
          ),
          ResponsiveRowColumn(
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowPadding: const EdgeInsets.all(30),
            columnPadding: const EdgeInsets.all(30),
            layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: CourseTile(course: courses[0]),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: CourseTile(course: courses[1]),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(child: SubscribeBlock()),
        ],
      ),
    );
  }
}
