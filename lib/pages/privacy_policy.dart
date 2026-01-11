import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('隐私政策')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          _buildSection(
            context,
            '一、引言',
            '欢迎使用 RankHub。本隐私政策旨在告知您在使用本应用时，我们如何收集、使用、储存、保护和披露您的个人信息（包括个人识别信息及其他相关数据），以及您在相关数据处理方面的权利与选择。请您在使用本应用前认真阅读、理解本政策内容。如果您不同意本政策任何内容，请您停止使用本应用。',
          ),
          _buildSection(context, '二、我们收集的信息类型', '在您使用本应用过程中，我们可能会收集如下类型的信息：', [
            _buildSubSection('1. 账户信息', [
              '当您使用第三方平台（如音游平台账号）绑定或登录时，我们可能获取您在该平台上的用户名、显示名称、头像链接、外部ID (externalId)、平台标识（如 "LXNS" 等）及相关账号元数据。',
              '如果您自行在本应用中创建或管理"内部账号"，可能需要提供电子邮件、密码、昵称等信息。',
            ]),
            _buildSubSection('2. 凭据／认证信息', [
              '当您绑定第三方音游平台账号时，可能需要提供 API Key、Access Token、Refresh Token、用户名与密码或 OAuth2 授权流程所需的凭证。',
              '这些凭据用于后续的帐号访问、数据同步等目的。',
            ]),
            _buildSubSection('3. 同步与使用数据', [
              '本应用支持"成绩同步"、"曲目数据同步"、"收藏品数据同步"等功能。我们可能获取您绑定账户在音游平台上的成绩信息、玩家数据、曲目列表、排名数据、游戏版本、游戏类型、平台标识等。',
              '本应用也可能收集本地使用情况数据，如您选择的游戏、绑定的账号、使用功能模块（如 Wiki、Rank、个人页面）等。',
            ]),
            _buildSubSection('4. 设备与日志信息', [
              '我们可能自动收集您设备的基础规格（如设备类型、操作系统版本、Flutter SDK 版本等），应用版本号、网络连接状态、崩溃日志、运行时错误、性能数据，以便我们优化应用。',
              '如果您允许，我们也可能收集设备标识符（如匿名设备 ID）或广告标识（若用于统计或分析，但截至目前本应用暂不用于广告投放）。',
            ]),
            _buildSubSection('5. 本地存储数据', [
              '本应用使用本地数据库（如 Isar）储存用户数据（如帐号、成绩、收藏、游戏数据等）。这些数据在用户设备上本地存储，不必然上传至我们的服务器。',
              '若您选择使用同步功能，部分本地数据可能与服务器或第三方平台交互。',
            ]),
          ]),
          _buildSection(context, '三、我们如何使用这些信息', '我们将上述信息用于以下目的：', [
            _buildBulletPoint('帮助您绑定多个平台账号、统一管理、切换账号。'),
            _buildBulletPoint('同步您绑定账号在各平台上的成绩、排名、曲目等音游数据，并在应用内展示。'),
            _buildBulletPoint('提供游戏Wiki、排行榜、个人页面、收藏品展示等功能。'),
            _buildBulletPoint('提升应用性能、安全性与稳定性：通过设备日志、崩溃日志、网络状态等数据定位问题、改善体验。'),
            _buildBulletPoint('若您同意，向您发送应用更新通知、功能推送、运营活动通知。'),
            _buildBulletPoint('遵守法律法规、应对安全事件、维护本应用／服务的安全运行。'),
          ]),
          _buildSection(context, '四、信息储存与保留', '', [
            _buildBulletPoint(
              '我们将按照实现功能所必需的期限保存您的相关信息。一旦您解绑账户或删除帐号，相关同步数据将按我们设计的删除策略清除。',
            ),
            _buildBulletPoint(
              '本应用中大部分数据为本地存储在您设备上的数据库，除非您明确启用云同步和上传功能，否则我们不会自动将本地数据上传至我们的服务器。',
            ),
            _buildBulletPoint(
              '若同步或上传至服务器，数据将被存储在我们或服务提供商的服务器上，并且会采取合理的技术安全措施防止未经授权访问。',
            ),
          ]),
          _buildSection(
            context,
            '五、信息共享与披露',
            '我们承诺不会将您的个人识别信息出售或出租给第三方。我们可能在以下情况下分享或披露您的信息：',
            [
              _buildBulletPoint('经您明确授权或同意。'),
              _buildBulletPoint(
                '为了实现与第三方平台账号绑定、数据同步功能，您的账号数据、API Key、访问凭证、成绩数据可能会发送至或由第三方平台服务方处理。',
              ),
              _buildBulletPoint(
                '为了遵守适用法律法规、司法或行政机关要求、保护我们的合法权益、安全运营或防止欺诈、滥用行为。',
              ),
              _buildBulletPoint(
                '若本应用或服务整体或部分发生合并、收购、资产转让，在相应信息资产移交过程中，您的数据可能作为业务资产的一部分被转移，但该等转移同样受本隐私政策及适用法律保护。',
              ),
            ],
          ),
          _buildSection(context, '六、您的权利与选择', '您享有以下权利：', [
            _buildBulletPoint('访问：您可向我们请求访问我们持有关于您的个人信息。'),
            _buildBulletPoint('更正：若您发现信息有误，可请求我们更正。'),
            _buildBulletPoint('删除：在不违反法律或其他合同义务的前提下，您可请求删除您的个人信息或解绑账号。'),
            _buildBulletPoint('限制／拒绝处理：在特定情况下，您可要求限制或拒绝我们对您的个人信息处理。'),
            _buildBulletPoint('注销账户：您可在应用内操作注销账户或删除绑定，相关数据将按我们的删除策略处理。'),
            _buildBulletPoint('撤回同意：若您之前同意我们发送推送或运营通知，可随时撤回。'),
            const SizedBox(height: 8),
            _buildBodyText(
              '请您通过应用内"设置"‑>"账户"／"隐私"页面，或通过我们提供的联系方式（见下文）提交上述请求。我们在法律允许的范围内，在合理期限内响应您的请求。',
            ),
          ]),
          _buildSection(
            context,
            '七、安全措施',
            '我们已采取合理的技术和组织措施，保护您的个人信息免遭未经授权访问、披露、篡改或毁损。包括但不限于加密传输（HTTPS）、访问控制、凭证安全储存、日志监控、最小权限原则。\n\n但请您注意：任何互联网传输或电子存储方式并非绝对安全。我们无法保证信息在传输过程中 100% 安全，因此您亦有责任妥善保管您的账号凭据。',
          ),
          _buildSection(
            context,
            '八、儿童隐私',
            '本应用不针对 13 岁以下（或依您所在地适用法律定义的儿童年龄）儿童设计，也不会故意收集该年龄段儿童的个人识别信息。如果我们发现无意间收集了该年龄段儿童的信息，我们将采取措施尽快删除。',
          ),
          _buildSection(
            context,
            '九、国际传输',
            '如果您的设备／账号所在地在中国大陆、台湾地区或其他国家／地区，您的数据可能被传输或储存在我们或服务提供商位于其他地区的服务器上。我们将按照适用数据保护法律采取适当保障措施。',
          ),
          _buildSection(
            context,
            '十、Cookie 与类似技术',
            '在移动应用环境下，我们可能使用类似 Cookie 的追踪技术（如 SDK、设备标识符、日志分析）用于性能分析、崩溃检测。您可以在设备系统设置中管理或禁止相关追踪，但可能影响部分功能效果。',
          ),
          _buildSection(
            context,
            '十一、隐私政策的变更',
            '我们可能会根据法律法规变化或服务调整更新本隐私政策。每次更新后，我们会在应用内及／或官网展示"最后更新"日期，并在重大变更时通过推送或其他显著方式通知您。继续使用本应用即表示您接受更新后的政策。',
          ),
          _buildSection(
            context,
            '十二、联系我们',
            '如您对本隐私政策或我们处理您个人信息的方式有任何疑问、意见或请求，请通过以下方式联系我们：',
            [
              _buildContactInfo(
                context,
                'GitHub Issue',
                '请在 RankHub 项目仓库提交 Issue 或联系 @qianmo2233',
              ),
            ],
          ),
          const Divider(height: 32),
          _buildFooter(context),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final now = DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '隐私政策',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          '生效日期：${now.year}年${now.month}月${now.day}日',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          '最后更新：${now.year}年${now.month}月${now.day}日',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    String content, [
    List<Widget>? children,
  ]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        if (content.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(content, style: Theme.of(context).textTheme.bodyMedium),
        ],
        if (children != null) ...children,
      ],
    );
  }

  Widget _buildSubSection(String title, List<String> points) {
    return Builder(
      builder: (context) => Padding(
        padding: const EdgeInsets.only(top: 12, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            ...points.map(
              (point) => Padding(
                padding: const EdgeInsets.only(left: 8, top: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• ', style: Theme.of(context).textTheme.bodyMedium),
                    Expanded(
                      child: Text(
                        point,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Builder(
      builder: (context) => Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• ', style: Theme.of(context).textTheme.bodyMedium),
            Expanded(
              child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyText(String text) {
    return Builder(
      builder: (context) => Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(
              text: '$label：',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            '感谢您使用 RankHub。我们致力于尊重并保护您的隐私，努力为您提供安全、优质的服务。',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 8),
          Text(
            '—— Fukakai Project Team',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
