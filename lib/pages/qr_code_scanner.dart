import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:rank_hub/services/qr_code_scanner_service.dart';

/// 二维码扫描页面
class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({super.key});

  @override
  State<QRCodeScannerPage> createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage>
    with SingleTickerProviderStateMixin {
  final MobileScannerController cameraController = MobileScannerController();
  bool isProcessing = false;
  bool isCameraInitialized = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _cornerAnimation;

  @override
  void initState() {
    super.initState();

    // 初始化动画控制器
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCirc,
    );

    _opacityAnimation = Tween<double>(begin: 1, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _cornerAnimation = Tween<double>(begin: 120.0, end: 32.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    // 监听相机初始化
    cameraController.start().then((_) {
      if (mounted) {
        setState(() {
          isCameraInitialized = true;
        });
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    cameraController.dispose();
    super.dispose();
  }

  Future<void> _handleBarcode(BarcodeCapture capture) async {
    if (isProcessing) return;

    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    final String? code = barcodes.first.rawValue;
    if (code == null || code.isEmpty) return;

    setState(() {
      isProcessing = true;
    });

    try {
      final success = await QRCodeScannerService().handleQRCode(context, code);

      if (success) {
        // 处理成功，返回上一页
        if (mounted) {
          Get.back();
        }
      } else {
        // 未找到匹配的处理器
        if (mounted) {
          Get.snackbar(
            '提示',
            '无法识别此二维码',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange,
            colorText: Colors.white,
          );
        }

        // 延迟后允许再次扫描
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) {
          setState(() {
            isProcessing = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        Get.snackbar(
          '错误',
          '处理二维码失败: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );

        // 延迟后允许再次扫描
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) {
          setState(() {
            isProcessing = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('扫描二维码'),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on),
            onPressed: () => cameraController.toggleTorch(),
            tooltip: '手电筒',
          ),
          IconButton(
            icon: const Icon(Icons.flip_camera_ios),
            onPressed: () => cameraController.switchCamera(),
            tooltip: '切换相机',
          ),
        ],
      ),
      body: _buildBody(colorScheme),
    );
  }

  Widget _buildBody(ColorScheme colorScheme) {
    // 权限已授予，显示扫描界面
    return Stack(
      children: [
        // 相机预览
        MobileScanner(controller: cameraController, onDetect: _handleBarcode),

        // 扫描框外的模糊遮罩
        if (isCameraInitialized)
          AnimatedBuilder(
            animation: _opacityAnimation,
            builder: (context, child) {
              return Opacity(opacity: _opacityAnimation.value, child: child);
            },
            child: ClipPath(
              clipper: _ScannerOverlayClipper(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(color: Colors.black.withOpacity(0.5)),
              ),
            ),
          ),

        // 扫描框 - 带动画
        Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              if (!isCameraInitialized) {
                return const SizedBox.shrink();
              }
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Opacity(opacity: _opacityAnimation.value, child: child),
              );
            },
            child: SizedBox(
              width: 250,
              height: 250,
              child: Stack(
                children: [
                  // 四个角的L形装饰
                  AnimatedBuilder(
                    animation: _cornerAnimation,
                    builder: (context, child) {
                      return Stack(
                        children: [
                          _buildCornerDecoration(
                            Alignment.topLeft,
                            colorScheme.primary,
                            _cornerAnimation.value,
                          ),
                          _buildCornerDecoration(
                            Alignment.topRight,
                            colorScheme.primary,
                            _cornerAnimation.value,
                          ),
                          _buildCornerDecoration(
                            Alignment.bottomLeft,
                            colorScheme.primary,
                            _cornerAnimation.value,
                          ),
                          _buildCornerDecoration(
                            Alignment.bottomRight,
                            colorScheme.primary,
                            _cornerAnimation.value,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),

        // 提示文字
        if (isCameraInitialized)
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _opacityAnimation,
              builder: (context, child) {
                return Opacity(opacity: _opacityAnimation.value, child: child);
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isProcessing ? '处理中...' : '将二维码放入框内',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCornerDecoration(
    Alignment alignment,
    Color color,
    double length,
  ) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        width: length,
        height: length,
        child: CustomPaint(
          painter: _CornerPainter(
            color: color,
            strokeWidth: 4,
            alignment: alignment,
          ),
        ),
      ),
    );
  }
}

/// L形角绘制器
class _CornerPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final Alignment alignment;

  _CornerPainter({
    required this.color,
    required this.strokeWidth,
    required this.alignment,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();

    // 根据对齐方式绘制L形
    if (alignment == Alignment.topLeft) {
      // 左上角：横线从左到右，竖线从上到下
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.moveTo(0, 0);
      path.lineTo(0, size.height);
    } else if (alignment == Alignment.topRight) {
      // 右上角：横线从右到左，竖线从上到下
      path.moveTo(size.width, 0);
      path.lineTo(0, 0);
      path.moveTo(size.width, 0);
      path.lineTo(size.width, size.height);
    } else if (alignment == Alignment.bottomLeft) {
      // 左下角：横线从左到右，竖线从下到上
      path.moveTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.moveTo(0, size.height);
      path.lineTo(0, 0);
    } else if (alignment == Alignment.bottomRight) {
      // 右下角：横线从右到左，竖线从下到上
      path.moveTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.moveTo(size.width, size.height);
      path.lineTo(size.width, 0);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CornerPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.alignment != alignment;
  }
}

/// 扫描框外的遮罩裁剪器
class _ScannerOverlayClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // 裁剪出中间的扫描框区域
    final scannerRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 250,
      height: 250,
    );

    final scannerPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(scannerRect, const Radius.circular(12)),
      );

    return Path.combine(PathOperation.difference, path, scannerPath);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
