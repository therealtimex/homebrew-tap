cask "realtimex@1.1.691" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.691"

  # Provide both SHA256 hashes
  sha256 arm:   "d676a9f386831b30aac7299dd1f83832c4c5f8df2338bebafe2324853ca5f11e",
         intel: "ac7bbde3476198930594896d377433febb3f294b3f242cec9b52cda00c9aee9a"

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
