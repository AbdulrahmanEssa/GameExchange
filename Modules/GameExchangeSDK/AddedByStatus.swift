//
//  AddedByStatus.swift
//  GameExchangeSDK
//
//  Created by Abdulrahman Essa on 10/08/2021.
//

import Foundation

public class AddedByStatus : Codable {
    public var beaten : Int?
    public var dropped : Int?
    public var owned : Int?
    public var playing : Int?
    public var toplay : Int?
    public var yet : Int?
    
    public init(beaten: Int? = nil, dropped: Int? = nil, owned: Int? = nil, playing: Int? = nil, toplay: Int? = nil, yet: Int? = nil) {
        self.beaten = beaten
        self.dropped = dropped
        self.owned = owned
        self.playing = playing
        self.toplay = toplay
        self.yet = yet
    }
}
