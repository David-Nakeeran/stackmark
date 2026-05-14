# Stackmark

Stackmark is a bookmarking application built with Ruby on Rails. It allows users to save links, organise them with tags and quickly access their stored resources in one place.

---

## Features

- User authentication
- Full CRUD for bookmarks
- Automatic metadata storage for bookmarks (title, URL, notes, description)
- Tagging system for organising bookmarks
- Many-to-many relationship between bookmarks and tags
- Automatic tag creation and deduplication
- Clean tag display in UI

---

## Tech Stack

- Ruby on Rails
- PostgreSQL
- Tailwind CSS
- ERB templates

---

## How Tags Work

Tags are created dynamically when a user adds them to a bookmark.

Key behaviours:

- Tags are normalised (lowercased, trimmed, duplicates removed)
- Tags are shared across bookmarks (not duplicated per bookmark)
- A join table (`bookmark_tags`) manages the relationship between bookmarks and tags

This keeps the data structure clean and avoids unnecessary duplication.

---

## What I Learned

Building Stackmark helped reinforce and deepen my understanding of several core concepts:

- The importance of normalising user input before saving to the database
- When NOT to build full CRUD (e.g. tags as supporting data rather than a primary resource)
- Keeping controller logic simple and focused on flow, while models handle relationships and data structure
- Thinking more about how data structure impacts UI and user experience

---

## Future Improvements

There are several features planned to improve the application further:

- Filter bookmarks by tag
- Search functionality for bookmarks
- Improved UI layout and spacing
- Ability to edit or merge tags
- Folder or collection-based organisation
- Optional browser extension for saving bookmarks quickly
