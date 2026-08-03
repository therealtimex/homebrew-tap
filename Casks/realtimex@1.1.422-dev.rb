cask "realtimex@1.1.422-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.422-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "40a285dec0ddd34eff01464aae3a9366bfc659bf8c0b334f5c3a7c16da6a607d",
         intel: "c5436048d9b43782e4b345a184041a7e3d73266a253ceddd104f80a3608838e3"

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
