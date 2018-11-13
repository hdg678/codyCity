require 'zip/zip'
require 'httparty'
require 'stringio'

class StringIO
  def path; end
end


module Github
  class Client

    def initialize(user, repo)
      @user, @repo = user, repo
      @archive = "https://github.com/#{user}/#{repo}/archive/master.zip"
    end

    def courses
      _courses = []
      resp = HTTParty.get(@archive, follow_redirects: true)
      Zip::ZipInputStream.open(StringIO.new(resp.body)) do |io|
        while (entry = io.get_next_entry)
          # deal with your zip contents here, e.g.
          _courses.push({
            entry: entry.name,
            data: io.read
          })
        end
      end

      _courses
    end

  end
end
