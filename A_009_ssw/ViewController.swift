//
//  ViewController.swift
//  A_009_ssw
//
//  Created by 소프트웨어컴퓨터 on 2024/06/05.
//

import UIKit
struct MovieData : Codable {
    let boxOfficeResult : BoxOfficeResult
}
struct BoxOfficeResult : Codable {
    let dailyBoxOfficeList : [DailyBoxOfficeList]
}
struct DailyBoxOfficeList : Codable {
    let movieNm : String
    let audiCnt : String
    let audiAcc : String
    let rank : String
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    var movieData : MovieData?
    var movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=9ab7888144dbfc165c4531b6c0fcd5d0&targetDt="
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        movieURL += makeYesterdayString()
        getData()
    }
    func makeYesterdayString() -> String {
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date()) // 어제 날짜 구하기
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd" // 년(4자리)월(2자리)일(2자리) 형식으로 포맷 설정
        let yesterdayString = dateFormatter.string(from: yesterday!) // 어제 날짜를 문자열로 변환
        return yesterdayString
    }

    func getData() {
        guard let url = URL(string: movieURL) else {            return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            guard let JSONdata = data else { return }
            // print(JSONdata)
            // print(response!)
            // let dataString = String(data: JSONdata, encoding: .utf8)
            // print(dataString!)
            let decode = JSONDecoder()
            do {
                let decodedData = try decode.decode(MovieData.self, from: JSONdata)
                // print(decodedData.boxOfficeResult.dailyBoxOfficeList[0].movieNm)
                self.movieData = decodedData
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        guard let mRank = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].rank else { return UITableViewCell() }
        guard let mName = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].movieNm else{ return UITableViewCell() }
        cell.movieName.text = "[\(mRank)위] \(mName)"
        if let aAcc = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].audiAcc {
                  let numF = NumberFormatter()
                  numF.numberStyle = .decimal
                  let aAcc1 = Int(aAcc)!
                  let result = numF.string(for: aAcc1)!+"명"
                  cell.audiAccumulate.text = "누적 : \(result)"
              }
        if let aCnt = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].audiCnt{let numF = NumberFormatter()
            numF.numberStyle = .decimal
            let aAcc1 = Int(aCnt)!
            let result = numF.string(for: aAcc1)!+"명"
            cell.audiCount.text = "어제 : \(result)"}
  
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "🍿박스오피스(영화진흥위원회제공:"+makeYesterdayString()+")🍿"
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "🍙 by Smile Shin"
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! DetailViewController
        //dest.movieName = "abababab"
        let myIndexPath = table.indexPathForSelectedRow!
        let row = myIndexPath.row
        //print(row)
        dest.movieName = (movieData?.boxOfficeResult.dailyBoxOfficeList[row].movieNm)!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print(indexPath.description)
    }

}

