//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_EXIT   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 999;
	condition   = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Hi   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 2;
	condition   = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Thorus_Hi_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Hi_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_00");//Pravidla znáš. Bez červený kamenný tabulky se nikdo do dolu nedostane.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Hi_15_01");//Na důl zapomeň - chci vidět Havrana.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_02");//Ale i tak tu máme svý pravidla a ty se týkaj všech. Dokonce i tebe.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_03");//Vrať se. Když se pokusíš bez dovolení vstoupit tam nahoru, stráže tě zabijou. TAKOVÝ jsou pravidla.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_04");//Jestli s tím máš problém, promluv si s Estebanem. Má na starosti tábor.
	};
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
};
//----------------------------------------------------------------------
//	Info Raven
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Raven   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 3;
	condition   = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent   = FALSE;
	description = "Musím se nutně dostat k Havranovi...";
};
FUNC INT DIA_Addon_Thorus_Raven_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raven_15_00");//Nutně se musím dostat k Havranovi.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_01");//Vážně? Fakt si myslíš, že se k němu dostaneš?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_02");//Jeho stráže maj rozkaz, aby k němu NIKOHO nepouštěly. Byl bys mrtvej, ještě než by ses k němu dostal.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_03");//Tak to pusť z hlavy.

	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Havran je vůdcem banditů. Jestli se k němu chci dostat, budu jich muset pár odklidit z cesty."); 
};
//----------------------------------------------------------------------
//	Info Zeit
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Zeit   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent   = FALSE;
	description = "Pamatuješ se na mě? Ze Starého tábora...";
};
FUNC INT DIA_Addon_Thorus_Zeit_Condition()
{	
	if (RavenIsDead == FALSE) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Zeit_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Zeit_15_00");//Ty se na mě nepamatuješ? Ze Starýho tábora?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_01");//Tys byl jedním z vězňů?! Klidně jsi moh patřit i k mý stráži. A to si myslíš, že z nás teď dělá spojence, nebo co?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_02");//Ne, to ne.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_03");//Možná seš ten maník, co rozbil bariéru - a možná seš i ten, co pobil mý kámoše.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_04");//A co?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_05");//Ty doby už jsou pryč.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_06");//Chceš dovnitř? Tak si sežeň červenej kámen a nezdržuj mě.
	};
};

//----------------------------------------------------------------------
//	Die guten alten Zeiten
//----------------------------------------------------------------------
var int Thorus_GoodOldPerm;
//----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm  (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent   = TRUE;
	description = "No tak, pusť mě dál. Kvůli starým dobrým časům.";
};
FUNC INT DIA_Addon_Thorus_GoodOldPerm_Condition()
{	
	if (MIS_Send_Buddler != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_BDT_10014_Thorus_Zeit))
	&& (RavenIsDead == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_GoodOldPerm_Info()
{	
	AI_Output (other, self, "DIA_Addon_Thorus_Add_15_00"); //No tak, pusť mě tam. Pro starý dobrý časy.
	if (Thorus_GoodOldPerm == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_01"); //Něco ti vysvětlím. Víš, proč jsem ještě naživu?
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_02"); //Protože jsem vždycky věrnej svejm lidem.
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_03"); //Nemusím souhlasit se vším, co Havran dělá, ale musím dodržovat pravidla. 
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_04"); //A ty taky!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_05"); //(pevně) Ne!
	};
};

//----------------------------------------------------------------------
//Abfrage auf alle Tokens bis auf den ROTEN 
//----------------------------------------------------------------------
FUNC INT C_PlayerHasWrongToken ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	|| (Npc_HasItems (hero, ItWr_StonePlateCommon_Addon) >= 1)//Klar.
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_02) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_03) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_04) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_05) >= 1)
	{
		return TRUE;
	};
	return FALSE;
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Stein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent   = TRUE;
	description = "Mám tu pro tebe kamennou tabulku...";
};
FUNC INT DIA_Addon_Thorus_Stein_Condition()
{	
	if (C_PlayerHasWrongToken () == TRUE)
	&& (RavenIsDead == FALSE)
	&& (MIS_Send_Buddler != LOG_RUNNING)
	&& (MIS_Send_Buddler != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Stein_15_00");//Mám tu pro tebe kamennou tabulku.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Stein_12_01");//Tohle není ten pravej kámen. Důležitý jsou jenom ty červený.
};
//----------------------------------------------------------------------
//	Info Rein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Rein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent   = FALSE;
	description = "Mám tu pro tebe červenou kamennou tabulku...";
};
FUNC INT DIA_Addon_Thorus_Rein_Condition()
{	
	if (Npc_HasItems (other, ItMi_Addon_Stone_01) >= 1)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Rein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_00");//Mám tu červenou tabulku.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_01");//Fajn.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_02");//Ty jsi zabil Estebana, takže teď budeš jeho práci dělat TY!
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_03");//V dole mají trochu problémy s důlníma červama.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_04");//Už to koupili tři kopáči a ty se teď máš postarat o náhradu.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_05");//A kdy se konečně dostanu do toho zatracenýho dolu?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_06");//Napřed dokonči práci a pak si můžeš dělat, co chceš.
	
	MIS_Send_Buddler = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Buddler, LOG_RUNNING);
	B_LogEntry (Topic_Addon_Buddler,"Jelikož jsem teď nahradil Estebana, měl bych do dolu poslat tři kopáče.");
};
//----------------------------------------------------------------------
//	Info drei typen losgeschickt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Sent   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent   = FALSE;
	description = "Poslal jsem tam tři chlapy.";
};
FUNC INT DIA_Addon_Thorus_Sent_Condition()
{	
	if (Player_SentBuddler >= 3)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Sent_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Sent_15_00");//Poslal jsem tam tři chlapy.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Sent_12_01");//No dobře. Tak teď si pro mě za mě můžeš jít dovnitř.

	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Armor   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent   = FALSE;
	description = "No teda, co to máš za brnění? Kde bych takové sehnal?";
};
FUNC INT DIA_Addon_Thorus_Armor_Condition()
{	
	if (RavenIsDead == FALSE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Armor_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Armor_15_00");//Hele, co to máš za zbroj? Kde bych takovou sehnal?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_01");//To nejde. Tuhle zbroj můžou nosit jenom Havranovy stráže.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_02");//Pochybuju, že by noví kandidáti měli skládat ňáký zkoušky Ale závěrečný rozhodnutí stejně nezáleží na mně, ale na Havranovi.
};
//----------------------------------------------------------------------
//	Info Gefangene
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Gefangene   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 88;
	condition   = DIA_Addon_Thorus_Gefangene_Condition;
	information = DIA_Addon_Thorus_Gefangene_Info;
	permanent   = FALSE;
	description = "Jak se vede vězňům?";
};
FUNC INT DIA_Addon_Thorus_Gefangene_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&&  Npc_KnowsInfo (other,DIA_Addon_Patrick_Hi)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Gefangene_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");//Jak se vede vězňům?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");//Hmm, udělali svou práci. Pokud vím, teď by měli kutat zlato.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");//A co když utečou?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");//Tak za nima Bloodwyn pošle stráže. Ale pochybuju, že by byli tak blbí a utíkali.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");//Pokud...
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");//Pokud co?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");//Pokud je k tomu někdo nepřiměje. Ale žádnýho takovýho cvoka neznám, aspoň dokud je tu Bloodwyn.
	B_Say (other, self,"$VERSTEHE");
};
//----------------------------------------------------------------------
//	Info Speech
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Speech   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Thorus_Speech_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Speech_Info()
{	
	
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_00");//Co máš v plánu?
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_01");//Cože??
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_02");//Takže teď už jsi z cesty odklidil i Bloodwyna. Jen se ptám, kdo bude další na řadě. Havran? Nebo já?
		AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_03");//Bojíš se?
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_04");//Z boje strach nemám, ale bojím se následků, který by tvý činy mohly mít.
	};
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_05");//Tenhle tábor je to jediný, co nám ještě zbejvá.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_06");//Možná nefunguje dokonale, ale hlavně že ŇÁK funguje.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_07");//A s každým zabitým zmizí i část naší komunity.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_08");//My jsme banditi. Vyděděnci, zločinci, desperáti.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_09");//Půjdou po nás, kamkoliv se hneme. Budou se nás snažit zavřít a zabít.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_10");//Lepší místo než tohle už pro nás není, a lepší čas taky ne.
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_11");//Kam tím míříš?
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_12");//Tihle chlapi potřebujou někoho, kdo je povede. Kdo by to měl bejt? Ty? Když se furt couráš z místa na místo?
};
//----------------------------------------------------------------------
//	Info Answer
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Answer   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent   = FALSE;
	description = "Pak se ujmi vedení tábora ty.";
};
FUNC INT DIA_Addon_Thorus_Answer_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Speech)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Answer_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_00");//Pak se ujmi vedení tábora ty.
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_01");//No jo, ale co Havran?
		AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_02");//Havran bude mít brzo úplně jiné starosti. Já se o něj postarám.
	};
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_03");//Jo, a taky dohlídni na to, aby vězni mohli v klidu odejít z tábora.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_04");//No dobře. Postarám se o všecky zdejší stráže.
	
	B_LogEntry (Topic_Addon_Sklaven,"Bloodwyn je mrtvý a Thorus se postará, aby otroci mohli odejít z tábora."); 
	
	if !Npc_IsDead (PrisonGuard)
	{
		B_LogEntry (Topic_Addon_Sklaven,"Teď si s tím 'hlídačem otroků' promluvím ještě jednou, aby Patrick a jeho chlapi mohli odejít."); 
	}
	else
	{
		B_LogEntry (Topic_Addon_Sklaven,"S 'hlídačem otroků' už jsem se vypořádal a Patrick teď může klidně odejít i se svými lidmi."); 
	};
};
//----------------------------------------------------------------------
//	Info Raventot
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Raventot   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent   = FALSE;
	description = "Zvládnul jsem to. Havran už to má za sebou.";
};
FUNC INT DIA_Addon_Thorus_Raventot_Condition()
{	
	if (RavenIsDead == TRUE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raventot_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_00");//A je to. Havran už to má za sebou.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_01");//To znamená, že jsi Beliarovi zasadil pořádnou ránu.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_02");//Takže půjdeš dál?
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_03");//Moje práce v tomhle údolí skončila. Teď bych si rád pár dní odpočal.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_04");//(směje se) Jo, ty seš furt na pochodu, co? (vážně) Tak šťastnou cestu!
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_05");//Kdo ví, možná na sebe ještě někdy narazíme.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_06");//Kdo ví. Ještě budeš muset projít mnoha průsmykama i chodbama. A v jedný z nich mě najdeš.
	
	AI_StopProcessInfos (self);
	
};



