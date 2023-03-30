CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  published_date DATE,
  archived BOOLEAN DEFAULT FALSE
);

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  author_id INTEGER NOT NULL,
  cover_state TEXT,
  FOREIGN KEY (id) REFERENCES items(id),
  FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE music_albums (
  id SERIAL PRIMARY KEY,
  on_spotify BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (id) REFERENCES items(id)
);

  CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    last_played_at DATE,
    FOREIGN KEY (id) REFERENCES items(id)
  );

CREATE TABLE items_labels (
  item_id INTEGER,
  label_id INTEGER,
  FOREIGN KEY (item_id) REFERENCES items(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE items_genres (
  item_id INTEGER,
  genre_id INTEGER,
  FOREIGN KEY (item_id) REFERENCES items(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE items_authors (
  item_id INTEGER,
  author_id INTEGER,
  FOREIGN KEY (item_id) REFERENCES items(id),
  FOREIGN KEY (author_id) REFERENCES authors(id)
);