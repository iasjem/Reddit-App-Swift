//
//  OtherFunctions swift
//  Related to APIs
//
//  Created by Jemimah Beryl M. Sai on 16/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation

struct JSONConstants {
    
    struct Source {
        static let APIBaseURL = "https://api.reddit.com/r/"
    }
    
    struct ParameterKeys {
        static let SubReddit = "subreddit"
        static let Format = "format"
        static let FilterType = "filter_type"
    }
    
    struct ParameterValues {
        static var SubReddit = "iOSProgramming"
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
        static let imageWidth = "width"
        static let imageHeight = "height"
        static let CreatedUTC = "created_utc"
        
        static let SubRedditIcon = "icon_img"
        static let Subscribers = "subscribers"
        static let DisplayName = "display_name"
        static let DisplayNamePrefixed = "display_name_prefixed"
        static let PublicDescription = "public_description"
        static let BannerImage = "header_img"
    }
    
    struct ResponseValues {
        static let OKStatus = "ok"
    }
    
}

