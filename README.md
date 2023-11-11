<a name="readme-top"></a>
<div align="center">
  <!-- You are encouraged to replace this logo with your own! Otherwise you can also remove it. -->
  <img src="./app/assets/images/twatter.png" alt="logo" width="140"  height="auto" />
  <br/>

  <h3><b>Blog app on Rails</b></h3>

</div>

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 \[BlogApp\] ](#-blogapp-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Run tests](#run-tests)
    - [Usage](#usage)
    - [API request examples](#api-request-examples)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

# 📖 [BlogApp] <a name="about-project"></a>

**[Blog App]** is a blogging app, designed to rival Twitter (lol). It is built with Ruby on Rails and uses the MVC architecture. It is a project for the Microverse Ruby on Rails curriculum.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

- **[Ruby](https://www.ruby-lang.org/en/)**
- **[Ruby on Rails](https://rubyonrails.org/)**
- **[JavaScript](https://www.javascript.com/)**
- **[PostgreSQL](https://www.postgresql.org/)**
- **[TailwindCSS](https://tailwindcss.com/)**

### Key Features <a name="key-features"></a>

- **[Users can create posts, add likes and create comments to posts]**
- **[MVC architecture]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- Install [Ruby](https://www.ruby-lang.org/en/)
- Install [Ruby on Rails](https://rubyonrails.org/)
- Install [PostgreSQL](https://www.postgresql.org/)

### Setup

Clone this repository to your desired folder:

`git clone git@github.com:wickathou/mcv-blog.git`

### Install

Install the required gems
`bundle install`

Create the database by running the command
`rails db:create`

Then run the migrations by setting up the db
`rails db:setup`

Then seed the database using
`rails db:seed`

### Run tests

Run the tests using
`rspec`

### Usage

Then run the rails server

`rails s`

### API request examples

To fetch all users:
`curl -H 'Content-Type: application/json' -H 'Accept: application/json' -X GET http://localhost:3000/users`

To fetch all comments to a post:
`curl -H 'Content-Type: application/json' -H 'Accept: application/json' -X GET http://localhost:3000/posts/9/comments/`

To post a comment to a post:
`curl -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST -d '{"comment": {"text":"something", "user_id":9}}'  http://localhost:3000/users/9/posts/9/comments/`

And now you should be able to see the project running on `localhost:3000`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Javier Hernandez**

- GitHub: [@wickathou](https://github.com/wickathou)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/javierjhm/)


👤 **Anshuman Singh Negi**
- GitHub: [@githubhandle](https://github.com/anshuman7negi)
- Twitter: [@twitterhandle](https://twitter.com/AnshumanNegi108)
- LinkedIn: [@LinkedIn](https://www.linkedin.com/in/anshuman-singh-negi-33779a224/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[Add and delete posts]**
- [ ] **[Like posts]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

Leave a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- [Microverse](https://www.microverse.org/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [GNU](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>