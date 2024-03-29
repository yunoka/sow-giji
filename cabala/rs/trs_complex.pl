package SWTextRS_complex;

sub GetTextRS {
   # プロローグ〜二日目の開始時メッセージ
   my @announce_first = (
      '<b>（ミッションアラート）</b><br>非認可の組織が、親愛なるコンピューター・_NPC_を破壊するたくらみを持っています。そして、ここに集まった市民には……、連中の一味が含まれています。',
      'R&D（調査設計部門）は、市民達のために装備を開発しました。<br>ＰＬＣから配布を受け、フィールドテストをし、結社を発見しなさい。支給品の機密は保たれています。',
      '<b>（すべてのアラートは沈黙し、天井は真っ暗に消灯した。）<br>_NPC_が破壊され、クローンが失われました。</b><br>今日からは、▼zap▼は慎重に行わなくてはなりません。次のクローンはなにひとつ、うまくやることができないのです。<br>静寂の中、誰かが言い出します。今日からは、▼zap▼は一日ひとりに制限しよう。',
   );

   # 役職配分のお知らせ
   my @announce_role = (
      'どうやらこの中には、_ROLE_いるようだ。',
      'が',
      '人',
      '、',
   );

   # 生存者のお知らせ
   my @announce_lives = (
      '現在の生存者は、',
      '、',
      'の_LIVES_名。',
   );

   # 処刑時のお知らせ
   my @announce_vote =(
      '_NAME_ は _TARGET_ にレーザー・ガンを向けた。_RANDOM_',
      '_NAME_ に _COUNT_人がレーザー・ガンを向けた。',
      '_NAME_ は市民の手により▼zap▼された。',
      '_NAME_ を▼zap▼するには畏れ多かったので、取りやめた。',
   );

   # 襲撃時のお知らせ
   my @announce_selectkill =(
      '',
      '_NAME_ に _COUNT_人がレーザー・ガンを向けた。',
      '_NAME_ は襲撃された。',
      '',
      '',
   );

	# 優勢側をアナウンス
	my @announce_lead =(
		'村人と人狼の人数が等しく、勢力は拮抗しているようです。',
		'村人が多く、村人陣営が優勢のようです。',
		'人狼が多く、人狼陣営が優勢のようです。',
	);

   # 委任投票のお知らせ
   my @announce_entrust = (
      '_NAME_は▼zap▼を委任しています。_RANDOM_',
      '_NAME_は▼zap▼を委任しようとしましたが、解決不能でした。_RANDOM_',
   );

   # コミット
   my @announce_commit = (
      '_NAME_が時を進めることを諦めた。',
      '_NAME_は時が進むよう、天井を操作した。',
   );

   # コミット状況
   my @announce_totalcommit = (
      '「時間を進める」を選択している人は、まだ少ないようです。', # 0〜1/3の時
      '「時間を進める」を選択している人が増えてきているようです。', # 1/3〜2/3の時
      '多数の人が「時間を進める」を選択していますが、全員ではないようです。', # 2/3〜n-1の時
      '全員が「時間を進める」を選択しています。', # 全員コミット済み
   );

   # 襲撃結果メッセージ
   my @announce_kill = (
      '時は来た。村人達は集まり、互いの姿を確認する。',
      '犠牲者はいないようだ。殺戮の手は及ばなかったのだろうか？',
      '_TARGET_ が無残な姿で発見された。',
   );
   
   my %status_live = (
      live       =>  '生存した',
      executed   =>  '▼zap▼',
      victim     =>  '襲われた',
      cursed     =>  '衝撃だった',
      droop      =>  '時間切れ',
      suicide    =>  '後追った',
      feared     =>  '知ってしまった死',
      suddendead =>  '突然死',
   );

   # 勝敗メッセージ
   my @announce_winner = (
      '全ての人物が消え失せた。無人のコンプレックスはやがて朽ち果てるのだろう。',
      '非認可の組織は全滅した……。結社に怯える日々は去ったのだ！',
      '市民達は自らの過ちに気付いた。<br>結社の残党は最後の破壊活動を済ませると、赤の広場を建設したのだ。ハラショー！同志！',
      '市民達は気付いてしまった。もう疑いあう必要なんてないことに。<br>土に根を下ろし、風と共に生きよう。種と共に冬を越え、鳥と共に春をうたおう。',
      '全ての結社員を退治した……。<br>だが、崩壊したコンプレックスは戻らない。<br>土に根を下ろし、風と共に生きよう。種と共に冬を越え、鳥と共に春をうたおう。どんなに恐ろしい武器を持っても、たくさんのかわいそうな市民を操っても。土から離れては、生きられない。',
      'その時、結社員は勝利を確信し、そして初めて過ちに気づいた。持ち込んだ装備もまた、朽ちて使い物にならないことに。<br>土に根を下ろし、風と共に生きよう。種と共に冬を越え、鳥と共に春をうたおう。どんなに恐ろしい武器を持っても、たくさんのかわいそうな市民を操っても。土から離れては、生きられない。',
      '市民達は、そして結社員も自らの過ちに気付いた。党はさらなる諜報員を送り込んでいたと。<br>たったひとりの結社員は最後の破壊活動を済ませると、赤の広場を建設したのだ。称える者すらない広場を。',
      '市民も、「人狼」も、ミュータントでさえも、恋人たちの前では無力でした。<br>必ず最後に愛は勝つのです。ところで愛って一口いくら？',
      '',
      '全ての人物が消え失せた。無人のコンプレックスはやがて朽ち果てるのだろう。',
   );

   # 勝利者
   my @caption_winner = (
      '',
      '市民の勝利',
      '結社の勝利',
      '教祖の勝利',
      '妖精の勝利',
      '妖精の勝利',
      '一匹狼の勝利',
      '恋人達の勝利',
      '',
      '勝利者なし',
   );

	my %role_win = (
		WIN_NONE     => '--',
		WIN_DISH     => '据え膳',
		WIN_LOVER    => '恋人陣営',
		WIN_HATER    => '邪気陣営',
		WIN_LONEWOLF => '一匹狼',
		WIN_HUMAN    => '村人陣営',
		WIN_WOLF     => '人狼陣営',
		WIN_PIXI     => '妖精',
		WIN_GURU     => '外世界の教祖',
		WIN_EVIL     => '裏切りの陣営',
	);

    # イベント名
    my @eventname = (
        '', ''    , '', '', '', '', '', '', '', '',
        '', ''    , '', '', '', '', '', '', '', '',
    );

   my @explain_event = (
'未定義のイベントです。',
'今日は、特別なことのない一日のようだ。さあ普段通り、誰かを処刑台にかけよう。',
'<b>四月馬鹿</b><br>大変、大変、大変なことになった。きみの役職は変化しているかもしれない。もしも誰かと絆を結んでいるなら、急に相手が憎くなってしまい、絆の相手にしか投票できない。そして今夜だけは、相方の後を追うことはないことを悟ってしまった……。',
'<b>二重スパイ</b><br>なんということだろう！一人が村側を裏切り、狼に与してしまった。明日以降も、彼は村人を裏切り続けるだろう……。',
'<b>妖精の輪</b><br>なんということだろう！一人が森に立ち入り、妖精の養子になってしまった。明日以降も、彼は村人を裏切り続けるだろう……。',
'<b>日蝕</b><br>暗い日蝕が村中を覆い、お互い顔も名前も解らない。この闇夜は、丸一日続くだろう。',
'<b>Sir Cointoss</b><br>コイントス卿はこの村の投票結果に意見があるようでございます。卿の御意向によっては、処刑を取り止めにすることもあります。五分五分くらいかな。',
'<b>影響力</b><br>今日の投票箱は無色透明だ。投票した瞬間にその中が見えるから、投票をセットするときは気を付けて！',
'<b>奇跡</b><br>帰ってきた！黄泉の国から人狼による犠牲者達がかえってきた！能力は失ったかもしれないけれど、それは些細なことだよ！ね！',
'<b>聖者のお告げ</b><br>聖者は民の夢枕に告げられました。今の任より、保安官にふさわしい人物がいると。あたらしい保安官は皆に喝采で迎え入れられるだろう。',

'未定義のイベントです。',
'<b>不満</b><br>村には不満が鬱屈している。今夜の投票でまた人間を処刑してしまったら……悪夢が始まるのだ。',
'<b>熱意</b><br>村には期待に満ちた熱意が渦巻いている。今夜の投票がひとならぬものを処刑できたなら……悪夢が始まるのだ。',
'<b>悪夢</b><br>恐ろしい一日が始まる。さあ投票して、こんな日が早く過ぎ去ってしまうよう、祈りを捧げよう。',
'<b>亡霊</b><br>今夜、人狼に襲われた人は人狼になる。また、今夜襲撃を実行した人狼は命を落としてしまうだろう。',
'<b>逃亡</b><br>せめて一人だけでも、なんとかして逃がそう。今夜の投票で逃亡者を一人決め、夜中の処刑のかわりに密かに逃がすのだ。<br>しかし逃亡者は一日のあいだ逃亡生活を続け、ついに村へと帰還してしまう。帰還者の票は通常の三倍尊重されるだろう。',
'<b>降霊会</b><br>こっくりさん、こっくりさん……',
'未定義のイベントです。',
'未定義のイベントです。',
'未定義のイベントです。',
);

   # アイテム名
   my @giftname = (
      'おまかせ',          'なし',  '喪失',  '感染',  '','光の輪', '魔鏡', '結社のスパイ', '新人ミュータント', '結社のお仲間',
      ''        ,'チームリーダー','夢占師',      '',  '',      '',     '',             '',                 '',             '',
   );

   # アイテム名（省略時）
   my @giftshortname = (
      '',   '', '喪', '', '', '光',   '','結',  '', '',
      '', 'TL',   '', '', '',   '',   '',  '',  '', '',
   );

   # アイテム用特殊発言欄のラベル
   my @caption_giftsay = (
      '', '', '', '', '', '', '', '囁き', '', '',
      '', '', '', '', '', '', '',     '', '', '',
   );

   # アイテム能力名
   my @abi_gift = (
      '',        '',     '', '', '', '渡す', '渡す', '襲う', '', '',
      '', '▼zap▼', '占う', '', '',     '',     '',     '', '', '',
   );

   # 役職名
   my @rolename = (
      'おまかせ','発泡飲料支給',''              ,''            ,'信号線支給'  ,''                ,''                ,''              , ''           ,''              ,
      ''        ,''            ,''              ,''            ,''            ,'モラルオフィサー','陽電子砲支給'    ,'石綿鎧支給'    ,'お忍びＵＶ様',''              ,
      ''        ,''            ,'時限爆弾支給'  ,''            ,''            ,'超ＡＥＤ支給'    ,'Ｘ線スコープ支給','スケープゴート',''            ,''              ,
      ''        ,''            ,'手鏡支給'      ,'テレパ椎'    ,''            ,''                ,''                ,''              ,''            ,''              ,
      ''        ,''            ,''              ,'放送ジャック','結社無線'    ,'結社入門'        ,''                ,''              ,''            ,''              ,
      ''        ,''            ,''              ,''            ,''            ,''                ,''                ,''              ,''            ,''              ,
      ''        ,'結社員'      ,''              ,'結社員'      ,''            ,''                ,'結社アイドル'    ,''              ,''            ,''              ,
      ''        ,''            ,''              ,''            ,''            ,''                ,''                ,''              ,''            ,''              ,
      ''        ,''            ,''              ,''            ,''            ,''                ,''                ,''              ,''            ,'悪戯妖精'      ,
      ''        ,''            ,''              ,'弟子'        ,'盗賊'        ,''                ,'一匹狼'          ,'外世界教祖'    ,''            ,''              ,
   );

   # 役職名（省略時）
   my @roleshortname = (
      '',   '泡', ''  , ''  , '信', ''   , ''  , ''  , ''  , ''  ,
      '',   ''  , ''  , ''  , ''  , '志' , '壁', '綿', 'UV', ''  ,
      '',   ''  , '爆', ''  , ''  , 'AED', 'Ｘ', '贄', ''  , ''  ,   
      '',   ''  , '鏡', '念', ''  , ''   , ''  , ''  , ''  , ''  ,
      '',   ''  , ''  , '放', '囁', '入' , ''  , ''  , ''  , ''  ,
      '',   ''  , ''  , ''  , ''  , ''   , ''  , ''  , ''  , ''  ,
      '',   ''  , ''  , '結', ''  , ''   , '結', ''  , ''  , ''  ,   
      '',   ''  , ''  , ''  , ''  , ''   , ''  , ''  , ''  , ''  ,
      '',   ''  , ''  , ''  , ''  , ''   , ''  , ''  , ''  , '戯',   
      '',   ''  , ''  , '弟', '盗', ''   , '壱', '教', ''  , ''  ,   
   );

   # 能力者用特殊発言欄のラベル
   my @caption_rolesay = (
      '',''    ,''    ,''        ,'共鳴',''    ,''    ,''    ,'',''    ,
      '',''    ,''    ,''        ,''    ,''    ,''    ,''    ,'',''    ,
      '',''    ,''    ,''        ,''    ,''    ,''    ,''    ,'',''    ,
      '','念話','念話','念話'    ,''    ,''    ,''    ,''    ,'',''    ,
      '',''    ,''    ,'放送'    ,'囁き',''    ,''    ,''    ,'',''    ,
      '','囁き',''    ,''        ,''    ,''    ,''    ,''    ,'',''    ,
      '','囁き','囁き','囁き'    ,'囁き','囁き','囁き','囁き','',''    ,
      '',''    ,''    ,''        ,''    ,''    ,''    ,''    ,'',''    ,
      '',''    ,''    ,''        ,''    ,''    ,'囁き',''    ,'',''    ,
      '',''    ,''    ,''        ,''    ,''    ,''    ,''    ,'',''    ,
   );

   # 能力名
   my @abi_role = (
      '',''    ,''    ,''    ,''    ,''        ,''    ,'探知','','',   
      '',''    ,''    ,''    ,''    ,''        ,'狙う',''    ,'','',   
      '',''    ,''    ,''    ,''    ,'ショック','覗き','疑う','','',   
      '','隠す','換る',''    ,''    ,''        ,''    ,''    ,'','',   
      '',''    ,''    ,''    ,''    ,''        ,''    ,''    ,'','',   
      '','襲う',''    ,''    ,''    ,''        ,''    ,''    ,'','',   
      '','襲う','襲う','襲う','襲う','襲う'    ,'襲う',''    ,'','',   
      '',''    ,''    ,''    ,''    ,''        ,''    ,''    ,'','',   
      '',''    ,''    ,''    ,'結ぶ',''        ,''    ,''    ,'','',   
      '',''    ,''    ,'入門',''    ,''        ,'襲う','誘う','','',
   );

   # 説明
   # 説明
   my $stat_kill   = '殺害します。ただし、対象が護衛されているか、光の輪を渡されているか、妖精、もしくは一匹狼であれば、効力は発揮しません。また、対象が結社入門者であれば結社員になります。対象がアスベストアーマーを着込んでいる場合即死しませんが、彼はあと一日の命でしょう。';
   my $stat_wolf   = '毎夜、結社全員で一人だけ、市民を'.$stat_kill.'<br>';
   my $stat_wisper = '結社（と、結社無線を持ってしまった市民）同士にしか聞こえない会話が可能です。<br>';
   my $stat_pixi   = '結社に殺されることがありません。勝利条件では市民にも結社にも数えられません。<br>市民は勿論知りませんが、外世界には美しい空、緑豊かな森、澄み切った湖が広がり、そして、沢山のミュータントが住んでいます。<br>';
   my $stat_enemy  = '市民でありながら、結社に協力する裏切り者です。勝利条件では市民扱いで集計されるため、場合によっては敢えて死ぬ必要があります。';
   my $stat_fm     = '自分以外に信号線が支給されたのは誰か、知っています。';
   my $act_seer    = '';
   my $act_medium  = '';
   my $stat_seer   = '';
   my $know_seer   = '';
   my $know_wisdom = '持つ役職がわかります。恩恵は、役職とは違います。このため結社のお仲間、結社のスパイ、新人ミュータントを直接見分けることはできません。';
   my $stat_droop  = 'あなたに固定された爆弾は、生きた結社員の人数の二日後に起爆します。南無。';
   my $stat_other  = 'あなたは、勝利条件では市民として数えられます。';

   my @explain_gift = (
'',
'',
'<p>あなたは光の輪を<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Gift)GIFTID_LOST" TARGET="_blank">喪失</A>しました。<br>もう手にすることはないでしょう。もし、光の輪があなたの手に渡ったら、光の輪は消え去ってしまいます。そして、あなたがそれに気付くことはないでしょう。</p>',
'<p></p>',
'',
'<p>あなたを<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Gift)GIFTID_SHIELD" TARGET="_blank">光の輪</A>が取り巻きます。<br>あなたはもし昨夜、襲撃されていたとしても守られました。<br>光の輪はひとりを一度しか守りません。もし渡した光の輪がふたたびあなたの手に渡ったら、光の輪は消え去ってしまいます。次に光りに守られるべき良き友を選びましょう。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Gift)GIFTID_FINK" TARGET="_blank">結社のお仲間</A>です。<br>あなたには市民の装備が与えられましたが、あなたは結社の門を叩きました。<br>'.$stat_enemy.'</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Gift)GIFTID_OGRE" TARGET="_blank">結社のスパイ</A>です。<br>あなたには市民の装備が与えられましたが、あなたは結社の門を叩きました。<br>'.$stat_wolf.'また、'.$stat_wisper,'</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Gift)GIFTID_FAIRY" TARGET="_blank">新人ミュータント</A>です。<br>あなたには市民の装備が与えられましたが、ミュータントでもあったのです！'.$stat_pixi.'</p>',
'',

'',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Gift)GIFTID_DECIDE" TARGET="_blank">チームリーダー</A>です。<br>あなたは追加票を投じる権利を持ちつづけます。行使することで、健在を示すこともできるでしょう。</p>',
'',
'',
'',
'',
'',
'',
'',
'',
   );

   my @explain_role = (
'<p>あなたは、未定義の役職です。</p>',
'<p>あなたには<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_VILLAGER" TARGET="_blank">発泡飲料</A>が支給されましたです。<br>特殊な能力はもっていません。楽しいな！</p>',
'<p></p>',
'<p></p>',
'<p>あなたには<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_SYMPATHY" TARGET="_blank">信号線</A>が支給されました。<br>'.$stat_fm.'<br>そして、あなたは他の支給者と信号線で通話することができます。</p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',

'<p>あなたは、未定義の役職です。</p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_FAN" TARGET="_blank">モラルオフィサー</A>です。<br>あなたが命を落とした翌日、市民達は暴力的にふたりを▼zap▼するでしょう。</p>',
'<p>あなたには<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_HUNTER" TARGET="_blank">プラズマ・キャノン</A>が支給されました。<br>毎夜、一人を付け狙います。<br>あなたが命を落とす夜に、あなたはついに引き金を引き狙った人物を'.$stat_kill.'</p>',
'<p>あなたには<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_WEREDOG" TARGET="_blank">アスベスト・アーマー</A>が支給されました。<br>あなたは襲撃されると傷を負うものの、一日だけ生き長らえます。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_PRINCE" TARGET="_blank">お忍びＵＶ様</A>です。<br>あなたが▼zap▼されることに決まると一度だけ、その▼zap▼はとりやめになります。</p>',
'<p></p>',

'<p>あなたは、未定義の役職です。</p>',
'<p></p>',
'<p>あなたには<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_DYING" TARGET="_blank">時限爆弾</A>が支給されました。<br>'.$stat_droop.'</p>',
'<p></p>',
'<p></p>',
'<p>あなたには<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_WITCH" TARGET="_blank">超ＡＥＤ</A>が支給されました。<br>あなたは二日目以降、生きている者にショックを与えて殺害するか、死者にショックを与えて蘇生させます。ただし、殺害（生者を選ぶ）、蘇生（死者を選ぶ）、はそれぞれ一度ずつだけおこなうことができ、それっきり装置は壊れてしまいます。装置を使うにはあらかじめ準備するので、もしもショッキングな夜に対象の生死が変化しても、効能も変化せず無駄に使われてしまうでしょう。</p>',
'<p>あなたには<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_GIRL" TARGET="_blank">Ｘ線スコープ</A>が支給されました。<br>あなたは二日目以降、夜に出歩くことができます。顔や名前はあなたには判りませんが、結社の囁き、星人の念話、信号線の通話を聞いちゃうことでしょう。ただしこのとき、もしあなたが、結社の、誰かひとりにでも襲撃される矛先に含まれていると、実際に襲われる犠牲者とは別に死んでしまいます。この死亡を護衛する方法はありません。また、息を引き取るあなたを尻目に、結社員達は別の人物を襲撃するでしょう。</p>',
'<p>あなたは悲しい<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_ELDER" TARGET="_blank">スケープゴート</A>です。発砲飲料すら飲み尽くしてしまいました。<br>もし処刑の投票数が同数になり、そのうちの一人があなたであったとき、混乱した市民達に処刑されてしまいます。あなたが最後に指差した人は、後悔する市民達に翌日、処刑されるでしょう。</p>',
'<p></p>',
'<p></p>',

'<p>あなたは、未定義の役職です。</p>',
'<p></p>',
'<p>あなたには<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_SNATCH" TARGET="_blank">小さなコンパクト</A>が支給されました。<br>好きな人物の顔と名前を奪い、自身のそれと入れ替えることができます。この能力は非常に露顕しやすいので、行使には注意が必要です。<br>もしも夜の間に屍体になった人を対象に選んだなら、旧いあなたは命を落とし、あなたであるその屍体は息を吹き返すでしょう。また、絆や、信者になったことは姿とともにあり、姿を移し替えたときに引き継ぐことがあります。<br>それから、ゆんゆん会話が可能です。できるんだって。<br>'.$stat_enemy.'</p>',
'<p>あなたは念波星人の末裔です。<br>ゆんゆん会話が可能です。できるんだって。<br>'.$stat_enemy.'</p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',

'<p>あなたは、未定義の役職です。</p>',
'<p></p>',
'<p></p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_MUPPETER" TARGET="_blank">放送システム</A>を奪いました。<br>あなたは_NPC_の口を借り、言葉を伝えることができます。<br>'.$stat_enemy.'</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_WISPER" TARGET="_blank">結社無線</A>をなぜか持っています。<br>'.$stat_wisper.$stat_enemy.'少人数になると勝敗が確定する状況もあります、ですがこの場合も自動で終了することはありません。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_SEMIWOLF" TARGET="_blank">結社に入門</A>しました。<br>あなたが襲撃されるとハクがつき、あなたは晴れて結社に迎え入れられます。<br>'.$stat_enemy.'</p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',

'<p>あなたは、未定義の役職です。</p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',

'<p>あなたは、未定義の役職です。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_WOLF" TARGET="_blank">非認可の結社</A>に所属しています。<br>'.$stat_wolf.'また、'.$stat_wisper.'</p>',
'<p></p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_INTWOLF" TARGET="_blank">非認可の結社</A>に所属しています。<br>仲間や自分が▼zap▼した市民が'.$know_wisdom.'<br>'.$stat_wolf.'また、'.$stat_wisper.'</p>',
'<p></p>',
'<p></p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_CHILDWOLF" TARGET="_blank">結社員のアイドル</A>です。<br>'.$stat_wolf.'また、'.$stat_wisper.'あなたが命を落とした翌日、結社は二つの襲撃をおこない、二人を一度に殺害します。</p>',
'<p></p>',
'<p></p>',
'<p></p>',

'<p>あなたは、未定義の役職です。</p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',

'<p>あなたは、未定義の役職です。</p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p></p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_TRICKSTER" TARGET="_blank">悪戯妖精</A>(ミュータント)です。<br>悪戯妖精は一日目、好きな二人に“運命の絆”を結びつける事ができます。“運命の絆”を結んだ人は、片方が死亡すると後を追って死亡します。結ばれた彼らにとっては、単なるはた迷惑な悪戯にすぎません。<br>'.$stat_pixi.'</p>',

'<p>あなたは、未定義の役職です。</p>',
'<p></p>',
'<p></p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_LOVER" TARGET="_blank">弟子</A>です。<br>一日目、好きな人物を師匠として選び、“運命の絆”を結びつけ、弟子入りします。次の朝、あなたは絆の師匠と同じ役職になっているでしょう。“運命の絆”を結んだ二人は、片方が死亡すると後を追って死亡します。<br></p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_ROBBER" TARGET="_blank">盗賊</A>です。<br>あなたは、誰もならなかった残り役職をすべて知ります。次の夜、その中から運命の導くままひとつの役職を選び、仮面の役職に成り代わるでしょう。運命は、あなたになにを課すでしょうか？</p>',
'<p></p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_LONEWOLF" TARGET="_blank">一匹狼</A>です。<br>結社員ですが、他の結社員とは別個に襲撃し、市民や結社員を殺害します。'.$stat_kill.'<br>さらに、襲撃先は他の結社員でもかまわず、あなた自身は、結社員の襲撃や賞金稼の手により殺されることはありません。</p>',
'<p>あなたは<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_GURU" TARGET="_blank">外世界の教祖</A>です。<br>教祖は毎晩ふたりずつ、好きな人物をひそかに誘い込むことができます。自分自身を誘うことはできません。<br>誘い込まれた当人たちは信者となって夜な夜な宗教儀式に耽り、そのことを覚えています。しかし、彼らの能力や所属陣営などに変化はありません。<br>また、'.$stat_other.'</p>','<p></p>',
'<p></p>',
   );

   # 役職希望
   my %explain = (
      prologue => 'あなたは_SELROLE_を希望しています。ただし、希望した通りの能力者になれるとは限りません。',
      dead     => 'あなたは_ROLE_ですが、命を落としました。',
      mob      => 'あなたは<b>_ROLE_の<A href="http://crazy-crazy.sakura.ne.jp/giji/?(Role)ROLEID_MOB" TARGET="_blank">見物人</A></b>です。あなたは勝敗に関与せず、いかなる陣営の人数にも含まれません。',
      epilogue => 'あなたは_ROLE_でした（_SELROLE_を希望）。',
      explain_role  => \@explain_role,
      explain_gift  => \@explain_gift,
   );

   # 投票欄表示
   my @votelabels = (
      '▼zap▼',
      '委ねる',
   );


   # 聖痕者の色
   # 五人揃っている所を見てみたい（おい
   my @stigma_subid = (
      '赤の',
      '青の',
      '黄の',
      '緑の',
      '桃の',
      '白の',
      '銀の',
   );

   # 占い結果
   my @result_seer = (
      '_NAME__RESULT_',
      'は 人間 のようだ。',
      'は 【結社員】のようだ。',
      'は 【能力者ではない】ようだ。',
      'は 能力者のようだ。',
      'は _ROLE_ のようだ。',
      'を調べることができなかった。',
   );

   # 配分表名称
   my %caption_roletable = (
      custom   => '自由設定',
   );

   # アクション
   my @actions = (
      'につかいこまれた。',
      'にスパム缶を押しつけた。',
      'に画期的なミッションを提案した。さあ、きみも参加しよう！',
      'にロケットシューズを差し出した。10、9、8、……',
      'に「Thiotimoline」と書かれた注射を投与した。',
      'にアスベストアーマーを謹んで進呈した。',
      'にゴシゴシボットをけしかけた。',
      'にあっかんべーをした。',
      'にむぎゅうした。',
      'にクラクションを鳴らした。',
      'にお辞儀をした。',
      'にひどくうろたえた。',
      'に謹んで賄賂を差し出した。',
      'を不信の目で見た。',
      'をつんつんつついた。',
      'を秘密警察(IntSec)に通報しますた。',
      'をじっと見つめた。',
      'を慰める振りをした。',
      'を巻き添えにした。',
      'を秘密結社に招待した。',
      'を「同志！」と呼んでみた。',
      'を空の彼方にぶっ飛ばした。',
      'をセラミックハリセンで殴った。',
      'を純白(Ultra-Violet)のハリセンで殴った。',
      'を自殺的ボランティアに推薦した。',
      'を電子レンジで乾かしてさしあげた。',
      'をプラズマキャノンの的にしてみた。',
      'をトンデモ理論で弁護した。',
      'を冷凍庫に放り込んだ。',
      'を医療ポッドに捧げた。',
      'の装備を取り上げて、じろじろ覗き込んだ。',
      'の足下を指さした。たいへん、地面がありませんよ。',
      'の頭を撫でた。',
      'の行いを、最新の「反逆っぽい行動リスト」から見つけ出した。',
      'の靴をほこりひとつないほどに舐め回した。',
      'のチョコレートを借用した。',
      'と試用したR&Dの新装備に、Ａ評価をつけた。',
      'とにやりと微笑みあった。',
      'から逃げ出した！しかし、回り込まれてしまった！',
   );

   my %textrs = (
      CAPTION => 'PARANOIA',
      HELP    => 'ようこそ、トラブルシューター。市民達は進行中以外はクローンにされたり、セキュリティ・クリアランスが変ったりします。<br>！注意！　入村直後の市民はクローンではありません。ただちに別れを告げてあげましょう。　！注意！',
      FORCE_DEFAULT => 'custom',

      # ダミーキャラの参加表示（○○がやってきました）の有無
      NPCENTRYMES => 0,

      # 公開アナウンス
      ANNOUNCE_EXTENSION  => '定員に達しなかったため、村の更新日時が24時間延長されました。',
      ENTRYMES            => '_NAME_ が参加しました。',
      EXITMES             => '_NAME_がいたような気がしたが、気のせいだったようだ……(_NAME_は村を出ました)',
      SUDDENDEATH         => '_NAME_ は、突然死した。',
      SUICIDEBONDS        => '_NAME_ は絆に引きずられるように _TARGET_ の後を追った。',
      SUICIDELOVERS       => '_NAME_ は哀しみに暮れて _TARGET_ の後を追った。',
      ANNOUNCE_RANDOMVOTE => '(ランダム投票)',
      ANNOUNCE_VICTORY    => '_VICTORY_です！<br>',
      ANNOUNCE_EPILOGUE   => '_AVICTORY_全てのログとユーザー名を公開します。_DATE_ まで自由に書き込めますので、今回の感想などをどうぞ。',

      RANDOMENTRUST => '(ランダム委任)',

      # 能力関連
      UNDEFTARGET     => '（パス）',
      RANDOMTARGET    => 'ランダム',
      RANDOMROLE      => 'ランダム', # 役職ランダム希望
      NOSELROLE       => '全ての希望を無視し、装備を与える。',
      SETRANDOMROLE   => 'COMPUTERは _NAME_ の役職希望を _SELROLE_ に決めた。',
      SETRANDOMTARGET => '_NAME_ は _ABILITY_ の対象を神に任せた。神は _TARGET_ に決めた。',
      CANCELTARGET    => '_NAME_ は _ABILITY_ をとりやめた。',
      EXECUTESEER     => '_NAME_ は、_TARGET_ を占った。',
      EXECUTEKILL     => '_TARGET_！ 今日がお前の命日だ！',
      EXECUTEALCHEMIST=> '_NAME_ は、秘薬を飲み下した。',
      EXECUTEKILLWITCH=> '_NAME_ は、_TARGET_ を殺害した。',
      EXECUTELIVEWITCH=> '_NAME_ は、_TARGET_ を蘇生させた。',
      EXECUTEGUARD    => '_NAME_ は、_TARGET_ を守っている。',
      EXECUTEJAMM     => '_NAME_ は、_TARGET_ を隠している。',
      EXECUTETRICKSTER=> '_NAME_ は、_TARGET1_ と _TARGET2_ との間に運命の絆を結んだ。',
      EXECUTELOVER    => '_NAME_ は、_TARGET_ との間に運命の絆を結んだ。',
      EXECUTEGURU     => '_NAME_ は、_TARGET_ を誘い込んだ。',
      EXECUTESNATCH   => '_NAME_ は、_TARGET_ の姿を奪った。', 
      EXECUTEFAN      => '_NAME_ が遺した扇り文句は、村中を異様な雰囲気に包んだ。', 
      EXECUTECHILDWOLF=> '_NAME_ は、か細く鳴き、こときれた。', 
      EXECUTEGIRL     => '_NAME_ が、こっそりお散歩したようだ。',
      EXECUTEGIRLFEAR => '_NAME_ は、恐ろしいものを見てしまった！',
      EXECUTETHROW    => '_NAME_ は、_TARGET_ に_GIFT_を差し出した。',
      EXECUTELOST     => '_NAME_ には、_GIFT_は届かなかった…',
      EXECUTESHIELDBRK=> '_NAME_ に光の輪が渡され、人知れず破壊した。',
      RESULT_RIGHTWOLF=> '人狼の血族だったようだ。<br>（狼血族のあなたは、占い師に人狼と判定されます。ですが、あなたは村人で、勝利条件も変わりません。勝利を目指して頑張りましょう。）',
      RESULT_MEMBER   => '_NAME_ から、 _RESULT_ の気配を感じた。',
      RESULT_FANATIC  => '_NAME_ から、結社員の気配を感じた。',
      RESULT_BAT      => '_NAME_ から、妖精の気配を感じた。',
      RESULT_GUARD    => '_TARGET_ を襲撃から守った。',
      RESULT_JAMM     => '_TARGET_ の正体を占い師から隠した。',
      RESULT_TRICKSTER=> '_TARGET1_ と _TARGET2_ との間に運命の絆を結んだ。',
      RESULT_KILL     => '_TARGET_ を殺害した。',
      RESULT_LIVE     => '_TARGET_ を蘇生した。',
      RESULT_ALCHEMIST=> 'あなたは、秘薬を飲み下した。',
      RESULT_ELDER    => '傷を負った。', 
      RESULT_WEREDOG  => '傷を負った。あと一日の命だ。', 
      RESULT_SEMIWOLF => '結社員に迎えられた。',
      RESULT_LOVER    => 'あなたは _TARGET_ と運命を分かち合いました。',
      RESULT_LOVEE    => '_NAME_ が、あなたと運命を分かち合いました。',
      RESULT_ROBBER   => 'あなたは盗賊だ。<br>_ROLE_、から選び、仮面を纏う。',
      RESULT_DYING    => 'あなたは、もし結社員が_NUMBER_名なら今夜、命を落とす。',
      RESULT_GURU     => '_TARGET_ を誘い込んだ。',
      RESULT_THROW    => '_TARGET_ に_GIFT_を差し出した。',
      STATE_SHEEPS   => ' 踊り狂った、おぼろげな記憶がある。',
      STATE_BONDS    => 'あなたは _TARGET_ と運命の絆を結んでいます。',
      STATE_BIND      => 'あなたはもう、特殊能力を使うことができません。',
      STATE_BIND_ROLE => 'あなたはもう役職能力を使うことができません。',
      STATE_BIND_GIFT => 'あなたはもう恩恵能力を使うことができません。',

      WIN_HUMAN       => '<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Text)WIN_HUMAN" TARGET="_blank">市民陣営</A></b><br>市民の数が結社の数以下になるまでに結社とミュータント（妖精）が全滅すれば勝利です。<br>ただし、結社を全滅させた時点でミュータント（妖精）が生き残っていると敗北になります。',
      WIN_WOLF        => '<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Text)WIN_WOLF" TARGET="_blank">結社陣営</A></b><br>ルール「タブラの人狼」「死んだら負け」「Trouble☆Aliens」では人間(妖精や人外の者を除く)の数を結社と同数以下まで減らせば、ルール「ミラーズホロウ」「深い霧の夜」では発泡飲料を支給された市民を全滅させれば勝利です。<br>ただし、最後までミュータント（妖精）が生き残っていると敗北になり、他にも横から勝利を掻っ攫うもの達が存在します。',
      WIN_LONEWOLF    => '<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Text)WIN_LONEWOLF" TARGET="_blank">一匹狼陣営</A></b><br>ルール「タブラの人狼」「死んだら負け」「Trouble☆Aliens」では市民(ミュータントを除く)の数を一匹狼と同数以下まで減らせば、ルール「ミラーズホロウ」「深い霧の夜」では発泡飲料を支給された市民を全滅させ、かつ、結社陣営の結社員が生きていなければ勝利です。<br>',
      WIN_PIXI        => '<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Text)WIN_PIXI" TARGET="_blank">妖精陣営</A></b><br>結社が全滅するか、市民(ミュータントを除く)の数が結社と同数以下まで減るまで「生き残れば」勝利です。ただし、横から勝利を掻っ攫うもの達が存在します。',
      WIN_GURU        => '<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Text)WIN_GURU" TARGET="_blank">教祖</A></b><br>教祖以外の生存者が信者だけになれば勝利となります。教祖自身は、最終的に生き残っていなくとも構いません。<br>ただし、横から勝利を掻っ攫うもの達が存在します。',
      WIN_EVIL        => '<b><A href="http://crazy-crazy.sakura.ne.jp/giji/?(Text)WIN_EVIL" TARGET="_blank">裏切りの陣営</A></b><br>市民が敗北すれば勝利です。ただし、恋人が勝利した場合は敗北します。<br>あなたと勝利をともにする陣営は、ひとつだけではないかもしれません。',
      MARK_BONDS      => '絆',

      # アクション関連
      ACTIONS_ADDPT          => 'に話の続きを促した。_REST_',
      ACTIONS_RESTADDPT      => '(残_POINT_回)',
      ACTIONS_BOOKMARK       => 'ここまで読んだ。',
      ACTIONS_CLEARANCE_UP   => 'のセキュリティ・クリアランスを引き上げた。',
      ACTIONS_CLEARANCE_DOWN => 'のセキュリティ・クリアランスを引き下ろした。',
      ACTIONS_CLEARANCE_NG   => 'しかし、認められなかった。',
      ACTIONS_ZAP            => 'に別れを告げた。次のクローンはもっとうまくやるだろう。_COUNT_',
      ACTIONS_ZAPCOUNT       => '(_POINT_回目)',

      # 操作ログ関連
      ANNOUNCE_SELROLE    => '_NAME_ は _SELROLE_ になれるよう、COMPUTERに祈った。（他の人には見えません）。',
      ANNOUNCE_SETVOTE    => '_NAME_は、_TARGET_ を▼zap▼先に選びました。',
      ANNOUNCE_SETENTRUST => '_NAME_は、_TARGET_ に▼zap▼を委任しました。',
      ANNOUNCE_SETTARGET  => '_NAME_は、_TARGET_ を能力（_ABILITY_）の対象に選びました。',

      # ボタンのラベル
      BUTTONLABEL_PC  => '_BUTTON_ / 更新',
      BUTTONLABEL_MB  => '_BUTTON_',
      CAPTION_SAY_PC  => '発言',
      CAPTION_SAY_MB  => '発言',
      CAPTION_TSAY_PC => '独り言',
      CAPTION_TSAY_MB => '独り言',
      CAPTION_GSAY_PC => '呻き',
      CAPTION_GSAY_MB => '呻き',
      CAPTION_ROLESAY => \@caption_rolesay,
      CAPTION_GIFTSAY => \@caption_giftsay,

      ANNOUNCE_WINNER_DISH => 'そして、天に召された魚料理はとてもとても、幸せそうでしたとさ。',
      ANNOUNCE_WINNER      => \@announce_winner,
      ANNOUNCE_FIRST       => \@announce_first,
      ANNOUNCE_ROLE        => \@announce_role,
      ANNOUNCE_LIVES       => \@announce_lives,
      ANNOUNCE_VOTE        => \@announce_vote,
      ANNOUNCE_SELECTKILL  => \@announce_selectkill,
      ANNOUNCE_COMMIT      => \@announce_commit,
      ANNOUNCE_TOTALCOMMIT => \@announce_totalcommit,
      ANNOUNCE_ENTRUST     => \@announce_entrust,
      ANNOUNCE_KILL        => \@announce_kill,
      ANNOUNCE_LEAD        => \@announce_lead,
      STATUS_LIVE          => \%status_live,
      CAPTION_WINNER       => \@caption_winner,
      ROLEWIN              => \%role_win,
      ROLENAME             => \@rolename,
      ROLESHORTNAME        => \@roleshortname,
      GIFTNAME             => \@giftname,
      GIFTSHORTNAME        => \@giftshortname,
      ABI_ROLE             => \@abi_role,
      ABI_GIFT             => \@abi_gift,
      EXPLAIN              => \%explain,
      STIGMA_SUBID         => \@stigma_subid,
      RESULT_SEER          => \@result_seer,
      CAPTION_ROLETABLE    => \%caption_roletable,
      VOTELABELS           => \@votelabels,
      ACTIONS              => \@actions,
   );
   return \%textrs;
}

1;
