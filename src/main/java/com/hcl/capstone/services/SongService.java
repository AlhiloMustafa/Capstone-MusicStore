package com.hcl.capstone.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcl.capstone.entities.Album;
import com.hcl.capstone.entities.Artist;
import com.hcl.capstone.entities.Genre;
import com.hcl.capstone.entities.Song;
import com.hcl.capstone.repositories.SongRepository;

@Service
public class SongService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	SongRepository songRepository;
//	private Song song = new Song();
	
	public Iterable<Song> getAllSong(){
		return songRepository.findAll();
	}
	
	public Optional<Song> getSongById(Long id){
		return songRepository.findById(id);
	}
	
	public List<Song> getSongByName(String name){
		return songRepository.findByName(name);
	}
	
	public List<Song> getSongByPriceRange(Double minPrice, Double maxPrice){
		return songRepository.findByPriceRange(minPrice, maxPrice);
	}
	
	
	public List<Song> getSongByAlbumName(String album){ 
		return songRepository.findByAlbumName(album);
	}
	
	public List<Song> sortSongsBySortedName(){
		return songRepository.findByOrderByName();
	}
	
	public List<Song> getSongByArtistName(String artist){ 
		return songRepository.findByArtistName(artist);
	}
	 
		
	public Song createSong(Song song) {
		return songRepository.save(song);
	}
	
	public Boolean updateSong(Long id, Song song) {
		Optional<Song> foundSong = getSongById(id);
		if(!foundSong.isPresent()) {
			//throw new SongNotFoundException(id);
			return false;
		}else {
			
			Song updateSong = foundSong.get();
			
			updateSong.setName(song.getName());
			updateSong.setPrice(song.getPrice());
			updateSong.setInventory(song.getInventory());
			updateSong.setArtist(song.getArtist());
			updateSong.setAlbum(song.getAlbum());
			songRepository.save(updateSong);

			return true;
		}
	}
	
	public Boolean deleteSong(Long id) {
		if(getSongById(id).get() == null) {
			//throw new SongNotFoundException(id);
			return false;
		}else {
			songRepository.delete(getSongById(id).get());
			return true;
		}
		
	}

	
	/*
	 * 
	 * 
	 * 		SEARCH QUERIES
	 * 
	 * 
	 */
	
	public List<Song> search(String search, String criteria){
		List<Song> songs = new ArrayList<Song>();
		logger.info("======================>>> song service: "+criteria);
		try {
			switch(criteria) {
			case "name":
			case "song":
				for (Song song : songRepository.findByNameContains(search)) {
					logger.info("=================>>> found song <<< ====================");
					songs.add(song);
				}				
				break;
			case "artist":
				for (Song song : songRepository.findByArtistNameContains(search)) {
					songs.add(song);
				}	
				break;
			case "album":
				for (Song song : songRepository.findByAlbumNameContains(search)) {
					songs.add(song);
				}	
				break;
			}
			if(songs.isEmpty()) {
				return (List<Song>) songRepository.findAll();
			}
			return songs;
		}catch(Exception ex) {
			return (List<Song>) songRepository.findAll();
		}
	}
}
