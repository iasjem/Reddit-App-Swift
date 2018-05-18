//
//  OtherFunctions swift
//  Related to APIs
//
//  Created by Jemimah Beryl M. Sai on 16/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}

struct Constants {
    struct Source {
        static let APIBaseURL = "https://api.reddit.com/r/"
    }
    
    struct ParameterKeys {
        static let SubReddit = "subreddit"
        static let Format = "format"
        static let FilterType = "filter_type"
    }
    
    struct ParameterValues {
        static let SubReddit = "iOSProgramming"
        static let Format = ".json"
        static let FilterType = ""
    }
    
    struct ResponseKeys {
        static let Children = "children"
        static let Data = "data"
        static let Status = "stat"
        static let SubReddit = "subreddit"
        static let Title = "title"
        static let Author = "author"
        static let SelfText = "selftext"
        static let Preview = "preview"
        static let Images = "images"
        static let Source = "source"
        static let Id = "id" 
        static let URL = "url"
        static let CreatedUTC = "created_utc"
    }
    
    struct ResponseValues {
        static let OKStatus = "ok"
    }
}


