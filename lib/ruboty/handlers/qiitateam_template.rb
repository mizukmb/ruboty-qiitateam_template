require 'json'
require 'net/http'
require 'uri'

module Ruboty
  module Handlers
    class QiitateamTemplate < Base
      on %r(create template (?<id>\d+) *(?<coediting>coediting)?), name: :create, description: "generate template on #{ENV['ORGANIZATION_NAME']}.qiita.com"

      def create(message)
        url = URI.parse("https://#{ENV['ORGANIZATION_NAME']}.qiita.com/api/v2/items")
        req = Net::HTTP::Post.new(url.path)
        req = set_headers(req)

        template = template(message[:id])
        coediting = message[:coediting] ? true : false
        data = {
          coediting: coediting,
          gist: false,
          tags: template[:tags],
          title: template[:title],
          body: template[:body]
        }.to_json

        req.body = data

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        res = http.start do |http|
          http.request(req)
        end

        created_url = JSON.load(res.body)['url']
        message.reply("created #{created_url}")
      end

      private
      def template(id)
        url = URI.parse("https://#{ENV['ORGANIZATION_NAME']}.qiita.com/api/v2/templates/#{id}")
        req = Net::HTTP::Get.new(url.request_uri)
        req = set_headers(req)

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        res = http.start do |http|
          http.request(req)
        end

        json = JSON.load(res.body)

        {title: json["expanded_title"], body: json["expanded_body"], tags: json["tags"]}
      end

      def set_headers(req)
        access_token = ENV['QIITA_ACCESS_TOKEN']
        req['Accept'] = 'application/json'
        req['Content-Type'] = 'application/json; charset=utf-8'
        req['Authorization'] = "Bearer #{access_token}"

        req
      end
    end
  end
end

