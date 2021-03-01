# HolidayWorkday
Setting holiday and workday, then get weeks exclude holiday but include workday. Saturday and Sunday default is holiday.

[Demo](http://139.198.180.2/holiday_workday)

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'holiday_workday', github: "crosspass/holiday_workday", branch: 'main'
```

And then execute:
```bash
$ bundle
```

install engin
```bash
$ bin/rails holiday_workday:install:migrations
$ bin/rails db:migrate SCOPE=holiday_workday
```
mount holiday_workday

```ruby
Rails.application.routes.draw do
  ...
  mount HolidayWorkday::Engine, at: "/holiday_workday"
end
 ```

## Usage

Then go http://localhost:3000/holiday_workday toggle holiday and workday

Then you can get weeks which include workdays and exclude holidays

```ruby
HolidayWorkday::Hwday.weeks((Date.current.at_beginning_of_year..Date.current))
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
