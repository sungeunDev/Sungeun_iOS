//
//  Albums.swift
//  SongData
//
//  Created by 박성은 on 2018. 3. 1..
//  Copyright © 2018년 SE. All rights reserved.
//

import Foundation

struct Albums {
    
    var albumInfo: AlbumInfo2
    var songList: [SongInfo2] = []
    
    init?(with dic:[String:Any]) {
        guard let album = dic["AlbumInfo"] as? [String:String] else {return nil}
        self.albumInfo = AlbumInfo2(with: album)!
        
        if let songlist = dic["SongList"] as? [[String:Any]]
        {
            for dic in songlist {
                if let songDicModel = SongInfo2(with: dic)
                {
                    self.songList.append(songDicModel)
                }
            }
        }
    }
}

struct AlbumInfo2 {
    var albumtitle: String
    var artist: String
    var genre: String
    
    init?(with dic: [String:String]) {
        guard let title = dic["albumTitle"] else {return nil}
        guard let artist = dic["artist"] else {return nil}
        guard let genre = dic["genre"] else {return nil}
        
        self.albumtitle = title
        self.artist = artist
        self.genre = genre
    }
}

struct SongInfo2 {
    var songTitle: String
    var trackNum: Int
    var artist: String
    var writer: String
    
    init?(with dic: [String:Any]) {
        guard let songTitle = dic["title"] as? String else {return nil}
        guard let trackNum = dic["trackNum"] as? Int else {return nil}
        guard let artist = dic["artist"] as? String else {return nil}
        guard let writer = dic["writer"] as? String else {return nil}
        
        self.songTitle = songTitle
        self.artist = artist
        self.trackNum = trackNum
        self.writer = writer
    }
    
}
