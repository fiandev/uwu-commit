class Uwucommit < Formula
  desc "A CLI that writes your git commit messages for you with Google Gemini AI, but it more uwu"
  homepage "https://github.com/fiandev/uwu-commit"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/fiandev/uwu-commit/releases/download/v0.0.3/uwucommit-v0.0.3-darwin-amd64.tar.gz"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    else
      url "https://github.com/fiandev/uwu-commit/releases/download/v0.0.3/uwucommit-v0.0.3-darwin-arm64.tar.gz"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    end
  end

  def install
    bin.install "uwucommit"
  end

  test do
    system "#{bin}/uwucommit", "--version"
  end
end
