//
//  VKPost.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 26.01.2020.
//  Copyright © 2020 Kirill Khudiakov. All rights reserved.
//

import Foundation


struct CommonResponse<T: Decodable>: Decodable {
    
    let response: Response?
    
    struct Response: Decodable {
        let count: Int?
        let items: [T]
    }
}

struct VKPost: Decodable {
    let id: Int
    let owner_id: Int //    идентификатор владельца стены, на которой размещена запись. В версиях API ниже 5.7 это поле называется to_id.
    let from_id: Int? //    идентификатор автора записи (от чьего имени опубликована запись).
    let created_by: Int? //  идентификатор администратора, который опубликовал запись
    let date: Int? //     время публикации записи в формате unixtime.
    let text: String? // текст записи.
    let reply_owner_id: Int? // идентификатор владельца записи, в ответ на которую была оставлена текущая.
    let reply_post_id: Int? // идентификатор записи, в ответ на которую была оставлена текущая.
    let friends_only: Int? // 1, если запись была создана с опцией «Только для друзей».
    let comments: Comments?
    let like: Likes?
    let reposts: Reposts?
    let views: Views? // информация о просмотрах записи. Объект с единственным полем:
    let post_type: String? // тип записи, может принимать следующие значения: post, copy, reply, postpone, suggest.
    let post_source: PostSource?
    let geo: Geo?
    let signer_id: Int? // идентификатор автора, если запись была опубликована от имени сообщества и подписана пользователем;
    //        let copy_history: [VKPost]
    let can_pin: Int?        //
    let can_delete: Int?     //
    let can_edit: Int?       //
    let is_pinned: Int?      //
    let marked_as_ads: Int?  //
    let is_favorite: Bool?   //     true, если объект добавлен в закладки у текущего пользователя.
    let postponed_id: Int?   //  integer
}

extension VKPost {
    struct Comments: Decodable {
        let count: Int?  // count (integer) — количество комментариев;
        let can_post: Int? // (integer, [0,1]) — информация о том, может ли текущий пользователь комментировать запись (1 — может, 0 — не может);
        let groups_can_post: Int? // (integer, [0,1]) — информация о том, могут ли сообщества комментировать запись;
        let can_close: Bool? // (boolean) — может ли текущий пользователь закрыть комментарии к записи;
        let can_open: Bool? // (boolean) — может ли текущий пользователь открыть комментарии к записи.
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
