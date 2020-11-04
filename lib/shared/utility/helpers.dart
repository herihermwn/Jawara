part of '../shared.dart';

dynamic condition({bool value, dynamic onTrue, dynamic onFalse}) {
  return (value) ? onTrue : onFalse;
}