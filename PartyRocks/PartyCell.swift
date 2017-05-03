//
//  PartyCell.swift
//  PartyRocks
//
//  Created by Brian McAulay on 01/05/2017.
//  Copyright © 2017 Brian McAulay. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var imgVideo: UIImageView!
    @IBOutlet weak var lblVideoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func updateUI(partyRock: PartyRock){
        lblVideoTitle.text = partyRock.videoTitle
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.imgVideo.image = UIImage(data: data)
                }
            }
            catch{
                //deal with any errors here
            }
        }
        
        
    }

}
