//
//  TweetRowViewModel.swift
//  TwitterApplication
//
//  Created by Chetan Choudhary on 16/07/23.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    @Published var tweet: Tweet
    private let service = TweetService()
    
    init(tweet: Tweet){
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweet(){
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    func unlikeTweet(){
        service.unlikeTeet(tweet) {
            self.tweet.didLike = false
        }
    }
    
    func checkIfUserLikedTweet(){
        service.checkIfUserLikdTweet(tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
}
