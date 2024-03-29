package SWResource_time;

#----------------------------------------
# キャラセット
#----------------------------------------

sub GetRSChr {
  my $sow = $_[0];

  my $maker = $sow->{'cfg'}->{'CID_MAKER'};
  my $admin = $sow->{'cfg'}->{'CID_ADMIN'};

  # キャラの表示順
  my @order = (
    'c10',  # c10  小銃協会 ゾーイ 
    'c09',  # c09  暗殺教団 ヒロシ 
    't01',  # t01  友愛組合 チアキ 時をかける少女
    't02',  # t02  幸運の科学 リッキィ 夏への扉
    't03',  # t03  FSM団 ミナカタ ー仁ー
    't04',  # t04  截拳道 カイル サラ・コナー・クロニクルズ
    't05',  # t05  開放的市民 ジェニファー バック・トゥ・ザ・フューチャー
    't06',  # t06  死ね死ね団 サミュエル トランスフォーマー
    't07',  # t07  勧善懲悪委 アカリ 時をかける少女
    't08',  # t08  覆面嫉妬団 ミルフィ 海賊戦隊ゴーカイジャー
    't09',  # t09  匿名軍団 ゴロウ 時をかける少女
    't10',  # t10  営利政府 トレイル ゼルダの伝説 ムジュラの仮面
    't11',  # t11  鷹の爪団 マドカ 宇宙戦艦ヤマモト・ヨーコ
    't12',  # t12  地下鉄道 フランク オーロラの彼方へ
    't13',  # t13  MNU機関 ジャニス フラッシュフォワード
    't14',  # t14  猫の集会 クシャミ 吾輩は猫である。
    't15',  # t15  少年探偵団 ガーディ ベイカー街少年探偵団
    't16',  # t16  安全保障局 アラン 映画監督たちの共用偽名
  );

  # キャラの肩書き
  my %chrjob = (
    'c09' => '暗殺教団',  # c09  暗殺教団 ヒロシ 
    'c10' => '小銃協会',  # c10  小銃協会 ゾーイ 
    't01' => '友愛組合',  # t01  友愛組合 チアキ 時をかける少女
    't02' => '幸運の科学',  # t02  幸運の科学 リッキィ 夏への扉
    't03' => 'FSM団',  # t03  FSM団 ミナカタ ー仁ー
    't04' => '截拳道',  # t04  截拳道 カイル サラ・コナー・クロニクルズ
    't05' => '開放的市民',  # t05  開放的市民 ジェニファー バック・トゥ・ザ・フューチャー
    't06' => '死ね死ね団',  # t06  死ね死ね団 サミュエル トランスフォーマー
    't07' => '勧善懲悪委',  # t07  勧善懲悪委 アカリ 時をかける少女
    't08' => '覆面嫉妬団',  # t08  覆面嫉妬団 ミルフィ 海賊戦隊ゴーカイジャー
    't09' => '匿名軍団',  # t09  匿名軍団 ゴロウ 時をかける少女
    't10' => '営利政府',  # t10  営利政府 トレイル ゼルダの伝説 ムジュラの仮面
    't11' => '鷹の爪団',  # t11  鷹の爪団 マドカ 宇宙戦艦ヤマモト・ヨーコ
    't12' => '地下鉄道',  # t12  地下鉄道 フランク オーロラの彼方へ
    't13' => 'MNU機関',  # t13  MNU機関 ジャニス フラッシュフォワード
    't14' => '猫の集会',  # t14  猫の集会 クシャミ 吾輩は猫である。
    't15' => '少年探偵団',  # t15  少年探偵団 ガーディ ベイカー街少年探偵団
    't16' => '安全保障局',  # t16  安全保障局 アラン 映画監督たちの共用偽名
    $maker => '次元X式コンピューター',
    $admin => '第四の壁の深奥',
  );

  # キャラの名前
  my %chrname = (
    'c09' => 'ヒロシ',   # c09  暗殺教団 ヒロシ 
    'c10' => 'ゾーイ',   # c10  小銃協会 ゾーイ 
    't01' => 'チアキ',   # t01  友愛組合 チアキ 時をかける少女
    't02' => 'リッキィ',   # t02  幸運の科学 リッキィ 夏への扉
    't03' => 'ミナカタ',   # t03  FSM団 ミナカタ ー仁ー
    't04' => 'カイル',   # t04  截拳道 カイル サラ・コナー・クロニクルズ
    't05' => 'ジェニファー',   # t05  開放的市民 ジェニファー バック・トゥ・ザ・フューチャー
    't06' => 'サミュエル',   # t06  死ね死ね団 サミュエル トランスフォーマー
    't07' => 'アカリ',   # t07  勧善懲悪委 アカリ 時をかける少女
    't08' => 'ミルフィ',   # t08  覆面嫉妬団 ミルフィ 海賊戦隊ゴーカイジャー
    't09' => 'ゴロウ',   # t09  匿名軍団 ゴロウ 時をかける少女
    't10' => 'トレイル',   # t10  営利政府 トレイル ゼルダの伝説 ムジュラの仮面
    't11' => 'マドカ',   # t11  鷹の爪団 マドカ 宇宙戦艦ヤマモト・ヨーコ
    't12' => 'フランク',   # t12  地下鉄道 フランク オーロラの彼方へ
    't13' => 'ジャニス',   # t13  MNU機関 ジャニス フラッシュフォワード
    't14' => 'クシャミ',   # t14  猫の集会 クシャミ 吾輩は猫である。
    't15' => 'ガーディ',   # t15  少年探偵団 ガーディ ベイカー街少年探偵団
    't16' => 'アラン',   # t16  安全保障局 アラン 映画監督たちの共用偽名
    $maker    => '（村建て人）',
    $admin    => '（管理人）',
  );

  # ダミーキャラの発言
  my @npcsay =(
    "M4ライフルを持ってさえいれば…、なーんて、思っててもしょうがないね。鍵かけとこう。",
    "やっぱさ、銃を持った善人がいないとさ。<br><br>ちょっと出かけてくる！プリン食べちゃダメだよ！",
  );

  my @expression = (
  );

  my %charset = (
    CAPTION        => 'エクスパンション・セット「帰還者議事」',
    NPCID          => 'c10',
    CHRNAME        => \%chrname,
    CHRJOB         => \%chrjob,
    ORDER          => \@order,
    NPCSAY         => \@npcsay,
    IMGFACEW       => 90,
    IMGFACEH       => 130,
    IMGBODYW       => 90,
    IMGBODYH       => 130,
    DIR            => "$sow->{'cfg'}->{'DIR_IMG'}/portrate/",
    EXT            => '.jpg',
    BODY           => '',
    FACE           => '',
    GRAVE          => '',
    EXPRESSION     => \@expression,
    LAYOUT_NAME    => 'right',
  );

  return \%charset;
}

1;
