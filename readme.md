# Page Options Engine for Refinery CMS

## About

Page options allows you to add key/value pairs to a refinery page

## Requirements

* refinerycms >= 2.0.0

## Features

* Ability to add key/value pairs

## Install

Add this line to your applications `Gemfile`

```ruby
gem 'refinerycms-page-options', '~> 2.0.0'
```

Next run

```bash
bundle install
rails generate refinery:page_options
rake db:migrate
```

Now when you start up your Refinery application, edit a page and there should be a new "Options" tab.

## Usage

`app/views/refinery/pages/show.html.erb`

If you don't have this file then Refinery will be using its default. You can override this with

```bash
rake refinery:override view=refinery/pages/show
```

```erb
<% content_for :body_content_right do %>
  <ul id='specification'>
    <% @page.page_options.each do |option| %>
      <li>
        <%= option.key %> - <%= option.value >
      </li>
   <% end %>
  </ul>
<% end %>
<%= render :partial => "/refinery/content_page" %>
```r :partial => "/refinery/content_page" %>
```