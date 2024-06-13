//
//  MyTableViewCell.swift
//  A_009_ssw
//
//  Created by 소프트웨어컴퓨터 on 2024/06/05.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var audiAccumulate: UILabel!
    @IBOutlet weak var audiCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }

}
