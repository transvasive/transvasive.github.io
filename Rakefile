# frozen_string_literal: true

abort('Please run this using `bundle exec rake`') unless ENV['BUNDLE_BIN_PATH']
require 'html-proofer'
require 'rubocop/rake_task'

desc 'run rubocop'
task :rubocop do
  RuboCop::RakeTask.new
rescue StandardError => e
  puts e
end

desc 'build site'
task :build do
  # using --unpublished or --future disables --drafts
  sh 'JEKYLL_ENV="production" bundle exec jekyll build --strict_front_matter --unpublished --future'
rescue StandardError => e
  puts e
end

desc 'run vnu validator'
task vnu: :build do
  sh 'vnu --skip-non-html --also-check-css --also-check-svg --format text _site'
rescue StandardError => e
  puts e
end

desc 'verify links'
task test: :build do
  options = {
    typhoeus:
    {
      connecttimeout: 60,
      timeout: 300
    },
    check_external_hash: true,
    check_internal_hash: true,
    check_favicon: true,
    check_opengraph: true,
    check_html: true,
    check_img_http: true,
    check_sri: true,
    validation: {
      report_eof_tags: true,
      report_invalid_tags: true,
      report_mismatched_tags: true,
      report_missing_doctype: true,
      report_missing_names: true,
      report_script_embeds: true
    },
    cache: {
      timeframe: {
        internal: '1d',
        external: '1d'
      }
    },
    enforce_https: false,
    ignore_status_codes: [403, 405, 503],
    ignore_urls: [
      # URL not resolving
      # URLs time out
      # URLs require authentication
      # Dead URLs not available on https://web.archive.org
      'https://vimeo.com/31654452',
      'http://www.ustream.tv/recorded/18541162',
      'https://dev.issa.org/Library/Journals/2006/May/Parker%20-%20Replacing%20Risk-Based%20Security.pdf',
      'https://www.societyinforisk.org/posts/2012/Mar/siracon-2012/',
      'http://siracon2016.busyconf.com/schedule'
    ]
  }
  begin
    HTMLProofer.check_directory('./_site', options).run
  rescue StandardError => e
    puts e
  end
end

task default: %i[rubocop test]
