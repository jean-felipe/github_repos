# Project Name

GitHub Repo Search Rails App
## Overview

The GitHub Repo Search Rails App is a web application built using Rails 7. It allows users to search public GitHub repositories based on a given username. The app provides an API v1 endpoint for searching and saving repositories, as well as a user-friendly view where users can input a GitHub username, trigger a search, and view the results in interactive cards on the screen.
Features

    Search public GitHub repositories by username
    Save a repository to the database via API
    Interactive view to input a GitHub username and display search results as cards

How It Works

    API v1 Endpoint:
        The app exposes an API v1 endpoint where you can search for public GitHub repositories by providing a GitHub username.
        The API handles the search and returns the matching repositories.
        The user can also use the API to save a repository to the app's database.

    User-Friendly View:
        The app provides a user-friendly web view.
        Users can access a page with an input field to enter a GitHub username.
        When the user submits the form, the app triggers a search for repositories associated with the provided username.
        The search results are dynamically rendered as interactive cards on the screen, displaying essential repository details such as name, description, stars, etc.

    Repository Saving:
        When searching for repositories through the view, the controller also saves the found repositories to the app's database.
        This feature runs on background using a Sidekiq job.

# Installation

Follow these steps to set up the GitHub Repo Search Rails App on your local machine:

    Clone the repository: git clone https://github.com/jean-felipe/github_repos.git
    Change into the project directory: cd github_repos
    Install dependencies: bundle install
    Set up the database: rails db:migrate
    Start the Rails server: rails server
    Access the application in your web browser at http://localhost:3000

Requirements

    Ruby 3.0.0 or higher
    Rails 7.0.0 or higher
    Redis latest version
    PostgreSQL (or your preferred database system)

API endpoints

    GET '/api/v1/search?username=jean-felipe' => Returns repos from given username.
    POST '/api/v1/save-repo' => Creates a new repository locally, based on the given parameters (:name, :stars, :github_id)
