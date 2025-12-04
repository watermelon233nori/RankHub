//
//  RankHubWidgetLiveActivity.swift
//  RankHubWidget
//
//  Created by 千沫qianmo on 2025/12/3.
//

import ActivityKit
import SwiftUI
import WidgetKit

struct LiveActivitiesAppAttributes: ActivityAttributes, Identifiable {
    public typealias LiveDeliveryData = ContentState
    
    public struct ContentState: Codable, Hashable {
        // 这个结构体可以为空，实际数据通过 UserDefaults 传递
    }
    
    var id = UUID()
}

// Swift 扩展用于处理带前缀的 key
extension LiveActivitiesAppAttributes {
    func prefixedKey(_ key: String) -> String {
        return "\(id)_\(key)"
    }
}

// 创建共享的 UserDefaults 以访问 Flutter 数据
let sharedDefault = UserDefaults(suiteName: "group.space.fukakai.rankhub")!

struct RankHubWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveActivitiesAppAttributes.self) { context in
            // 从 UserDefaults 读取 Flutter 传递的数据
            let partyName = sharedDefault.string(forKey: context.attributes.prefixedKey("partyName")) ?? ""
            let playerName = sharedDefault.string(forKey: context.attributes.prefixedKey("playerName")) ?? ""
            let position = sharedDefault.integer(forKey: context.attributes.prefixedKey("position"))
            let totalPeople = sharedDefault.integer(forKey: context.attributes.prefixedKey("totalPeople"))
            let estimatedWait = sharedDefault.integer(forKey: context.attributes.prefixedKey("estimatedWait"))
            let isPlaying = sharedDefault.bool(forKey: context.attributes.prefixedKey("isPlaying"))
            
            // Lock screen/banner UI
            LockScreenView(
                partyName: partyName,
                playerName: playerName,
                position: position,
                totalPeople: totalPeople,
                estimatedWait: estimatedWait,
                isPlaying: isPlaying
            )
        } dynamicIsland: { context in
            // 从 UserDefaults 读取数据
            let partyName = sharedDefault.string(forKey: context.attributes.prefixedKey("partyName")) ?? ""
            let playerName = sharedDefault.string(forKey: context.attributes.prefixedKey("playerName")) ?? ""
            let position = sharedDefault.integer(forKey: context.attributes.prefixedKey("position"))
            let totalPeople = sharedDefault.integer(forKey: context.attributes.prefixedKey("totalPeople"))
            let estimatedWait = sharedDefault.integer(forKey: context.attributes.prefixedKey("estimatedWait"))
            let isPlaying = sharedDefault.bool(forKey: context.attributes.prefixedKey("isPlaying"))
            
            return DynamicIsland {
                DynamicIslandExpandedRegion(.bottom) {
                    VStack(alignment: .center) {
                        HStack(alignment: .center, spacing: 12) {
                            VStack(alignment: .leading, spacing: 8) {
                                VStack(alignment: .leading, spacing: 2) {
                                    HStack(spacing: 3) {
                                        Image(systemName: "music.note.house.fill")
                                            .font(.system(size: 11))
                                            .foregroundColor(.blue)
                                        Text("房间")
                                            .font(.system(size: 9))
                                            .foregroundColor(.secondary)
                                    }
                                    Text(partyName)
                                        .font(.system(size: 14, weight: .semibold))
                                        .lineLimit(1)
                                }
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    HStack(spacing: 3) {
                                        Image(systemName: "person.fill")
                                            .font(.system(size: 11))
                                            .foregroundColor(.blue)
                                        Text("玩家")
                                            .font(.system(size: 9))
                                            .foregroundColor(.secondary)
                                    }
                                    Text(playerName)
                                        .font(.system(size: 14, weight: .semibold))
                                        .lineLimit(1)
                                }
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                HStack(alignment: .firstTextBaseline, spacing: 2) {
                                    Text("第")
                                        .font(.system(size: 12))
                                        .foregroundColor(.secondary)
                                    Text("\(position)")
                                        .font(.system(size: 48, weight: .bold))
                                        .foregroundColor(isPlaying ? .green : (position == 3 || position == 4) ? .red : .blue)
                                    Text("/\(totalPeople)")
                                        .font(.system(size: 12))
                                        .foregroundColor(.secondary)
                                }
                                
                                if isPlaying {
                                    HStack(spacing: 2) {
                                        Image(systemName: "gamecontroller.fill")
                                            .font(.system(size: 10))
                                            .foregroundColor(.green)
                                        Text("上机中")
                                            .font(.system(size: 11, weight: .semibold))
                                            .foregroundColor(.green)
                                    }
                                } else if estimatedWait > 0 {
                                    HStack(spacing: 2) {
                                        Image(systemName: "clock.fill")
                                            .font(.system(size: 10))
                                            .foregroundColor(.orange)
                                        Text("约 \(estimatedWait) 分钟")
                                            .font(.system(size: 11))
                                            .foregroundColor(.orange)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    CompactQueueVisualization(position: position, totalPeople: totalPeople, isPlaying: isPlaying)
                }
            }
            compactLeading: {
                let isPlaying = sharedDefault.bool(forKey: context.attributes.prefixedKey("isPlaying"))
                let position = sharedDefault.integer(forKey: context.attributes.prefixedKey("position"))
                let totalPeople = sharedDefault.integer(forKey: context.attributes.prefixedKey("totalPeople"))
                
                if isPlaying {
                    HStack(spacing: 2) {
                        Image(systemName: "gamecontroller.fill")
                            .font(.system(size: 12))
                            .foregroundColor(.green)
                        Text("上机中")
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(.green)
                    }
                } else {
                    HStack(spacing: 2) {
                        Text("第")
                            .font(.system(size: 10))
                            .foregroundColor(.secondary)
                        Text("\(position)")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor((position == 3 || position == 4) ? .red : .blue)
                        Text("/\(totalPeople)")
                            .font(.system(size: 10))
                            .foregroundColor(.secondary)
                    }
                }
            } compactTrailing: {
                let isPlaying = sharedDefault.bool(forKey: context.attributes.prefixedKey("isPlaying"))
                let estimatedWait = sharedDefault.integer(forKey: context.attributes.prefixedKey("estimatedWait"))
                
                if !isPlaying && estimatedWait > 0 {
                    HStack(spacing: 2) {
                        Image(systemName: "clock.fill")
                            .font(.system(size: 10))
                            .foregroundColor(.orange)
                        Text("\(estimatedWait)分")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(.orange)
                    }
                } else if isPlaying {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 14))
                        .foregroundColor(.green)
                }
            } minimal: {
                let isPlaying = sharedDefault.bool(forKey: context.attributes.prefixedKey("isPlaying"))
                Image(systemName: isPlaying ? "gamecontroller.fill" : "person.2.fill")
                    .font(.system(size: 12))
                    .foregroundColor(isPlaying ? .green : .blue)
            }
            .keylineTint(sharedDefault.bool(forKey: context.attributes.prefixedKey("isPlaying")) ? .green : .blue)
        }
    }
}

struct LockScreenView: View {
    let partyName: String
    let playerName: String
    let position: Int
    let totalPeople: Int
    let estimatedWait: Int
    let isPlaying: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            // 顶部信息行：房间和玩家
            HStack(alignment: .center, spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 3) {
                            Image(systemName: "music.note.house.fill")
                                .font(.system(size: 11))
                                .foregroundColor(.blue)
                            Text("房间")
                                .font(.system(size: 9))
                                .foregroundColor(.secondary)
                        }
                        Text(partyName)
                            .font(.system(size: 14, weight: .semibold))
                            .lineLimit(1)
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 3) {
                            Image(systemName: "person.fill")
                                .font(.system(size: 11))
                                .foregroundColor(.blue)
                            Text("玩家")
                                .font(.system(size: 9))
                                .foregroundColor(.secondary)
                        }
                        Text(playerName)
                            .font(.system(size: 14, weight: .semibold))
                            .lineLimit(1)
                    }
                }
                
                Spacer()
                
                // 右侧：位次信息
                VStack(alignment: .trailing) {
                    HStack(alignment: .firstTextBaseline, spacing: 2) {
                        Text("第")
                            .font(.system(size: 12))
                            .foregroundColor(.secondary)
                        Text("\(position)")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(isPlaying ? .green : (position == 3 || position == 4) ? .red : .blue)
                        Text("/\(totalPeople)")
                            .font(.system(size: 12))
                            .foregroundColor(.secondary)
                    }
                    
                    if isPlaying {
                        HStack(spacing: 2) {
                            Image(systemName: "gamecontroller.fill")
                                .font(.system(size: 10))
                                .foregroundColor(.green)
                            Text("上机中")
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundColor(.green)
                        }
                    } else if estimatedWait > 0 {
                        HStack(spacing: 2) {
                            Image(systemName: "clock.fill")
                                .font(.system(size: 10))
                                .foregroundColor(.orange)
                            Text("约 \(estimatedWait) 分钟")
                                .font(.system(size: 11))
                                .foregroundColor(.orange)
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            
            // 底部队列可视化
            CompactQueueVisualization(position: position, totalPeople: totalPeople, isPlaying: isPlaying)
                .redacted(reason: .placeholder)
                .padding(.horizontal, 16)
        }
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .activityBackgroundTint(Color.black.opacity(0.1))
        .activitySystemActionForegroundColor(Color.white)
    }
}

struct CompactQueueVisualization: View {
    let position: Int
    let totalPeople: Int
    let isPlaying: Bool
    
    private let dotWidth: CGFloat = 16
    private let maxWidth: CGFloat = 200
    
    private var visibleRange: ClosedRange<Int> {
        let maxVisibleDots = Int(maxWidth / dotWidth)
        let halfVisible = maxVisibleDots / 2
        
        let startIndex: Int
        let endIndex: Int
        
        if totalPeople <= maxVisibleDots {
            startIndex = 1
            endIndex = totalPeople
        } else if position <= halfVisible {
            startIndex = 1
            endIndex = min(totalPeople, maxVisibleDots)
        } else if position > totalPeople - halfVisible {
            startIndex = max(1, totalPeople - maxVisibleDots + 1)
            endIndex = totalPeople
        } else {
            startIndex = max(1, position - halfVisible)
            endIndex = min(totalPeople, position + halfVisible)
        }
        
        return startIndex ... endIndex
    }
    
    private var shouldFade: Bool {
        let maxVisibleDots = Int(maxWidth / dotWidth)
        return totalPeople > maxVisibleDots
    }
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 8) {
                ForEach(visibleRange, id: \.self) { index in
                    Circle()
                        .fill(getDotColor(for: index))
                        .frame(width: getDotSize(for: index), height: getDotSize(for: index))
                        .overlay(
                            Circle()
                                .stroke(index == position ? Color.gray.opacity(0.3) : Color.clear, lineWidth: 3)
                        )
                        .opacity(shouldFade ? getOpacity(for: index, start: visibleRange.lowerBound, end: visibleRange.upperBound) : 1.0)
                }
            }
            .frame(height: 32)
        }
    }
    
    private func getDotColor(for index: Int) -> Color {
        if index <= 2 {
            return .green
        } else if index == position {
            return .blue
        } else {
            return Color.gray.opacity(0.5)
        }
    }
    
    private func getDotSize(for index: Int) -> CGFloat {
        if index == position {
            return 16
        } else if index <= 2 {
            return 14
        } else {
            return 12
        }
    }
    
    private func getOpacity(for index: Int, start: Int, end: Int) -> Double {
        let fadeCount = 2
        
        // 左侧淡化（仅当未到达队列开头时）
        if start > 1 && index - start < fadeCount {
            let offset = index - start
            return 0.3 + Double(offset) * 0.35
        }
        // 右侧淡化（仅当未到达队列结尾时）
        else if end < totalPeople && end - index < fadeCount {
            let offset = end - index
            return 0.3 + Double(offset) * 0.35
        }
        
        return 1.0
    }
}

// MARK: - Previews

private func setupPreviewData(attributes: LiveActivitiesAppAttributes, partyName: String, playerName: String, position: Int, totalPeople: Int, estimatedWait: Int, isPlaying: Bool) {
    let preview = UserDefaults(suiteName: "group.space.fukakai.rankhub")!
    preview.set(partyName, forKey: attributes.prefixedKey("partyName"))
    preview.set(playerName, forKey: attributes.prefixedKey("playerName"))
    preview.set(position, forKey: attributes.prefixedKey("position"))
    preview.set(totalPeople, forKey: attributes.prefixedKey("totalPeople"))
    preview.set(estimatedWait, forKey: attributes.prefixedKey("estimatedWait"))
    preview.set(isPlaying, forKey: attributes.prefixedKey("isPlaying"))
}

#Preview("排队中 - 锁屏", as: .content, using: {
    let attrs = LiveActivitiesAppAttributes()
    setupPreviewData(attributes: attrs, partyName: "舞萌超级无敌大逼队", playerName: "千沫qianmo", position: 3, totalPeople: 10, estimatedWait: 25, isPlaying: false)
    return attrs
}()) {
    RankHubWidgetLiveActivity()
} contentStates: {
    LiveActivitiesAppAttributes.ContentState()
}

#Preview("上机中 - 锁屏", as: .content, using: {
    let attrs = LiveActivitiesAppAttributes()
    setupPreviewData(attributes: attrs, partyName: "舞萌超级无敌大逼队", playerName: "千沫qianmo", position: 1, totalPeople: 8, estimatedWait: 0, isPlaying: true)
    return attrs
}()) {
    RankHubWidgetLiveActivity()
} contentStates: {
    LiveActivitiesAppAttributes.ContentState()
}

#Preview("排队中 - 灵动岛", as: .dynamicIsland(.expanded), using: {
    let attrs = LiveActivitiesAppAttributes()
    setupPreviewData(attributes: attrs, partyName: "舞萌超级无敌大逼队", playerName: "千沫qianmo", position: 8, totalPeople: 17, estimatedWait: 50, isPlaying: false)
    return attrs
}()) {
    RankHubWidgetLiveActivity()
} contentStates: {
    LiveActivitiesAppAttributes.ContentState()
}

#Preview("上机中 - 灵动岛", as: .dynamicIsland(.expanded), using: {
    let attrs = LiveActivitiesAppAttributes()
    setupPreviewData(attributes: attrs, partyName: "舞萌超级无敌大逼队", playerName: "千沫qianmo", position: 1, totalPeople: 17, estimatedWait: 0, isPlaying: true)
    return attrs
}()) {
    RankHubWidgetLiveActivity()
} contentStates: {
    LiveActivitiesAppAttributes.ContentState()
}

#Preview("紧凑模式", as: .dynamicIsland(.compact), using: {
    let attrs = LiveActivitiesAppAttributes()
    setupPreviewData(attributes: attrs, partyName: "舞萌超级无敌大逼队", playerName: "千沫qianmo", position: 2, totalPeople: 8, estimatedWait: 15, isPlaying: false)
    return attrs
}()) {
    RankHubWidgetLiveActivity()
} contentStates: {
    LiveActivitiesAppAttributes.ContentState()
}

#Preview("最小化模式", as: .dynamicIsland(.minimal), using: {
    let attrs = LiveActivitiesAppAttributes()
    setupPreviewData(attributes: attrs, partyName: "舞萌超级无敌大逼队", playerName: "千沫qianmo", position: 4, totalPeople: 9, estimatedWait: 28, isPlaying: false)
    return attrs
}()) {
    RankHubWidgetLiveActivity()
} contentStates: {
    LiveActivitiesAppAttributes.ContentState()
}
