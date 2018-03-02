//
//  ViewController.swift
//  SongData
//
//  Created by 박성은 on 2018. 2. 28..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var albumData: AlbumModel?
    
    @IBOutlet var songTable: UITableView!
    @IBOutlet var albumTitle: UILabel!
    @IBOutlet var artist: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let albumData = AlbumModel(dic: sosi)
        {
            albumTitle.text = albumData.albumInfo.albumTitle
            artist.text = albumData.albumInfo.artist
            self.albumData = albumData
        }
        
        songTable.delegate = self
        songTable.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = albumData {
            return data.songList.count
        } else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongTableViewCell
        
        // 셀 자체 데이터로 정보 넘기기
        cell.songData = albumData!.songList[indexPath.row]
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

