DROP TABLE IF EXISTS song_genre;
CREATE TABLE song_genre(
	id SERIAL,
    name VARCHAR(255)
);

DROP TABLE IF EXISTS song_albums;
CREATE TABLE song_albums (
	id SERIAL,
	name VARCHAR(255) DEFAULT 'New Album',
    author VARCHAR(255),
    genre_id BIGINT UNSIGNED NOT NULL,
    discription VARCHAR(255), -- Описание альбома
    single_album ENUM('single', 'album'),
    created_at DATETIME DEFAULT NOW(),
    cover_link VARCHAR(255), -- путь к файлу

  	PRIMARY KEY (id),
    INDEX (name, author),
    FOREIGN KEY (genre_id) REFERENCES song_genre(id)
);

DROP TABLE IF EXISTS songs;
CREATE TABLE songs (
    id SERIAL,
    album_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(255),
    author VARCHAR(255),
    genre_id BIGINT UNSIGNED NOT NULL,
    text TEXT,
    song_link VARCHAR(255), -- путь к файлу

    PRIMARY KEY (id),
    INDEX song_name(name),
    FOREIGN KEY (album_id) REFERENCES song_albums(id)
);

DROP TABLE IF EXISTS users_albums;
CREATE TABLE users_albums(
	user_id BIGINT UNSIGNED NOT NULL,
	albums_id BIGINT UNSIGNED NOT NULL,
	song_id BIGINT UNSIGNED NOT NULL,

	PRIMARY KEY (user_id, albums_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (albums_id) REFERENCES song_albums(id),
    FOREIGN KEY (song_id) REFERENCES songs(id)
);
