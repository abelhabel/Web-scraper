require_relative 'parser'
require_relative 'post'
require 'colorize'

def init
  parser = Parser.new

  src_url = ARGV[0] || 'https://news.ycombinator.com/item?id=7663775'
  parser.parse_url(src_url)

  title = parser.search('title').inner_text
  item_id = 7663775
  points = parser.search('.score').inner_text.to_i
  post = Post.new(title, points, src_url, item_id)
  images = parser.search('img')

  comments = parser.search('.comment')
  comments.each { |tag| post.add_comment(tag.content.strip) }

  images.each {|url| post.add_image(url)}

  puts "Post title: #{post.title.red}"
  puts "Number of Comments: #{post.comments.count.to_s.blue}"
  puts "Images:"
  images.each { |img| puts img.attribute('src').to_s.green }

end

init
