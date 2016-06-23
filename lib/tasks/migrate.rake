require 'open-uri'
require 'csv'

namespace :migrate do 
  task :article => :environment do 
    root_url      = "http://conteudojuridico.com.br"
    article_page  = 360
    text          = ""

    324.times do 
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

  task :migrate_author  => :environment do
    
    MigrateArticle.select('author').group('author').each do |art|
      author      = Author.new
      author.name = art.author
      author.save 
    end
  end

  task :migrate_author_id => :environment do 
    Author.all.order(:name).each do |author|
      migrate = MigrateArticle.where(author: author.name)
      migrate.each do |m|
        m.update(author_id: author.id)
      end
      
      puts migrate.first.author
    end
  end

  task :migrate_article_final_table => :environment do 
    MigrateArticle.all.order(:id).each do |migrate|
      article             = Article.new
      article.author_id   = migrate.author_id 
      article.content     = migrate.content
      article.created_at  = migrate.date
      article.title       = migrate.title
      article.old_id      = migrate.link.split(',')[2].split('.')[0].to_i
      article.old_link    = migrate.link
      
      article.save

      puts migrate.id
    end
  end
end