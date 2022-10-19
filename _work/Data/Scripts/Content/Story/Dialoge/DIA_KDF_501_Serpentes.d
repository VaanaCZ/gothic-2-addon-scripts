///////////////////////////////////////////////////////////////////////
//	Info Kap1 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap1_EXIT_Condition;
	information = DIA_Serpentes_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info NOTALK
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOTALK		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOTALK_Condition;
	information	 = 	DIA_Serpentes_NOTALK_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Serpentes_NOTALK_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOTALK_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_NOTALK_10_00"); //Jak œmiesz siê do mnie odzywaæ, nowicjuszu? Wracaj do pracy!
	
	Info_ClearChoices (DIA_Serpentes_NOTALK);
	Info_AddChoice 	  (DIA_Serpentes_NOTALK,"Ja tylko... (KONIEC)",DIA_Serpentes_NOTALK_EXIT);
	Info_AddChoice 	  (DIA_Serpentes_NOTALK,"Mam jeszcze jedno pytanie...",DIA_Serpentes_NOTALK_QUESTION);
};
FUNC VOID DIA_Serpentes_NOTALK_QUESTION()
{
	AI_Output (other, self, "DIA_Serpentes_NOTALK_QUESTION_15_00"); //Mam jeszcze jedno pytanie...
	AI_Output (self, other, "DIA_Serpentes_NOTALK_QUESTION_10_01"); //Chyba nie rozumiesz. To ja decydujê, czy chcê z tob¹ rozmawiaæ, czy te¿ nie. Co ty sobie wyobra¿asz?
	AI_Output (self, other, "DIA_Serpentes_NOTALK_QUESTION_10_02"); //A teraz wracaj do pracy!
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Serpentes_NOTALK_EXIT()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_GOAWAY		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_GOAWAY_Condition;
	information	 = 	DIA_Serpentes_GOAWAY_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Serpentes_GOAWAY_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Serpentes_NOTALK)
	&& Npc_IsInState (self, ZS_Talk)
	&& !(Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_GOAWAY_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_GOAWAY_10_00"); //Twoja obecnoœæ tutaj to nie tylko oznaka braku szacunku, ale i g³upoty, nowicjuszu!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info YOURSTORY
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_YOURSTORY		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr			 = 	24;
	condition	 = 	DIA_Serpentes_YOURSTORY_Condition;
	information	 = 	DIA_Serpentes_YOURSTORY_Info;
	permanent	 =  FALSE;
	description	 = 	"S³ysza³em, ¿e przeszed³eœ Próbê Ognia?";
};
func int DIA_Serpentes_YOURSTORY_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Ulthar_TEST)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (hero, DIA_Pyrokar_MAGICAN)== FALSE)
	&& (MIS_GOLEM != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_YOURSTORY_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_YOURSTORY_15_00"); //S³ysza³em, ¿e przeszed³eœ Próbê Ognia?
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_01"); //Z ca³¹ pokor¹ muszê przyznaæ, ¿e wszyscy inni, którzy tego próbowali, ponieœli klêskê.
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_02"); //Naprawdê nie powinieneœ podejmowaæ siê tej próby. Twój duch jest s³aby. Pracuj lepiej w klasztorze, a za kilka lat mo¿e zostaniesz wybrañcem.
	AI_Output (other, self, "DIA_Serpentes_YOURSTORY_15_03"); //Mam zamiar przejœæ tê próbê.
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_04"); //Jeœli Innos tego zechce, uda ci siê. W przeciwnym wypadku - jesteœ skazany na pora¿kê.
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_TEST		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_TEST_Condition;
	information	 = 	DIA_Serpentes_TEST_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mistrzu, jestem gotów poddaæ siê Próbie.";
};
func int DIA_Serpentes_TEST_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_TEST_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_TEST_15_00"); //Mistrzu, jestem gotów poddaæ siê próbie.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_01"); //Mówisz wiêc, ¿e chcesz przejœæ próbê. Jedynie najodwa¿niejszy z odwa¿nych nowicjuszy mo¿e o ni¹ prosiæ. Odwaga to jednak nie wszystko.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_02"); //Czy jesteœ dostatecznie m¹dry, by przejœæ próbê? Czy jesteœ dostatecznie silny, by stawiæ czo³o przeciwnoœciom?
	AI_Output (self, other, "DIA_Serpentes_TEST_10_03"); //Jeœli nie, zap³acisz za to w³asnym ¿yciem.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_04"); //Pos³uchaj wiêc, co ciê czeka: w Miejscu z Kamienia szukaj tego, który siê nie narodzi³ - znajdŸ tego, którego przywo³ano.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_05"); //Pokonaj tego, który nie mo¿e zostaæ pokonany - zmierz siê z ¿yw¹ ska³¹, walcz z nieœmiertelnym kamieniem - i zniszcz go.
	
	//----- Der Magische Golem ----
	Wld_InsertNpc 	(MagicGolem, 			"FP_MAGICGOLEM");
	Magic_Golem		= Hlp_GetNpc (MagicGolem);	//Damits auch initialisiert ist!!


	MIS_GOLEM = LOG_RUNNING;
	Log_CreateTopic (TOPIC_Golem,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Golem,LOG_RUNNING);
	B_LogEntry (TOPIC_Golem,"Serpentes poddaje mnie próbie. Chce, abym znalaz³ 'tego, którego onegdaj przywo³ano', ¿ywy g³az, i pokona³ go.");
};
///////////////////////////////////////////////////////////////////////
//	Info NOIDEA
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOIDEA		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOIDEA_Condition;
	information	 = 	DIA_Serpentes_NOIDEA_Info;
	permanent	 = 	FALSE;
	description	 = 	"A có¿ to za stworzenie?";
};
func int DIA_Serpentes_NOIDEA_Condition ()
{	
	if (MIS_GOLEM == LOG_RUNNING)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOIDEA_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_NOIDEA_15_00"); //¯yw¹ ska³¹... ? A có¿ to za stworzenie?
	AI_Output (self, other, "DIA_Serpentes_NOIDEA_10_01"); //Powiedzia³em ci ju¿ wszystko. Mo¿e próba wydaje ci siê zbyt trudna?
	AI_Output (self, other, "DIA_Serpentes_NOIDEA_10_02"); //Wkrótce przekonasz siê, czym jest Próba Ognia - nie odpowiem na wiêcej pytañ.
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info NOHELP
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOHELP		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOHELP_Condition;
	information	 = 	DIA_Serpentes_NOHELP_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Serpentes_NOHELP_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Serpentes_NOIDEA)
	&& ((Npc_IsDead (Magic_Golem)) == FALSE)
	&& (MIS_GOLEM == LOG_RUNNING)
	&& Npc_IsInState	(self, ZS_Talk) 
	&& (other.guild == GIL_NOV)
	&& ((Npc_KnowsInfo (other, DIA_Ulthar_TEST) == FALSE)
	|| Npc_KnowsInfo (other,DIA_Serpentes_YOURSTORY))
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOHELP_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_NOHELP_10_00"); //IdŸ, nowicjuszu. Wykonaj swoje zadanie.
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr			 = 	3;
	condition	 = 	DIA_Serpentes_SUCCESS_Condition;
	information	 = 	DIA_Serpentes_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"Uda³o mi siê pokonaæ golema.";
};
func int DIA_Serpentes_SUCCESS_Condition ()
{	
	if (Npc_IsDead (MagicGolem))
	&& (MIS_GOLEM == LOG_RUNNING)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_SUCCESS_Info ()
{
	var C_NPC garwig;
	garwig = Hlp_GetNpc (NOV_608_Garwig);
	
	AI_Output (other, self, "DIA_Serpentes_SUCCESS_15_00"); //Uda³o mi siê pokonaæ golema.
	AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_01"); //Co? Naprawdê? Przecie¿ bez m³ota Innosa nie by³byœ w stanie tego dokonaæ!
	
	if (Npc_IsDead (garwig))
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_02"); //Zdradzi³eœ siê! To ty zamordowa³eœ Garwiga!
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_03"); //NIECH SPOTKA CIÊ KARA ZA ZAMORDOWANIE S£UGI INNOSA!!!
		
		AI_StopProcessInfos (self);
		B_Attack  (self, other, AR_HumanMurderedHuman, 0);
	}
	else 
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_04"); //Niemniej muszê przyznaæ, ¿e wykona³eœ powierzone ci zadanie.
	};
	if (Npc_HasItems (other, Holy_Hammer_Mis) >= 1)
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_05"); //Pozwól, ¿e wezmê m³ot.
		
		Npc_RemoveInvItems (other, Holy_Hammer_MIS,1); 
		Wld_InsertItem (Holy_Hammer_MIS,"FP_HAMMER");
	};
	
	MIS_GOLEM = LOG_SUCCESS;
	B_GivePlayerXP (XP_GOLEM);
	
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_PERM   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 99;
	condition   = DIA_Serpentes_PERM_Condition;
	information = DIA_Serpentes_PERM_Info;
	permanent   = TRUE;

	description = "Czy chcia³byœ powiedzieæ mi coœ jeszcze?";
};
FUNC INT DIA_Serpentes_PERM_Condition()
{	
	if (Kapitel >= 3)
	|| Npc_KnowsInfo (other,DIA_Serpentes_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Serpentes_PERM_Info()
{
	AI_Output (other, self, "DIA_Serpentes_PERM_15_00"); //Czy chcia³byœ mi powiedzieæ coœ jeszcze?

		if (hero.guild == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Serpentes_PERM_10_01"); //Nie, Bracie, nie teraz.
		}
		else
		{
			AI_Output (self, other, "DIA_Serpentes_PERM_10_02"); //OdejdŸ. Wiesz, co masz robiæ.
		};
	AI_StopProcessInfos (self);
};

//##################################################################
//##
//##	Kapitel 2
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap2 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap2_EXIT_Condition;
	information = DIA_Serpentes_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


//##################################################################
//##
//##	Kapitel 3
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap3 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap3_EXIT_Condition;
	information = DIA_Serpentes_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info MinenAnteile
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_MinenAnteile		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	30;
	condition	 = 	DIA_Serpentes_MinenAnteile_Condition;
	information	 = 	DIA_Serpentes_MinenAnteile_Info;
	important	 = 	TRUE;
};

func int DIA_Serpentes_MinenAnteile_Condition ()
{
	if (Pedro_Traitor == TRUE)
	&& ((hero.guild == GIL_KDF) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Serpentes_MinenAnteile_Info ()
{
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_00"); //Nie tak szybko, mam dla ciebie kolejne zadanie.

	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_15_01"); //A dok³adniej?
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_02"); //Przynale¿noœæ do Bractwa Ognia niesie ze sob¹ wielk¹ odpowiedzialnoœæ. S¹ pewne obowi¹zki, które ka¿dy z nas musi wype³niaæ.
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_03"); //Jak wiesz, nasz koœció³ zajmuje siê nie tylko sprawami magii - jest równie¿ najwy¿szym organem w³adzy s¹downiczej.
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_04"); //Wydarzenia ostatnich dni zaleg³y nam na sercu ogromnym ciê¿arem, a problem ten musi zostaæ rozwi¹zany raz na zawsze.
		
		Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Nie mam czasu na takie drobiazgi. ZnajdŸ sobie kogoœ innego.", DIA_Serpentes_MinenAnteile_nein );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "O co chodzi?", DIA_Serpentes_MinenAnteile_was );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Czy stra¿ miejska nie powinna siê tym zaj¹æ?", DIA_Serpentes_MinenAnteile_miliz );
	}
	else
	{
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_05"); //Najemnik taki jak ty by³by tu bardzo przydatny.
		
		Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Nie mam czasu na takie drobiazgi. ZnajdŸ sobie kogoœ innego.", DIA_Serpentes_MinenAnteile_nein );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "To kogo mam zlikwidowaæ?", DIA_Serpentes_MinenAnteile_KillSLD );
	};
};
func void DIA_Serpentes_MinenAnteile_miliz ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_miliz_15_00"); //Czy stra¿ miejska nie powinna siê tym zaj¹æ?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_miliz_10_01"); //Stra¿ odpowiada za bezpieczeñstwo w mieœcie. Ta sprawa wykracza daleko poza jej jurysdykcjê.

};

func void DIA_Serpentes_MinenAnteile_nein ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_nein_15_00"); //Nie mam czasu na takie drobiazgi. ZnajdŸ sobie kogoœ innego.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_nein_10_01"); //To oburzaj¹ce. Jeœli nie bêdziesz wykonywa³ zleceñ Bractwa, wy¿sze krêgi magii na zawsze pozostan¹ dla ciebie tajemnic¹.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_nein_10_02"); //Udzielam ci nagany. Mam nadziejê, ¿e podobna sytuacja ju¿ siê nie powtórzy - inaczej Ÿle siê to dla ciebie skoñczy.
	AI_StopProcessInfos (self);
};

func void DIA_Serpentes_MinenAnteile_was ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_15_00"); //O co dok³adnie chodzi?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_01"); //Ktoœ w mieœcie sprzedaje fa³szywe udzia³y w kopalniach rudy znajduj¹cych siê w by³ej kolonii karnej.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_02"); //Udzia³y te nie przedstawiaj¹ ¿adnej wartoœci. Mimo to mog¹ staæ siê zarzewiem konfliktów wœród ludnoœci. Na to zaœ nie mo¿emy sobie pozwoliæ.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_03"); //Dosz³y mnie s³uchy, ¿e oszustowi uda³o siê dotrzeæ do kilku najbardziej wp³ywowych kupców w mieœcie i kraju. Ba! Zdo³a³ im nawet sprzedaæ fa³szywe udzia³y!
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_04"); //Musisz odnaleŸæ tego z³oczyñcê i doprowadziæ go przed nasze oblicze. W tak ciê¿kich czasach nie mo¿emy pozwoliæ, by oszuœci i hochsztaplerzy czuli siê bezkarni.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_05"); //Niech kara, jaka go spotka, bêdzie ostrze¿eniem dla reszty zuchwalców.
	
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Postaram siê zaj¹æ t¹ spraw¹.", DIA_Serpentes_MinenAnteile_was_ja );

};
func void DIA_Serpentes_MinenAnteile_was_ja ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_ja_15_00"); //Postaram siê zaj¹æ t¹ spraw¹.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_01"); //Jest jeszcze coœ. Kupcy nie powinni siê dowiedzieæ, ¿e interesuje ciê sprawa udzia³ów w kopalniach.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_02"); //Jeœli dowiedz¹ siê, ¿e dzia³asz w imieniu koœcio³a, nie bêd¹ ci chcieli zaproponowaæ takiego towaru. Chyba to rozumiesz?
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_ja_15_03"); //Rozumiem.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_04"); //W takim razie bierz siê do pracy, Bracie. ¯yczê szczêœcia.
	Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
	
	MIS_Serpentes_MinenAnteil_KDF = LOG_RUNNING;	

	 if ((Npc_IsDead(Salandril))== FALSE)
	 {
		 CreateInvItems (Salandril, 	ItWr_MinenAnteil_Mis, 2); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	 };
	 if ((Npc_IsDead(VLK_416_Matteo))== FALSE)
	 {
		 CreateInvItems (VLK_416_Matteo, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_413_Bosper))== FALSE)
	 {
		 CreateInvItems (VLK_413_Bosper, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_409_Zuris))== FALSE)
	 {
		 CreateInvItems (VLK_409_Zuris, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(BAU_911_Elena))== FALSE)
	 {
		 CreateInvItems (BAU_911_Elena, 	ItWr_MinenAnteil_Mis, 2); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	 };
	 if ((Npc_IsDead(BAU_970_Orlan))== FALSE)
	 {
		 CreateInvItems (BAU_970_Orlan, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_407_Hakon))== FALSE)
	 {
		 CreateInvItems (VLK_407_Hakon, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(BAU_936_Rosi))== FALSE)
	 {
		 CreateInvItems (BAU_936_Rosi, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_468_Canthar))== FALSE)
	 {
		 CreateInvItems (VLK_468_Canthar, 	ItWr_MinenAnteil_Mis, 3); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 3;
	 };
	SalandrilVerteilteMinenAnteil =	SalandrilMinenAnteil_MAINCounter;

	Log_CreateTopic (TOPIC_MinenAnteile, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile, LOG_RUNNING);
	B_LogEntry (TOPIC_MinenAnteile,"Ktoœ sprzedaje fa³szywe udzia³y w kopalni rudy. Muszê siê dowiedzieæ, u kogo zaopatruj¹ siê miejscowi kupcy, a Serpentes chce dostaæ wszystkie nielegalne udzia³y."); 
};

func void DIA_Serpentes_MinenAnteile_KillSLD ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_Kill_15_00"); //To kogo mam zlikwidowaæ?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_01"); //Na Innosa! Nikogo! Ta sprawa wymaga nieco delikatnoœci, nie rozwi¹zañ si³owych.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_02"); //Salandril, alchemik z górnego miasta, dopuœci³ siê powa¿nych przestêpstw i musi zostaæ ukarany.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_03"); //Mimo to odmawia stawienia siê w klasztorze na swój proces. PrzyprowadŸ go tutaj.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_04"); //Nie ma znaczenia, jak tego dokonasz. Za swe starania zostaniesz oczywiœcie odpowiednio wynagrodzony.
	
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Czy stra¿ miejska nie powinna siê tym zaj¹æ?", DIA_Serpentes_MinenAnteile_miliz );
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "¯aden problem. Zajmê siê tym.", DIA_Serpentes_MinenAnteile_was_jaSLD );
};

var int MIS_Serpentes_BringSalandril_SLD;
func void DIA_Serpentes_MinenAnteile_was_jaSLD ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_jaSLD_15_00"); //¯aden problem. Zajmê siê tym.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_jaSLD_10_01"); //Doskonale. Do zobaczenia za kilka dni.
	MIS_Serpentes_BringSalandril_SLD = LOG_RUNNING;
	Info_ClearChoices	(DIA_Serpentes_MinenAnteile);

	Log_CreateTopic (TOPIC_MinenAnteile, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile, LOG_RUNNING);
	B_LogEntry (TOPIC_MinenAnteile,"Mam przyprowadziæ Salandrila - alchemika z górnego miasta Khorinis - do klasztoru, gdzie zostanie os¹dzony. Nie interesuje mnie, jakie pope³ni³ wykroczenie, o ile dostanê swoj¹ zap³atê."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MinenAnteileBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_MinenAnteileBringen		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	2;
	condition	 = 	DIA_Serpentes_MinenAnteileBringen_Condition;
	information	 = 	DIA_Serpentes_MinenAnteileBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co do tych fa³szywych udzia³ów w kopalni...";
};

func int DIA_Serpentes_MinenAnteileBringen_Condition ()
{
	if (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_MinenAnteil_Mis))
	&& (hero.guild == GIL_KDF) 
		{
				return TRUE;
		};
};

var int SerpentesMinenAnteilCounter;
func void DIA_Serpentes_MinenAnteileBringen_Info ()
{
		var int SerpentesMinenAnteilCount;
		var int XP_BringSerpentesMinenAnteils;
		var int SerpentesMinenAnteilOffer;
		var int SerpentesMinenAnteilGeld;
	
		SerpentesMinenAnteilCount = Npc_HasItems(other, ItWr_MinenAnteil_Mis);
		SerpentesMinenAnteilOffer = 200; 

		 if (SerpentesMinenAnteilCount == 1)
			{
				AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_00"); //Odzyska³em jeden z udzia³ów w kopalni.
				B_GivePlayerXP (XP_BringSerpentesMinenAnteil);
				B_GiveInvItems (other, self, ItWr_MinenAnteil_Mis,1);
				SerpentesMinenAnteilCounter = SerpentesMinenAnteilCounter + 1;
			}
			else
			{
				AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_01"); //Uda³o mi siê odzyskaæ kilka udzia³ów w kopalni.
	
				B_GiveInvItems (other, self, ItWr_MinenAnteil_Mis,  SerpentesMinenAnteilCount);
	
				XP_BringSerpentesMinenAnteils = (SerpentesMinenAnteilCount * XP_BringSerpentesMinenAnteil);
				SerpentesMinenAnteilCounter = (SerpentesMinenAnteilCounter + SerpentesMinenAnteilCount); 
	
				B_GivePlayerXP (XP_BringSerpentesMinenAnteils);
			};

		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter - SerpentesMinenAnteilCount;
		
		var string MinenAnteilText;
		var string MinenAnteilLeft;
		MinenAnteilLeft = IntToString (SalandrilMinenAnteil_MAINCounter);
		MinenAnteilText = ConcatStrings(MinenAnteilLeft, PRINT_NumberLeft);
		AI_PrintScreen	(MinenAnteilText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);

		if (SerpentesMinenAnteilCounter < SalandrilVerteilteMinenAnteil)
		{
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_02"); //Doskonale. Nale¿y je jak najszybciej wycofaæ z obiegu. Przynieœ je wszystkie do mnie.
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_03"); //Proszê. Zapewniê ci niezbêdne œrodki.
		}
		else if (SerpentesMinenAnteilCounter == SalandrilVerteilteMinenAnteil) //Joly:kein Exploid
		{
			AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_04"); //Myœlê, ¿e to ju¿ wszystkie.
			AI_Output		(self, other, "DIA_Serpentes_MinenAnteileBringen_10_05"); //Doskonale, zas³u¿y³eœ na nagrodê.
			AI_Output		(self, other, "DIA_Serpentes_MinenAnteileBringen_10_06"); //WeŸ ten ochronny amulet. Na pewno przyda ci siê w twoich dalszych wyprawach.
			CreateInvItems (self, ItAm_Prot_Mage_01, 1); 
			B_GiveInvItems (self, other, ItAm_Prot_Mage_01, 1);
		}
		else	//Joly: zur Sicherheit!
		{
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_07"); //To ju¿ chyba ostatni, prawda?
		};
		
		SerpentesMinenAnteilGeld	= (SerpentesMinenAnteilCount * SerpentesMinenAnteilOffer);
		
		CreateInvItems (self, ItMi_Gold, SerpentesMinenAnteilGeld); 
		B_GiveInvItems (self, other, ItMi_Gold, SerpentesMinenAnteilGeld);
};

///////////////////////////////////////////////////////////////////////
//	Info GotSalandril
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_GOTSalandril		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	32;
	condition	 = 	DIA_Serpentes_GOTSalandril_Condition;
	information	 = 	DIA_Serpentes_GOTSalandril_Info;

	description	 = 	"Wiem, kto wprowadzi³ fa³szywe udzia³y do obrotu.";
};

func int DIA_Serpentes_GOTSalandril_Condition ()
{
	if (SC_KnowsProspektorSalandril == TRUE)
	&& (hero.guild == GIL_KDF) 
		{
				return TRUE;
		};
};

func void DIA_Serpentes_GOTSalandril_Info ()
{
	AI_Output			(other, self, "DIA_Serpentes_GOTSalandril_15_00"); //Wiem, kto wprowadzi³ fa³szywe udzia³y do obrotu. To Salandril, alchemik z górnego miasta.
	AI_Output			(self, other, "DIA_Serpentes_GOTSalandril_10_01"); //PrzyprowadŸ go tutaj. Musimy z nim powa¿nie porozmawiaæ.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info SalandrilHere
///////////////////////////////////////////////////////////////////////

instance DIA_Serpentes_SalandrilHERE		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	33;
	condition	 = 	DIA_Serpentes_SalandrilHERE_Condition;
	information	 = 	DIA_Serpentes_SalandrilHERE_Info;

	description	 = 	"Salandril jest tutaj, w klasztorze.";
};

func int DIA_Serpentes_SalandrilHERE_Condition ()
{
	if (Npc_GetDistToWP(Salandril,"ALTAR")<10000) 
		{
			if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
				{
					return TRUE;
				}
			else if (Npc_KnowsInfo(other, DIA_Serpentes_GOTSalandril))
			&& (hero.guild == GIL_KDF) 
				{
					return TRUE;
				}
			else
				{
					return FALSE;
				};
		};
};

func void DIA_Serpentes_SalandrilHERE_Info ()
{
	AI_Output		(other, self, "DIA_Serpentes_SalandrilHERE_15_00"); //Salandril jest tutaj, w klasztorze.
	AI_Output		(self, other, "DIA_Serpentes_SalandrilHERE_10_01"); //Dobra robota. Zajmiemy siê nim póŸniej.

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output		(self, other, "DIA_Serpentes_SalandrilHERE_10_02"); //Oto twoja nagroda. I pamiêtaj, nikomu ani s³owa.
		CreateInvItems (self, ItMi_Gold, 400);									
		B_GiveInvItems (self, other, ItMi_Gold, 400);					
	};
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP 	(XP_SalandrilInKloster);
};

///////////////////////////////////////////////////////////////////////
//	Info SalandrilDEAD
///////////////////////////////////////////////////////////////////////

instance DIA_Serpentes_SalandrilDEAD		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	33;
	condition	 = 	DIA_Serpentes_SalandrilDEAD_Condition;
	information	 = 	DIA_Serpentes_SalandrilDEAD_Info;

	description	 = 	"Salandril nie ¿yje.";
};

func int DIA_Serpentes_SalandrilDEAD_Condition ()
{
	if  (
			(Npc_KnowsInfo(other, DIA_Serpentes_GOTSalandril))
			||  (
					((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
					&& (MIS_Serpentes_BringSalandril_SLD == LOG_RUNNING)
				)
		)
		&& (Npc_IsDead(Salandril))
		{
				return TRUE;
		};
};

func void DIA_Serpentes_SalandrilDEAD_Info ()
{
	AI_Output			(other, self, "DIA_Serpentes_SalandrilDEAD_15_00"); //Salandril nie ¿yje.
	AI_Output			(self, other, "DIA_Serpentes_SalandrilDEAD_10_01"); //Có¿, jego wystêpki zosta³y ukarane. Niech Innos zlituje siê nad dusz¹ tego nieszczêœnika.
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP 	(XP_Ambient);
};
	
//##################################################################
//##
//##	Kapitel 4
//##
//##################################################################

///////////////////////////////////////////////////////////////////////
//	Info Kap2 EXIT 
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Serpentes_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap4_EXIT_Condition;
	information = DIA_Serpentes_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//##################################################################
//##
//##	Kapitel 5
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap5 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap5_EXIT_Condition;
	information = DIA_Serpentes_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Serpentes_PICKPOCKET (C_INFO)
{
	npc			= KDF_501_Serpentes;
	nr			= 900;
	condition	= DIA_Serpentes_PICKPOCKET_Condition;
	information	= DIA_Serpentes_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Serpentes_PICKPOCKET_Condition()
{
	C_Beklauen (86, 380);
};
 
FUNC VOID DIA_Serpentes_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Serpentes_PICKPOCKET);
	Info_AddChoice		(DIA_Serpentes_PICKPOCKET, DIALOG_BACK 		,DIA_Serpentes_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Serpentes_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Serpentes_PICKPOCKET_DoIt);
};

func void DIA_Serpentes_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Serpentes_PICKPOCKET);
};
	
func void DIA_Serpentes_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Serpentes_PICKPOCKET);
};





















