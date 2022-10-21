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
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_00");//Pravidla znáš. Bez èervenı kamennı tabulky se nikdo do dolu nedostane.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Hi_15_01");//Na dùl zapomeò - chci vidìt Havrana.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_02");//Ale i tak tu máme svı pravidla a ty se tıkaj všech. Dokonce i tebe.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_03");//Vra se. Kdy se pokusíš bez dovolení vstoupit tam nahoru, stráe tì zabijou. TAKOVİ jsou pravidla.
	
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
	description = "Musím se nutnì dostat k Havranovi...";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raven_15_00");//Nutnì se musím dostat k Havranovi.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_01");//Vánì? Fakt si myslíš, e se k nìmu dostaneš?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_02");//Jeho stráe maj rozkaz, aby k nìmu NIKOHO nepouštìly. Byl bys mrtvej, ještì ne by ses k nìmu dostal.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_03");//Tak to pus z hlavy.

	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Havran je vùdcem banditù. Jestli se k nìmu chci dostat, budu jich muset pár odklidit z cesty."); 
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
	description = "Pamatuješ se na mì? Ze Starého tábora...";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Zeit_15_00");//Ty se na mì nepamatuješ? Ze Starıho tábora?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_01");//Tys byl jedním z vìzòù?! Klidnì jsi moh patøit i k mı strái. A to si myslíš, e z nás teï dìlá spojence, nebo co?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_02");//Ne, to ne.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_03");//Moná seš ten maník, co rozbil bariéru - a moná seš i ten, co pobil mı kámoše.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_04");//A co?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_05");//Ty doby u jsou pryè.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_06");//Chceš dovnitø? Tak si seeò èervenej kámen a nezdruj mì.
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
	description = "No tak, pus mì dál. Kvùli starım dobrım èasùm.";
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
	AI_Output (other, self, "DIA_Addon_Thorus_Add_15_00"); //No tak, pus mì tam. Pro starı dobrı èasy.
	if (Thorus_GoodOldPerm == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_01"); //Nìco ti vysvìtlím. Víš, proè jsem ještì naivu?
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_02"); //Protoe jsem vdycky vìrnej svejm lidem.
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_03"); //Nemusím souhlasit se vším, co Havran dìlá, ale musím dodrovat pravidla. 
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_04"); //A ty taky!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_05"); //(pevnì) Ne!
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
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Stein_12_01");//Tohle není ten pravej kámen. Dùleitı jsou jenom ty èervenı.
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
	description = "Mám tu pro tebe èervenou kamennou tabulku...";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_00");//Mám tu èervenou tabulku.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_01");//Fajn.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_02");//Ty jsi zabil Estebana, take teï budeš jeho práci dìlat TY!
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_03");//V dole mají trochu problémy s dùlníma èervama.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_04");//U to koupili tøi kopáèi a ty se teï máš postarat o náhradu.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_05");//A kdy se koneènì dostanu do toho zatracenıho dolu?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_06");//Napøed dokonèi práci a pak si mùeš dìlat, co chceš.
	
	MIS_Send_Buddler = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Buddler, LOG_RUNNING);
	B_LogEntry (Topic_Addon_Buddler,"Jeliko jsem teï nahradil Estebana, mìl bych do dolu poslat tøi kopáèe.");
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
	description = "Poslal jsem tam tøi chlapy.";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Sent_15_00");//Poslal jsem tam tøi chlapy.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Sent_12_01");//No dobøe. Tak teï si pro mì za mì mùeš jít dovnitø.

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
	description = "No teda, co to máš za brnìní? Kde bych takové sehnal?";
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
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_01");//To nejde. Tuhle zbroj mùou nosit jenom Havranovy stráe.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_02");//Pochybuju, e by noví kandidáti mìli skládat òákı zkoušky Ale závìreènı rozhodnutí stejnì nezáleí na mnì, ale na Havranovi.
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
	description = "Jak se vede vìzòùm?";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");//Jak se vede vìzòùm?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");//Hmm, udìlali svou práci. Pokud vím, teï by mìli kutat zlato.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");//A co kdy uteèou?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");//Tak za nima Bloodwyn pošle stráe. Ale pochybuju, e by byli tak blbí a utíkali.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");//Pokud...
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");//Pokud co?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");//Pokud je k tomu nìkdo nepøimìje. Ale ádnıho takovıho cvoka neznám, aspoò dokud je tu Bloodwyn.
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
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_01");//Coe??
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_02");//Take teï u jsi z cesty odklidil i Bloodwyna. Jen se ptám, kdo bude další na øadì. Havran? Nebo já?
		AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_03");//Bojíš se?
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_04");//Z boje strach nemám, ale bojím se následkù, kterı by tvı èiny mohly mít.
	};
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_05");//Tenhle tábor je to jedinı, co nám ještì zbejvá.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_06");//Moná nefunguje dokonale, ale hlavnì e ÒÁK funguje.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_07");//A s kadım zabitım zmizí i èást naší komunity.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_08");//My jsme banditi. Vydìdìnci, zloèinci, desperáti.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_09");//Pùjdou po nás, kamkoliv se hneme. Budou se nás snait zavøít a zabít.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_10");//Lepší místo ne tohle u pro nás není, a lepší èas taky ne.
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_11");//Kam tím míøíš?
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_12");//Tihle chlapi potøebujou nìkoho, kdo je povede. Kdo by to mìl bejt? Ty? Kdy se furt couráš z místa na místo?
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
		AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_02");//Havran bude mít brzo úplnì jiné starosti. Já se o nìj postarám.
	};
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_03");//Jo, a taky dohlídni na to, aby vìzni mohli v klidu odejít z tábora.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_04");//No dobøe. Postarám se o všecky zdejší stráe.
	
	B_LogEntry (Topic_Addon_Sklaven,"Bloodwyn je mrtvı a Thorus se postará, aby otroci mohli odejít z tábora."); 
	
	if !Npc_IsDead (PrisonGuard)
	{
		B_LogEntry (Topic_Addon_Sklaven,"Teï si s tím 'hlídaèem otrokù' promluvím ještì jednou, aby Patrick a jeho chlapi mohli odejít."); 
	}
	else
	{
		B_LogEntry (Topic_Addon_Sklaven,"S 'hlídaèem otrokù' u jsem se vypoøádal a Patrick teï mùe klidnì odejít i se svımi lidmi."); 
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
	description = "Zvládnul jsem to. Havran u to má za sebou.";
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
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_00");//A je to. Havran u to má za sebou.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_01");//To znamená, e jsi Beliarovi zasadil poøádnou ránu.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_02");//Take pùjdeš dál?
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_03");//Moje práce v tomhle údolí skonèila. Teï bych si rád pár dní odpoèal.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_04");//(smìje se) Jo, ty seš furt na pochodu, co? (vánì) Tak šastnou cestu!
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_05");//Kdo ví, moná na sebe ještì nìkdy narazíme.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_06");//Kdo ví. Ještì budeš muset projít mnoha prùsmykama i chodbama. A v jednı z nich mì najdeš.
	
	AI_StopProcessInfos (self);
	
};



