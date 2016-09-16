[![Stories in Done](https://badge.waffle.io/SocialList/devine.png?label=done&title=Done)](https://waffle.io/SocialList/devine)
<a href='https://coveralls.io/github/SocialList/devine?branch=master'><img src='https://coveralls.io/repos/github/SocialList/devine/badge.svg?branch=master' alt='Coverage Status' /></a>
[![Build Status](https://travis-ci.org/SocialList/devine.svg?branch=master)](https://travis-ci.org/SocialList/devine)
# Devine
App that socializes [GitHub](http://github.com).
 A place where you can find a pairing partner, challenging project and why not a new friend.

Current functionality allows users to sign in using [GitHub API-v3](https://developer.github.com/v3/) and [OAuth protocol](https://developer.github.com/v3/oauth/), which supports authorization code grant type to obtain both access tokens and refresh tokens and is optimized for confidential clients.

Signing in with GitHub  - allows users to use their GitHub data for creating a project on Devine. Which was implemented using a GitHub API-v3 wrapper [Octokit](http://octokit.github.io/).

Each project profile can be viewed by Devine users. Can be commented and liked using [Disqus](https://disqus.com/) functionality. Which also gives additional boost to projects by showing them to a greater internet.

Finding a project of your choice is just a click of a button. From project profile page users can directly mail project owner using implemented [Mailboxer](https://github.com/mailboxer/mailboxer) functionality, which is based on Social Stream engine for Ruby on Rails.
Or user can show their interest through Disqus.

Further implementation will include users map, which will make finding pair partners even easier. And will bring pairing to real locations of your choice.


## This application requires:

- Ruby 2.3.1
- Rails 4.2.7
- Postgresql

## Getting Started

_$ = command line_

- fork the repo
- $ git clone git@github.com:_YourRepo_/devine.git
- $ gem install bundler
- $ bundle
- $ rake db:create
- $ rails s
- go to <http://localhost:3000/>
- Sign in with GitHub (Currently only available for GitHub users)
- Send message, checkout other user's account, see recent issues you can help with...
- Or post a repo you need help on
- Enjoy and keep on coding!

## Documentation and Support

- If you would like to look at our code or make a collaboration, just have a look at our gems if you want to know what documentation to use
- If you need support just send a message to any of the collaborators

## Issues

- If you have any issues with the app just post them on to [issues] (https://github.com/SocialList/devine/issues) on the [repo page] (https://github.com/SocialList/devine)

## Contributing

- Sal aka cyberplanner (founder)
- Victor aka 6eff (main collaborator)
- Giancarlo aka Procras (main collaborator)
- Francesco aka Frunez (main collaborator)

## Credits

- Special thanks to Makers Academy and Roi for teaching us about all the tools we needed to create this application
- Thanks to Stack Overflow for helping us debug all our issues

## License

- All rights owned by founder and main collaborators
