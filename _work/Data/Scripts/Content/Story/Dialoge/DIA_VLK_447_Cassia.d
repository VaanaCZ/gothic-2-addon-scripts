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
		AI_Output (self, other, "DIA_Cassia_Gilde_16_00");//Vidím, že ses pâidal na stranu práva a âádu.
		AI_Output (self, other, "DIA_Cassia_Gilde_16_01");//Nevadí, že ses stal služebníkem Innose. Jsi jedním z nás. A já doufám, že se nêjaký zpùsob najde.
	};
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_02");//Tak teë patâíš k Innosovê církvi. Fajn, ale ještê poâád jsi jedním z nás - doufám, že jsi na to nezapomnêl.
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
	AI_Output (self, other, "DIA_Cassia_Abgelaufen_16_00");//Tvùj èas vypršel. Nemêl ses vracet.
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
		AI_Output (self, other, "DIA_Cassia_News_16_00");//Vidím, že jsi dostal náš dar. Jsem Cassia.
		AI_Output (other, self, "DIA_Cassia_News_15_01");//Dobrá, Cassio, tak mi âekni, proè jsem tady.
		AI_Output (self, other, "DIA_Cassia_News_16_02");//Upoutal jsi naši pozornost tím, že jsi dokázal získat dùvêru jednoho z našich pâátel.
		AI_Output (self, other, "DIA_Cassia_News_16_03");//A my ti chceme dát šanci. Mùžeš se k nám pâidat.
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_News_16_04");//To se podívejme, kdo sem našel cestu. Attila tê podcenil. Nehodlám udêlat stejnou chybu.
		AI_Output (other, self, "DIA_Cassia_News_15_05");//Co to tady kujete?
		AI_Output (self, other, "DIA_Cassia_News_16_06");//Chceme tê pâipravit o život za to, že jsi donášel na našeho pâítele. Proto jsme poslali Attilu.
		AI_Output (self, other, "DIA_Cassia_News_16_07");//Nicménê - tvoje pâítomnost nám poskytuje nové možnosti...
		AI_Output (other, self, "DIA_Cassia_News_15_08");//...co mi chceš nabídnout?
		AI_Output (self, other, "DIA_Cassia_News_16_09");//Mùžeš se k nám pâidat.
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
	description = "Âekni mi o vaší organizaci víc.";
};

FUNC INT DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_mehr_Info()
{
	AI_Output (other, self, "DIA_Cassia_mehr_15_00");//Âekni mi o vaší organizaci víc.
	AI_Output (self, other, "DIA_Cassia_mehr_16_01");//Lidé z mêsta jsou námi trochu znepokojeni. Ale nikdo nezná náš úkryt.
	AI_Output (self, other, "DIA_Cassia_mehr_16_02");//Ta hrstka lidí, co ví o existenci stok, vêâí, že jsou zamèené a nikdo se do nich nemùže dostat.
	AI_Output (self, other, "DIA_Cassia_mehr_16_03");//A dokud se do nich nikdo nedostane, mùžeme v klidu pracovat.
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
	description = "Co víš o têch zmizelých lidech?";
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
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_00"); //Víš nêco víc o têch pohâešovaných lidech?
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_01"); //A co je ti vlastnê po tom?
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_02"); //Chci zjistit, co se s nimi stalo.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_03"); //Když vylezeš ze stok, plavej chvíli dál podél pobâeží doprava.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_04"); //Tam najdeš odpovêdi.
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
	description = "Co z toho budu mít, když se k vám pâidám?";
};

FUNC INT DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_Vorteil_Info()
{
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_00");//Co z toho budu mít, když se k vám pâidám?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_01");//Mùžeš se od nás nauèit pár zajímavejch vêcí - schopnosti, které ti umožní žít v pâepychu.
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_02");//Ale nemusím se skrývat tady dole, nebo jo?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_03");//(tichý smích) Ne. Musíš jen dodržovat naše pravidla. To je všechno.
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
	description = "Co se od vás mùžu nauèit?";
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
	AI_Output (other, self, "DIA_Cassia_Lernen_15_00");//Co se od vás mùžu nauèit?
	AI_Output (self, other, "DIA_Cassia_Lernen_16_01");//Jesper je mistrem v plížení. Ukáže ti, jak se nehluènê pohybovat.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_02");//Ramirez je výjimeènê nadaný zlodêj. Jeho ruèièkám neodolá žádný zámek.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_03");//A já tê nauèím, jak si pâivlastàovat obsahy kapes. Cizích.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_04");//Taky ti pomùžu s tím, jak dosáhnout vêtší obratnosti. Protože obratnost je klíèem ke tvým schopnostem.
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry(Topic_CityTeacher,"Cassia mê nauèí kapsáâství a pomùže mi zvýšit obratnost.");
	B_LogEntry(Topic_CityTeacher,"Ramirez mê nauèí, jak páèit zámky.");
	B_LogEntry(Topic_CityTeacher,"Jesper mê nauèí plížení.");
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
	AI_Output (self, other, "DIA_Cassia_Regeln_16_04");//Za tâetí: Jestli tady dole na nêkoho vytáhneš zbraà, zabijeme tê.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_05");//A ètvrté, poslední pravidlo je: Každý, kdo se k nám chce pâidat, musí prokázat, že k nêèemu je.
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
	description = "Co se stane, když mê chytnou?";
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
	AI_Output (other, self, "DIA_Cassia_Erwischen_15_00");//Co se stane, když mê chytnou?
	AI_Output (self, other, "DIA_Cassia_Erwischen_16_01");//Prostê se nenech chytit, jasné?
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
	description = "Jak mám dokázat, že jsem co k èemu?";
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
	AI_Output (other, self, "DIA_Cassia_beweisen_15_00");//Jak mám dokázat, že jsem co k èemu?
	
	if (Join_Thiefs == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_01");//Tak pâidáš se k nám, nebo ne?
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_02");//Ten palièatej starej alchymista - Constantino - má nádherný prsten.
		AI_Output (self, other, "DIA_Cassia_beweisen_16_03");//Ale jemu vážnê není k nièemu. Chci, aby zdobil mou ruku.
		
		MIS_CassiaRing = LOG_RUNNING;
		DIA_Cassia_beweisen_permanent = TRUE;
		
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaRing,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaRing,"Cassia po mnê chce, abych jí pâinesl Constantinùv prsten.");
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
	AI_Output (self, other, "DIA_Cassia_Beitreten_16_01");//Výbornê. Dostal jsi šanci prokázat, co v tobê vêzí. A jestli se chceš od nás nêèemu pâiuèit, jsi tady vítán.
	
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
	description = "A co když se k vám nebudu chtít pâidat?";
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
	AI_Output (other, self, "DIA_Cassia_Ablehnen_15_00");//A co když se k vám nebudu chtít pâidat...?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_01");//Zahazuješ šanci, která se naskytne jen jednou, ale mùžeš jít.
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_02");//(vážnê) A ani nepomysli na to, že bys nás nêkomu prozradil. Mohl bys toho trpce litovat.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"OK, jdu do toho.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Musím si to rozmyslet.",DIA_Cassia_Ablehnen_Frist);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_03");//V tom pâípadê tê zabiju.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"OK, jdu do toho.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"No tak si mê zkus zabít.",DIA_Cassia_Ablehnen_Kill);
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Okay()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Okay_15_00");//Dobrá, jdu do toho.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_01");//(usmívá se) Uèinil jsi správné rozhodnutí. Jestli uspêješ ve zkoušce, mùžeš rozšíâit naše âady.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_02");//Jestli se chceš nejprve nauèit zlodêjské dovednosti, posluž si - budeš je potâebovat.
	Join_Thiefs = TRUE; 
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};
FUNC VOID DIA_Cassia_Ablehnen_Kill()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Kill_15_00");//No tak si mê zkus zabít.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Kill_16_01");//To je zlé. Mêl jsem dojem, že jsi chytâejší.

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Cassia_Ablehnen_Frist()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Frist_15_00");//Musím si to rozmyslet.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Frist_16_01");//Jak chceš. Dávám ti dva dny na rozmyšlenou. Po uplynutí lhùty už se tu nesmíš ukázat.
	
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
	description = "Mùžeš mê nêco nauèit?";
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
	AI_Output (other, self, "DIA_Cassia_BevorLernen_15_00");//Mùžeš mê nêco nauèit?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_01");//Jasnê, žádný problém. Prostê mi dej vêdêt, až budeš pâipraven.
		Cassia_TeachPickpocket = TRUE;
		Cassia_TeachDEX = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_02");//Jasnê. Kapsáâství a obratnost tê bude každá stát 100 zlatých.
	
		Info_ClearChoices (DIA_Cassia_BevorLernen);
		Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Možná pozdêji. (ZPÊT)",DIA_Cassia_BevorLernen_Spaeter);
		
		if (Cassia_TeachPickpocket == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Chtêl bych se nauèit kapsáâskému umêní (zaplatit 100 zlaãákù).",DIA_Cassia_BevorLernen_Pickpocket);
		};
		
		if (Cassia_TeachDEX == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Chci se stát obratnêjším (zaplatit 100 zlaãákù).",DIA_Cassia_BevorLernen_DEX);
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
		AI_Output (other, self, "DIA_Cassia_BevorLernen_DEX_15_00");//Chci dosáhnout vêtší obratnosti. Tady je zlato.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_DEX_16_01");//Mùžeme zaèít hned, jak budeš pâipraven.
		Cassia_TeachDEX = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");//Vraã se, až budeš mít zlato.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
FUNC VOID DIA_Cassia_BevorLernen_Pickpocket()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_Pickpocket_15_00");//Chci se dozvêdêt nêco o kapsáâství. Tady je zlato.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_01");//Mùžeme zaèít hned, jak budeš pâipraven.
		Cassia_TeachPickpocket = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_02");//Vraã se, až budeš mít zlato.
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
	description	 = 	"Chtêl bych být o nêco obratnêjší.";
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
	AI_Output (other, self, "DIA_Cassia_TEACH_15_00"); //Chtêl bych být o nêco obratnêjší.
	
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
	description = "Ukaž mi, jak vybírat cizí kapsy. (10 VB)";
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
	AI_Output (other, self, "DIA_Cassia_Pickpocket_15_00");//Ukaž mi, jak se vybírají kapsy.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET)
	{
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_01");//Jestli chceš nêkomu vyprázdnit kapsy, rozptyl ho. Prostê si s ním zaèni povídat, hoëte âeè.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_02");//Zatímco na nêj mluvíš, poâádnê si ho odhadni. Všímej si nacpaných kapes, šperkù nebo kožených âemínkù kolem krku. A hlavnê si hlídej, jak moc je ten chlápek všímavý.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_03");//Obrat nalitého nádeníka není to samé jako okrást ostražitého obchodníka, mêj to na pamêti.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_04");//Když budeš neohrabaný, tak samozâejmê bude èuchat zradu. Tak hlavnê klídek.
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
	
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_01");//Gratuluju. Prošel jsi vstupní zkouškou. Teë jsi opravdu jedním z nás.
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_02");//Vezmi si tenhle klíè. Je od dveâí od hotelu. (úsmêv) Tak nebudeš muset pokaždé plavat.
	B_GiveInvItems (self, other,ItKe_ThiefGuildKey_Hotel_MIS,1);
	
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_03");//Taky bys mêl vêdêt, že máme tajné znamení. Zvláštní kývnutí.
	AI_PlayAni (other,"T_YES");
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_04");//Pâesnê. Když budeš mluvit s tím pravým èlovêkem a udêláš tenhle posunek, bude vêdêt, že jsi jedním z nás.
		
	MIS_CassiaRing = LOG_SUCCESS;
	B_GivePlayerXP (XP_CassiaRing);
	Knows_SecretSign = TRUE;
	Log_CreateTopic (Topic_Diebesgilde, LOG_NOTE);
	B_LogEntry (Topic_Diebesgilde,"Byl jsem pâijat do zlodêjského cechu."); 
	B_LogEntry (Topic_Diebesgilde,"Nauèil jsem se zlodêjský signál - když jej ukážu têm správným lidem, poznají, že jsem jedním z nich.");
	 
	
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
	description = "Tak kde ukrýváte svou koâist?";
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
	AI_Output (other, self, "DIA_Cassia_Versteck_15_00");//Tak kde ukrýváte svou koâist?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_01");//Hele, snad si vážnê nemyslíš, že ti tohle âeknu?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_02");//Budeš mít dost pâíležitostí, aby sis užil své vlastní koâisti. Pamatuj - kdo je moc nenasytný, skonèí s prázdnýma rukama.
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
	description = "Máš pro mê práci?";
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
	AI_Output (other, self, "DIA_Cassia_Blutkelche_15_00");//Máš pro mê práci?
	
	if (PETZCOUNTER_City_Theft  > 0)
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_01");//Ne do té doby, co tê ve mêstê budou znát jako zlodêje.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_02");//Nejdâív uklidni situaci - zaplaã pokutu nebo se zbav svêdkù, je mi to jedno. Prostê to nêjak vyâeš.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_03");//Ano. Je tady sada kalichù. Je jich šest.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_04");//Král Rhobar je získal na jedné ze svých váleèných výprav -  ale obêtoval mnoho mužù na to, aby si je mohl odvézt. Proto se jim âíká krvavé kalichy.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_05");//Žádný z têch kalichù nemá sám o sobê velkou cenu - ale všech šest pohromadê pâedstavuje celé jmêní.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_06");//Kde jsou ty kalichy?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_07");//Jsou tady, ve mêstê - patâí bohatým obchodníkùm z horní ètvrti.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_08");//Pâines mi je. Já se zatím pokusit sehnat na nê kupce.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_09");//Co z toho budu mít?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_10");//Buë polovinu zisku, nebo si mùžeš vzít jeden zajímavý pâedmêt z mé koâisti.
 		
 		MIS_CassiaKelche = LOG_RUNNING;
 		Log_CreateTopic(Topic_Cassiakelche,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaKelche,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaKelche,"Cassia mê požádala, abych jí pâinesl šest krvavých kalichù. Nejspíš je všechny najdu kdesi ve mêstê.");
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
	description = "Co se týká têch kalichù...";
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
		AI_Output (other, self, "DIA_Cassia_abgeben_15_01");//Mám têch šest kalichù.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_02");//Dobrá práce. Já jsem zatím našla kupce.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_03");//Mùžeš si hned vzít svou odmênu. Dík, žes to pro mê udêlal.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_04");//Už pro tebe nemám nic na práci - ale mùžeš se ode mê kdykoli nêèemu nauèit. A navíc, na tomhle ostrovê je toho dost, co jen èeká, až si to nêkdo vezme. (usmívá se)
		    
		
		MIS_CassiaKelche = LOG_SUCCESS;
		B_GivePlayerXP (XP_CassiaBlutkelche);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_abgeben_16_05");//Mùžu ty kalichy prodat jen jako sadu. Pâines mi je všechny.
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
	description = "Pâišel jsem si pro svoji odmênu.";
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
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_00");//Pâišel jsem si pro svoji odmênu.
	AI_Output (self, other, "DIA_Cassia_Belohnung_16_01");//Co sis vybral?
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
	
	Info_AddChoice (DIA_Cassia_Belohnung,"400 zlaãákù.",DIA_Cassia_Belohnung_Gold);
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
