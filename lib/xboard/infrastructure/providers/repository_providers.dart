import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_clash/xboard/domain/domain.dart';
import 'package:fl_clash/xboard/infrastructure/infrastructure.dart';

/// Repository Provider 文件
/// 
/// 提供所有 Repository 的依赖注入
/// 
/// ## 架构说明
/// 
/// 本项目采用统一的 SDK 层抽象，所有仓储都通过 XBoardSDK 调用。
/// SDK 内部会根据配置中的 panelType 自动选择对应的实现（XBoard 或 V2Board）。
/// 
/// ### 切换面板类型的方法
/// 
/// 只需在配置文件（remote.config.json）中修改 panelType 即可：
/// ```json
/// {
///   "panelType": "xboard",   // 使用 XBoard 面板
///   // 或
///   "panelType": "v2board",  // 使用 V2Board 面板
///   ...
/// }
/// ```
/// 
/// SDK 初始化时会自动读取配置，创建对应的 API 实现。
/// 仓储层无需修改，保持对面板实现的透明。
/// 
/// ### 技术细节
/// 
/// - SDK 层使用工厂模式 (ApiFactory) 根据 PanelType 创建对应的 API 实例
/// - 所有 XBoard/V2Board API 都实现了统一的契约接口 (contracts)
/// - 仓储层通过契约接口调用，与具体实现解耦
/// - 支持的面板类型：xboard, v2board

// ========== 用户相关 ==========

/// 用户仓储 Provider
/// 
/// 注意：此仓储通过 XBoardSDK 调用，SDK 会根据 panelType 自动选择实现
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return XBoardUserRepository();
});

/// 认证仓储 Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return XBoardAuthRepository();
});

// ========== 套餐和订阅 ==========

/// 套餐仓储 Provider
final planRepositoryProvider = Provider<PlanRepository>((ref) {
  return XBoardPlanRepository();
});

/// 订阅仓储 Provider
final subscriptionRepositoryProvider = Provider<SubscriptionRepository>((ref) {
  return XBoardSubscriptionRepository();
});

// ========== 订单和支付 ==========

/// 订单仓储 Provider
final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return XBoardOrderRepository();
});

/// 支付仓储 Provider
final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  return XBoardPaymentRepository();
});

// ========== 邀请和佣金 ==========

/// 邀请仓储 Provider
final inviteRepositoryProvider = Provider<InviteRepository>((ref) {
  return XBoardInviteRepository();
});

// ========== 系统功能 ==========

/// 公告仓储 Provider
final noticeRepositoryProvider = Provider<NoticeRepository>((ref) {
  return XBoardNoticeRepository();
});

/// 工单仓储 Provider
final ticketRepositoryProvider = Provider<TicketRepository>((ref) {
  return XBoardTicketRepository();
});
