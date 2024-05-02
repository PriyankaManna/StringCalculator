# String Calculator TDD Kata

## Overview

This repository contains a solution to the String Calculator TDD Kata, which is an assessment conducted by Incubyte for evaluating candidates during their recruiting process. The objective of this assessment is to create a simple string calculator with specific requirements outlined below.

## Requirements

- Create a string calculator with a method signature: `int add(string numbers)`
- Input: a string of comma-separated numbers
- Output: an integer, sum of the numbers

## Examples

- Input: "", "1", "1,5"
- Output: 0, 1, 6

## Instructions

1. Start with the simplest test case of an empty string and move to one and two numbers.
2. Solve things as simply as possible, forcing yourself to write tests you did not think about.
3. Refactor after each passing test.
4. Allow the add method to handle any amount of numbers.
5. Allow the add method to handle new lines between numbers (instead of commas).
6. Support different delimiters.
7. Calling add with a negative number will throw an exception "negative numbers not allowed <negative_number>".
8. If there are multiple negative numbers, show all of them in the exception message, separated by commas.
