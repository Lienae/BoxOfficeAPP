//
//  comingMoviesViewController.swift
//  A_009_ssw
//
//  Created by 소프트웨어컴퓨터 on 2024/06/05.
//

import UIKit

struct UpcomingMoviesData: Codable {
    let results: [UpcomingMovie]
}

struct UpcomingMovie: Codable {
    let title: String
    let release_date: String
}

class comingMoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    
    var upcomingMovies: UpcomingMoviesData?
        var movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=9ab7888144dbfc165c4531b6c0fcd5d0&targetDt="
        
        override func viewDidLoad() {
            super.viewDidLoad()
            table.delegate = self
            table.dataSource = self
            getData()
        }
        
        func getData() {
            guard let url = URL(string: movieURL) else { return }
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                guard let JSONdata = data else { return }
                
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(UpcomingMoviesData.self, from: JSONdata)
                    self.upcomingMovies = decodedData
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "upcomingCell", for: indexPath) as! UpcomingTableViewCell
            guard let movieTitle = upcomingMovies?.results[indexPath.row].title else { return UITableViewCell() }
            guard let releaseDate = upcomingMovies?.results[indexPath.row].release_date else { return UITableViewCell() }
            
            cell.movieName.text = movieTitle
            cell.upcomingDate.text = "개봉일: \(releaseDate)"
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "🎬 개봉 예정 영화"
        }
        
        func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            return "🍙 by Smile Shin"
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let dest = segue.destination as! DetailViewController
            let myIndexPath = table.indexPathForSelectedRow!
            let row = myIndexPath.row
            dest.movieName = upcomingMovies?.results[row].title ?? "Unknown"
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // print(indexPath.description)
        }
    }


