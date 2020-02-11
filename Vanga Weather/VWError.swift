//
//  VWError.swift
//  Vanga Weather
//
//  Created by Nick Beznos on 2/11/20.
//  Copyright © 2020 Nick Beznos. All rights reserved.
//

import Foundation

enum VWError: String, Error {
    case invalidURL    = "Apperently this URL is invalid."
    case unableToComlete    = "Unable to complete your request. Please check your internet connection."
    case invalidData        = "The data recived from the server was invalid. Please try again."
    case invalidResponse    = "Invalid responce from server. Please try again."
}
