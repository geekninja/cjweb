require 'open-uri'
require 'csv'

namespace :migrate do 
  task :article => :environment do 
    root_url      = "http://conteudojuridico.com.br"
    article_page  = 1
    text          = ""

    684.times do 
      articles_page = Nokogiri::HTML(open("#{root_url}/artigos,#{article_page}.html"))
      articles_page.css('#divContents').children.css('.lnblue').children.each do |item|
        date    = item.css('span')[0].text        rescue nil

        unless date.nil?
          author  = item.css('span')[1].text        rescue nil
          title   = item.css('a').text              rescue nil
          link    = item.css('a').attr('href').text rescue nil 
          
          article_url   = Nokogiri::HTML(open("#{root_url}#{link}")) rescue nil
          article_body  = article_url.at('#corpo').text rescue nil

          text += "#{date}|&|#{author}|&|#{title}|&|#{link}|&|#{article_body}|&|"
          
          migrate = ::MigrateArticle.new
          migrate.date    = date
          migrate.author  = author
          migrate.title   = title 
          migrate.link    = link 
          migrate.content = article_body
          migrate.save
        end
      end

      article_page += 1
      puts article_page
    end
  end


  task :test_csv do 

    CSV.foreach("migrate_14062016.txt", :col_sep => "|&|") do |row|
      byebug
    end
  end
end