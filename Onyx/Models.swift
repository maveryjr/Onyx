//
//  Models.swift
//  Onyx
//
//  Created by Michael L. Avery Jr. on 12/6/23.
//

import Foundation


enum VoiceType: String, Codable, Hashable, Sendable, CaseIterable {
    case alloy
    case echo
    case fable
    case onyx
    case nova
    case shimmer
}

enum VoiceChatState {
    case idle
    case recordingSpeech
    case processsingSpeech
    case playingSpeech
    case error(Error)
}

