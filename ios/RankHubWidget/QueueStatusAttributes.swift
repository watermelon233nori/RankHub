import ActivityKit
import Foundation

/// 排队状态 Activity 属性
struct QueueStatusAttributes: ActivityAttributes {
    /// 静态属性（Activity 创建后不变）
    public struct ContentState: Codable, Hashable {
        /// 房间名称
        var partyName: String
        /// 玩家名称
        var playerName: String
        /// 排队位置（从1开始）
        var position: Int
        /// 总人数
        var totalPeople: Int
        /// 预计等待时间（分钟）
        var estimatedWait: Int
        /// 是否在上机位置
        var isPlaying: Bool
    }
}
