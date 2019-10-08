# gateQ
Progateで学習している人限定の質問投稿サイトです。


## 動作環境

- ruby: 2.5.0
- Rails: 5.2.0

## セットアップ

#### 1.任意のディレクトリにクローン

```bash

# git clone
git clone git@gitlab.com:eichann1/gateq.git
# gateQのディレクトリに移動
cd gateq

```

#### 2.bundle install

```bash

bundle

```

#### 3.データベースを作成

```bash

#DB作成
rails db:create

#テーブル作成
rails db:migrate

```

#### 4.初期データ投入

```bash

rails db:seed

```

#### 5.ローカルで立ち上がるか確認

```bash

rails s

```
