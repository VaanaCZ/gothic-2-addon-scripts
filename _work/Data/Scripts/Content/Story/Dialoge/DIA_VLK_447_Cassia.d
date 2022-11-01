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
		AI_Output (self, other, "DIA_Cassia_Gilde_16_00");//Vidím, že ses přidal na stranu práva a řádu.
		AI_Output (self, other, "DIA_Cassia_Gilde_16_01");//Nevadí, že ses stal služebníkem Innose. Jsi jedním z nás. A já doufám, že se nějaký způsob najde.
	};
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_02");//Tak teď patříš k Innosově církvi. Fajn, ale ještě pořád jsi jedním z nás - doufám, že jsi na to nezapomněl.
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
	AI_Output (self, other, "DIA_Cassia_Abgelaufen_16_00");//Tvůj čas vypršel. Neměl ses vracet.
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
		AI_Output (other, self, "DIA_Cassia_News_15_01");//Dobrá, Cassio, tak mi řekni, proč jsem tady.
		AI_Output (self, other, "DIA_Cassia_News_16_02");//Upoutal jsi naši pozornost tím, že jsi dokázal získat důvěru jednoho z našich přátel.
		AI_Output (self, other, "DIA_Cassia_News_16_03");//A my ti chceme dát šanci. Můžeš se k nám přidat.
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_News_16_04");//To se podívejme, kdo sem našel cestu. Attila tě podcenil. Nehodlám udělat stejnou chybu.
		AI_Output (other, self, "DIA_Cassia_News_15_05");//Co to tady kujete?
		AI_Output (self, other, "DIA_Cassia_News_16_06");//Chceme tě připravit o život za to, že jsi donášel na našeho přítele. Proto jsme poslali Attilu.
		AI_Output (self, other, "DIA_Cassia_News_16_07");//Nicméně - tvoje přítomnost nám poskytuje nové možnosti...
		AI_Output (other, self, "DIA_Cassia_News_15_08");//...co mi chceš nabídnout?
		AI_Output (self, other, "DIA_Cassia_News_16_09");//Můžeš se k nám přidat.
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
	description = "Řekni mi o vaší organizaci víc.";
};

FUNC INT DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_mehr_Info()
{
	AI_Output (other, self, "DIA_Cassia_mehr_15_00");//Řekni mi o vaší organizaci víc.
	AI_Output (self, other, "DIA_Cassia_mehr_16_01");//Lidé z města jsou námi trochu znepokojeni. Ale nikdo nezná náš úkryt.
	AI_Output (self, other, "DIA_Cassia_mehr_16_02");//Ta hrstka lidí, co ví o existenci stok, věří, že jsou zamčené a nikdo se do nich nemůže dostat.
	AI_Output (self, other, "DIA_Cassia_mehr_16_03");//A dokud se do nich nikdo nedostane, můžeme v klidu pracovat.
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
	description = "Co víš o těch zmizelých lidech?";
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
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_00"); //Víš něco víc o těch pohřešovaných lidech?
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_01"); //A co je ti vlastně po tom?
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_02"); //Chci zjistit, co se s nimi stalo.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_03"); //Když vylezeš ze stok, plavej chvíli dál podél pobřeží doprava.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_04"); //Tam najdeš odpovědi.
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
	description = "Co z toho budu mít, když se k vám přidám?";
};

FUNC INT DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_Vorteil_Info()
{
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_00");//Co z toho budu mít, když se k vám přidám?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_01");//Můžeš se od nás naučit pár zajímavejch věcí - schopnosti, které ti umožní žít v přepychu.
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
	description = "Co se od vás můžu naučit?";
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
	AI_Output (other, self, "DIA_Cassia_Lernen_15_00");//Co se od vás můžu naučit?
	AI_Output (self, other, "DIA_Cassia_Lernen_16_01");//Jesper je mistrem v plížení. Ukáže ti, jak se nehlučně pohybovat.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_02");//Ramirez je výjimečně nadaný zloděj. Jeho ručičkám neodolá žádný zámek.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_03");//A já tě naučím, jak si přivlastňovat obsahy kapes. Cizích.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_04");//Taky ti pomůžu s tím, jak dosáhnout větší obratnosti. Protože obratnost je klíčem ke tvým schopnostem.
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry(Topic_CityTeacher,"Cassia mě naučí kapsářství a pomůže mi zvýšit obratnost.");
	B_LogEntry(Topic_CityTeacher,"Ramirez mě naučí, jak páčit zámky.");
	B_LogEntry(Topic_CityTeacher,"Jesper mě naučí plížení.");
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
	AI_Output (self, other, "DIA_Cassia_Regeln_16_02");//Za prvé: Nešpitneš o nás ani slůvko. Nikomu. Nikdy.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_03");//Za druhé: Nenecháš se chytit.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_04");//Za třetí: Jestli tady dole na někoho vytáhneš zbraň, zabijeme tě.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_05");//A čtvrté, poslední pravidlo je: Každý, kdo se k nám chce přidat, musí prokázat, že k něčemu je.
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
	description = "Co se stane, když mě chytnou?";
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
	AI_Output (other, self, "DIA_Cassia_Erwischen_15_00");//Co se stane, když mě chytnou?
	AI_Output (self, other, "DIA_Cassia_Erwischen_16_01");//Prostě se nenech chytit, jasné?
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
	description = "Jak mám dokázat, že jsem co k čemu?";
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
	AI_Output (other, self, "DIA_Cassia_beweisen_15_00");//Jak mám dokázat, že jsem co k čemu?
	
	if (Join_Thiefs == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_01");//Tak přidáš se k nám, nebo ne?
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_02");//Ten paličatej starej alchymista - Constantino - má nádherný prsten.
		AI_Output (self, other, "DIA_Cassia_beweisen_16_03");//Ale jemu vážně není k ničemu. Chci, aby zdobil mou ruku.
		
		MIS_CassiaRing = LOG_RUNNING;
		DIA_Cassia_beweisen_permanent = TRUE;
		
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaRing,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaRing,"Cassia po mně chce, abych jí přinesl Constantinův prsten.");
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
	AI_Output (self, other, "DIA_Cassia_Beitreten_16_01");//Výborně. Dostal jsi šanci prokázat, co v tobě vězí. A jestli se chceš od nás něčemu přiučit, jsi tady vítán.
	
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
	description = "A co když se k vám nebudu chtít přidat?";
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
	AI_Output (other, self, "DIA_Cassia_Ablehnen_15_00");//A co když se k vám nebudu chtít přidat...?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_01");//Zahazuješ šanci, která se naskytne jen jednou, ale můžeš jít.
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_02");//(vážně) A ani nepomysli na to, že bys nás někomu prozradil. Mohl bys toho trpce litovat.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"OK, jdu do toho.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Musím si to rozmyslet.",DIA_Cassia_Ablehnen_Frist);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_03");//V tom případě tě zabiju.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"OK, jdu do toho.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"No tak si mě zkus zabít.",DIA_Cassia_Ablehnen_Kill);
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Okay()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Okay_15_00");//Dobrá, jdu do toho.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_01");//(usmívá se) Učinil jsi správné rozhodnutí. Jestli uspěješ ve zkoušce, můžeš rozšířit naše řady.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_02");//Jestli se chceš nejprve naučit zlodějské dovednosti, posluž si - budeš je potřebovat.
	Join_Thiefs = TRUE; 
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};
FUNC VOID DIA_Cassia_Ablehnen_Kill()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Kill_15_00");//No tak si mě zkus zabít.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Kill_16_01");//To je zlé. Měl jsem dojem, že jsi chytřejší.

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Cassia_Ablehnen_Frist()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Frist_15_00");//Musím si to rozmyslet.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Frist_16_01");//Jak chceš. Dávám ti dva dny na rozmyšlenou. Po uplynutí lhůty už se tu nesmíš ukázat.
	
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
	description = "Můžeš mě něco naučit?";
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
	AI_Output (other, self, "DIA_Cassia_BevorLernen_15_00");//Můžeš mě něco naučit?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_01");//Jasně, žádný problém. Prostě mi dej vědět, až budeš připraven.
		Cassia_TeachPickpocket = TRUE;
		Cassia_TeachDEX = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_02");//Jasně. Kapsářství a obratnost tě bude každá stát 100 zlatých.
	
		Info_ClearChoices (DIA_Cassia_BevorLernen);
		Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Možná později. (ZPĚT)",DIA_Cassia_BevorLernen_Spaeter);
		
		if (Cassia_TeachPickpocket == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Chtěl bych se naučit kapsářskému umění (zaplatit 100 zlaťáků).",DIA_Cassia_BevorLernen_Pickpocket);
		};
		
		if (Cassia_TeachDEX == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Chci se stát obratnějším (zaplatit 100 zlaťáků).",DIA_Cassia_BevorLernen_DEX);
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
		AI_Output (other, self, "DIA_Cassia_BevorLernen_DEX_15_00");//Chci dosáhnout větší obratnosti. Tady je zlato.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_DEX_16_01");//Můžeme začít hned, jak budeš připraven.
		Cassia_TeachDEX = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");//Vrať se, až budeš mít zlato.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
FUNC VOID DIA_Cassia_BevorLernen_Pickpocket()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_Pickpocket_15_00");//Chci se dozvědět něco o kapsářství. Tady je zlato.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_01");//Můžeme začít hned, jak budeš připraven.
		Cassia_TeachPickpocket = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_02");//Vrať se, až budeš mít zlato.
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
	description	 = 	"Chtěl bych být o něco obratnější.";
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
	AI_Output (other, self, "DIA_Cassia_TEACH_15_00"); //Chtěl bych být o něco obratnější.
	
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
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_01");//Jestli chceš někomu vyprázdnit kapsy, rozptyl ho. Prostě si s ním začni povídat, hoďte řeč.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_02");//Zatímco na něj mluvíš, pořádně si ho odhadni. Všímej si nacpaných kapes, šperků nebo kožených řemínků kolem krku. A hlavně si hlídej, jak moc je ten chlápek všímavý.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_03");//Obrat nalitého nádeníka není to samé jako okrást ostražitého obchodníka, měj to na paměti.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_04");//Když budeš neohrabaný, tak samozřejmě bude čuchat zradu. Tak hlavně klídek.
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
	description = "Dostal jsem Constantinův prsten.";
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
	AI_Output (other, self, "DIA_Cassia_Aufnahme_15_00");//Dostal jsem Constantinův prsten.
	B_GiveInvItems (other, self,ItRi_Prot_Point_01_MIS,1);
	
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_01");//Gratuluju. Prošel jsi vstupní zkouškou. Teď jsi opravdu jedním z nás.
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_02");//Vezmi si tenhle klíč. Je od dveří od hotelu. (úsměv) Tak nebudeš muset pokaždé plavat.
	B_GiveInvItems (self, other,ItKe_ThiefGuildKey_Hotel_MIS,1);
	
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_03");//Taky bys měl vědět, že máme tajné znamení. Zvláštní kývnutí.
	AI_PlayAni (other,"T_YES");
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_04");//Přesně. Když budeš mluvit s tím pravým člověkem a uděláš tenhle posunek, bude vědět, že jsi jedním z nás.
		
	MIS_CassiaRing = LOG_SUCCESS;
	B_GivePlayerXP (XP_CassiaRing);
	Knows_SecretSign = TRUE;
	Log_CreateTopic (Topic_Diebesgilde, LOG_NOTE);
	B_LogEntry (Topic_Diebesgilde,"Byl jsem přijat do zlodějského cechu."); 
	B_LogEntry (Topic_Diebesgilde,"Naučil jsem se zlodějský signál - když jej ukážu těm správným lidem, poznají, že jsem jedním z nich.");
	 
	
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
	description = "Tak kde ukrýváte svou kořist?";
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
	AI_Output (other, self, "DIA_Cassia_Versteck_15_00");//Tak kde ukrýváte svou kořist?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_01");//Hele, snad si vážně nemyslíš, že ti tohle řeknu?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_02");//Budeš mít dost příležitostí, aby sis užil své vlastní kořisti. Pamatuj - kdo je moc nenasytný, skončí s prázdnýma rukama.
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
	description = "Máš pro mě práci?";
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
	AI_Output (other, self, "DIA_Cassia_Blutkelche_15_00");//Máš pro mě práci?
	
	if (PETZCOUNTER_City_Theft  > 0)
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_01");//Ne do té doby, co tě ve městě budou znát jako zloděje.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_02");//Nejdřív uklidni situaci - zaplať pokutu nebo se zbav svědků, je mi to jedno. Prostě to nějak vyřeš.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_03");//Ano. Je tady sada kalichů. Je jich šest.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_04");//Král Rhobar je získal na jedné ze svých válečných výprav -  ale obětoval mnoho mužů na to, aby si je mohl odvézt. Proto se jim říká krvavé kalichy.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_05");//Žádný z těch kalichů nemá sám o sobě velkou cenu - ale všech šest pohromadě představuje celé jmění.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_06");//Kde jsou ty kalichy?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_07");//Jsou tady, ve městě - patří bohatým obchodníkům z horní čtvrti.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_08");//Přines mi je. Já se zatím pokusit sehnat na ně kupce.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_09");//Co z toho budu mít?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_10");//Buď polovinu zisku, nebo si můžeš vzít jeden zajímavý předmět z mé kořisti.
 		
 		MIS_CassiaKelche = LOG_RUNNING;
 		Log_CreateTopic(Topic_Cassiakelche,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaKelche,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaKelche,"Cassia mě požádala, abych jí přinesl šest krvavých kalichů. Nejspíš je všechny najdu kdesi ve městě.");
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
	description = "Co se týká těch kalichů...";
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
		AI_Output (other, self, "DIA_Cassia_abgeben_15_01");//Mám těch šest kalichů.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_02");//Dobrá práce. Já jsem zatím našla kupce.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_03");//Můžeš si hned vzít svou odměnu. Dík, žes to pro mě udělal.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_04");//Už pro tebe nemám nic na práci - ale můžeš se ode mě kdykoli něčemu naučit. A navíc, na tomhle ostrově je toho dost, co jen čeká, až si to někdo vezme. (usmívá se)
		    
		
		MIS_CassiaKelche = LOG_SUCCESS;
		B_GivePlayerXP (XP_CassiaBlutkelche);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_abgeben_16_05");//Můžu ty kalichy prodat jen jako sadu. Přines mi je všechny.
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
	description = "Přišel jsem si pro svoji odměnu.";
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
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_00");//Přišel jsem si pro svoji odměnu.
	AI_Output (self, other, "DIA_Cassia_Belohnung_16_01");//Co sis vybral?
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
	
	Info_AddChoice (DIA_Cassia_Belohnung,"400 zlaťáků.",DIA_Cassia_Belohnung_Gold);
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
