#!/usr/bin/env bash
set -eu

git submodule update --init --recursive
cp -rp RSSHub/website/* .

# update config file
name=docusaurus.config.ts
cp ${name} bak1-${name}
sed -E "s/url: '.+',/url: 'https:\/\/qundao.github.io',/" < bak1-${name} > bak2-${name}
sed -E "s/baseUrl: .+,/baseUrl: '\/rsshub-doc\/',/" < bak2-${name} > bak1-${name}
mv bak1-${name} ${name}
