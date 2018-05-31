//
//  OtherFunctions swift
//  Related to APIs
//
//  Created by Jemimah Beryl M. Sai on 16/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation


/** MARK: Constants for API calling **/
    struct JSONConstants {
        
        struct Source {
            static let APIBaseURL = "https://api.reddit.com/r/"
        }
        
        struct ParameterKeys {
            static let SubReddit = "subreddit"
        }
        
        struct ParameterValues {
            static var SubReddit = "iOSProgramming"
        }
        
        struct ResponseKeys {
            static let Children = "children"
            static let Data = "data"

            static let Preview = "preview"
            static let Images = "images"
            static let Source = "source"
            
            static let SubReddit = "subreddit"
            static let Title = "title"
            static let Author = "author"
            static let SelfText = "selftext"
            static let URL = "url"
            static let imageWidth = "width"
            static let CreatedUTC = "created_utc"
            
            static let SubRedditIcon = "icon_img"
            static let Subscribers = "subscribers"
            static let DisplayName = "display_name"
            static let DisplayNamePrefixed = "display_name_prefixed"
            static let PublicDescription = "public_description"
            static let BannerImage = "header_img"
        }
        
    }


