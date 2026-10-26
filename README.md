# RunClaim Policy Site

静态 GitHub Pages 发布包，包含 RunClaim 的公开隐私、支持、使用条款和知识产权页面。目录本身可复制为独立政策仓库。

## 页面

- `/privacy/`：隐私政策
- `/support/`：使用支持
- `/terms/`：使用条款与知识产权
- `/intellectual-property/`：知识产权直达页

## 发布边界

本目录只包含公开法律与支持文案，不包含用户路线、精确位置、模拟器坐标、测试结果、签名材料或内部构建产物。目录内含 `verify_public_policy_site.sh` 和独立仓库可用的 `.github/workflows/pages.yml`；复制本目录内容到专用政策仓库根目录后，该 workflow 会在 `main` 分支变更或手动触发时先验证再部署。若在 RunClaim 主仓库托管，则由主仓库 `.github/workflows/runclaim-policy-pages.yml` 验证并部署 `RunClaimPolicySite/`。这两个 workflow 只发布静态政策页面，不会上传 RunClaim 本机记录。独立公开仓库已发布：`https://github.com/roik378/runclaim-policy-site/`；GitHub Pages 站点为 `https://roik378.github.io/runclaim-policy-site/`，由仓库内的 Actions workflow 部署。Pages 只托管本目录中的静态政策页面，不会上传 RunClaim 本机记录。

本地校验：

```bash
bash verify_public_policy_site.sh .
```

当前隐私政策和支持页面分别为 [`/privacy/`](https://roik378.github.io/runclaim-policy-site/privacy/) 与 [`/support/`](https://roik378.github.io/runclaim-policy-site/support/)。每次修改站点后，须等待部署 workflow 成功，再匿名回读 HTTPS 状态与正文；这些草案 URL 不表示 App Store Connect 已提交或 App 已正式上架。
