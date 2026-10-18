# RunClaim Policy Site

静态 GitHub Pages 发布包，包含 RunClaim 的公开隐私、支持、使用条款和知识产权页面。目录本身可复制为独立政策仓库。

## 页面

- `/privacy/`：隐私政策
- `/support/`：使用支持
- `/terms/`：使用条款与知识产权
- `/intellectual-property/`：知识产权直达页

## 发布边界

本目录只包含公开法律与支持文案，不包含用户路线、精确位置、模拟器坐标、测试结果、签名材料或内部构建产物。目录内含 `verify_public_policy_site.sh` 和独立仓库可用的 `.github/workflows/pages.yml`；复制本目录内容到专用政策仓库根目录后，该 workflow 会在 `main` 分支变更或手动触发时先验证再部署。若在 RunClaim 主仓库托管，则由主仓库 `.github/workflows/runclaim-policy-pages.yml` 验证并部署 `RunClaimPolicySite/`。这两个 workflow 只发布静态政策页面，不会上传 RunClaim 本机记录。本地包尚未发布；创建仓库、启用 GitHub Pages 或触发 workflow 前需有明确发布授权，且不得在公开 HTTPS URL 完成未登录回读前把 URL 写入 App Store Connect。

本地校验：

```bash
bash verify_public_policy_site.sh .
```

公开 URL 在 GitHub 仓库创建、Pages 设置为 GitHub Actions、工作流成功并完成未登录回读前，不应写入 App Store Connect。
