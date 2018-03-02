//
//  SongTableViewCell.swift
//  LoginSample
//
//  Created by 박성은 on 2018. 2. 26..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet var songTitle: UILabel!
    @IBOutlet var playTime: UILabel!

    var songData: SongInfo? {
        didSet {
            if let nowData = songData
            {
                // 셀에서 데이터를 받아서 처리
                self.songTitle.text = nowData.songTitle
                self.playTime.text = nowData.playTimeStr
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

