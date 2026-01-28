import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:rank_hub/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('账号登录'),
        automaticallyImplyLeading: false,
        toolbarHeight: 72, // 增加 Toolbar 高度
        titleSpacing: 24, // 增加标题左侧间距
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Get.back(),
          ),
          const SizedBox(width: 12), // 增加右侧间距
        ],
      ),
      body: Obx(() {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: controller.currentStep.value == 0
              ? _PhoneInputView(controller: controller)
              : _OtpInputView(controller: controller),
        );
      }),
    );
  }
}

class _PhoneInputView extends StatelessWidget {
  final LoginController controller;

  const _PhoneInputView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Text(
              '欢迎回来',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '请输入手机号进行登录或注册',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              autofocus: true,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: '手机号',
                hintText: '请输入11位手机号',
                prefixIcon: Icon(Icons.phone_android),
                border: OutlineInputBorder(),
              ),
              onChanged: controller.validatePhone,
            ),
            const SizedBox(height: 24),
            Obx(
              () => FilledButton(
                onPressed:
                    controller.isPhoneValid.value && !controller.isLoading.value
                    ? controller.sendSms
                    : null,
                child: controller.isLoading.value
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('获取验证码'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OtpInputView extends StatelessWidget {
  final LoginController controller;

  const _OtpInputView({required this.controller});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: Theme.of(context).textTheme.titleLarge,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Theme.of(context).colorScheme.primary,
        width: 2,
      ),
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Text(
              '输入验证码',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '验证码已发送至 ',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                Obx(
                  () => Text(
                    controller.phoneNumber.value,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              autofocus: true,
              onChanged: (value) => controller.otpCode.value = value,
              onCompleted: (_) => controller.login(),
            ),
            const SizedBox(height: 24),
            Obx(
              () => FilledButton(
                onPressed:
                    controller.otpCode.value.length == 6 &&
                        !controller.isLoading.value
                    ? controller.login
                    : null,
                child: controller.isLoading.value
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('登录'),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Obx(
                () => TextButton(
                  onPressed: controller.canResend.value
                      ? controller.sendSms
                      : null,
                  child: Text(
                    controller.canResend.value
                        ? '重新发送验证码'
                        : '${controller.countdown.value}秒后可重新发送',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
