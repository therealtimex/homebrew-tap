cask "realtimex@1.1.602-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.602-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a4ac6c20bef8ee515f47e0881cbbc84fc10a9f7cb3913c2088012bd9c78d79a2",
         intel: "ed39c06a714513549eda439456d5cd6d1a25c932ec61bf1acf762832878045bc"

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
