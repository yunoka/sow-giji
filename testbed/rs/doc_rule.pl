package SWDocRule;

#---------------------------------------------
# 禁止行為
#---------------------------------------------

#----------------------------------------
# コンストラクタ
#----------------------------------------
sub new {
	my ($class, $sow) = @_;

   my @n_rule_name = (
		'ここは長期人狼サーバーだ。短期はできない。',
		'情報ページ（ここ）を熟読する。',
		'ルールを守り、つねに心構えに気を配る。',
		'進行中は、どんな嘘でもＯＫ。',
		'ただし、（村建て人）、（管理人）の発言では嘘をつかないこと。',
		'突然死をしない。',
   );
   @n_rule_name[5] = '' if ($sow->{'cfg'}->{'RULE'} eq 'RP');
   my @n_rule_text = (
		'ネット上の人狼ゲームの種類は、<a href="http://crazy-crazy.sakura.ne.jp/giji/?(Knowledge)Guidance#l1">リンク先を参考</a>にしよう。人狼議事は長期人狼を遊ぶ場所なので、<a title=\"１０分とか、５分とか。……ひどいときは１分だぜ。クール！\">短期人狼</a>には対応していない。アクセスが集中すると、あの白くて殺風景な、忌々しい霧が発生するかもしれないんだ。２３時〜２時(２６時)の範囲は利用が集中しているので、特にあぶない。<br$net>こういう遊びかたには、もっとふさわしい<a href="http://wolfbbs.jp/%BF%CD%CF%B5%A5%AF%A5%ED%A1%BC%A5%F3.html#content_1_18">別の場所</a>があるから、そちらで思いっきり楽しむといい。',
		"参加したらもう、知らなかった、忘れてた、はナシだ。そしてそんなふうに言われないよう、解りやすいルールを見やすい場所に記そう。",
		"もし不明な部分、迷う部分があったら、抱えていることはない。プロローグのうちに積極的に問いかけて明らかにしておこう。ルール違反で迷惑を被ったなら、遠慮なく非難しよう。気付かなかった、はナシだ。",
		"",
		"プロローグ終了からエピローグ開始までが、ゲームの進行中だ。この期間は全員、勝利のためにあらゆる手段を講じている。だから、あらゆる発言が嘘かもしれないし、嘘と受け取られる可能\性があるんだ。<br$net>ただしプロローグとエピローグだけは特殊で、ルールそのものを作っていく場であり、すべて明らかになっての反省会でもある。ひょっとしたらルール違反の指摘もあるかもしれない。だから<a title=\"ホントごめん！仕事が終わらなかったんだ！とか、そういうやつ。\">勝つためと思われたくない主張</a>を本気でしたいときは、誤解の少ないエピローグまで待つ方が確実だ。<br$net>これはゲームを楽しむためのルールだけれど、村建て人と、管理人だけはそれでは困るんだ。彼等から特別な発言があったら、そこに嘘やハッタリは含まれていない。勝敗よりも優先することを発表\したり、問いかけたりするから、疑わずに聞いてほしい。",
		"丸一日のあいだ発言を一切しないと、その人物は死んでしまう。このことを突然死と呼んでいるんだ。<br$net>$sow->{'cfg'}->{'NAME_SW'}は会話を楽しむゲームだってことを思い出してほしい。これじゃ、なんのために村に参加したのか、わからないよね。だから死んでしまうことにしている。<br$net>事情があってなかなか喋れないとき、事情よりもゲームを優先するのはとても難しいことだ。だから、ゲームの時間が残るように、計算高くいろいろ企むといい。<br$net>突然死をすると有利になる状況は、よく探すとごろごろしてる。けれど狙わないこと。それはルール違反だ。",
   );
   my @v_rule_name = (
		'多重ログインをしない。',
		'システムの出力内容を、そのまま書き写さない。',
		'エピローグまで秘密を守る。参加中の村の内容は秘密だ。',
		'エピローグまで秘密を守る。希望した能力、画面を見ているきみが何者なのかは秘密だ。',
		'エピローグまで勝利を目指す。',
   );
   @v_rule_name[4] = '' if ($sow->{'cfg'}->{'RULE'} eq 'RP');
   @v_rule_name[4] = '' if ($sow->{'cfg'}->{'RULE'} eq 'PRETENSE');
   @v_rule_name[4] = '' if ($sow->{'cfg'}->{'RULE'} eq 'PERJURY');
   my @v_rule_text = (
		"つまり、同じ人が同じ村に、複数のキャラクターで参加してはいけない。それは狡いし、簡単に勝てるチョロい方法なんだ。そんな程度の勝ち方じゃつまらないだろ？",
		"きみなりの言葉で、伝えるべき内容を主張するんだ。そのほうが面白いし、きみの言葉を人間の綴る発言として読んで貰える。コンピューターのアウトプットしたオクテットストリングスなんかではなくてね。<br$net>そして読むときにも、機械っぽい正確さに頼らないこと。そんな考え方をしたせいで推理を誤ったって、誰のせいにもできない。",
		"きみ自身の役職、相方の存在、判定、思考していることなど、村に関わることを村の外で話してはいけない。場外乱闘はせず、<a title=\"プロレスと違って、１０秒以内でもダメ。\">リングで戦う</a>こと。",
		"これらの情報は、一方的に有利に働いたり、進行中に思考を変質させたりする。もう知っていることは忘れなくてかまわないが、黙ってること。",
		"誰かに急ぎ決着したい事情があろうと、誰かに諦めろと唆されようと、見るに耐えない仲間割れがあろうと、きみ自身に勝ち目がまったく考え出せなかろうと、ルールを守り、そして、勝利を目指すこと。特殊な勝敗ルールがある村では、その勝利を目指すんだ。<br$net>",
   );

   my @v_mind_name = (
		'村のルールは、プロローグ終了までに取り決めよう。',
		'プロローグでは、村にふさわしくないと感じた参加者を追い払える。',
		'必要なら、本来の更新日を一日のばせる。',
		'ルールは全員が理解してる？そうでないなら、どうしよう？',
		'この村のモラルの程度と方向性は？',
		'記号など（■、*、[]）の扱い方を取り決める？決めるならどう決める？',
   );
   my @v_mind_text = (
		"村建てフォームには標準的なルールが最初から記してある。賛同する内容はそのまま残し、不足なら筆を加え、余分と思ったルールは削除して村を建てよう。<br$net>一部の項目（国のルール）は編集できないようになってる。それは必須事項で、必ず守らなくてはならないからなんだ。村のルールで国のルールを否定しないこと。<br$net>書き忘れはないかな？１日目が始まると参加者に役職がつき、先を予\測して行動し始める。途中でルールに加筆・修正があると予\測が御破算になり、それでも既にしてしまった発言は元に戻らないんだ。",
		"できるならば、どういった点がふさわしくないか説明し、反省と改善を促そう。もしも気持ちが通じて、まずいところを改めて参加しなおして貰えれば最高だ。<br$net>いやな予\感がしたのによく考えず、そのまま開始するのはやめておこう。引き返せなくなってから破綻して、当人を含め皆が不幸せになる。",
		"在席困難なひとにチャンスを与え、全員に考える時間がたっぷり与えることが可能\だ。この機能\は２度まで使えるけれど、嘘をつかなくていい陣営にとって有利に働くので、慎重に扱うこと。最初に予\想していたゲームバランスとは、違ってくるだろうね。<br$net>どういった事態になったらこの機能\を使うのか、また、機能\行使のポリシーを予\め表\明しておけるかどうか、考えておくといい。",
		"ルールを守れるのは、解ってる人が集まるからだ。複雑なルールを加えていない？難解千萬ナル國語表\現ニ陥リテ如何（むずかしい言葉をつかってない）？ルールは見やすく掲示してある？疑問にすっきり答えきっている？",
		"「こだわり」アイコンは、もしもあらかじめやりたいことがあれば、それを表\現するためにある。<br$net>だけどきみの思いはアイコン一つじゃ伝わりきらないかもね。キーボードをもっと使って、言葉でとっくり説明したほうがいいかも！",
		"ちょっと暗記しておくと便利な記号の使い方があるんだ。詳しい人に聞いて、気に入ったら使ってみるといい。ただし、取り決めてないなら、黙っていきなり使っても理解して貰えるとは思わないこと。",
   );
   my @p_mind_name = (
		'これは会話を楽しむゲームだ。',
		'キャラクターを通して発言しよう。',
		'発言や行動に、うまく思いやりをこめられた？',
		'発言や行動に、棘や毒がまだ残ってない？',
		'言いたいことを言い尽くせた？そうでないなら、なぜ？',
		'きみへの論評に反論する？それとも受け入れる？それはなんのため？',
		'その嘘、ほんと？',
		'参加時間はお好みで。',
		'この村がすべてという姿勢を貫こう。',
		'能力には期待がかかる。受け止めきれるかな？',
		'役割には期待がかかる。受け止めきれるかな？',
		'楽しく参加できた？',
		'今日も健康でいられた？',
   );
   my @p_mind_text = (
		"きみの会話内容は評価される。絶賛されることも、酷評されることもあるだろうね。",
		"もしも画面を見ているきみ自身が言葉を綴りたくなったなら、ちょっと落ち着いてみよう。ほんとうにその言葉は、キャラクターでは口にできないことかな？<br$net>そして、落ち着いて考えてもその言葉が必要だと判断したら、もう躊躇わなくていい。",
		"きみ以外の参加者にも、尊重されるべき人格がある。彼等は敬意を受けるべきだ。それは味方に限らず、その村のライバルたちにも等しくね。きみの腕前の見せどころだ。<br$net>ただ、キャラクターがキャラクターに敬意を払うか、尊重するかはご自由に。",
		"紳士・淑女でいよう。きみがここにいるのは、周囲に刺々しさや毒気をばらまくためではなかったはずだ。",
		"更新までの時間や発言は、とても限られている。思いやりが不十\分だったり、刺々しさや毒気が残ってしまったとしても、懸命に考えたならやむを得ない。自分自身の未熟さを認めて発言ボタンを押そう。",
		"多くの評価がきみに向けられる。どう対応するのかで、きみは味方にも、敵にも、美しくも、情けなくも見えるだろうね。今日のきみは、周囲からどう見えると好都合だろう。",
		"言葉はどれも嘘かもしれないし、本当かもしれない。あっていい言葉が欠けているかもしれない。どうやって見極めよう？どうして見極めきれないんだろう？",
		"きみが好む時間に参加したいのと同様に、他の同村者も好む時間に参加したい。さて、どうやって両立させようか？",
		"もし浮気がばれてしまうと、悲しいことになる。皆が傷つき、きみは信用を失う。事実がどうであれ、掛け持ちで別村にいた、他の娯楽に現を抜かしていた、などと白状しないこと。たとえ厳しい追及にあっても、しらを切るほうがいい。<br$net>最初から浮気しない方法は、正直でいられる点でとても強力な防衛手段になる。",
		"投票、占い、襲撃、守護、etc...。これらの能\力をあてにして、皆が作戦を立てたり決断をしたりする。特に投票や占いでは、はっきりと要望されることも珍しくない。それらの要求に、きみは応えきれるだろうか。また、応えきれないなら、どうしたらいいだろう。",
		"まとめ役、役職CO、白黒つかない灰、etc...。こうした役割が決まってくると、どう振る舞うか期待されはじめるんだ。それを把握できているかな。わからないなら、どうやって知っていこう。そして、きみは期待に応えきれるだろうか。",
		"楽しく語り、聞き、素敵なひとときを過ごせたろうか。また、同様に楽しみたいと集まっている村の友人達は楽しめているだろうか。残念にもそうでないとしたら、どうしたら楽しくなるだろう。",
		"健康を維持するのはとても大変なことだ。今日のきみはやり遂げただろうか。このゲームを楽しむことが引き金になって、健康を害してしまってはつまらないね。",
   );

   my %n_rule = (
   	name => \@n_rule_name,
   	text => \@n_rule_text,
   );
   my %v_rule = (
   	name => \@v_rule_name,
   	text => \@v_rule_text,
   );
   my %v_mind = (
   	name => \@v_mind_name,
   	text => \@v_mind_text,
   );
   my %p_mind = (
   	name => \@p_mind_name,
   	text => \@p_mind_text,
   );

	my $self = {
		sow   => $sow,
		title => 'ルール', # タイトル
		n_rule => \%n_rule,
		v_rule => \%v_rule,
		v_mind => \%v_mind,
		p_mind => \%p_mind,
	};

	return bless($self, $class);
}

#---------------------------------------------
# 禁止行為（簡略）
# 運営者が適時書き換えて下さい。
#---------------------------------------------
sub outhtmlsimple {
	my $self = shift;
	my $sow = $self->{'sow'};
	my $cfg   = $sow->{'cfg'};
	my $net = $sow->{'html'}->{'net'}; # Null End Tag
	my $atr_id = $sow->{'html'}->{'atr_id'};
	my $docid = "css=$sow->{'query'}->{'css'}&trsid=$sow->{'query'}->{'trsid'}";

	$reqvals->{'cmd'} = 'rule';
	$reqvals->{'css'} = $sow->{'query'}->{'css'} if ($sow->{'query'}->{'css'} ne '');
	my $url_rule = &SWBase::GetLinkValues($sow, $reqvals);
	$url_rule = "$cfg->{'BASEDIR_CGI'}/$cfg->{'FILE_SOW'}?$url_rule";
	my $url_mind = "$url_rule#mind";
	my $url_make = "$url_rule#make";
}

#---------------------------------------------
# ルールと心構え（詳細）
# 運営者が適時書き換えて下さい。
#---------------------------------------------
sub outhtml {
	my $self = shift;
	my $sow = $self->{'sow'};
	my $cfg   = $sow->{'cfg'};
	my $net = $sow->{'html'}->{'net'}; # Null End Tag
	my $atr_id = $sow->{'html'}->{'atr_id'};

	my $nrule = $self->{'n_rule'};
	my $vrule = $self->{'v_rule'};
	my $vmind = $self->{'v_mind'};
	my $pmind = $self->{'p_mind'};
	print <<"_HTML_";
<script>
gon = {};
gon.welcome = [
{ mesicon:'',
  name:'学者 レオナルド',
  text:'ようこそ。ここにはこのサイトを楽しむためのルールや心構\えを綴ってある。\\
暖炉のそばが開いているから、腰を下ろして熟読しよう。楽しいゲームは全員が対等で、全員が読んで理解しているルールがあって成り立つんだ。<br>\\
<br>\\
ただし、やむを得ず、ルール違反をすることもあるだろうね。違反してしまった事実は覆らないけれど、ルールを破らざるをえなかった事情は、落ち着いて聞いてあげよう。\\
<a class="mark" href="http://www.nihonjiten.com/data/763.html">罪を憎んで、人を憎まず。</a>\\
これは話し合いをするゲームなんだ。<br>\\
<br>\\
<a title="法案や、企業の自主規制に従う必要はない。逆らう必要もない。それよりもきみのそばの十\数人のためを思おう。">このサイトは日本国の法律に従っている</a>。\\
特にここで、六法全書を引き写して退屈な思いをするつもりはないけれど、不正アクセス禁止法、個人情報保護法は関わりが深いはずだ。<br>',
updated_at:new Date(1370662886000),template:"message/say",style:"",mestype:"GSAY",csid:"all",face_id:"c96"}
];
gon.recovery = [
{ mesicon:'',
  name:'勧善懲悪委 アカリ',
  text:'突然死は悪！そうですよね先生！',
updated_at:new Date(1370662886000),template:"message/say",style:"head",mestype:"GSAY",csid:"all",face_id:"t07"},
{ mesicon:'',
  name:'学者 レオナルド',
  text:'正解、国のルールだね。<br>\\
<br>\\
ただし、やむを得ない事情もあるかもしれない。そういう場合エピローグなどをつかい、話を聞いてみるとよい。\\
エピローグでは全員が一同に介し、墓下と地上にわかれることなく、勝つための嘘もなく、より率直な話ができる。<br>\\
笑い合える展望が拓けるかもしれないよ。<br><br>\\
突然死に限らず、ルール違反全般に言えることだね。',
updated_at:new Date(1370662886000),template:"message/say",style:"",mestype:"GSAY",csid:"all",face_id:"c96"},
{ mesicon:'',
  name:'学者 レオナルド',
  text:'さて、もしもルールに違反してしまったとしたら？とても残念なことだけれど、まだ絶望しなくていい。<br>\\
<br>\\
きみには全員に釈明する、貴重な機会が残されているんだ。\\
真剣な話し合いが必要なときは、協力してそのための時間をなんとか捻り出してほしい。\\
家に帰るまでが遠足なのと同じで、エピローグが済むまでがその村なんだ。',
updated_at:new Date(1370662886000),template:"message/say",style:"",mestype:"GSAY",csid:"all",face_id:"c96"}
];
gon.create = [
{ mesicon:'',
  name:'営利政府 トレイル',
  text:'村建てフォームには、村のルールが既に記入してあります。<br>\\
賛同できる内容はそのまま残して、不足なら筆を加え、余分と判断する事項は削除して村を建ててください。<br>\\
<br>\\
村を建てるとき気をつけると良いことを心構\えに纏めました。<br>\\
ぜひご覧ください。',
updated_at:new Date(1370662886000),template:"message/say",style:"",mestype:"GSAY",csid:"all",face_id:"t10"}
];
</script>
<h2>準備はいいかな？</h2>
<div class="message_filter" ng-repeat="message in welcome" log="message"></div>
<DIV class=toppage>

<p class="paragraph">
<h2>ルール</h2>
<p class="paragraph">
村に書いてあったルールの詳細が知りたければ、ここから下を読もう。<br$net>
<br$net>
</p>
<h3><a name="nation">国のルール</a></h3>
<p class="paragraph">
<dl class="accordion">
_HTML_
	$list = $nrule->{'name'};
	for( $i=0; $i<@$list; $i++ ){
		next if ( '' eq $list->[$i] );
		my $name = $nrule->{'name'}->[$i];
		my $text = $nrule->{'text'}->[$i];
	print <<"_HTML_";
<dt><strong>$name</strong></dt>
<dd>$text</dd>
_HTML_
	}
	print <<"_HTML_";
</dl>
</p>
<hr class="invisible_hr"$net>
<h3><a name="village">村のルール</a></h3>
<p class="paragraph">
<dl class="accordion">
_HTML_
	$list = $vrule->{'name'};
	for( $i=0; $i<@$list; $i++ ){
		next if ( '' eq $list->[$i] );
		my $name = $vrule->{'name'}->[$i];
		my $text = $vrule->{'text'}->[$i];
	print <<"_HTML_";
<dt><strong>$name</strong></dt>
<dd>$text</dd>
_HTML_
	}
	print <<"_HTML_";
</dl>
</p>
<hr class="invisible_hr"$net>
<h2>ルール違反があったら？</h2>
<div class="message_filter" ng-repeat="message in recovery" log="message"></div>
<hr class="invisible_hr"$net>
<h2><a name="mind">心構\え</a></h2>
<p class="paragraph">
心構\えを守って、楽しく、強く遊ぼう。<br$net>
</p>
<p class="paragraph">
<dl class="accordion">
_HTML_
	$list = $pmind->{'name'};
	for( $i=0; $i<@$list; $i++ ){
		next if ( '' eq $list->[$i] );
		my $name = $pmind->{'name'}->[$i];
		my $text = $pmind->{'text'}->[$i];
	print <<"_HTML_";
<dt><strong>$name</strong></dt>
<dd>$text</dd>
_HTML_
	}
	print <<"_HTML_";
</dl>
</p>
<hr class="invisible_hr"$net>
<h2><a name="make">$sow->{'cfg'}->{'NAME_SW'}の運営</a></h2>
<h3>村を建てるかたへ</h3>
<div class="message_filter" ng-repeat="message in create" log="message"></div>
<hr class="invisible_hr"$net>
<h3>村建て人の心構\え</h3>
<p class="paragraph">
<dl class="accordion">
_HTML_
	$list = $vmind->{'name'};
	for( $i=0; $i<@$list; $i++ ){
		next if ( '' eq $list->[$i] );
		my $name = $vmind->{'name'}->[$i];
		my $text = $vmind->{'text'}->[$i];
	print <<"_HTML_";
<dt><strong>$name</strong></dt>
<dd>$text</dd>
_HTML_
	}
	print <<"_HTML_";
</dl>
</p>
</DIV>
_HTML_

}

#---------------------------------------------
# ルールと心構え（詳細）
# 運営者が適時書き換えて下さい。
#---------------------------------------------
sub outhtmlmb {
	my $self = shift;
	my $sow = $self->{'sow'};
	my $cfg   = $sow->{'cfg'};
	my $net = $sow->{'html'}->{'net'}; # Null End Tag
	my $atr_id = $sow->{'html'}->{'atr_id'};

	my $nrule = $self->{'n_rule'};
	my $vrule = $self->{'v_rule'};
	my $vmind = $self->{'v_mind'};
	my $pmind = $self->{'p_mind'};
	print <<"_HTML_";
<DIV class=toppage>
<h2>準備はいいかな？</h2>
<p class="paragraph">
ようこそ。ここにはこのサイトで楽しむためのルールや心構\えを綴ってある。暖炉のそばが開いているから、腰を下ろして熟読しよう。楽しいゲームは全員が対等で、全員が読んで理解しているルールがあって成り立つんだ。<br$net>
<br$net></p>
<p class="paragraph">
ただし、やむを得ず、ルール違反をすることもあるだろうね。違反してしまった事実は覆らないけれど、ルールを破らざるをえなかった事情は、落ち着いて聞いてあげよう。<a href="http://www.nihonjiten.com/data/763.html">罪を憎んで、人を憎まず。</a>これは話し合いをするゲームなんだ。<br$net>
</p>
<p class="paragraph">
<a title="法案や、企業の自主規制に従う必要はない。逆らう必要もない。それよりもきみのそばの十\数人のためを思おう。">このサイトは日本国の法律に従っている</a>。特にここで、六法全書を引き写して退屈な思いをするつもりはないけれど、不正アクセス禁止法、個人情報保護法は関わりが深いはずだ。<br$net>
<br$net></p>
<p class="paragraph">
<h2>ルール</h2>
<p class="paragraph">
村に書いてあったルールの詳細が知りたければ、ここから下を読もう。<br$net>
<br$net>
</p>
<h3><a name="nation">国のルール</a></h3>
<p class="paragraph">
<dl class="accordion">
_HTML_
	$list = $nrule->{'name'};
	for( $i=0; $i<@$list; $i++ ){
		next if ( '' eq $list->[$i] );
		my $name = $nrule->{'name'}->[$i];
		my $text = $nrule->{'text'}->[$i];
	print <<"_HTML_";
<dt><strong>$name</strong></dt>
<dd>$text</dd>
_HTML_
	}
	print <<"_HTML_";
</dl>
</p>
<hr class="invisible_hr"$net>
<h3><a name="village">村のルール</a></h3>
<p class="paragraph">
<dl class="accordion">
_HTML_
	$list = $vrule->{'name'};
	for( $i=0; $i<@$list; $i++ ){
		next if ( '' eq $list->[$i] );
		my $name = $vrule->{'name'}->[$i];
		my $text = $vrule->{'text'}->[$i];
	print <<"_HTML_";
<dt><strong>$name</strong></dt>
<dd>$text</dd>
_HTML_
	}
	print <<"_HTML_";
</dl>
</p>
<hr class="invisible_hr"$net>
<h2>ルール違反があったら？</h2>
<p class="paragraph">
もしもルールに違反してしまったとしたら？とても残念なことだけれど、まだ絶望しなくていい。<br$net>
きみには全員に釈明する、貴重な機会が残されているんだ。エピローグでは全員が一同に介し、墓下と地上にわかれることなく、勝つための嘘もなく、より率直な話ができる。<br$net>
真剣な話し合いが必要なときは、協力してそのための時間をなんとか捻り出してほしい。家に帰るまでが遠足なのと同じで、エピローグが済むまでがその村なんだ。<br$net>
<br$net>
</p>
<hr class="invisible_hr"$net>
<h2><a name="mind">心構\え</a></h2>
<p class="paragraph">
心構\えを守って、楽しく、強く遊ぼう。<br$net>
</p>
<p class="paragraph">
<dl class="accordion">
_HTML_
	$list = $pmind->{'name'};
	for( $i=0; $i<@$list; $i++ ){
		next if ( '' eq $list->[$i] );
		my $name = $pmind->{'name'}->[$i];
		my $text = $pmind->{'text'}->[$i];
	print <<"_HTML_";
<dt><strong>$name</strong></dt>
<dd>$text</dd>
_HTML_
	}
	print <<"_HTML_";
</dl>
</p>
<hr class="invisible_hr"$net>
<h2><a name="make">$sow->{'cfg'}->{'NAME_SW'}の運営</a></h2>
<h3>村を建てるかたへ</h3>
<p class="paragraph">
村建てフォームには、村のルールが既に記入してあります。賛同できる内容はそのまま残して、不足なら筆を加え、余分と判断する事項は削除して村を建ててください。<br$net>
村を建てるときに気をつけた方が良いことを、心構\えに纏めました。ぜひご覧ください。<br$net>
<br$net>
</p>
<hr class="invisible_hr"$net>
<h3>村建て人の心構\え</h3>
<p class="paragraph">
<dl class="accordion">
_HTML_
	$list = $vmind->{'name'};
	for( $i=0; $i<@$list; $i++ ){
		next if ( '' eq $list->[$i] );
		my $name = $vmind->{'name'}->[$i];
		my $text = $vmind->{'text'}->[$i];
	print <<"_HTML_";
<dt><strong>$name</strong></dt>
<dd>$text</dd>
_HTML_
	}
	print <<"_HTML_";
</dl>
</p>
</DIV>
_HTML_

}

1;
