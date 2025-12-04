//
//  RankHubWidgetLiveActivity.swift
//  RankHubWidget
//
//  Created by 千沫qianmo on 2025/12/3.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct RankHubWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct RankHubWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: RankHubWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension RankHubWidgetAttributes {
    fileprivate static var preview: RankHubWidgetAttributes {
        RankHubWidgetAttributes(name: "World")
    }
}

extension RankHubWidgetAttributes.ContentState {
    fileprivate static var smiley: RankHubWidgetAttributes.ContentState {
        RankHubWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: RankHubWidgetAttributes.ContentState {
         RankHubWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: RankHubWidgetAttributes.preview) {
   RankHubWidgetLiveActivity()
} contentStates: {
    RankHubWidgetAttributes.ContentState.smiley
    RankHubWidgetAttributes.ContentState.starEyes
}
