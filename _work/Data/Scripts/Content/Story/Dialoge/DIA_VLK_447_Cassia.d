//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_EXIT   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 999;
	condition   = DIA_Cassia_EXIT_Condition;
	information = DIA_Cassia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Cassia_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Cassia_PICKME (C_INFO)
{
	npc			= VLK_447_Cassia;
	nr			= 900;
	condition	= DIA_Cassia_PICKME_Condition;
	information	= DIA_Cassia_PICKME_Info;
	permanent	= TRUE;
	description = Pickpocket_100_Female;
};                       

FUNC INT DIA_Cassia_PICKME_Condition()
{
	C_Beklauen (100, 400);
};
 
FUNC VOID DIA_Cassia_PICKME_Info()
{	
	Info_ClearChoices	(DIA_Cassia_PICKME);
	Info_AddChoice		(DIA_Cassia_PICKME, DIALOG_BACK 		,DIA_Cassia_PICKME_BACK);
	Info_AddChoice		(DIA_Cassia_PICKME, DIALOG_PICKPOCKET	,DIA_Cassia_PICKME_DoIt);
};

func void DIA_Cassia_PICKME_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cassia_PICKME);
};
	
func void DIA_Cassia_PICKME_BACK()
{
	Info_ClearChoices (DIA_Cassia_PICKME);
};
//////////////////////////////////////////////////////////////////////
//	Info Gilde
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Gilde   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 1;
	condition   = DIA_Cassia_Gilde_Condition;
	information = DIA_Cassia_Gilde_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Cassia_Gilde_Condition()
{	
	if (Cassia_Gildencheck == TRUE)
	&& (Join_Thiefs == TRUE)
	&& ((other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Gilde_Info()
{
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_00");//Vidím, e ses pøidal na stranu práva a øádu.
		AI_Output (self, other, "DIA_Cassia_Gilde_16_01");//Nevadí, e ses stal sluebníkem Innose. Jsi jedním z nás. A já doufám, e se nìjakı zpùsob najde.
	};
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_02");//Tak teï patøíš k Innosovì církvi. Fajn, ale ještì poøád jsi jedním z nás - doufám, e jsi na to nezapomnìl.
	};
	
	
	AI_StopProcessInfos (self);
	
};
//////////////////////////////////////////////////////////////////////
//	Info Frist abgelaufen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Abgelaufen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Abgelaufen_Condition;
	information = DIA_Cassia_Abgelaufen_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Cassia_Abgelaufen_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Cassia_Frist == TRUE)  
	&& (Cassia_Day < (B_GetDayPlus() -2))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Abgelaufen_Info()
{
	AI_Output (self, other, "DIA_Cassia_Abgelaufen_16_00");//Tvùj èas vypršel. Nemìl ses vracet.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0); 
};
//////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_News   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 1;
	condition   = DIA_Cassia_News_Condition;
	information = DIA_Cassia_News_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Cassia_News_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_News_Info()
{
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_News_16_00");//Vidím, e jsi dostal náš dar. Jsem Cassia.
		AI_Output (other, self, "DIA_Cassia_News_15_01");//Dobrá, Cassio, tak mi øekni, proè jsem tady.
		AI_Output (self, other, "DIA_Cassia_News_16_02");//Upoutal jsi naši pozornost tím, e jsi dokázal získat dùvìru jednoho z našich pøátel.
		AI_Output (self, other, "DIA_Cassia_News_16_03");//A my ti chceme dát šanci. Mùeš se k nám pøidat.
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_News_16_04");//To se podívejme, kdo sem našel cestu. Attila tì podcenil. Nehodlám udìlat stejnou chybu.
		AI_Output (other, self, "DIA_Cassia_News_15_05");//Co to tady kujete?
		AI_Output (self, other, "DIA_Cassia_News_16_06");//Chceme tì pøipravit o ivot za to, e jsi donášel na našeho pøítele. Proto jsme poslali Attilu.
		AI_Output (self, other, "DIA_Cassia_News_16_07");//Nicménì - tvoje pøítomnost nám poskytuje nové monosti...
		AI_Output (other, self, "DIA_Cassia_News_15_08");//...co mi chceš nabídnout?
		AI_Output (self, other, "DIA_Cassia_News_16_09");//Mùeš se k nám pøidat.
	};
	if  (Npc_GetTrueGuild (other) == GIL_NONE)
	||  (Npc_GetTrueGuild (other) == GIL_NOV)
	{	
		Cassia_Gildencheck = TRUE;
	};
	
	DG_gefunden = TRUE;
};
//////////////////////////////////////////////////////////////////////
//	Info Erzähle mir mehr 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_mehr   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_mehr_Condition;
	information = DIA_Cassia_mehr_Info;
	permanent   = FALSE;
	description = "Øekni mi o vaší organizaci víc.";
};

FUNC INT DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_mehr_Info()
{
	AI_Output (other, self, "DIA_Cassia_mehr_15_00");//Øekni mi o vaší organizaci víc.
	AI_Output (self, other, "DIA_Cassia_mehr_16_01");//Lidé z mìsta jsou námi trochu znepokojeni. Ale nikdo nezná náš úkryt.
	AI_Output (self, other, "DIA_Cassia_mehr_16_02");//Ta hrstka lidí, co ví o existenci stok, vìøí, e jsou zamèené a nikdo se do nich nemùe dostat.
	AI_Output (self, other, "DIA_Cassia_mehr_16_03");//A dokud se do nich nikdo nedostane, mùeme v klidu pracovat.
};

//////////////////////////////////////////////////////////////////////
//	Vermisste Leute
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_MissingPeople   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_MissingPeople_Condition;
	information = DIA_Cassia_MissingPeople_Info;
	permanent   = FALSE;
	description = "Co víš o tìch zmizelıch lidech?";
};

FUNC INT DIA_Cassia_MissingPeople_Condition()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cassia_MissingPeople_Info()
{
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_00"); //Víš nìco víc o tìch pohøešovanıch lidech?
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_01"); //A co je ti vlastnì po tom?
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_02"); //Chci zjistit, co se s nimi stalo.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_03"); //Kdy vylezeš ze stok, plavej chvíli dál podél pobøeí doprava.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_04"); //Tam najdeš odpovìdi.
};


//////////////////////////////////////////////////////////////////////
//	Info Was habe ich davon? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Vorteil   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 3;
	condition   = DIA_Cassia_Vorteil_Condition;
	information = DIA_Cassia_Vorteil_Info;
	permanent   = FALSE;
	description = "Co z toho budu mít, kdy se k vám pøidám?";
};

FUNC INT DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_Vorteil_Info()
{
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_00");//Co z toho budu mít, kdy se k vám pøidám?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_01");//Mùeš se od nás nauèit pár zajímavejch vìcí - schopnosti, které ti umoní ít v pøepychu.
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_02");//Ale nemusím se skrıvat tady dole, nebo jo?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_03");//(tichı smích) Ne. Musíš jen dodrovat naše pravidla. To je všechno.
};
//////////////////////////////////////////////////////////////////////
//	Info Was kann ich bei euch lernen?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Lernen  (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 4;
	condition   = DIA_Cassia_Lernen_Condition;
	information = DIA_Cassia_Lernen_Info;
	permanent   = FALSE;
	description = "Co se od vás mùu nauèit?";
};

FUNC INT DIA_Cassia_Lernen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Vorteil)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Lernen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Lernen_15_00");//Co se od vás mùu nauèit?
	AI_Output (self, other, "DIA_Cassia_Lernen_16_01");//Jesper je mistrem v plíení. Ukáe ti, jak se nehluènì pohybovat.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_02");//Ramirez je vıjimeènì nadanı zlodìj. Jeho ruèièkám neodolá ádnı zámek.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_03");//A já tì nauèím, jak si pøivlastòovat obsahy kapes. Cizích.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_04");//Taky ti pomùu s tím, jak dosáhnout vìtší obratnosti. Protoe obratnost je klíèem ke tvım schopnostem.
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry(Topic_CityTeacher,"Cassia mì nauèí kapsáøství a pomùe mi zvıšit obratnost.");
	B_LogEntry(Topic_CityTeacher,"Ramirez mì nauèí, jak páèit zámky.");
	B_LogEntry(Topic_CityTeacher,"Jesper mì nauèí plíení.");
};
//////////////////////////////////////////////////////////////////////
//	Info Regeln 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Regeln   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 3;
	condition   = DIA_Cassia_Regeln_Condition;
	information = DIA_Cassia_Regeln_Info;
	permanent   = FALSE;
	description = "Jaká jsou vaše pravidla?";
};

FUNC INT DIA_Cassia_Regeln_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Vorteil)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Regeln_Info()
{
	AI_Output (other, self, "DIA_Cassia_Regeln_15_00");//Jaká jsou vaše pravidla?
	//AI_Output (self, other, "DIA_Cassia_Regeln_16_01");//Wir richten uns nach drei Regeln.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_02");//Za prvé: Nešpitneš o nás ani slùvko. Nikomu. Nikdy.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_03");//Za druhé: Nenecháš se chytit.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_04");//Za tøetí: Jestli tady dole na nìkoho vytáhneš zbraò, zabijeme tì.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_05");//A ètvrté, poslední pravidlo je: Kadı, kdo se k nám chce pøidat, musí prokázat, e k nìèemu je.
};
//////////////////////////////////////////////////////////////////////
//	Info Was passiert, wenn ich erwischt werde? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Erwischen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Erwischen_Condition;
	information = DIA_Cassia_Erwischen_Info;
	permanent   = FALSE;
	description = "Co se stane, kdy mì chytnou?";
};

FUNC INT DIA_Cassia_Erwischen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Erwischen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Erwischen_15_00");//Co se stane, kdy mì chytnou?
	AI_Output (self, other, "DIA_Cassia_Erwischen_16_01");//Prostì se nenech chytit, jasné?
};
//////////////////////////////////////////////////////////////////////
//	Info Wie muss ich mich beweisen?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_beweisen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_beweisen_Condition;
	information = DIA_Cassia_beweisen_Info;
	permanent   = TRUE;
	description = "Jak mám dokázat, e jsem co k èemu?";
};
//--------------------------------------
var int DIA_Cassia_beweisen_permanent;
//-------------------------------------
FUNC INT DIA_Cassia_beweisen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	&& (DIA_Cassia_beweisen_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_beweisen_Info()
{
	AI_Output (other, self, "DIA_Cassia_beweisen_15_00");//Jak mám dokázat, e jsem co k èemu?
	
	if (Join_Thiefs == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_01");//Tak pøidáš se k nám, nebo ne?
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_02");//Ten palièatej starej alchymista - Constantino - má nádhernı prsten.
		AI_Output (self, other, "DIA_Cassia_beweisen_16_03");//Ale jemu vánì není k nièemu. Chci, aby zdobil mou ruku.
		
		MIS_CassiaRing = LOG_RUNNING;
		DIA_Cassia_beweisen_permanent = TRUE;
		
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaRing,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaRing,"Cassia po mnì chce, abych jí pøinesl Constantinùv prsten.");
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Beitreten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Beitreten   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 10;
	condition   = DIA_Cassia_Beitreten_Condition;
	information = DIA_Cassia_Beitreten_Info;
	permanent   = FALSE;
	description = "OK, jdu do toho.";
};

FUNC INT DIA_Cassia_Beitreten_Condition()
{	
	if (Join_Thiefs == FALSE)
	&& Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Beitreten_Info()
{
	AI_Output (other, self, "DIA_Cassia_Beitreten_15_00");//Dobrá, jdu do toho.
	AI_Output (self, other, "DIA_Cassia_Beitreten_16_01");//Vıbornì. Dostal jsi šanci prokázat, co v tobì vìzí. A jestli se chceš od nás nìèemu pøiuèit, jsi tady vítán.
	
	Join_Thiefs = TRUE;
};
//////////////////////////////////////////////////////////////////////
//	Info Und wenn ich euch nicht beitrete...? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Ablehnen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 9;
	condition   = DIA_Cassia_Ablehnen_Condition;
	information = DIA_Cassia_Ablehnen_Info;
	permanent   = FALSE;
	description = "A co kdy se k vám nebudu chtít pøidat?";
};

FUNC INT DIA_Cassia_Ablehnen_Condition()
{	
	if (Join_Thiefs == FALSE)
	&& Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_15_00");//A co kdy se k vám nebudu chtít pøidat...?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_01");//Zahazuješ šanci, která se naskytne jen jednou, ale mùeš jít.
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_02");//(vánì) A ani nepomysli na to, e bys nás nìkomu prozradil. Mohl bys toho trpce litovat.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"OK, jdu do toho.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Musím si to rozmyslet.",DIA_Cassia_Ablehnen_Frist);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_03");//V tom pøípadì tì zabiju.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"OK, jdu do toho.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"No tak si mì zkus zabít.",DIA_Cassia_Ablehnen_Kill);
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Okay()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Okay_15_00");//Dobrá, jdu do toho.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_01");//(usmívá se) Uèinil jsi správné rozhodnutí. Jestli uspìješ ve zkoušce, mùeš rozšíøit naše øady.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_02");//Jestli se chceš nejprve nauèit zlodìjské dovednosti, poslu si - budeš je potøebovat.
	Join_Thiefs = TRUE; 
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};
FUNC VOID DIA_Cassia_Ablehnen_Kill()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Kill_15_00");//No tak si mì zkus zabít.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Kill_16_01");//To je zlé. Mìl jsem dojem, e jsi chytøejší.

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Cassia_Ablehnen_Frist()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Frist_15_00");//Musím si to rozmyslet.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Frist_16_01");//Jak chceš. Dávám ti dva dny na rozmyšlenou. Po uplynutí lhùty u se tu nesmíš ukázat.
	
	Cassia_Day = B_GetDayPlus ();
	Cassia_Frist = TRUE;
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};


//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_BevorLernen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 5;
	condition   = DIA_Cassia_BevorLernen_Condition;
	information = DIA_Cassia_BevorLernen_Info;
	permanent   = TRUE;
	description = "Mùeš mì nìco nauèit?";
};
FUNC INT DIA_Cassia_BevorLernen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	&& ((Cassia_TeachPickpocket == FALSE)
	|| (Cassia_TeachDEX == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_BevorLernen_Info()
{
	AI_Output (other, self, "DIA_Cassia_BevorLernen_15_00");//Mùeš mì nìco nauèit?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_01");//Jasnì, ádnı problém. Prostì mi dej vìdìt, a budeš pøipraven.
		Cassia_TeachPickpocket = TRUE;
		Cassia_TeachDEX = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_02");//Jasnì. Kapsáøství a obratnost tì bude kadá stát 100 zlatıch.
	
		Info_ClearChoices (DIA_Cassia_BevorLernen);
		Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Moná pozdìji. (ZPÌT)",DIA_Cassia_BevorLernen_Spaeter);
		
		if (Cassia_TeachPickpocket == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Chtìl bych se nauèit kapsáøskému umìní (zaplatit 100 zlaákù).",DIA_Cassia_BevorLernen_Pickpocket);
		};
		
		if (Cassia_TeachDEX == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Chci se stát obratnìjším (zaplatit 100 zlaákù).",DIA_Cassia_BevorLernen_DEX);
		};
	};
};
FUNC VOID DIA_Cassia_BevorLernen_Spaeter()
{
	Info_ClearChoices (DIA_Cassia_BevorLernen);
};
FUNC VOID DIA_Cassia_BevorLernen_DEX()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_DEX_15_00");//Chci dosáhnout vìtší obratnosti. Tady je zlato.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_DEX_16_01");//Mùeme zaèít hned, jak budeš pøipraven.
		Cassia_TeachDEX = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");//Vra se, a budeš mít zlato.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
FUNC VOID DIA_Cassia_BevorLernen_Pickpocket()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_Pickpocket_15_00");//Chci se dozvìdìt nìco o kapsáøství. Tady je zlato.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_01");//Mùeme zaèít hned, jak budeš pøipraven.
		Cassia_TeachPickpocket = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_02");//Vra se, a budeš mít zlato.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_TEACH		(C_INFO)
{
	npc		  	 = 	VLK_447_Cassia;
	nr			 = 	12;
	condition	 = 	DIA_Cassia_TEACH_Condition;
	information	 = 	DIA_Cassia_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chtìl bych bıt o nìco obratnìjší.";
};
func int DIA_Cassia_TEACH_Condition ()
{	
	if (Cassia_TeachDEX == TRUE) 
	{
		return TRUE;
	};
};
func void DIA_Cassia_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Cassia_TEACH_15_00"); //Chtìl bych bıt o nìco obratnìjší.
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
};
func void DIA_Cassia_TEACH_BACK()
{
	Info_ClearChoices (DIA_Cassia_TEACH);
};
func void DIA_Cassia_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
	
};
func void DIA_Cassia_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
	
};
//////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Pickpocket   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 10;
	condition   = DIA_Cassia_Pickpocket_Condition;
	information = DIA_Cassia_Pickpocket_Info;
	permanent   = TRUE;
	description = "Uka mi, jak vybírat cizí kapsy. (10 VB)";
};

FUNC INT DIA_Cassia_Pickpocket_Condition()
{	
	if (Cassia_TeachPickpocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Pickpocket_Info()
{
	AI_Output (other, self, "DIA_Cassia_Pickpocket_15_00");//Uka mi, jak se vybírají kapsy.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET)
	{
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_01");//Jestli chceš nìkomu vyprázdnit kapsy, rozptyl ho. Prostì si s ním zaèni povídat, hoïte øeè.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_02");//Zatímco na nìj mluvíš, poøádnì si ho odhadni. Všímej si nacpanıch kapes, šperkù nebo koenıch øemínkù kolem krku. A hlavnì si hlídej, jak moc je ten chlápek všímavı.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_03");//Obrat nalitého nádeníka není to samé jako okrást ostraitého obchodníka, mìj to na pamìti.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_04");//Kdy budeš neohrabanı, tak samozøejmì bude èuchat zradu. Tak hlavnì klídek.
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Aufnahme
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Aufnahme   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Aufnahme_Condition;
	information = DIA_Cassia_Aufnahme_Info;
	permanent   = FALSE;
	description = "Dostal jsem Constantinùv prsten.";
};

FUNC INT DIA_Cassia_Aufnahme_Condition()
{	
	if (MIS_CassiaRing == LOG_RUNNING)
	&& (Npc_HasItems (other, ItRi_Prot_Point_01_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Aufnahme_Info()
{
	AI_Output (other, self, "DIA_Cassia_Aufnahme_15_00");//Dostal jsem Constantinùv prsten.
	B_GiveInvItems (other, self,ItRi_Prot_Point_01_MIS,1);
	
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_01");//Gratuluju. Prošel jsi vstupní zkouškou. Teï jsi opravdu jedním z nás.
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_02");//Vezmi si tenhle klíè. Je od dveøí od hotelu. (úsmìv) Tak nebudeš muset pokadé plavat.
	B_GiveInvItems (self, other,ItKe_ThiefGuildKey_Hotel_MIS,1);
	
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_03");//Taky bys mìl vìdìt, e máme tajné znamení. Zvláštní kıvnutí.
	AI_PlayAni (other,"T_YES");
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_04");//Pøesnì. Kdy budeš mluvit s tím pravım èlovìkem a udìláš tenhle posunek, bude vìdìt, e jsi jedním z nás.
		
	MIS_CassiaRing = LOG_SUCCESS;
	B_GivePlayerXP (XP_CassiaRing);
	Knows_SecretSign = TRUE;
	Log_CreateTopic (Topic_Diebesgilde, LOG_NOTE);
	B_LogEntry (Topic_Diebesgilde,"Byl jsem pøijat do zlodìjského cechu."); 
	B_LogEntry (Topic_Diebesgilde,"Nauèil jsem se zlodìjskı signál - kdy jej ukáu tìm správnım lidem, poznají, e jsem jedním z nich.");
	 
	
};
//////////////////////////////////////////////////////////////////////
//	Info Versteck
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Versteck   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Versteck_Condition;
	information = DIA_Cassia_Versteck_Info;
	permanent   = FALSE;
	description = "Tak kde ukrıváte svou koøist?";
};

FUNC INT DIA_Cassia_Versteck_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& Npc_KnowsInfo (other,DIA_Ramirez_Beute)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Versteck_Info()
{
	AI_Output (other, self, "DIA_Cassia_Versteck_15_00");//Tak kde ukrıváte svou koøist?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_01");//Hele, snad si vánì nemyslíš, e ti tohle øeknu?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_02");//Budeš mít dost pøíleitostí, aby sis uil své vlastní koøisti. Pamatuj - kdo je moc nenasytnı, skonèí s prázdnıma rukama.
};
//////////////////////////////////////////////////////////////////////
//	Info Blutkelche
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Blutkelche   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Blutkelche_Condition;
	information = DIA_Cassia_Blutkelche_Info;
	permanent   = FALSE;
	description = "Máš pro mì práci?";
};

FUNC INT DIA_Cassia_Blutkelche_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& (MIS_CassiaKelche != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Blutkelche_Info()
{
	AI_Output (other, self, "DIA_Cassia_Blutkelche_15_00");//Máš pro mì práci?
	
	if (PETZCOUNTER_City_Theft  > 0)
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_01");//Ne do té doby, co tì ve mìstì budou znát jako zlodìje.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_02");//Nejdøív uklidni situaci - zapla pokutu nebo se zbav svìdkù, je mi to jedno. Prostì to nìjak vyøeš.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_03");//Ano. Je tady sada kalichù. Je jich šest.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_04");//Král Rhobar je získal na jedné ze svıch váleènıch vıprav -  ale obìtoval mnoho muù na to, aby si je mohl odvézt. Proto se jim øíká krvavé kalichy.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_05");//ádnı z tìch kalichù nemá sám o sobì velkou cenu - ale všech šest pohromadì pøedstavuje celé jmìní.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_06");//Kde jsou ty kalichy?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_07");//Jsou tady, ve mìstì - patøí bohatım obchodníkùm z horní ètvrti.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_08");//Pøines mi je. Já se zatím pokusit sehnat na nì kupce.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_09");//Co z toho budu mít?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_10");//Buï polovinu zisku, nebo si mùeš vzít jeden zajímavı pøedmìt z mé koøisti.
 		
 		MIS_CassiaKelche = LOG_RUNNING;
 		Log_CreateTopic(Topic_Cassiakelche,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaKelche,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaKelche,"Cassia mì poádala, abych jí pøinesl šest krvavıch kalichù. Nejspíš je všechny najdu kdesi ve mìstì.");
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Kelche abgeben
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_abgeben   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_abgeben_Condition;
	information = DIA_Cassia_abgeben_Info;
	permanent   = TRUE;
	description = "Co se tıká tìch kalichù...";
};

FUNC INT DIA_Cassia_abgeben_Condition()
{	
	if (MIS_CassiaKelche == LOG_RUNNING)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_abgeben_Info()
{
	AI_Output (other, self, "DIA_Cassia_abgeben_15_00");//Pokud jde o ty kalichy...
	
	if B_GiveInvItems (other, self, ItMi_BloodCup_MIS,6)
	{
		AI_Output (other, self, "DIA_Cassia_abgeben_15_01");//Mám tìch šest kalichù.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_02");//Dobrá práce. Já jsem zatím našla kupce.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_03");//Mùeš si hned vzít svou odmìnu. Dík, es to pro mì udìlal.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_04");//U pro tebe nemám nic na práci - ale mùeš se ode mì kdykoli nìèemu nauèit. A navíc, na tomhle ostrovì je toho dost, co jen èeká, a si to nìkdo vezme. (usmívá se)
		    
		
		MIS_CassiaKelche = LOG_SUCCESS;
		B_GivePlayerXP (XP_CassiaBlutkelche);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_abgeben_16_05");//Mùu ty kalichy prodat jen jako sadu. Pøines mi je všechny.
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Belohung
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Belohnung   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Belohnung_Condition;
	information = DIA_Cassia_Belohnung_Info;
	permanent   = FALSE;
	description = "Pøišel jsem si pro svoji odmìnu.";
};

FUNC INT DIA_Cassia_Belohnung_Condition()
{	
	if (MIS_CassiaKelche == LOG_SUCCESS)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Belohnung_Info()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_00");//Pøišel jsem si pro svoji odmìnu.
	AI_Output (self, other, "DIA_Cassia_Belohnung_16_01");//Co sis vybral?
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
	
	Info_AddChoice (DIA_Cassia_Belohnung,"400 zlaákù.",DIA_Cassia_Belohnung_Gold);
	Info_AddChoice (DIA_Cassia_Belohnung,"4 elixíry hojivé síly",DIA_Cassia_Belohnung_Trank);
	Info_AddChoice (DIA_Cassia_Belohnung, NAME_ADDON_CASSIASBELOHNUNGSRING ,DIA_Cassia_Belohnung_Ring);
	
};
FUNC VOID DIA_Cassia_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_02");//Dej mi zlato.
	B_GiveInvItems (self, other, ItmI_Gold,400);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
FUNC VOID DIA_Cassia_Belohnung_Trank()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_03");//Dej mi lektvary.
	B_GiveInvItems (self, other, ItPo_Health_03,4);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
FUNC VOID DIA_Cassia_Belohnung_Ring()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_04");//Dej mi prsten.
	B_GiveInvItems (self, other, ItRi_Hp_01,1);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
