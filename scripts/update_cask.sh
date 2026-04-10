#!/usr/bin/env bash
# Usage: update_cask.sh <cask_name> <version> <arm_sha> <intel_sha> <output_dir>
# Generates a Homebrew cask formula file.
set -euo pipefail

CASK_NAME="${1:?cask_name required}"
VERSION="${2:?version required}"
ARM_SHA="${3:?arm_sha required}"
INTEL_SHA="${4:?intel_sha required}"
OUTPUT_DIR="${5:-Casks}"

OUTPUT_FILE="${OUTPUT_DIR}/${CASK_NAME}.rb"

cat > "$OUTPUT_FILE" << 'EOF_TEMPLATE'
cask "CASK_NAME_PLACEHOLDER" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "VERSION_PLACEHOLDER"

  # Provide both SHA256 hashes
  sha256 arm:   "ARM_SHA_PLACEHOLDER",
         intel: "INTEL_SHA_PLACEHOLDER"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.AI.app"

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
EOF_TEMPLATE

sed -i "s/CASK_NAME_PLACEHOLDER/${CASK_NAME}/g"   "$OUTPUT_FILE"
sed -i "s/VERSION_PLACEHOLDER/${VERSION}/g"         "$OUTPUT_FILE"
sed -i "s/ARM_SHA_PLACEHOLDER/${ARM_SHA}/g"         "$OUTPUT_FILE"
sed -i "s/INTEL_SHA_PLACEHOLDER/${INTEL_SHA}/g"     "$OUTPUT_FILE"

echo "Written: $OUTPUT_FILE"
