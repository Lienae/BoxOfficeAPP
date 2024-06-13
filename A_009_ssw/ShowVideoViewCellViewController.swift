//
//  ShowVideoViewCellViewController.swift
//  A_009_ssw
//
//  Created by 소프트웨어컴퓨터 on 2024/06/05.
//

import UIKit
import WebKit
class ShowVideoViewCellViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    var movieName = "범죄도시 4"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlKorString = "https://www.youtube.com/results?search_query=" + movieName
        let urlString = urlKorString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let url = URL(string: urlString) else {return}
        let request = URLRequest(url: url)
        webView.load(request)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
