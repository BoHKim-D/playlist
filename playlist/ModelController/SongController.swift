//
//  SongController.swift
//  playlist
//
//  Created by Bo Kim on 4/11/22.
//

import Foundation

class SongController {
    //CRUD
    // create
    static func createSong(title: String, artistName: String, playlist: Playlist) {
        let newSong = Song(title: title, artistName: artistName)
        playlist.songs.append(newSong)
        PlaylistController.shared.saveToPersistenceStore()
//        songs.append(newSong)
//        saveToPersistenceStore()
    }
    // Delete
    static func deleteSong(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.firstIndex(of: song) else { return }
        playlist.songs.remove(at: index)
        PlaylistController.shared.saveToPersistenceStore()
//        songs.remove(at: index)
//        saveToPersistenceStore()
    }
}
