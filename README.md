# CodeCity


## Roles

* Student
  * register
  * signs in / out
  * sign up / take for courses
  * turn in homework
  * view student profiles (limited access)


* Instructor
  * signs in / out
  * Check student work
  * view student profiles (full access)


* Developer
  * register
  * signs in / out
  * create courses, lessons, exercises

* System Admin


## Nouns/Actors

Student
Instructor
Developer
Course
Lesson
Exercise
Grade



## Course

Created by a developer
Instructor assigned by admin
Joined by a student

title
description
image
lessons

## Lesson
title
belongs to a course
created by developer
has_many exercizes


## Exercise
belongs to lesson

title
instructions
point_value
test file




courses
id title
1 intro to react

lessons
id course_id title
1  1         Week 1

exercises
id lesson_id title                  point_value
1  1         count the chickens.    20
2  1         sort the things.       10

student_courses
course_id student_id
1         22

student_exercises
exercise_id student_id. point_value
1           22.         10








