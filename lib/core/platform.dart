import 'package:flutter/material.dart';
import 'package:rank_hub/core/account.dart';
import 'package:rank_hub/core/platform_id.dart';

abstract class Platform {
  PlatformId get id;
  String get name;
  ImageProvider get icon;

  Widget buildLoginPage();
  Future<Account> login();
  Future<Account> refresh(Account account);
  Future<bool> validate(Account account);
}
