# frozen_string_literal: true

# このファイルをまだ変更していないと仮定して、以下の各設定オプションを変更してください。
# はデフォルト値に設定されています。コメントアウトされているものもあれば、コメントアウトされているものもあることに注意してください。
# コメントなしの行は、設定を保護するためのものです。
# アップグレードでの変更を壊す (つまり、将来のバージョンの
# オプションのデフォルト値を変更するように工夫しています)。
#
# このフックを使って メーラーや監視員のフックなどを設定してください
# これらの設定オプションの多くはモデルの中でそのまま設定することができます。
Devise.setup do |config|
  # Deviseが使用する秘密鍵。Devise はこのキーを使って
  # ランダムトークンです。このキーを変更すると、既存の
  # 確認、パスワードのリセット、トークンのロック解除を行います。
  # Deviseは `secret_key_base` を `secret_key` として使用します。
  # です。以下のように変更して、独自の秘密鍵を使用することができます。
  # config.secret_key = '768b3f335cd229ce108e3881a8f3f6a5a73580c3550dda7aa219b8a6db691f9c33d3448431d94c2bdd682fdc2cddb5c6cacb290239dd045a1543e04a0f91640a'

  # ==> Controller configuration
  # デバイスコントローラの親クラスを設定します.
  # config.parent_controller = 'DeviseController'

  # ==> Mailer Configuration
  # Devise::Mailerに表示されるメールアドレスを設定します.
  # 独自のメーラークラスを使用している場合は上書きされることに注意してください。
  # デフォルトの "from "パラメータを使用します。
  config.mailer_sender = 'health_manager@example.com'

  # メール送信を担当するクラスを設定します.
  # config.mailer = 'Devise::Mailer'

  # メール送信を担当する親クラスを設定します.
  # config.parent_mailer = 'ActionMailer::Base'

  # ==> ORM configuration
  # ORM をロードして設定します。
  # active_record (デフォルト) とデフォルトでは :mongoid (bson_ext を推奨)。
  #他のORMは追加のgemとして利用可能
  require 'devise/orm/active_record'

  # ==> Configuration for any authentication mechanism
  # ユーザ認証時に使用する鍵を設定します。デフォルトは
  # デフォルトは :email です。これは [:username, :subdomain] を使用するように設定できます。
  # ユーザを認証するには、両方のパラメータが必要です。これらの
  # パラメータは認証時にのみ使用され、取得時には使用されません。
  # セッションを使用しています。パーミッションが必要な場合は, beforeフィルタで実装する必要があります.
  # ハッシュ値を指定することもできます。
  # 値が存在しない場合に認証を中止するかどうかを指定します.
  # config.authentication_keys = [:email]

  # 認証に使用するリクエストオブジェクトのパラメータを設定します. 各エントリ
  # 与えられたメソッドはリクエストメソッドでなければなりません。
  # find_for_authenticationメソッドを使用し、モデルの検索で考慮されます。例えば、以下のようになります。
  # :request_keysを[:subdomain]に設定した場合、認証時には :subdomainが使用されます。
  # authentication_keysで述べたのと同じ考慮事項がrequest_keysにも適用されます。
  # config.request_keys = []

  # 大文字小文字を区別しない認証キーを設定します。
  # これらのキーは, ユーザの作成や変更時には小文字になります.
  # ユーザーの認証や検索を行います. Default is :email.
  config.case_insensitive_keys = [:email]

  # どの認証鍵でホワイトスペースを削除するかを設定します。
  # これらの鍵は、認証鍵の作成時や
  # ユーザを変更したり, ユーザの認証や検索に利用される場合. Default is :email.
  config.strip_whitespace_keys = [:email]

  # request.paramsによる認証を有効にするかどうかを指定します。デフォルトでは True です。
  # これを配列に設定することで、params 認証を有効にするのは
  # 例えば、`config.params_authenticatable = [:database]` は
  # データベース(メール+パスワード)認証のみ有効にします。
  # config.params_authenticatable = true

  # HTTP Authによる認証を有効にするかどうかを指定します。デフォルトは False です。
  # 配列を指定することで、HTTP認証を有効にするのは
  # 例えば、`config.http_authenticatable = [:database]` は、 与えられたストラテジーを実行します。
  # データベース認証でのみ有効にします。
  # APIのみのアプリケーションで「すぐに使える」認証をサポートするには、おそらく
  # カスタムストラテジーを使用している場合を除き、 # :databaseを使用してこれを有効にします。
  # サポートされている戦略は以下の通りです。
  # :database = 認証キーとパスワードによる基本的な認証をサポートする
  # config.http_authenticatable = false

  # 401ステータスコードがAJAXリクエストに対して返されるべきかどうか。デフォルトではTrueです。
  # config.http_authenticatable_on_xhr = true

  # Http基本認証で使用する領域です。デフォルトは 'Application' です。
  # config.http_authentication_realm = 'Application'

  # ♪確認やパスワード回復などのワークフローを変更します
  # 提供された電子メールが正しいか間違っているかに関わらず, 同じように振る舞うようにします.
  config.paranoid = true

  # デフォルトではDeviseはユーザーをセッションに保存します。のために保存をスキップすることができます。
  # このオプションを設定することで, 特定の戦略を実現することができます.
  # すべての認証パスのストレージをスキップしている場合、以下のようになります。 
  # Deviseのセッションコントローラへのルート生成を無効にするには、次のようにします
  # passing skip: :sessions to `devise_for` in your config/routes.rb
  config.skip_session_storage = [:http_auth]

  # デフォルトでは、Deviseは認証時にCSRFトークンをクリーンアップして
  # CSRFトークンの固定化攻撃を回避します。これはAJAXを使うときに
  # サインインとサインアップのリクエストには、新しい CSRF トークンを取得する必要があります。
  # サーバーから  奪ってきたものです。このオプションは自己責任で無効にすることができます。
  # config.clean_up_csrf_token_on_authentication = true

  # falseの場合, イーガーロード時にルートを再読み込みしようとはしません.
  # これはアプリの起動にかかる時間を短縮することができますが、もしアプリが
  # アプリケーションの起動時に Devise のマッピングをロードする必要があります。
  # が正しく起動しません。
  # config.reload_routes = true

  # ==> Configuration for :database_authenticatable
  # bcryptの場合, これはパスワードのハッシュ化にかかるコストで, デフォルトは12です. もし
  # 他のアルゴリズムを使用している場合, パスワードを何回ハッシュ化するかを設定します.
  # ハッシュ化されたパスワードを生成するために使用されたストレッチの回数が
  # をハッシュ化したパスワードで指定します。これにより
  # 既存のパスワードを無効にする
  #
  # テスト中のストレッチを1つだけに制限することで
  # テストスイートを劇的に改善することができます。しかしながら
  # 他の環境では10以下の値になります。bcrypt (デフォルトの
  # アルゴリズム）, ストレッチの数に応じてコストは指数関数的に増加します (例: 20の値は既に非常に遅くなっています: 1回の計算で約60秒)
  # 20の値はすでに非常に遅いです: 1回の計算で約60秒)。
  config.stretches = Rails.env.test? ? 1 : 12

  # ハッシュ化されたパスワードを生成するためにペッパーを設定します。
  # config.pepper = 'ded1cca391541eb8680ae09fd4884d7b39225e2dbe267e561508ff600cd272b3f58dd989a4b0175cd2ae6d1fd969ccf5d0cdac376986c4e1fd950d81f11962e1'

  # ユーザーのメールが変更された際に、元のメールに通知を送信します。
  config.send_email_changed_notification = true

  # ユーザーのパスワードが変更された場合に通知メールを送信します.
  config.send_password_change_notification = true

  # ==> Configuration for :confirmable
  # ユーザーがWebサイトへのアクセスを許可されていない期間
  # アカウントを確認します。たとえば、2日に設定すると、ユーザーは
  # アカウントを確認せずに2日間Webサイトにアクセスできる、
  # アクセスは3日目にブロックされます。
  # nilに設定することもできます。これにより、ユーザーはWebサイトにアクセスできます
  # アカウントを確認せずに。
  # デフォルトは0.daysで、ユーザーはWebサイトにアクセスできません。
  # アカウントを確認します。
  # config.allow_unconfirmed_access_for = 2.days

  # の前にユーザーがアカウントを確認することができる期間を指定します.
  # トークンが無効になります. 例えば, 3.dayに設定されている場合, ユーザが確認できるのは
  # メールが送信されてから3日以内に口座を開設したが、4日目には
  # これ以上, トークンを使ってアカウントを確認することはできません.
  # デフォルトはnilです, つまり, ユーザーがトークンを取得できる時間に制限はありません.
  #アカウントを確認する前に
  # config.confirm_within = 3.days

  # trueの場合、メールでの変更を確認する必要があります (
  # 初期アカウント確認）を適用する必要があります。追加の unconfirmed_email が必要です。
  # dbフィールド(移行を参照)。確認されるまで、新しいメールは
  # 未確認のメール欄、確認成功時にはメール欄にコピーされています。
  config.reconfirmable = true

  # アカウントを確認する際に使用するキーを定義します。
  # config.confirmation_keys = [:email]

  # ==> Configuration for :rememberable
  # # ユーザーが再び資格情報を要求されずに記憶される時間を指定します.
  # config.remember_for = 2.weeks

  # ユーザーがサインアウトする際に、すべてのリマインド・ミー・トークンを無効にします。
  config.expire_all_remember_me_on_sign_out = true

  # trueの場合, クッキー経由で記憶された場合のユーザの記憶期間を延長します.
  # config.extend_remember_period = false

  # 作成されたクッキーに渡されるオプション。例えば
  # secure: trueにすると、SSLクッキーのみを強制的に使用することができます。
  # config.rememberable_options = {}

  # ==> Configuration for :validatable
  # パスワードの長さを指定する範囲です。
  config.password_length = 6..128

  # 電子メールのフォーマットを検証するために使用される電子メール正規表現。これは単に
  # 与えられた文字列の中に1つ（そして1つだけ）@が存在します。これは主に
  # ユーザーからのフィードバックを与えるためのものであり、メールの有効性を主張するものではありません。
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Configuration for :timeoutable
  # ユーザーセッションをタイムアウトさせたい時間を指定します. この後
  # ユーザーが再度資格情報の入力を求められる時間を指定します。デフォルトは30分です。
  config.timeout_in = 6.hours

  # ==> Configuration for :lockable
  # アカウントをロックする際に使用するストラテジーを定義します.
  # :failed_attempts = サインインに何度も失敗した場合にアカウントをロックします。
  # :none = ロック方法を指定しません。ロックは自分で行う必要があります.
  # config.lock_strategy = :failed_attempts

  # アカウントのロックとロック解除の際に使用するキーを定義します
  # config.unlock_keys = [:email]

  # アカウントのロックを解除する際に使用するストラテジーを定義します.
  # :email = ユーザーのメールアドレスにロック解除のリンクを送信します.
  # :time = 一定時間経過後にログインを再開します(下記の :unlock_in を参照)
  # :both = 両方の戦略を有効にする
  # :none = アンロック戦略はありません。アンロックは自分で処理してください。
  # config.unlock_strategy = :both

  # アカウントをロックする前に認証を試みる回数 もし lock_strategyならば
  #は失敗しました
  config.maximum_attempts = 5

  # :timeがunlock_strategyとして有効になっている場合、アカウントのロックを解除する時間間隔を指定します。
  config.unlock_in = 1.day

  # アカウントがロックされる前の最後の試みで警告します.
  # config.last_attempt_warning = true

  # ==> Configuration for :recoverable
  #
  # アカウントのパスワードを回復する際に使用するキーを定義します。
  # config.reset_password_keys = [:email]

  # パスワード再設定キーでパスワードを再設定できる時間間隔を指定します.
  #間隔を狭くしすぎないようにしましょう, ユーザがパスワードをリセットする時間がない場合は
  # パスワードを変更して
  config.reset_password_within = 6.hours

  # falseに設定されている場合, パスワードが入力された後に自動的にログインしません.
  # reset. デフォルトはtrueで、リセット後は自動的にサインインされます。
  # config.sign_in_after_reset_password = true

  # ==> Configuration for :encryptable
  # bcrypt (デフォルト)以外のハッシュ化や暗号化アルゴリズムを使用することができます.
  # :sha1, :sha512, あるいは他の認証ツールのアルゴリズムを使用することができます
  # :clearance_sha1, :authlogic_sha512 (この場合、上記のストレッチを20に設定する必要があります)
  # デフォルトの動作は #) と :restful_authentication_sha1 (この場合、以下のように設定する必要があります。
  # 10に伸ばして、REST_AUTH_SITE_KEYをpepperにコピーします)。
  #
  # bcrypt以外のものを使う場合は `devise-encryptable` gem を必要とします。
  # config.encryptor = :sha512

  # ==> Scopes configuration
  # スコープされたビューを有効にします。sessions/new "をレンダリングする前に、最初に
  # "users/sessions/new" のようになっています。これはデフォルトではオフになっています。
  # はデフォルトのビューのみを使用しています.
  config.scoped_views = true

  # Wardenに与えられるデフォルトのスコープを設定します。デフォルトでは、最初の
  # ルートで宣言されたロールを考案する (通常は :user)。
  # config.default_scope = :user

  # /users/sign_outにサインアウトさせたい場合は、この設定をfalseにします。
  # 現在のスコープのみを表示します. デフォルトでは、Deviseはすべてのスコープにサインアウトします。
  # config.sign_out_all_scopes = true

  # ==> Navigation configuration
  # ナビゲーショナルとして扱われるべきフォーマットをリストアップします. 以下のようなフォーマットをリストアップします。
  # :html, ユーザが
  # しかし、:xmlや:jsonのような形式でアクセスした場合は401を返すべきです。
  #
  # もしあなたが :iphone や :mobile のような追加のナビゲーションフォーマットを持っている場合、あなたは
  # ナビゲーショナルフォーマットのリストに追加してください。
  #
  # Internet Explorerのリクエストに対応するためには, 以下の "*/*"が必要です.
  # config.navigational_formats = ['*/*', :html]

  # リソースをサインアウトする際に使用するデフォルトのHTTPメソッドです. デフォルトは :delete です。
  config.sign_out_via = :delete

  # ==> OmniAuth
  # 新しいOmniAuthプロバイダを追加します。設定の詳細についてはwikiをチェックしてください。
  #モデルとフックの #アップ
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

  # ==> Warden configuration
  # 他の戦略を使いたい場合、それはDeviseではサポートされていません。
  # 失敗アプリを変更するには、config.wardenブロックの中で設定してください。
  #
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end

  # ==> Mountable engine configurations
  # エンジンの中でDeviseを使う場合は、`MyEngine`と呼ぶことにしましょう。
  # エンジンはマウント可能ですが, いくつかの追加設定を考慮する必要があります.
  # エンジンがマウントされていると仮定して, 以下のオプションが利用可能です.
  #
  #     mount MyEngine, at: '/my_engine'
  #
  # 上の例では、`devise_for` を起動したルータは次のようになります。
  # config.router_name = :my_engine
  #
  # OmniAuthを使用する場合, Deviseは自動的にOmniAuthパスを設定することはできません.
  # なので、手動で行う必要があります。ユーザースコープの場合は以下のようになります。
  # config.omniauth_path_prefix = '/my_engine/users/auth'

  # ==> Turbolinks configuration
  # Turbolinksを利用している場合は、リダイレクトを正しく行うためにTurbolinks::Controllerを含める必要があります。
  #
  # ActiveSupport.on_load(:devise_failure_app) do
  #   include Turbolinks::Controller
  # end

  # ==> Configuration for :registerable

  # falseに設定されている場合, パスワードが入力された後に自動的にログインしません.
  # 変更されました。デフォルトはtrueで, パスワードを変更すると自動的にサインインされます.
  # config.sign_in_after_change_password = true
end
