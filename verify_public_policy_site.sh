#!/usr/bin/env bash
set -euo pipefail

# This copy intentionally lives inside the portable policy bundle. When the
# bundle is copied to a dedicated GitHub repository, the Pages workflow can
# validate the same directory without depending on the iOS source repository.
site_dir="${1:-$(cd "$(dirname "$0")" && pwd)}"

required_files=(
  "index.html"
  "styles.css"
  "privacy/index.html"
  "support/index.html"
  "terms/index.html"
  "intellectual-property/index.html"
  ".nojekyll"
)

for relative_path in "${required_files[@]}"; do
  test -f "$site_dir/$relative_path" || {
    echo "missing: $site_dir/$relative_path" >&2
    exit 1
  }
done

content_files=(
  "$site_dir/index.html"
  "$site_dir/styles.css"
  "$site_dir/privacy/index.html"
  "$site_dir/support/index.html"
  "$site_dir/terms/index.html"
  "$site_dir/intellectual-property/index.html"
)
if rg -n '<待配置>|<待发布>|xcarchive|xcresult|DerivedData|Artifacts/' "${content_files[@]}"; then
  echo "public policy site contains a private placeholder or internal artifact marker" >&2
  exit 1
fi

rg -q '隐私政策' "$site_dir/privacy/index.html"
rg -q '使用支持' "$site_dir/support/index.html"
rg -q '下一次活力变化' "$site_dir/support/index.html"
rg -q '历史不会删除' "$site_dir/support/index.html"
rg -q '知识产权' "$site_dir/terms/index.html"
rg -q '知识产权声明' "$site_dir/intellectual-property/index.html"
rg -q 'mailto:roik378@gmail.com' "$site_dir"/*/index.html
rg -q '更新日期：2026 年 10 月 18 日' "$site_dir/index.html"
rg -q '生效日期：2026 年 10 月 18 日' "$site_dir/privacy/index.html"
rg -q 'Apple 地图服务可能处理' "$site_dir/privacy/index.html"
rg -q '最后一次接受的位置样本' "$site_dir/privacy/index.html"
rg -q '导出时间戳 exportedAt' "$site_dir/privacy/index.html"
rg -q '本周回顾 PNG' "$site_dir/privacy/index.html"
rg -q '代表区域名称' "$site_dir/privacy/index.html"
rg -q '生效日期：2026 年 8 月 17 日' "$site_dir/terms/index.html"
rg -q '生效日期：2026 年 8 月 17 日' "$site_dir/intellectual-property/index.html"
if rg -n '2026 年 8 月 16 日' "${content_files[@]}"; then
  echo "public policy site contains stale 2026-08-16 policy date" >&2
  exit 1
fi

echo "PUBLIC POLICY SITE: PASS"
