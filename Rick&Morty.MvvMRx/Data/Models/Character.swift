//
//  Character.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

struct CharacterResponse: Codable {
    var characters : [Character]?
    
    enum CodingKeys: String, CodingKey {
        case characters = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        characters = try values.decodeIfPresent([Character].self, forKey: .characters)
    }
}

struct Character : Codable {
    var id : Int!
    var name : String?
    var species : String?
    var gender : String?
    var image : String?
    var status : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case species = "species"
        case gender = "gender"
        case image = "image"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        species = try values.decodeIfPresent(String.self, forKey: .species)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}
