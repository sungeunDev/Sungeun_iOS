//
//  AlbumModel.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 2. 26..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

struct AlbumModel {
    var albumInfo: AlbumInfo
    var songList: [SongInfo] = []
    
    init?(dic: [String:Any]) {
        guard let albumInfo = dic["albumInfo"] as? [String:Any] else { return nil }
        self.albumInfo = AlbumInfo(dic: albumInfo)!
        
        if let list = dic["songList"] as? [[String:Any]]
        {
            for songDic in list {
                if let model = SongInfo(dic: songDic)
                {
                    self.songList.append(model)
                }
            }
        }
    }
}

struct AlbumInfo {
    var albumTitle: String
    var artist: String
    var genre: String
    
    init?(dic: [String:Any]) {
        guard let title = dic["albumTitle"] as? String else { return nil }
        guard let artist = dic["artist"] as? String else { return nil }
        guard let genre = dic["genre"] as? String else { return nil }
        
        self.albumTitle = title
        self.artist = artist
        self.genre = genre
    }
}

struct SongInfo {
    var songTitle: String
    var trackNum: Int
    var artist: String
    var writer: String
    var playTime: Int
    var playTimeStr: String {
        get {
            let minute = playTime / 3600
            let second = Int((playTime/60 - minute*60))
            return "\(minute):\(second)"
        }
    }
    
    var playURL: String
    
    init?(dic: [String:Any]) {
        guard let title = dic["songTitle"] as? String else { return nil }
        guard let trackNum = dic["trackNum"] as? Int else { return nil }
        guard let artist = dic["artist"] as? String else { return nil }
        guard let writer = dic["writer"] as? String else { return nil }
        guard let playTime = dic["playTime"] as? Int else { return nil }
        guard let playURL = dic["playURL"] as? String else { return nil }
        
        self.songTitle = title
        self.trackNum = trackNum
        self.artist = artist
        self.writer = writer
        self.playTime = playTime
        self.playURL = playURL
    }
}
