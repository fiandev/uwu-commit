# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>

pkgname=uwucommit-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with Google Gemini AI, but it more uwu'
arch=('x86_64' 'aarch64')
url='https://github.com/fiandev/uwu-commit'
license=('GPL3')
depends=('git')
source_x86_64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/uwucommit-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('2a467b4a5b3d56f76a50ee61fa964832b8326912ec3854f87e4b3acc16cd3089')

source_aarch64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/uwucommit-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('26bb27cb663e1fed462fe277b7c4965077e68d62845f138a9fa9a751bf48dbf7')

build() {
	./uwucommit completion bash >uwucommit.bash
	./uwucommit completion zsh >_uwucommit.zsh
	./uwucommit completion fish >uwucommit.fish
}

package() {
	install -Dm755 uwucommit "${pkgdir}/usr/bin/uwucommit"
	install -Dm644 uwucommit.bash "${pkgdir}/usr/share/bash-completion/completions/uwucommit"
	install -Dm644 _uwucommit.zsh "${pkgdir}/usr/share/zsh/site-functions/_uwucommit"
	install -Dm644 uwucommit.fish "${pkgdir}/usr/share/fish/vendor_completions.d/uwucommit.fish"
}
