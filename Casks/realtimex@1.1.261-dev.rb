cask "realtimex@1.1.261-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.261-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "581b82fb5ef48ce587a84aec48a7b44f9bf266d4836c153a3248c566cbcd8e19",
         intel: "76b88cad587d022f7b00924d5729ed9a8fedd1cacb16ee2f10ecd371474775fd"

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
