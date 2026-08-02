cask "realtimex@1.1.415-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.415-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e5b6fe291c641d7e2336ef565a182b61901763a9a7f6f611e9e4f90f394e5113",
         intel: "f241225099807279dc354eb352f0cb208649da024d5ad01e12f8b8a2098bd91f"

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
