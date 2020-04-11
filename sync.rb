# frozen_string_literal: true

require 'yaml'
require 'json'
require 'fileutils'
require 'shellwords'

SNIPPETS_PATH = 'snippets'
VSCODE_SNIPPETS_PATH =
  "#{Dir.home}/Library/Application Support/Code/User/snippets/my.code-snippets"

def build_snippets
  result = {}

  Dir.glob("#{SNIPPETS_PATH}/**/*.snippet.yml") do |filename|
    snippet_name, = filename.match(%r{^snippets\/(.*)\.snippet\.yml$}).captures

    snippet = YAML.safe_load(File.read(filename))
    result[snippet_name] = snippet
  end

  json_str = JSON.pretty_generate(result)
  File.write(VSCODE_SNIPPETS_PATH, json_str)

  escaped_vscode_snippets_path = Shellwords.escape(VSCODE_SNIPPETS_PATH)
  puts "Snippets successfully written at: #{escaped_vscode_snippets_path}"
end

build_snippets
