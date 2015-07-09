require_relative 'comment'
require_relative 'comment'
require_relative 'image'

class Post

  attr_accessor :title, :url, :points, :item_id, :comments

  def initialize(title, url, points, item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comments = []
    @images = []
  end

  def add_comment(comment)
    @comments << Comment.new(comment)
  end

  def add_image(image_url)
    @images << Image.new(image_url)
  end

  def create_method( name, &block )
        self.class.send( :define_method, name, &block )
  end

  def create_attr( name )
      create_method( "#{name}=".to_sym ) { |val| 
          instance_variable_set( "@" + name, val)
      }

      create_method( name.to_sym ) { 
          instance_variable_get( "@" + name ) 
      }
  end

end