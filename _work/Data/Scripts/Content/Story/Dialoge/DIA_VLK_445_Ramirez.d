//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_EXIT   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 999;
	condition   = DIA_Ramirez_EXIT_Condition;
	information = DIA_Ramirez_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ramirez_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ramirez_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ramirez_PICKPOCKET (C_INFO)
{
	npc			= VLK_445_Ramirez;
	nr			= 900;
	condition	= DIA_Ramirez_PICKPOCKET_Condition;
	information	= DIA_Ramirez_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Ramirez_PICKPOCKET_Condition()
{
	C_Beklauen (90, 300);
};
 
FUNC VOID DIA_Ramirez_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ramirez_PICKPOCKET);
	Info_AddChoice		(DIA_Ramirez_PICKPOCKET, DIALOG_BACK 		,DIA_Ramirez_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ramirez_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ramirez_PICKPOCKET_DoIt);
};

func void DIA_Ramirez_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ramirez_PICKPOCKET);
};
	
func void DIA_Ramirez_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ramirez_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Zeichen   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Zeichen_Condition;
	information = DIA_Ramirez_Zeichen_Info;
	permanent   = FALSE;
	description = "(Pâedvést zlodęjský signál.)";
};

FUNC INT DIA_Ramirez_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Ramirez_Zeichen_14_00");//Fajn, fajn, znáš signál. (zívá) Docela mę to pâekvapuje.
};

//////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Hallo   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Hallo_Condition;
	information = DIA_Ramirez_Hallo_Info;
	permanent   = TRUE;
	important	= TRUE;
};
//----------------------------------
var int DIA_Ramirez_Hallo_permanent;
//----------------------------------
FUNC INT DIA_Ramirez_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Ramirez_Hallo_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Hallo_Info()
{
	if (self.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Join_Thiefs == FALSE) 
	{
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_00");//Ztratil ses? Nemyslim si, že tohle je to pravý místo pro tebe.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_01");//Jestli se ti tady nęco stane, nikdo z nás ti pomoct nepůjde. Takže si dávej bacha. (široký úsmęv)
	};
	if  (Join_Thiefs == TRUE)  
	{
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_02");//Tak patâíš k nám. Dobrá, tak ti pâeju hodnę štęstí - ale buë opatrný, aă už dęláš cokoli.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_03");//A ještę jedna vęc - je mi jedno, kdo jsi tam nahoâe a s kým pracuješ.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_04");//Tady dole jsi jen jedním z nás. Zlodęj. Nic víc, nic míŕ.
		DIA_Ramirez_Hallo_permanent = TRUE;
	};
	
	DG_gefunden = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info Beute
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Beute   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 3;
	condition   = DIA_Ramirez_Beute_Condition;
	information = DIA_Ramirez_Beute_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Ramirez_Beute_Condition()
{
	if ((Mob_HasItems ("THIEF_CHEST_01",ItMi_Gold) < 50)
	|| (Mob_HasItems  ("THIEF_CHEST_02",ItMi_Gold) < 100)
	|| (Mob_HasItems  ("THIEF_CHEST_02",ItMi_Silvercup) == FALSE)
	|| (Mob_HasItems  ("THIEF_CHEST_03",ItMi_Gold) < 75))
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Beute_Info()
{
	AI_Output (self, other, "DIA_Ramirez_Beute_14_00");//Poslouchej, to nemůžeš myslet vážnę, že ne? Hrabeš se v našem zlatu - to se nás pokoušíš okrást?
	AI_Output (other, self, "DIA_Ramirez_Beute_15_01");//Neâíkej, že za tu dâinu je jen tęchhle pár mincí.
	AI_Output (other, self, "DIA_Ramirez_Beute_15_02");//Myslím, tahle hromádka tady - to je CELÁ koâist? To je všechno, co má zlodęjský cech Khorinidu k dispozici?
	AI_Output (self, other, "DIA_Ramirez_Beute_14_03");//Kdo âíkal, že tady dole máme naši koâist?
	AI_Output (other, self, "DIA_Ramirez_Beute_15_04");//Stejnę tomu nemůžu uvęâit. Tak kde jste schovali ty poklady?
	AI_Output (self, other, "DIA_Ramirez_Beute_14_05");//Na velmi bezpečné místo.
	AI_Output (other, self, "DIA_Ramirez_Beute_15_06");//Aha.
	AI_Output (self, other, "DIA_Ramirez_Beute_14_07");//Dobrá, můžeš si to zlato nechat. Ale budu na tebe dávat pozor. Tak to nepâepískni.
};
//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Bezahlen   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 9;
	condition   = DIA_Ramirez_Bezahlen_Condition;
	information = DIA_Ramirez_Bezahlen_Info;
	permanent   = TRUE;
	description	= "Můžeš mę nęčemu naučit?";
};
//--------------------------------------
var int DIA_Ramirez_Bezahlen_permanent;
//--------------------------------------
FUNC INT DIA_Ramirez_Bezahlen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (DIA_Ramirez_Bezahlen_permanent == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Bezahlen_Info()
{	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		Ramirez_Cost = 150;
	}
	else 
	{
		Ramirez_Cost = 300;
	};	
		
	AI_Output (other, self, "DIA_Ramirez_Bezahlen_15_00");//Můžeš mę nęčemu naučit?
	
	if (Npc_GetTalentSkill  (other, NPC_TALENT_PICKLOCK) == TRUE)
	{ 
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_14_01");//Nemůžu tę naučit nic. O páčení zámků už víš všechno.
		if (other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output (self, other, "DIA_Ramirez_Add_14_00"); //Teë už jen potâebuješ zdokonalit svou obratnost.
		};
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_14_02");//Můžu ti ukázat, jak páčit zámky. Bude tę to stát jen...
		B_Say_Gold (self, other, Ramirez_Cost);
		
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
		Info_AddChoice (DIA_Ramirez_Bezahlen,"Možná pozdęji. (ZPĘT)",DIA_Ramirez_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Ramirez_Bezahlen,"OK, zaplatím.",DIA_Ramirez_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Ramirez_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Ramirez_Bezahlen);
};
FUNC VOID DIA_Ramirez_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Ramirez_Bezahlen_Okay_15_00");//Dobrá, zaplatím.
	
	if B_GiveInvItems (other, self, ItMi_Gold, Ramirez_Cost)
	{
		AI_Output (other, self, "DIA_Ramirez_Bezahlen_Okay_15_01");//Tady je zlato.
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_Okay_14_02");//Výbornę. Jsem ti k službám.
		Ramirez_TeachPlayer = TRUE;
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_Okay_14_03");//Nejdâív si sežeŕ zlato a pak se vraă.
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	};

};
//////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Teach   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 99;
	condition   = DIA_Ramirez_Teach_Condition;
	information = DIA_Ramirez_Teach_Info;
	permanent   = TRUE;
	description = "Nauč mę páčit zámky!";
};

FUNC INT DIA_Ramirez_Teach_Condition()
{	
	if (Ramirez_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill  (other, NPC_TALENT_PICKLOCK) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Teach_Info()
{
	AI_Output (other,self, "DIA_Ramirez_Teach_15_00");//Ukaž mi, jak se páčí zámky!
	
	if (Ramirez_Zweimal == FALSE)
	{
		AI_Output (self, other, "DIA_Ramirez_Teach_14_06");//Páčení zámků je zlodęjské umęní.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_01");//Potâebuješ spoustu citu a intuice. A hromadu paklíčů.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_02");//Ale pozor, nękteré truhly mají speciální zámky, které lze odemknout jen pomocí odpovídajícího klíče.
		Ramirez_Zweimal = TRUE;
	}
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other, "DIA_Ramirez_Teach_14_03");//Takže si klekneš pâed zámek a paklíčem otáčíš napravo a nalevo.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_04");//Když jím otočíš moc rychle nebo moc silnę, zlomí se.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_05");//Ale čím zkušenęjší budeš, tím pro tebe bude snazší s nimi zacházet.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info oberes Viertel
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Viertel   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 8;
	condition   = DIA_Ramirez_Viertel_Condition;
	information = DIA_Ramirez_Viertel_Info;
	permanent   = FALSE;
	description = "Kde to páčení zámků stojí za tu námahu?";
};
FUNC INT DIA_Ramirez_Viertel_Condition()
{
	if (Knows_SecretSign == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Viertel_Info()
{	
	AI_Output (other, self, "DIA_Ramirez_Viertel_15_00");//Kde to páčení zámků stojí za námahu?
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_01");//V horní čtvrti, samozâejmę.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_02");//Ale jestli se tam budeš chtít k nękomu vloupat, počkej si na noc, až všichni usnou - teda kromę stráží.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_03");//Hlídkují tam celou noc. Jednoho z nich znám - jmenuje se Wambo. On je jedinej, koho zajímá zlato.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_04");//Je drahej, ale když mu jednou zaplatíš, už se o to nemusíš dál starat.
};
///////////////////////////////////////////////////////////////////////
//	Info Sextant
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Sextant   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Sextant_Condition;
	information = DIA_Ramirez_Sextant_Info;
	permanent   = FALSE;
	description = "Máš pro mę práci?";
};

FUNC INT DIA_Ramirez_Sextant_Condition()
{
	if (Knows_SecretSign == TRUE)
	&& (MIS_CassiaRing == LOG_SUCCESS)
	&& (Kapitel >= 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Sextant_Info()
{
	AI_Output (other, self, "DIA_Ramirez_Sextant_15_00");//Máš pro mę práci?
	AI_Output (self, other, "DIA_Ramirez_Sextant_14_01");//Hmm... je tu jedna vęcička, kterou bych rád męl. Ale zatím jsem ji nenašel.
	AI_Output (other, self, "DIA_Ramirez_Sextant_15_02");//Co to je?
	AI_Output (self, other, "DIA_Ramirez_Sextant_14_03");//Úhlomęr. Pâines mi sextant - dám ti za nęj dobrou cenu.
	
	Log_CreateTopic (Topic_RamirezSextant,LOG_MISSION);
	Log_SetTopicStatus (Topic_RamirezSextant, LOG_RUNNING);
	B_LogEntry (Topic_RamirezSextant, "Ramirez mę požádal, abych mu pâinesl sextant.");
	
	MIS_RamirezSextant = LOG_RUNNING;
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Success   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Success_Condition;
	information = DIA_Ramirez_Success_Info;
	permanent   = FALSE;
	description = "Mám pro tebe ten sextant.";
};

FUNC INT DIA_Ramirez_Success_Condition()
{
	if Npc_KnowsInfo (other, DIA_Ramirez_Sextant)
	&& (Npc_HasItems (other, Itmi_Sextant ) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Success_Info()
{
	AI_Output (other, self, "DIA_Ramirez_Success_15_00");//Mám pro tebe ten sextant.
	B_GiveInvItems (other, self, Itmi_Sextant,1);
	AI_Output (self, other, "DIA_Ramirez_Success_14_01");//To není možný. Vážnę se ti povedlo nęjaký najít.
	AI_Output (self, other, "DIA_Ramirez_Success_14_02");//Tady, ty peníze si vážnę zasloužíš.
	
	B_GiveInvItems (self, other, Itmi_Gold,Value_Sextant/2);
	Ramirez_Sextant = TRUE;
	MIS_RamirezSextant = LOG_SUCCESS;
	B_GivePlayerXP (XP_RamirezSextant);
};


