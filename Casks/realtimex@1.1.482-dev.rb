cask "realtimex@1.1.482-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.482-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "98ad11b0ed7551a5d1c455abc5ae3be125676c51df579a7a2a453b56cd98b7eb",
         intel: "60df79ed7d0bbf639ebdd315d6b06600471283b12fa8e73164c3f6622f0dea4c"

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
