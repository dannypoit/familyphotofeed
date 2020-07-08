# Family Photo Feed

A photo-sharing social media site designed for families with a simplistic, responsive UI. Upload photos, add users to your family, then view and comment on photos uploaded by your family. E-mail notifications let users know when a family member has uploaded a new photo or when family invites are sent or accepted.

## URL

[http://www.familyphotofeed.com](http://www.familyphotofeed.com)

## Users

Use the 'Sign up' and 'Log in' links at the top right to create a user and log into it. 

![](https://github.com/dannypoit/familyphotofeed/blob/master/app/assets/images/demo-sign-up.gif "Sign up and Log in links")

Creating a user will allow you to do the following:
* Log in
* Upload photos
* Invite people to your family
* Accept family requests from others
* View photos uploaded by your family members
* Comment on photos uploaded by you and your family members
* Upload your avatar and manage your profile

## Profile

Click the 'Profile' link to manage your user profile.

<img src="https://github.com/dannypoit/familyphotofeed/blob/master/app/assets/images/demo-profile.jpg" width="640px" height="360px" alt="Profile page">

Here you can edit your user info, change your password, change your avatar, and view all of the photos you have uploaded.

## Family

Click the 'Family' link to manage your family, which is like your "friends list."

![](https://github.com/dannypoit/familyphotofeed/blob/master/app/assets/images/demo-family.gif "Family page")

Here you can accept or deny incoming requests, view pending requests that you have sent, and search for users to send requests to. Once a user has been added to your family, they will be displayed under "Your family," and their uploaded photos will automatically be shown on your home page (by clicking the "Family Photo Feed" logo). Users can be removed from your family at any time.

Note: If you have incoming requests, a red bage with the number of requests will be displayed in the navigation bar next to the 'Family' link.

## Upload

Click the 'Upload' link to upload a photo and create a new post.

![](https://github.com/dannypoit/familyphotofeed/blob/master/app/assets/images/demo-upload.gif "Upload page")

You will be prompted to select the photo from your computer and to enter a caption. (Currently, a caption is required to upload a photo, however this may change at a later date.) Once uploaded, your photo will be displayed on your home page and on the home pages of all users added to your family.

### Comments

To add a comment to a post, scroll to the text input box either to the right or below the photo. Type your comment into the text field, then click 'Add comment'. Your comment will be displayed, along with any other comments that have been added to that post.

## RSpec

This application has been developed with Test-Driven Development using RSpec. To run all tests, once you have cloned the repository to your local environment and installed all gems, run the following command:

```ruby
bundle exec rspec
```

## Tech used

* [Rails](https://rubyonrails.org/) (5.0.7.2)
* [RSpec](https://rspec.info/) (3.9.2)
* [Bootstrap](https://getbootstrap.com/) (4.5.0)
* [simple_form](https://github.com/plataformatec/simple_form) (5.0.2)
* [Devise](https://github.com/plataformatec/devise) (4.7.2)
* [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) (1.3.1)
* [MiniMagick](https://github.com/minimagick/minimagick) (4.10.0)
* [Figaro](https://github.com/laserlemon/figaro) (1.2.0)
* [AWS](https://aws.amazon.com/)/[fog-aws](https://github.com/fog/fog-aws) (3.6.6)
* [has_friendship](https://github.com/sungwoncho/has_friendship) (1.1.8)

## Authors

* **[Danny Poit](https://github.com/dannypoit)**
