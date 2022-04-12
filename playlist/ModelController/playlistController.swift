//
//  playlistController.swift
//  playlist
//
//  Created by Bo Kim on 4/12/22.
//

import Foundation

class PlaylistController {
    static let shared = PlaylistController()
    
    // Source of Truth
    var playlists: [Playlist] = []
    
    //CRUD
    //Create
    func createPlaylist(name: String) {
        let newPlaylist = Playlist(name: name)
        playlists.append(newPlaylist)
        saveToPersistenceStore()
    }
    //update
    
    //Delete
    func deletePlaylist(playlist: Playlist) {
        guard let index = playlists.firstIndex(of: playlist) else { return }
        playlists.remove(at: index)
        saveToPersistenceStore()
    }
    // Persistence
    func persistentStore() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Playlist.json")
        return fileURL
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(playlists)
            try data.write(to: persistentStore())
        } catch {
            print("we had an error")
            print(error)
            print(error.localizedDescription)
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: persistentStore())
            let fetchedSongs = try JSONDecoder().decode([Playlist].self, from: data)
            playlists = fetchedSongs
        } catch {
            print("We had an error loading data")
            print(error)
            print(error.localizedDescription)
        }
    }
}

