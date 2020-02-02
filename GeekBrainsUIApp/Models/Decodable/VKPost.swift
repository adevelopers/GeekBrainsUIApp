//
//  VKPost.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 26.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import Foundation


struct VKPost: Decodable, VKPostProtocol {
    let id: Int
    let ownerId: Int //    идентификатор владельца стены, на которой размещена запись. В версиях API ниже 5.7 это поле называется to_id.
    let fromId: Int? //    идентификатор автора записи (от чьего имени опубликована запись).
    let createdBy: Int? //  идентификатор администратора, который опубликовал запись
    let date: Int? //     время публикации записи в формате unixtime.
    let text: String? // текст записи.
    let replyOwnerId: Int? // идентификатор владельца записи, в ответ на которую была оставлена текущая.
    let replyPostId: Int? // идентификатор записи, в ответ на которую была оставлена текущая.
    let friendsOnly: Int? // 1, если запись была создана с опцией «Только для друзей».
    let comments: Comments?
    let like: Likes?
    let reposts: Reposts?
    let views: Views? // информация о просмотрах записи. Объект с единственным полем:
    let postType: String? // тип записи, может принимать следующие значения: post, copy, reply, postpone, suggest.
    let postSource: PostSource?
    let geo: Geo?
    let signerId: Int? // идентификатор автора, если запись была опубликована от имени сообщества и подписана пользователем;
    //        let copy_history: [VKPost]
    let canPin: Int?        //
    let canDelete: Int?     //
    let canEdit: Int?       //
    let isPinned: Int?      //
    let markedAsAds: Int?  //
    let isFavorite: Bool?   //     true, если объект добавлен в закладки у текущего пользователя.
    let postponedId: Int?   //  integer
    let attachments: [Attachment]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerId = "owner_id"
        case fromId = "from_id"
        case createdBy = "created_by"
        case date
        case text
        case replyOwnerId = "reply_owner_id"
        case replyPostId = "reply_post_id"
        case friendsOnly = "friends_only"
        case comments
        case like
        case reposts
        case views
        case postType = "post_type"
        case postSource = "post_source"
        case geo
        case signerId = "signer_id"
        case canPin = "can_pin"
        case canDelete = "can_delete"
        case canEdit = "can_edit"
        case isPinned = "is_pinned"
        case markedAsAds = "marked_as_ads"
        case isFavorite = "is_favorite"
        case postponedId = "postponed_id"
        case attachments
    }
}

extension VKPost {
    struct Comments: Decodable {
        let count: Int?  // count (integer) — количество комментариев;
        let canPost: Int? // (integer, [0,1]) — информация о том, может ли текущий пользователь комментировать запись (1 — может, 0 — не может);
//        let groupsCanPost: Decimal // (integer, [0,1]) — информация о том, могут ли сообщества комментировать запись;
//        let canClose: Bool? // (boolean) — может ли текущий пользователь закрыть комментарии к записи;
//        let canOpen: Bool? // (boolean) — может ли текущий пользователь открыть комментарии к записи.
        
        enum CodingKeys: String, CodingKey {
            case count
            case canPost = "can_post"
//            case groupsCanPost = "groups_can_post"
//            case canClose = "can_close"
//            case canOpen = "can_open"
        }
    }
    
    struct Likes: Decodable {
        let count: Int? // (integer) — число пользователей, которым понравилась запись;
        let user_likes: Int? //* (integer, [0,1]) — наличие отметки «Мне нравится» от текущего пользователя (1 — есть, 0 — нет);
        let can_like: Int? //* (integer, [0,1]) — информация о том, может ли текущий пользователь поставить отметку «Мне нравится» (1 — может, 0 — не может);
        let can_publish: Int? // * (integer, [0,1]) — информация о том, может ли текущий пользователь сделать репост записи (1 — может, 0 — не может).
    }
    
    struct Reposts: Decodable { // информация о репостах записи («Рассказать друзьям»), объект с полями:
        let count: Int? // (integer) — число пользователей, скопировавших запись;
        let user_reposted: Int? // * (integer, [0,1]) — наличие репоста от текущего пользователя (1 — есть, 0 — нет).
    }
    
    struct Views: Decodable {
        let count: Int? // count (integer) — число просмотров записи.
    }
    
    struct PostSource: Decodable {
        let type: String?
        let platform: String?
    }
    
    struct Attachment: Decodable { // attachments - array    медиавложения записи (фотографии, ссылки и т.п.).
        let type: String?
    }
    
    struct Geo: Decodable {
        let type: String?
        let coordinates: String?
        let place: Place?
    }
    
    struct Place: Decodable {
        let id: Int? // идентификатор места.
        let title: String? // string    название места.
        let latitude: Int? // integer    географическая широта, заданная в градусах (от -90 до 90).
        let longitude: Int? // integer    географическая широта, заданная в градусах (от -90 до 90).
        let created: Int? // integer    дата создания места в Unixtime.
        let icon: String? // string    иконка места, URL изображения.
        let checkins: Int? // число отметок в этом месте.
        let updated: Int? // integer    дата обновления места в Unixtime.
        let type: Int? // integer  тип места.
        let country: Int? // integer идентификатор страны.
        let city: Int? // integer    идентификатор города.
        let address: String? // адрес места.
    }
    
}
