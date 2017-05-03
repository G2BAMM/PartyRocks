//
//  VideoVC.swift
//  PartyRocks
//
//  Created by Brian McAulay on 28/04/2017.
//  Copyright © 2017 Brian McAulay. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {
    private var _partyRock: PartyRock!
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblVideoTitle: UILabel!
    @IBOutlet weak var webView: UIWebView!
    var partyRock: PartyRock{
        get{return _partyRock
        }
        set{_partyRock = newValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lblVideoTitle.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnBack_Clicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
