abort('Please run this using `bundle exec rake`') unless ENV["BUNDLE_BIN_PATH"]
require 'html-proofer'

desc 'remove all local files'
task :distclean do
  begin
    sh 'rm -rf `cat .gitignore`'
  rescue => msg
    puts "#{msg}"
  end
end

# bundle exec rake update does not work as expected
desc 'update gems'
task :update do
  begin
    sh 'bundle update'
    sh 'bundle clean'
  rescue => msg
    puts "#{msg}"
  end
end

desc 'build site'
task :build do
  begin
    sh 'JEKYLL_ENV="production" bundle exec jekyll build'
  rescue => msg
    puts "#{msg}"
  end
end

desc 'run vnu validator'
task :vnu => :build do
  begin
    sh 'vnu --skip-non-html --also-check-css --also-check-svg --format text _site'
  rescue => msg
    puts "#{msg}"
  end
end

desc 'verify links'
task :test => :build do
  options = {
    :check_external_hash => true,
    :check_favicon => true,
    :check_opengraph => true,
    :check_html => true,
    :check_img_http => true,
    :check_sri => true,
    :validation => {
      :report_eof_tags => true,
      :report_invalid_tags => true,
      :report_mismatched_tags => true,
      :report_missing_doctype => true,
      :report_missing_names => true,
      :report_script_embeds => true,
    },
    :cache => {
      :timeframe => '1d'
    },
    :http_status_ignore => [403,503],
    :url_ignore => [
      "http://www.ustream.tv/recorded/18541162",
      "https://dev.issa.org/Library/Journals/2006/May/Parker%20-%20Replacing%20Risk-Based%20Security.pdf",
      "https://www.societyinforisk.org/posts/2012/Mar/siracon-2012/",
      "http://www.securitybsides.com/w/page/47572893/BSidesSanFrancisco2012",
    ]
  }
  begin
    HTMLProofer.check_directory("./_site", options).run
  rescue => msg
    puts "#{msg}"
  end
end

task :default => [:test]
