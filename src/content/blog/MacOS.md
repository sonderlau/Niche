---
title: "My macOS Configuration and Experience"
description: "How I setup my beautiful USA girl."
pubDate: "2026-05-06"
tags: ["macos", "config"]
---

macOS 确实非常的好用。本文给出我目前的日常使用和工具的内容。

## 使用需求和目的

- Ghostty
  - 现代化的终端，有GPU加速，功能够用
- Zed Editor
  - 功能强大，但我用来当轻量级的文本编辑器
- Texifier
  - LaTex 编辑器，开箱即用，收费
- 妙言
  - 简单的写作工具，iCloud同步
  - 项目备忘录等等
- Raycast
  - App 启动器，内置很多功能但我没用
- 坚果云
  - webDav 同步，每个月 5 Gb 流量，目前够用
  - 主要搭配 Zotero 实现多端的论文阅读和共享
- Zotero
  - 论文管理，包含分类，检索等
  - 还有 Tag 等功能
-

## 命令

```bash
# Run the commands down beload to set configs

# No .DS_Store on USB
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# always show hidden files(dirs)
defaults write com.apple.finder AppleShowAllFiles -bool true

# Keyboard settings
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 11
/usr/bin/hidutil property --set '{"CapsLockDelayOverride":0}'
```
