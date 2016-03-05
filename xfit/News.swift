//
//  News.swift
//  xfit
//
//  Created by Ingwar on 3/5/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import Foundation
import Parse

class News {
    
    private var _title: String?
    
    private var _featuredImg: PFFile?
    
    private var _content: String?
    
    private var _category: String?
    
    private var _date: NSDate?
    
    private var _commentCount: Int!
    
    var title: String? {
        return _title
    }
    
    var content: String? {
        return _content
    }
    
    var featuredImg: PFFile? {
        return _featuredImg
    }
    
    var category: String? {
        return _category
    }
    
    var date: NSDate? {
        return _date
    }
    
    var commentCount: Int? {
        return _commentCount
    }
    
    init (title: String?, content: String?, featuredImg: String?, category: String?, date: NSDate?, commentCount:Int?) {
        self._title = title
        self._content = content
        self._category = category
        self._featuredImg = featuredImg
        self._date = date
        self._commentCount = commentCount
    }
    
    init(postKey: String, date: NSDate, dictionary: PFObject) {
        
        self._postKey = postKey
        self._date = date
        
        if let title = dictionary["title"] as? String {
            self._title = title
        }
        
        if let excerpt = dictionary["excerpt"] as? String {
            self._excerpt = excerpt
        }
        
        if let content = dictionary["content"] as? String {
            self._content = content
        }
        
        if let category = dictionary["category"]["categoryName"] as? String {
            self._category = category
        }
        
        if let imageDesc = dictionary["imageDesc"] as? String {
            self._imageDesc = imageDesc
        }
        
        if let featuredImg = dictionary["featuredImage"] as? PFFile {
            self._featuredImg = featuredImg
        }
        
        if let commentCount = dictionary["comments"] as? Int {
            self._commentCount = commentCount
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}