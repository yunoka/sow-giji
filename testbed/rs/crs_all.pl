package SWResource_all;

#----------------------------------------
# キャラセット
#----------------------------------------

sub GetRSChr {
  my $sow = $_[0];

  my $maker = $sow->{'cfg'}->{'CID_MAKER'};
  my $admin = $sow->{'cfg'}->{'CID_ADMIN'};

  # キャラの表示順
  my @order = (
    'c49',  # c49  石工 ボリス 
    'c38',  # c38  歌い手 コリーン 
    'c77',  # c77  馬飼い キャロライナ 
    'c35',  # c35  親方 ダン 
    'c53',  # c53  大地主 ゼルダ 
    'c74',  # c74  踊り手 フランシスカ 
    'c50',  # c50  会計士 ディーン 
    'c36',  # c36  飾り職 ミッシェル 
    'c26',  # c26  楽器職人 モニカ 
    'c55',  # c55  寡婦 パピヨン 
    'c29',  # c29  記者 イアン 
    'c12',  # c12  御者 バーナバス 
    'c16',  # c16  食いしん坊 マリアンヌ 
    'c34',  # c34  靴磨き トニー 
    'c44',  # c44  小悪党 ドナルド 
    'c11',  # c11  小僧 カルヴィン 
    'c10',  # c10  小娘 ゾーイ 
    'c70',  # c70  子守り パティ 
    'c56',  # c56  酒屋 ゴドウィン 
    'c07',  # c07  雑貨屋 ティモシー 
    'c41',  # c41  さすらい人 ヤニク 
    'c58',  # c58  司祭 ブルーノ 
    'c17',  # c17  詩人 ユリシーズ 
    'c39',  # c39  仕立て屋 シビル 
    'c40',  # c40  執事 ハワード 
    'c65',  # c65  始末屋 ズリエル 
    'c59',  # c59  修道士 ムパムピス 
    'c57',  # c57  修道女 ツェツィーリヤ 
    'c04',  # c04  女中 ノーリーン 
    'c46',  # c46  助手 ゲイル 
    'c14',  # c14  聖歌隊員 レティーシャ 
    'c09',  # c09  刺客 ヒロシ 
    'c42',  # c42  掃除夫 ラルフ 
    'c37',  # c37  奏者 セシル 
    'c75',  # c75  奏者 ビリー 
    'c32',  # c32  双生児 オスカー 
    'c33',  # c33  双生児 ホリー 
    'c02',  # c02  村長 アルフレッド 
    'c66',  # c66  紅茶屋 クリストファー 
    'c24',  # c24  長老 ナタリア 
    'c79',  # c79  長老の孫 マーゴ 
    'c61',  # c61  釣り師 ヌマタロウ 
    'c23',  # c23  伝道師 チャールズ 
    'c28',  # c28  読書家 ケイト 
    'c68',  # c68  賭場の主 ヨアヒム 
    'c30',  # c30  鳥使い フィリップ 
    'c21',  # c21  肉屋 ニール 
    'c52',  # c52  墓堀 ギリアン 
    'c51',  # c51  墓守 ヨーランダ 
    'c01',  # c01  花売り メアリー 
    'c69',  # c69  美術家 ギネス 
    'c63',  # c63  漂白工 ピッパ 
    'c05',  # c05  病人 キャサリン 
    'c22',  # c22  百姓 ワット 
    'c62',  # c62  風来坊 ヴェラ 
    'c13',  # c13  ベテラン医師 ロミオ 
    'c18',  # c18  ベテラン看護婦 エマ 
    'c27',  # c27  牧人 リンダ 
    'c08',  # c08  本屋 ベネット 
    'c19',  # c19  水商売 タバサ 
    'c71',  # c71  道案内 ノックス 
    'c03',  # c03  見習い医師 スティーブン 
    'c43',  # c43  森番 ガストン 
    'c15',  # c15  郵便屋 ウェーズリー 
    'c54',  # c54  理髪師 ザック 
    'c25',  # c25  良家の息子 ルーカス 
    'c20',  # c20  良家の娘 グロリア 
    'c72',  # c72  ランタン職人 ヴェスパタイン 
    'c47',  # c47  流浪者 ペラジー 
    'c80',  # c80  若者 テッド 
    'c105',  # c105  教え子 シメオン 年末カウントダウン♪
    'c96',  # c96  学者 レオナルド 2011/12/11
    'c95',  # c95  新聞配達 モリス 2011/12/11
    'c97',  # c97  捜査官 ジェフ 2011/12/14 超常現象はあるんだ…
    'c98',  # c98  探偵 オズワルド 2011/12/29 この髭はぜったいワックス使ってる。
    'c100',  # c100  徒弟 グレッグ 2012/12/30 スポーツ系中学生くらいに見える
    'c101',  # c101  手伝い クラリッサ 2011/12/30 美人さん♪
    'c104',  # c104  負傷兵 ヒュー 年末カウントダウン♪
    'c106',  # c106  魚屋 ワンダ 年末カウントダウン♪
    'c108',  # c108  採集人 ブローリン 年末カウントダウン♪
    'c90',  # c90  粉ひき ケヴィン 2011/12/06
    'c88',  # c88  料理人 ピエール 2011/12/05
    'c89',  # c89  新妻 カトリーナ 2011/12/06
    'c84',  # c84  妻 ブレンダ 2011/12/05
    'c85',  # c85  お使い ハナ 2011/12/05
    'c91',  # c91  洗濯婦 ドロシー 2011/12/06 姦しい奥様♪
    'c92',  # c92  洗濯婦 セレスト 2011/12/06 姦し娘ーず♪
    'c93',  # c93  洗濯婦 ベッキー 2011/12/06 えー○○が許されるのは小学生までだよねー♪
    'c78',  # c78  道化師 ネイサン 
    'c82',  # c82  執事見習い ロビン 
    'c109',  # c109  村娘 ラディスラヴァ 年末カウントダウン♪
    'c94',  # c94  女主人 ダーラ 2011/12/11
    'c102',  # c102  指揮者 ウォーレン 年末カウントダウン♪
    'c73',  # c73  水商売 ローズマリー 
    'c81',  # c81  薬屋 サイラス 
    'c64',  # c64  墓荒らし ヘクター 
    'c107',  # c107  成金 イヴォン 年末カウントダウン♪
    'c67',  # c67  店番 ソ\フィア 
    'c76',  # c76  留守番 ジョージ 
    'c60',  # c60  良家の末娘 ポーチュラカ 
    'c45',  # c45  博徒 プリシラ 
    'c87',  # c87  病人 エリアス 2011/12/05
    'c48',  # c48  宝石収集家 ビアンカ 
    'c86',  # c86  放蕩者 ホレーショー 2011/12/05
    'c83',  # c83  受付 アイリス 
    'c31',  # c31  童話作家 ネル 
    'c103',  # c103  厭世家 ナンシー 年末カウントダウン♪
    'c99',  # c99  厭世家 サイモン 
    'g01',  # g01  三元道士 露蝶 中国女性名
    'g02',  # g02  白鶴拳 志偉 台湾男性名 越南の名前も探したかったが、見つからぬ…
    'g03',  # g03  吹牛方士 芙蓉 里帰り
    'g04',  # g04  心意六合拳 攻芸 台湾男性名
    'g05',  # g05  本草方士 麻雀 中国女性名
    'g06',  # g06  宝飾交易 黍炉 ダリダイ・オッチギン
    'g07',  # g07  お針子 ジリヤ ロシア女性名
    'mad01',  # mad01  青い鳥 デメテル 阿片窟からきました
    'mad02',  # mad02  蟻塚崩し エルゴット 阿片窟からきました
    'mad03',  # mad03  露店巡り シーシャ 阿片窟からきました
    'mad04',  # mad04  酸味探し ドリベル 阿片窟からきました
    'mad05',  # mad05  天井手繰り ヤヘイ 阿片窟からきました
    'mad06',  # mad06  隠れん坊 アヤワスカ 阿片窟からきました
    'mad07',  # mad07  早口言葉 ダイミ 阿片窟からきました
    'mad08',  # mad08  妄執の誓い エフェドラ 阿片窟からきました
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
    'm99',  # m99  かみさま パルック 
    'm06',  # m06  きゅうていがか リリンラ 
    'm03',  # m03  しょうぐん トノサマ 
    'm05',  # m05  はおう ナナコロ 
    'm15',  # m15  びじん ミソ\チャ 
    'm07',  # m07  こひつじ アリス 
    'r30',  # r30  ひとづかい トリ 
    'm01',  # m01  ようせい ケムシ 
    'm02',  # m02  ようせい ポプラ 
    'm04',  # m04  すくみず アオイ 
    'b44',  # b44  こあくとう ドナルド 
    'm08',  # m08  おふくろのあじ おっぱい 
    'm09',  # m09  しーさー カミジャー 
    'b49',  # b49  いしく ボリス 
    'm10',  # m10  ころぽっくる アチャポ 
    'm12',  # m12  暗黒騎士 トルニトス 
    'm11',  # m11  神聖騎士 ライトニング 
    'm13',  # m13  調律師 ミケ 
    'm14',  # m14  奇跡の子 カリュクス 
    'sf01',  # sf01  通信士 ラッシード りしあさん＆かれやなぎさん
    'sf02',  # sf02  哲学者 エスペラント ふらぅさん＆かれやなぎさん
    'sf03',  # sf03  道案内 ピート たるっとさん＆りちゃさん
    'sf04',  # sf04  お散歩隊長 アシモフ あすたん＆りりんら
    'sf05',  # sf05  新製品 モナリザ ななころび＆りりんら
    'sf06',  # sf06  士官 ワレンチナ まりもさん＆あずまさん
    'sf07',  # sf07  遊泳員 ヤンファ りしあさん＆はむおくん
    'sf08',  # sf08  服飾商 ＰＪ りしあさん＆ふらぅさん
    'sf09',  # sf09  研修生 キリシマ ななころび＆ふらぅさん
    'sf10',  # sf10  保安技師 ナユタ かれやなぎさん＆かいさん
    'sf11',  # sf11  艇長 イワノフ かれやなぎさん＆りちゃさん
    'sf12',  # sf12  廃神 †ルシフェル† 
    'sf13',  # sf13  消防隊長 トルドヴィン 
    'sf18',  # sf18  感性子 玖休 
    'sf19',  # sf19  理性子 参休 
    'sf14',  # sf14  対面販売 クリスマス 
    'sf15',  # sf15  忍者隊 ジェームス 
    'sf16',  # sf16  保険調査 ライジ 
    'sf17',  # sf17  幽閉児 ジャック 
    'sf20',  # sf20  測量士 ティソ\ 
    'w05',  # w05  飴師 定吉 ぷえるとりこの旅人　エージ―エー
    'w21',  # w21  うどん職人 鉄平 日本の伝統　熊木彫
    'w22',  # w22  そば職人 竹三 雪国の風雅　熊木彫
    'w36',  # w36  楽士 ウト 
    'w16',  # w16  髪結い 勢 ぶたさん印の　あおいジンギスカン
    'w18',  # w18  後妻 菊 
    'w26',  # w26  餓鬼大将 勝丸 
    'w35',  # w35  神主 奈須麿 
    'w24',  # w24  喧嘩屋 辰次 桃源郷ぐた国のめぐみ　ふらう乳業
    'w37',  # w37  薬売り 芙蓉 
    'w29',  # w29  琴弾き 志乃 
    'w20',  # w20  呉服問屋 藤之助 
    'w31',  # w31  子守り 日向 
    'w12',  # w12  女中 おみつ 道を外して60年　GEDOU協会
    'w10',  # w10  刺客 博史 
    'w25',  # w25  説法師 法泉 
    'w09',  # w09  宣教師 チャールズ チャールズ派遣ならおまかせ　O-ririn
    'w30',  # w30  宗主 雪代 
    'w14',  # w14  手妻師 華月斎 めげないゼラチン作り　MEGEゼラチン
    'w13',  # w13  団子屋 たまこ 世界の道をつなぐ　議事国地図
    'w11',  # w11  釣り師 沼太郎 
    'w03',  # w03  忍者 朔 新しい議事をつくる　たき学会
    'w34',  # w34  野伏り 余四朗 
    'w27',  # w27  発明家 源蔵 
    'w28',  # w28  飛脚 甚六 
    'w17',  # w17  病人 雷門 輝く月に未来を託す　暁月商事
    'w39',  # w39  武家の娘 沙耶 
    'w08',  # w08  双子 朝顔 
    'w43',  # w43  丁稚 春松 
    'w07',  # w07  双子 夕顔 
    'w40',  # w40  懐刀 朧 
    'w33',  # w33  船大工 団十\郎 
    'w23',  # w23  弁士 仁右衛門 
    'w04',  # w04  町娘 小鈴 お口の愛人　タルッティ・タルット
    'w06',  # w06  巫女 ゆり 道を外して60年　GEDOU協会
    'w38',  # w38  門下生 一平太 
    'w01',  # w01  役者 鏡花 輝く月に未来を託す　暁月商事
    'w15',  # w15  山姥 八重 桃源郷ぐた国のめぐみ　ふらう乳業
    'w32',  # w32  落胤 明之進 
    'w02',  # w02  浪人 慶三郎 カメラのことなら　MISEKI
    'w44',  # w44  機織り 雪客 りりんラハウス呑んだくれ大会
    'w45',  # w45  座敷守 亀吉 りりんラハウス呑んだくれ大会
    'w46',  # w46  屍漁り 梅子 お誕生日記念☆
    'w47',  # w47  肥代取り 置壱 日本の美徳強化月間
    'w48',  # w48  和算家 直円 和算復活月間
    'w49',  # w49  地図抜荷 錠 ポルトガル人にジオゴっているんだぜ。へー。かっこいー。
    'w50',  # w50  半の目 丁助 負けるたびに追い博打
    'all',  # all  かみさま パルック 
  );

  # キャラの肩書き
  my %chrjob = (
    'all' => 'かみさま',  # all  かみさま パルック 
    'b44' => 'こあくとう',  # b44  こあくとう ドナルド 
    'b49' => 'いしく',  # b49  いしく ボリス 
    'c01' => '花売り',  # c01  花売り メアリー 
    'c02' => '村長',  # c02  村長 アルフレッド 
    'c03' => '見習い医師',  # c03  見習い医師 スティーブン 
    'c04' => '女中',  # c04  女中 ノーリーン 
    'c05' => '病人',  # c05  病人 キャサリン 
    'c07' => '雑貨屋',  # c07  雑貨屋 ティモシー 
    'c08' => '本屋',  # c08  本屋 ベネット 
    'c09' => '刺客',  # c09  刺客 ヒロシ 
    'c10' => '小娘',  # c10  小娘 ゾーイ 
    'c100' => '徒弟',  # c100  徒弟 グレッグ 2012/12/30 スポーツ系中学生くらいに見える
    'c101' => '手伝い',  # c101  手伝い クラリッサ 2011/12/30 美人さん♪
    'c102' => '指揮者',  # c102  指揮者 ウォーレン 年末カウントダウン♪
    'c103' => '厭世家',  # c103  厭世家 ナンシー 年末カウントダウン♪
    'c104' => '負傷兵',  # c104  負傷兵 ヒュー 年末カウントダウン♪
    'c105' => '教え子',  # c105  教え子 シメオン 年末カウントダウン♪
    'c106' => '魚屋',  # c106  魚屋 ワンダ 年末カウントダウン♪
    'c107' => '成金',  # c107  成金 イヴォン 年末カウントダウン♪
    'c108' => '採集人',  # c108  採集人 ブローリン 年末カウントダウン♪
    'c109' => '村娘',  # c109  村娘 ラディスラヴァ 年末カウントダウン♪
    'c11' => '小僧',  # c11  小僧 カルヴィン 
    'c12' => '御者',  # c12  御者 バーナバス 
    'c13' => 'ベテラン医師',  # c13  ベテラン医師 ロミオ 
    'c14' => '聖歌隊員',  # c14  聖歌隊員 レティーシャ 
    'c15' => '郵便屋',  # c15  郵便屋 ウェーズリー 
    'c16' => '食いしん坊',  # c16  食いしん坊 マリアンヌ 
    'c17' => '詩人',  # c17  詩人 ユリシーズ 
    'c18' => 'ベテラン看護婦',  # c18  ベテラン看護婦 エマ 
    'c19' => '水商売',  # c19  水商売 タバサ 
    'c20' => '良家の娘',  # c20  良家の娘 グロリア 
    'c21' => '肉屋',  # c21  肉屋 ニール 
    'c22' => '百姓',  # c22  百姓 ワット 
    'c23' => '伝道師',  # c23  伝道師 チャールズ 
    'c24' => '長老',  # c24  長老 ナタリア 
    'c25' => '良家の息子',  # c25  良家の息子 ルーカス 
    'c26' => '楽器職人',  # c26  楽器職人 モニカ 
    'c27' => '牧人',  # c27  牧人 リンダ 
    'c28' => '読書家',  # c28  読書家 ケイト 
    'c29' => '記者',  # c29  記者 イアン 
    'c30' => '鳥使い',  # c30  鳥使い フィリップ 
    'c31' => '童話作家',  # c31  童話作家 ネル 
    'c32' => '双生児',  # c32  双生児 オスカー 
    'c33' => '双生児',  # c33  双生児 ホリー 
    'c34' => '靴磨き',  # c34  靴磨き トニー 
    'c35' => '親方',  # c35  親方 ダン 
    'c36' => '飾り職',  # c36  飾り職 ミッシェル 
    'c37' => '奏者',  # c37  奏者 セシル 
    'c38' => '歌い手',  # c38  歌い手 コリーン 
    'c39' => '仕立て屋',  # c39  仕立て屋 シビル 
    'c40' => '執事',  # c40  執事 ハワード 
    'c41' => 'さすらい人',  # c41  さすらい人 ヤニク 
    'c42' => '掃除夫',  # c42  掃除夫 ラルフ 
    'c43' => '森番',  # c43  森番 ガストン 
    'c44' => '小悪党',  # c44  小悪党 ドナルド 
    'c45' => '博徒',  # c45  博徒 プリシラ 
    'c46' => '助手',  # c46  助手 ゲイル 
    'c47' => '流浪者',  # c47  流浪者 ペラジー 
    'c48' => '宝石収集家',  # c48  宝石収集家 ビアンカ 
    'c49' => '石工',  # c49  石工 ボリス 
    'c50' => '会計士',  # c50  会計士 ディーン 
    'c51' => '墓守',  # c51  墓守 ヨーランダ 
    'c52' => '墓堀',  # c52  墓堀 ギリアン 
    'c53' => '大地主',  # c53  大地主 ゼルダ 
    'c54' => '理髪師',  # c54  理髪師 ザック 
    'c55' => '寡婦',  # c55  寡婦 パピヨン 
    'c56' => '酒屋',  # c56  酒屋 ゴドウィン 
    'c57' => '修道女',  # c57  修道女 ツェツィーリヤ 
    'c58' => '司祭',  # c58  司祭 ブルーノ 
    'c59' => '修道士',  # c59  修道士 ムパムピス 
    'c60' => '良家の末娘',  # c60  良家の末娘 ポーチュラカ 
    'c61' => '釣り師',  # c61  釣り師 ヌマタロウ 
    'c62' => '風来坊',  # c62  風来坊 ヴェラ 
    'c63' => '漂白工',  # c63  漂白工 ピッパ 
    'c64' => '墓荒らし',  # c64  墓荒らし ヘクター 
    'c65' => '始末屋',  # c65  始末屋 ズリエル 
    'c66' => '紅茶屋',  # c66  紅茶屋 クリストファー 
    'c67' => '店番',  # c67  店番 ソ\フィア 
    'c68' => '賭場の主',  # c68  賭場の主 ヨアヒム 
    'c69' => '美術家',  # c69  美術家 ギネス 
    'c70' => '子守り',  # c70  子守り パティ 
    'c71' => '道案内',  # c71  道案内 ノックス 
    'c72' => 'ランタン職人',  # c72  ランタン職人 ヴェスパタイン 
    'c73' => '水商売',  # c73  水商売 ローズマリー 
    'c74' => '踊り手',  # c74  踊り手 フランシスカ 
    'c75' => '奏者',  # c75  奏者 ビリー 
    'c76' => '留守番',  # c76  留守番 ジョージ 
    'c77' => '馬飼い',  # c77  馬飼い キャロライナ 
    'c78' => '道化師',  # c78  道化師 ネイサン 
    'c79' => '長老の孫',  # c79  長老の孫 マーゴ 
    'c80' => '若者',  # c80  若者 テッド 
    'c81' => '薬屋',  # c81  薬屋 サイラス 
    'c82' => '執事見習い',  # c82  執事見習い ロビン 
    'c83' => '受付',  # c83  受付 アイリス 
    'c84' => '妻',  # c84  妻 ブレンダ 2011/12/05
    'c85' => 'お使い',  # c85  お使い ハナ 2011/12/05
    'c86' => '放蕩者',  # c86  放蕩者 ホレーショー 2011/12/05
    'c87' => '病人',  # c87  病人 エリアス 2011/12/05
    'c88' => '料理人',  # c88  料理人 ピエール 2011/12/05
    'c89' => '新妻',  # c89  新妻 カトリーナ 2011/12/06
    'c90' => '粉ひき',  # c90  粉ひき ケヴィン 2011/12/06
    'c91' => '洗濯婦',  # c91  洗濯婦 ドロシー 2011/12/06 姦しい奥様♪
    'c92' => '洗濯婦',  # c92  洗濯婦 セレスト 2011/12/06 姦し娘ーず♪
    'c93' => '洗濯婦',  # c93  洗濯婦 ベッキー 2011/12/06 えー○○が許されるのは小学生までだよねー♪
    'c94' => '女主人',  # c94  女主人 ダーラ 2011/12/11
    'c95' => '新聞配達',  # c95  新聞配達 モリス 2011/12/11
    'c96' => '学者',  # c96  学者 レオナルド 2011/12/11
    'c97' => '捜査官',  # c97  捜査官 ジェフ 2011/12/14 超常現象はあるんだ…
    'c98' => '探偵',  # c98  探偵 オズワルド 2011/12/29 この髭はぜったいワックス使ってる。
    'c99' => '厭世家',  # c99  厭世家 サイモン 
    'g01' => '三元道士',  # g01  三元道士 露蝶 中国女性名
    'g02' => '白鶴拳',  # g02  白鶴拳 志偉 台湾男性名 越南の名前も探したかったが、見つからぬ…
    'g03' => '吹牛方士',  # g03  吹牛方士 芙蓉 里帰り
    'g04' => '心意六合拳',  # g04  心意六合拳 攻芸 台湾男性名
    'g05' => '本草方士',  # g05  本草方士 麻雀 中国女性名
    'g06' => '宝飾交易',  # g06  宝飾交易 黍炉 ダリダイ・オッチギン
    'g07' => 'お針子',  # g07  お針子 ジリヤ ロシア女性名
    'm01' => 'ようせい',  # m01  ようせい ケムシ 
    'm02' => 'ようせい',  # m02  ようせい ポプラ 
    'm03' => 'しょうぐん',  # m03  しょうぐん トノサマ 
    'm04' => 'すくみず',  # m04  すくみず アオイ 
    'm05' => 'はおう',  # m05  はおう ナナコロ 
    'm06' => 'きゅうていがか',  # m06  きゅうていがか リリンラ 
    'm07' => 'こひつじ',  # m07  こひつじ アリス 
    'm08' => 'おふくろのあじ',  # m08  おふくろのあじ おっぱい 
    'm09' => 'しーさー',  # m09  しーさー カミジャー 
    'm10' => 'ころぽっくる',  # m10  ころぽっくる アチャポ 
    'm11' => '神聖騎士',  # m11  神聖騎士 ライトニング 
    'm12' => '暗黒騎士',  # m12  暗黒騎士 トルニトス 
    'm13' => '調律師',  # m13  調律師 ミケ 
    'm14' => '奇跡の子',  # m14  奇跡の子 カリュクス 
    'm15' => 'びじん',  # m15  びじん ミソ\チャ 
    'm99' => 'かみさま',  # m99  かみさま パルック 
    'mad01' => '青い鳥',  # mad01  青い鳥 デメテル 阿片窟からきました
    'mad02' => '蟻塚崩し',  # mad02  蟻塚崩し エルゴット 阿片窟からきました
    'mad03' => '露店巡り',  # mad03  露店巡り シーシャ 阿片窟からきました
    'mad04' => '酸味探し',  # mad04  酸味探し ドリベル 阿片窟からきました
    'mad05' => '天井手繰り',  # mad05  天井手繰り ヤヘイ 阿片窟からきました
    'mad06' => '隠れん坊',  # mad06  隠れん坊 アヤワスカ 阿片窟からきました
    'mad07' => '早口言葉',  # mad07  早口言葉 ダイミ 阿片窟からきました
    'mad08' => '妄執の誓い',  # mad08  妄執の誓い エフェドラ 阿片窟からきました
    'r30' => 'ひとづかい',  # r30  ひとづかい トリ 
    'sf01' => '通信士',  # sf01  通信士 ラッシード りしあさん＆かれやなぎさん
    'sf02' => '哲学者',  # sf02  哲学者 エスペラント ふらぅさん＆かれやなぎさん
    'sf03' => '道案内',  # sf03  道案内 ピート たるっとさん＆りちゃさん
    'sf04' => 'お散歩隊長',  # sf04  お散歩隊長 アシモフ あすたん＆りりんら
    'sf05' => '新製品',  # sf05  新製品 モナリザ ななころび＆りりんら
    'sf06' => '士官',  # sf06  士官 ワレンチナ まりもさん＆あずまさん
    'sf07' => '遊泳員',  # sf07  遊泳員 ヤンファ りしあさん＆はむおくん
    'sf08' => '服飾商',  # sf08  服飾商 ＰＪ りしあさん＆ふらぅさん
    'sf09' => '研修生',  # sf09  研修生 キリシマ ななころび＆ふらぅさん
    'sf10' => '保安技師',  # sf10  保安技師 ナユタ かれやなぎさん＆かいさん
    'sf11' => '艇長',  # sf11  艇長 イワノフ かれやなぎさん＆りちゃさん
    'sf12' => '廃神',  # sf12  廃神 †ルシフェル† 
    'sf13' => '消防隊長',  # sf13  消防隊長 トルドヴィン 
    'sf14' => '対面販売',  # sf14  対面販売 クリスマス 
    'sf15' => '忍者隊',  # sf15  忍者隊 ジェームス 
    'sf16' => '保険調査',  # sf16  保険調査 ライジ 
    'sf17' => '幽閉児',  # sf17  幽閉児 ジャック 
    'sf18' => '感性子',  # sf18  感性子 玖休 
    'sf19' => '理性子',  # sf19  理性子 参休 
    'sf20' => '測量士',  # sf20  測量士 ティソ\ 
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
    'w01' => '役者',  # w01  役者 鏡花 輝く月に未来を託す　暁月商事
    'w02' => '浪人',  # w02  浪人 慶三郎 カメラのことなら　MISEKI
    'w03' => '忍者',  # w03  忍者 朔 新しい議事をつくる　たき学会
    'w04' => '町娘',  # w04  町娘 小鈴 お口の愛人　タルッティ・タルット
    'w05' => '飴師',  # w05  飴師 定吉 ぷえるとりこの旅人　エージ―エー
    'w06' => '巫女',  # w06  巫女 ゆり 道を外して60年　GEDOU協会
    'w07' => '双子',  # w07  双子 夕顔 
    'w08' => '双子',  # w08  双子 朝顔 
    'w09' => '宣教師',  # w09  宣教師 チャールズ チャールズ派遣ならおまかせ　O-ririn
    'w10' => '刺客',  # w10  刺客 博史 
    'w11' => '釣り師',  # w11  釣り師 沼太郎 
    'w12' => '女中',  # w12  女中 おみつ 道を外して60年　GEDOU協会
    'w13' => '団子屋',  # w13  団子屋 たまこ 世界の道をつなぐ　議事国地図
    'w14' => '手妻師',  # w14  手妻師 華月斎 めげないゼラチン作り　MEGEゼラチン
    'w15' => '山姥',  # w15  山姥 八重 桃源郷ぐた国のめぐみ　ふらう乳業
    'w16' => '髪結い',  # w16  髪結い 勢 ぶたさん印の　あおいジンギスカン
    'w17' => '病人',  # w17  病人 雷門 輝く月に未来を託す　暁月商事
    'w18' => '後妻',  # w18  後妻 菊 
    'w20' => '呉服問屋',  # w20  呉服問屋 藤之助 
    'w21' => 'うどん職人',  # w21  うどん職人 鉄平 日本の伝統　熊木彫
    'w22' => 'そば職人',  # w22  そば職人 竹三 雪国の風雅　熊木彫
    'w23' => '弁士',  # w23  弁士 仁右衛門 
    'w24' => '喧嘩屋',  # w24  喧嘩屋 辰次 桃源郷ぐた国のめぐみ　ふらう乳業
    'w25' => '説法師',  # w25  説法師 法泉 
    'w26' => '餓鬼大将',  # w26  餓鬼大将 勝丸 
    'w27' => '発明家',  # w27  発明家 源蔵 
    'w28' => '飛脚',  # w28  飛脚 甚六 
    'w29' => '琴弾き',  # w29  琴弾き 志乃 
    'w30' => '宗主',  # w30  宗主 雪代 
    'w31' => '子守り',  # w31  子守り 日向 
    'w32' => '落胤',  # w32  落胤 明之進 
    'w33' => '船大工',  # w33  船大工 団十\郎 
    'w34' => '野伏り',  # w34  野伏り 余四朗 
    'w35' => '神主',  # w35  神主 奈須麿 
    'w36' => '楽士',  # w36  楽士 ウト 
    'w37' => '薬売り',  # w37  薬売り 芙蓉 
    'w38' => '門下生',  # w38  門下生 一平太 
    'w39' => '武家の娘',  # w39  武家の娘 沙耶 
    'w40' => '懐刀',  # w40  懐刀 朧 
    'w43' => '丁稚',  # w43  丁稚 春松 
    'w44' => '機織り',  # w44  機織り 雪客 りりんラハウス呑んだくれ大会
    'w45' => '座敷守',  # w45  座敷守 亀吉 りりんラハウス呑んだくれ大会
    'w46' => '屍漁り',  # w46  屍漁り 梅子 お誕生日記念☆
    'w47' => '肥代取り',  # w47  肥代取り 置壱 日本の美徳強化月間
    'w48' => '和算家',  # w48  和算家 直円 和算復活月間
    'w49' => '地図抜荷',  # w49  地図抜荷 錠 ポルトガル人にジオゴっているんだぜ。へー。かっこいー。
    'w50' => '半の目',  # w50  半の目 丁助 負けるたびに追い博打
    $maker => '天のお告げ',
    $admin => '闇の呟き',
  );

  # キャラの名前
  my %chrname = (
    'all' => 'パルック',   # all  かみさま パルック 
    'b44' => 'ドナルド',   # b44  こあくとう ドナルド 
    'b49' => 'ボリス',   # b49  いしく ボリス 
    'c01' => 'メアリー',   # c01  花売り メアリー 
    'c02' => 'アルフレッド',   # c02  村長 アルフレッド 
    'c03' => 'スティーブン',   # c03  見習い医師 スティーブン 
    'c04' => 'ノーリーン',   # c04  女中 ノーリーン 
    'c05' => 'キャサリン',   # c05  病人 キャサリン 
    'c07' => 'ティモシー',   # c07  雑貨屋 ティモシー 
    'c08' => 'ベネット',   # c08  本屋 ベネット 
    'c09' => 'ヒロシ',   # c09  刺客 ヒロシ 
    'c10' => 'ゾーイ',   # c10  小娘 ゾーイ 
    'c100' => 'グレッグ',   # c100  徒弟 グレッグ 2012/12/30 スポーツ系中学生くらいに見える
    'c101' => 'クラリッサ',   # c101  手伝い クラリッサ 2011/12/30 美人さん♪
    'c102' => 'ウォーレン',   # c102  指揮者 ウォーレン 年末カウントダウン♪
    'c103' => 'ナンシー',   # c103  厭世家 ナンシー 年末カウントダウン♪
    'c104' => 'ヒュー',   # c104  負傷兵 ヒュー 年末カウントダウン♪
    'c105' => 'シメオン',   # c105  教え子 シメオン 年末カウントダウン♪
    'c106' => 'ワンダ',   # c106  魚屋 ワンダ 年末カウントダウン♪
    'c107' => 'イヴォン',   # c107  成金 イヴォン 年末カウントダウン♪
    'c108' => 'ブローリン',   # c108  採集人 ブローリン 年末カウントダウン♪
    'c109' => 'ラディスラヴァ',   # c109  村娘 ラディスラヴァ 年末カウントダウン♪
    'c11' => 'カルヴィン',   # c11  小僧 カルヴィン 
    'c12' => 'バーナバス',   # c12  御者 バーナバス 
    'c13' => 'ロミオ',   # c13  ベテラン医師 ロミオ 
    'c14' => 'レティーシャ',   # c14  聖歌隊員 レティーシャ 
    'c15' => 'ウェーズリー',   # c15  郵便屋 ウェーズリー 
    'c16' => 'マリアンヌ',   # c16  食いしん坊 マリアンヌ 
    'c17' => 'ユリシーズ',   # c17  詩人 ユリシーズ 
    'c18' => 'エマ',   # c18  ベテラン看護婦 エマ 
    'c19' => 'タバサ',   # c19  水商売 タバサ 
    'c20' => 'グロリア',   # c20  良家の娘 グロリア 
    'c21' => 'ニール',   # c21  肉屋 ニール 
    'c22' => 'ワット',   # c22  百姓 ワット 
    'c23' => 'チャールズ',   # c23  伝道師 チャールズ 
    'c24' => 'ナタリア',   # c24  長老 ナタリア 
    'c25' => 'ルーカス',   # c25  良家の息子 ルーカス 
    'c26' => 'モニカ',   # c26  楽器職人 モニカ 
    'c27' => 'リンダ',   # c27  牧人 リンダ 
    'c28' => 'ケイト',   # c28  読書家 ケイト 
    'c29' => 'イアン',   # c29  記者 イアン 
    'c30' => 'フィリップ',   # c30  鳥使い フィリップ 
    'c31' => 'ネル',   # c31  童話作家 ネル 
    'c32' => 'オスカー',   # c32  双生児 オスカー 
    'c33' => 'ホリー',   # c33  双生児 ホリー 
    'c34' => 'トニー',   # c34  靴磨き トニー 
    'c35' => 'ダン',   # c35  親方 ダン 
    'c36' => 'ミッシェル',   # c36  飾り職 ミッシェル 
    'c37' => 'セシル',   # c37  奏者 セシル 
    'c38' => 'コリーン',   # c38  歌い手 コリーン 
    'c39' => 'シビル',   # c39  仕立て屋 シビル 
    'c40' => 'ハワード',   # c40  執事 ハワード 
    'c41' => 'ヤニク',   # c41  さすらい人 ヤニク 
    'c42' => 'ラルフ',   # c42  掃除夫 ラルフ 
    'c43' => 'ガストン',   # c43  森番 ガストン 
    'c44' => 'ドナルド',   # c44  小悪党 ドナルド 
    'c45' => 'プリシラ',   # c45  博徒 プリシラ 
    'c46' => 'ゲイル',   # c46  助手 ゲイル 
    'c47' => 'ペラジー',   # c47  流浪者 ペラジー 
    'c48' => 'ビアンカ',   # c48  宝石収集家 ビアンカ 
    'c49' => 'ボリス',   # c49  石工 ボリス 
    'c50' => 'ディーン',   # c50  会計士 ディーン 
    'c51' => 'ヨーランダ',   # c51  墓守 ヨーランダ 
    'c52' => 'ギリアン',   # c52  墓堀 ギリアン 
    'c53' => 'ゼルダ',   # c53  大地主 ゼルダ 
    'c54' => 'ザック',   # c54  理髪師 ザック 
    'c55' => 'パピヨン',   # c55  寡婦 パピヨン 
    'c56' => 'ゴドウィン',   # c56  酒屋 ゴドウィン 
    'c57' => 'ツェツィーリヤ',   # c57  修道女 ツェツィーリヤ 
    'c58' => 'ブルーノ',   # c58  司祭 ブルーノ 
    'c59' => 'ムパムピス',   # c59  修道士 ムパムピス 
    'c60' => 'ポーチュラカ',   # c60  良家の末娘 ポーチュラカ 
    'c61' => 'ヌマタロウ',   # c61  釣り師 ヌマタロウ 
    'c62' => 'ヴェラ',   # c62  風来坊 ヴェラ 
    'c63' => 'ピッパ',   # c63  漂白工 ピッパ 
    'c64' => 'ヘクター',   # c64  墓荒らし ヘクター 
    'c65' => 'ズリエル',   # c65  始末屋 ズリエル 
    'c66' => 'クリストファー',   # c66  紅茶屋 クリストファー 
    'c67' => 'ソ\フィア',   # c67  店番 ソ\フィア 
    'c68' => 'ヨアヒム',   # c68  賭場の主 ヨアヒム 
    'c69' => 'ギネス',   # c69  美術家 ギネス 
    'c70' => 'パティ',   # c70  子守り パティ 
    'c71' => 'ノックス',   # c71  道案内 ノックス 
    'c72' => 'ヴェスパタイン',   # c72  ランタン職人 ヴェスパタイン 
    'c73' => 'ローズマリー',   # c73  水商売 ローズマリー 
    'c74' => 'フランシスカ',   # c74  踊り手 フランシスカ 
    'c75' => 'ビリー',   # c75  奏者 ビリー 
    'c76' => 'ジョージ',   # c76  留守番 ジョージ 
    'c77' => 'キャロライナ',   # c77  馬飼い キャロライナ 
    'c78' => 'ネイサン',   # c78  道化師 ネイサン 
    'c79' => 'マーゴ',   # c79  長老の孫 マーゴ 
    'c80' => 'テッド',   # c80  若者 テッド 
    'c81' => 'サイラス',   # c81  薬屋 サイラス 
    'c82' => 'ロビン',   # c82  執事見習い ロビン 
    'c83' => 'アイリス',   # c83  受付 アイリス 
    'c84' => 'ブレンダ',   # c84  妻 ブレンダ 2011/12/05
    'c85' => 'ハナ',   # c85  お使い ハナ 2011/12/05
    'c86' => 'ホレーショー',   # c86  放蕩者 ホレーショー 2011/12/05
    'c87' => 'エリアス',   # c87  病人 エリアス 2011/12/05
    'c88' => 'ピエール',   # c88  料理人 ピエール 2011/12/05
    'c89' => 'カトリーナ',   # c89  新妻 カトリーナ 2011/12/06
    'c90' => 'ケヴィン',   # c90  粉ひき ケヴィン 2011/12/06
    'c91' => 'ドロシー',   # c91  洗濯婦 ドロシー 2011/12/06 姦しい奥様♪
    'c92' => 'セレスト',   # c92  洗濯婦 セレスト 2011/12/06 姦し娘ーず♪
    'c93' => 'ベッキー',   # c93  洗濯婦 ベッキー 2011/12/06 えー○○が許されるのは小学生までだよねー♪
    'c94' => 'ダーラ',   # c94  女主人 ダーラ 2011/12/11
    'c95' => 'モリス',   # c95  新聞配達 モリス 2011/12/11
    'c96' => 'レオナルド',   # c96  学者 レオナルド 2011/12/11
    'c97' => 'ジェフ',   # c97  捜査官 ジェフ 2011/12/14 超常現象はあるんだ…
    'c98' => 'オズワルド',   # c98  探偵 オズワルド 2011/12/29 この髭はぜったいワックス使ってる。
    'c99' => 'サイモン',   # c99  厭世家 サイモン 
    'g01' => '露蝶',   # g01  三元道士 露蝶 中国女性名
    'g02' => '志偉',   # g02  白鶴拳 志偉 台湾男性名 越南の名前も探したかったが、見つからぬ…
    'g03' => '芙蓉',   # g03  吹牛方士 芙蓉 里帰り
    'g04' => '攻芸',   # g04  心意六合拳 攻芸 台湾男性名
    'g05' => '麻雀',   # g05  本草方士 麻雀 中国女性名
    'g06' => '黍炉',   # g06  宝飾交易 黍炉 ダリダイ・オッチギン
    'g07' => 'ジリヤ',   # g07  お針子 ジリヤ ロシア女性名
    'm01' => 'ケムシ',   # m01  ようせい ケムシ 
    'm02' => 'ポプラ',   # m02  ようせい ポプラ 
    'm03' => 'トノサマ',   # m03  しょうぐん トノサマ 
    'm04' => 'アオイ',   # m04  すくみず アオイ 
    'm05' => 'ナナコロ',   # m05  はおう ナナコロ 
    'm06' => 'リリンラ',   # m06  きゅうていがか リリンラ 
    'm07' => 'アリス',   # m07  こひつじ アリス 
    'm08' => 'おっぱい',   # m08  おふくろのあじ おっぱい 
    'm09' => 'カミジャー',   # m09  しーさー カミジャー 
    'm10' => 'アチャポ',   # m10  ころぽっくる アチャポ 
    'm11' => 'ライトニング',   # m11  神聖騎士 ライトニング 
    'm12' => 'トルニトス',   # m12  暗黒騎士 トルニトス 
    'm13' => 'ミケ',   # m13  調律師 ミケ 
    'm14' => 'カリュクス',   # m14  奇跡の子 カリュクス 
    'm15' => 'ミソ\チャ',   # m15  びじん ミソ\チャ 
    'm99' => 'パルック',   # m99  かみさま パルック 
    'mad01' => 'デメテル',   # mad01  青い鳥 デメテル 阿片窟からきました
    'mad02' => 'エルゴット',   # mad02  蟻塚崩し エルゴット 阿片窟からきました
    'mad03' => 'シーシャ',   # mad03  露店巡り シーシャ 阿片窟からきました
    'mad04' => 'ドリベル',   # mad04  酸味探し ドリベル 阿片窟からきました
    'mad05' => 'ヤヘイ',   # mad05  天井手繰り ヤヘイ 阿片窟からきました
    'mad06' => 'アヤワスカ',   # mad06  隠れん坊 アヤワスカ 阿片窟からきました
    'mad07' => 'ダイミ',   # mad07  早口言葉 ダイミ 阿片窟からきました
    'mad08' => 'エフェドラ',   # mad08  妄執の誓い エフェドラ 阿片窟からきました
    'r30' => 'トリ',   # r30  ひとづかい トリ 
    'sf01' => 'ラッシード',   # sf01  通信士 ラッシード りしあさん＆かれやなぎさん
    'sf02' => 'エスペラント',   # sf02  哲学者 エスペラント ふらぅさん＆かれやなぎさん
    'sf03' => 'ピート',   # sf03  道案内 ピート たるっとさん＆りちゃさん
    'sf04' => 'アシモフ',   # sf04  お散歩隊長 アシモフ あすたん＆りりんら
    'sf05' => 'モナリザ',   # sf05  新製品 モナリザ ななころび＆りりんら
    'sf06' => 'ワレンチナ',   # sf06  士官 ワレンチナ まりもさん＆あずまさん
    'sf07' => 'ヤンファ',   # sf07  遊泳員 ヤンファ りしあさん＆はむおくん
    'sf08' => 'ＰＪ',   # sf08  服飾商 ＰＪ りしあさん＆ふらぅさん
    'sf09' => 'キリシマ',   # sf09  研修生 キリシマ ななころび＆ふらぅさん
    'sf10' => 'ナユタ',   # sf10  保安技師 ナユタ かれやなぎさん＆かいさん
    'sf11' => 'イワノフ',   # sf11  艇長 イワノフ かれやなぎさん＆りちゃさん
    'sf12' => '†ルシフェル†',   # sf12  廃神 †ルシフェル† 
    'sf13' => 'トルドヴィン',   # sf13  消防隊長 トルドヴィン 
    'sf14' => 'クリスマス',   # sf14  対面販売 クリスマス 
    'sf15' => 'ジェームス',   # sf15  忍者隊 ジェームス 
    'sf16' => 'ライジ',   # sf16  保険調査 ライジ 
    'sf17' => 'ジャック',   # sf17  幽閉児 ジャック 
    'sf18' => '玖休',   # sf18  感性子 玖休 
    'sf19' => '参休',   # sf19  理性子 参休 
    'sf20' => 'ティソ\',   # sf20  測量士 ティソ\ 
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
    'w01' => '鏡花',   # w01  役者 鏡花 輝く月に未来を託す　暁月商事
    'w02' => '慶三郎',   # w02  浪人 慶三郎 カメラのことなら　MISEKI
    'w03' => '朔',   # w03  忍者 朔 新しい議事をつくる　たき学会
    'w04' => '小鈴',   # w04  町娘 小鈴 お口の愛人　タルッティ・タルット
    'w05' => '定吉',   # w05  飴師 定吉 ぷえるとりこの旅人　エージ―エー
    'w06' => 'ゆり',   # w06  巫女 ゆり 道を外して60年　GEDOU協会
    'w07' => '夕顔',   # w07  双子 夕顔 
    'w08' => '朝顔',   # w08  双子 朝顔 
    'w09' => 'チャールズ',   # w09  宣教師 チャールズ チャールズ派遣ならおまかせ　O-ririn
    'w10' => '博史',   # w10  刺客 博史 
    'w11' => '沼太郎',   # w11  釣り師 沼太郎 
    'w12' => 'おみつ',   # w12  女中 おみつ 道を外して60年　GEDOU協会
    'w13' => 'たまこ',   # w13  団子屋 たまこ 世界の道をつなぐ　議事国地図
    'w14' => '華月斎',   # w14  手妻師 華月斎 めげないゼラチン作り　MEGEゼラチン
    'w15' => '八重',   # w15  山姥 八重 桃源郷ぐた国のめぐみ　ふらう乳業
    'w16' => '勢',   # w16  髪結い 勢 ぶたさん印の　あおいジンギスカン
    'w17' => '雷門',   # w17  病人 雷門 輝く月に未来を託す　暁月商事
    'w18' => '菊',   # w18  後妻 菊 
    'w20' => '藤之助',   # w20  呉服問屋 藤之助 
    'w21' => '鉄平',   # w21  うどん職人 鉄平 日本の伝統　熊木彫
    'w22' => '竹三',   # w22  そば職人 竹三 雪国の風雅　熊木彫
    'w23' => '仁右衛門',   # w23  弁士 仁右衛門 
    'w24' => '辰次',   # w24  喧嘩屋 辰次 桃源郷ぐた国のめぐみ　ふらう乳業
    'w25' => '法泉',   # w25  説法師 法泉 
    'w26' => '勝丸',   # w26  餓鬼大将 勝丸 
    'w27' => '源蔵',   # w27  発明家 源蔵 
    'w28' => '甚六',   # w28  飛脚 甚六 
    'w29' => '志乃',   # w29  琴弾き 志乃 
    'w30' => '雪代',   # w30  宗主 雪代 
    'w31' => '日向',   # w31  子守り 日向 
    'w32' => '明之進',   # w32  落胤 明之進 
    'w33' => '団十\郎',   # w33  船大工 団十\郎 
    'w34' => '余四朗',   # w34  野伏り 余四朗 
    'w35' => '奈須麿',   # w35  神主 奈須麿 
    'w36' => 'ウト',   # w36  楽士 ウト 
    'w37' => '芙蓉',   # w37  薬売り 芙蓉 
    'w38' => '一平太',   # w38  門下生 一平太 
    'w39' => '沙耶',   # w39  武家の娘 沙耶 
    'w40' => '朧',   # w40  懐刀 朧 
    'w43' => '春松',   # w43  丁稚 春松 
    'w44' => '雪客',   # w44  機織り 雪客 りりんラハウス呑んだくれ大会
    'w45' => '亀吉',   # w45  座敷守 亀吉 りりんラハウス呑んだくれ大会
    'w46' => '梅子',   # w46  屍漁り 梅子 お誕生日記念☆
    'w47' => '置壱',   # w47  肥代取り 置壱 日本の美徳強化月間
    'w48' => '直円',   # w48  和算家 直円 和算復活月間
    'w49' => '錠',   # w49  地図抜荷 錠 ポルトガル人にジオゴっているんだぜ。へー。かっこいー。
    'w50' => '丁助',   # w50  半の目 丁助 負けるたびに追い博打
    $maker    => '（村建て人）',
    $admin    => '（管理人）',
  );

  # ダミーキャラの発言
  my @npcsay =(
    "ちゃんとご注文通り、さまざまな人たちをお呼びしましたよ。<br>いたるところから…そう、地平の果てや、宇宙の彼方からも。<br><br>中には、主様を消してくださるような方もいらっしゃるかもしれません。",
    "皆さまお集まりありがとうございます。えー、ごほん。<br>この催し物、しっかりと楽しんでくださいませ。<br><br>…何があっても、文句は言いませんよう、ご了承くださいませ。<br>",
  );

  my @expression = (
  );

  my %charset = (
    CAPTION        => '人狼議事 ちゃんぷる',
    NPCID          => 'all',
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
