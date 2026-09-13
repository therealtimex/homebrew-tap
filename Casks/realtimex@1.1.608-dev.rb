cask "realtimex@1.1.608-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.608-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2cbfc602ab2bfe6d1e6565da2c3b51cbd901b00ad25da0b4b89ff43d6159014c",
         intel: "c1680858b06896e23c362a14b2cad109b0b48cb180c62926ab7ef4190837befa"

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
