cask "realtimex@1.1.243-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.243-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0e994e8f22346bfa72a24daca3af40f53b03c93907d3be54e42176673917ec6d",
         intel: "d25aad13d7ac7f5ab587668def749daa3a455d9a96ae2cfb20652049dbf104cd"

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
