#!/usr/bin/env bash

set -euo pipefail

# パッケージ情報の更新
sudo apt-get update

# ロケール関連パッケージのインストール
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y locales

# 日本語ロケールの有効化
sudo sed -i -E \
    's/^#[[:space:]]*(ja_JP\.UTF-8[[:space:]]+UTF-8)/\1/' \
    /etc/locale.gen

# 日本語ロケールの生成
sudo locale-gen

# 設定確認
locale -a
cat /etc/locale.conf