require 'sinatra'
require 'octokit'
require 'slim'
require 'dotenv/load'

token = ENV['GITHUB_TOKEN']
org_id = ENV['ORG_ID']
client = Octokit::Client.new(access_token: token)


get "/" do
    slim :index
  end
  
  post "/add" do
    client.add_team_membership(org_id, params["github"])
    "OK, Check your EMAIL"
  end