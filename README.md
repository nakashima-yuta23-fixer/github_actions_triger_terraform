# 開発環境構築
※ 前提としてPowerShellで実行することを想定している。
## 本リポジトリのクローン
```powershell
git clone {ここにリポジトリのURLを載せる}
```

## Terraform, Terragruntのインストール
- Terraformのインストールは![こちら](Install Terraform)の公式ドキュメントを参考にする
- Terragruntのインストールは![こちら](https://terragrunt.gruntwork.io/docs/getting-started/install/)の公式ドキュメントを参考にする

## pre-commitの導入
1. Windows環境にて、pre-commitをインストールする.（Python3、Pip3を使用するので、これらが未インストールであれば、先にインストールする）
```powershell
pip3 install --upgrade pip
pip3 install pre-commit
pre-commit --version # コマンド実行後にpre-commitのバージョンが出力されない場合はパスを通す必要がある。
```

2. Windows環境にて、git-secretsをインストールする。(参考は![こちら](https://github.com/SystangoTechnologies/git-secrets?tab=readme-ov-file#windows))
```powershell
git clone https://github.com/SystangoTechnologies/git-secrets.git
cd git-secrets # git-secretsの配置先に応じてパスを変更する
./install.ps1
```

3. pre-commitファイルの設定
- .github/.pre-commit-config-sample.yaml をルートに移動させ、ファイル名を.pre-commit-config.yaml に変更する
- pre-commit の設定を行う
```powershell
pre-commit install -c .pre-commit-config.yaml
```

4. Azureのシークレットパターンの登録
```powershell
git secrets --register-azure
```

5. 動作確認
```powershell
pre-commit run -a
```
