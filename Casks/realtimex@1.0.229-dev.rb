cask "realtimex@1.0.229-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.229-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4f41aca947682a251a34e7a42e11a0ae2eb1c9726f80558c474539a09615a207",
         intel: "1a05f4ab38476f50e55b67ee26de2229e5850d6248088aa3f257fcb376e919bf"

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
