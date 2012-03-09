Factory.define(:user) do |u|
  u.username "Bob"
  u.password "mypass"
  u.password_confirmation {|a| a.password}
  u.after_create { |u| u.password = nil }
end

Factory.define(:post) do |post|
  post.sequence(:title) { |n| "My awesome post #{n}" }
end

Factory.define(:article, :class => :article, :parent => :post) do |article|
  article.body "Some _random_ text"
  article.published true
end

Factory.define(:link, :class => :link, :parent => :post) do |link|
  link.url "example.com"
  link.description "some text"
  link.published true
end