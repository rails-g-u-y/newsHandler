# NewsreportsRails
NewsReporsRails is constructed by Rails Template Handler [NewsReports](http://www.newsreports.org/ ) the PDF.


Nickname: newsreports-handler


## Supported versions

* Ruby 1.9.3, 2.0.X, 2.1.X, 2.2.X
* Rails 3.X, 4.X
* NewsReports 0.8.1 later

## Installation

Add this line to your application's Gemfile:

    gem 'newsreports-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install newsreports-rails

## Usage

### Example to, Display in the browser.

#### Controllers
``` ruby
class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
end
```

#### Views

app/views/orders/index.pdf.newsreports 

``` ruby
report.start_new_page
report.page.values printed_at: Time.now
@orders.each do |order|
  report.page.list(:list).add_row do |row|
    row.item(:col1).value order.name
    row.item(:col2).value order.num
  end
end
```

### Example to, Download PDF.

``` ruby
class OrdersController < ApplicationController
  def index
    @orders = Order.all
    respond_to do |format|
      format.pdf { 
        send_data render_to_string, filename: 'foo.pdf', type: 'application/pdf', disposition: 'attachment'
      }
    end
  end
end
```
Copyright (c) 2014 Stefan Dura.

