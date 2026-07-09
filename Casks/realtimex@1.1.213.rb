cask "realtimex@1.1.213" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.213"

  # Provide both SHA256 hashes
  sha256 arm:   "d9dfe329d3491cb173cc0b97df3b660276c8ba10e4cfee5fc4aefb77ea77aec5",
         intel: "a4918c18f7fdec5e1d097a491b35b7ed54135a69f76382c99c52498d0ab34a99"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  app "RealTimeX.AI.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "RealTimeX.AI" to quit']
  end

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
