//
//  NetworkService.swift
//  Brastlewark
//
//  Created by Gabriel Z on 18/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService: NSObject {

    // MARK: - Variables
    private let alamofireManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 120
        configuration.timeoutIntervalForResource = 120
        return Session(configuration: configuration)
    }()

    // MARK: - Functions
    func makeRequest(for endpoint: Endpoint,
                     method: HTTPMethod,
                     completionSuccess: @escaping ((Data) -> Void),
                     completionError: @escaping (() -> Void)) {

        // URL
        guard let urlForRequest = NetworkAPI.getURL(for: endpoint) else {
            completionError()
            return
        }

        // Request
        var request = URLRequest(url: urlForRequest)

        // Method
        request.method = method

        alamofireManager.request(request).responseJSON { response in
            switch response.result {
            case .failure(let error):

                switch error._code {
                case 400:
                    print("Bad request")
                default:
                    print("Other")
                }
            case .success:
                guard let code = response.response?.statusCode else {
                    print("Error getting status code")
                    completionError()
                    return
                }
                switch code {
                case 200...299:
                    print("Succees")
                    guard let data = response.data else {
                        print("Failure to decode")
                        completionError()
                        return
                    }
                    completionSuccess(data)
                default:
                    print("Another response to catch")
                }
            }
        }
    }

    func donwloadInfo(for path: String,
                      completionSuccess: @escaping ((Data) -> Void),
                      completionError: @escaping (() -> Void)) {

        // URL
        guard let urlPath = URL(string: path) else {
            completionError()
            return
        }

        // Request
        let urlRequest = URLRequest(url: urlPath)

        alamofireManager.download(urlRequest).responseData { dataResponse in
            print("Finish to Download: \(dataResponse)")
            switch dataResponse.result {
            case .success(let dataImage):
                completionSuccess(dataImage)
            case .failure(let error):
                completionError()
            }
        }
    }

}
