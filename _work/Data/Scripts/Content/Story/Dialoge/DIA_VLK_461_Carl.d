///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Carl_EXIT   (C_INFO)
{
	npc         = VLK_461_Carl;
	nr          = 999;
	condition   = DIA_Carl_EXIT_Condition;
	information = DIA_Carl_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Carl_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Carl_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
FUNC VOID B_CarlSayHallo ()
{
	AI_Output (self, other, "DIA_Carl_Hallo_05_00"); //Vypadá to, že tu ve męstę máme pár zlodęjů, co okrádají boháče.
	AI_Output (self, other, "DIA_Carl_Hallo_05_01"); //Męstská stráž nedávno obrátila pâístavní čtvră vzhůru nohama, ale nenašli vůbec nic.
	
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Carl_PICKPOCKET (C_INFO)
{
	npc			= VLK_461_Carl;
	nr			= 900;
	condition	= DIA_Carl_PICKPOCKET_Condition;
	information	= DIA_Carl_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Carl_PICKPOCKET_Condition()
{
	C_Beklauen (34, 40);
};
 
FUNC VOID DIA_Carl_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Carl_PICKPOCKET);
	Info_AddChoice		(DIA_Carl_PICKPOCKET, DIALOG_BACK 		,DIA_Carl_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Carl_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Carl_PICKPOCKET_DoIt);
};

func void DIA_Carl_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Carl_PICKPOCKET);
};
	
func void DIA_Carl_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Carl_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Carl_Hallo   (C_INFO)
{
	npc         = VLK_461_Carl;
	nr          = 2;
	condition   = DIA_Carl_Hallo_Condition;
	information = DIA_Carl_Hallo_Info;
	permanent   = FALSE;
	Important	= TRUE;
};

FUNC INT DIA_Carl_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Carl_Hallo_Info()
{
	AI_Output (self, other, "DIA_Carl_Hallo_05_02"); //Co dęláš v týhle ubohý špinavý díâe? Co tady hledáš?
	
	Info_ClearChoices (DIA_Carl_Hallo);
	Info_AddChoice (DIA_Carl_Hallo,"Zabloudil jsem.",DIA_Carl_Hallo_verlaufen);
	Info_AddChoice (DIA_Carl_Hallo,"Jen se dívám kolem.",DIA_Carl_Hallo_umsehen);
	
	
};
FUNC VOID DIA_Carl_Hallo_verlaufen()
{
	AI_Output (other, self, "DIA_Carl_Hallo_verlaufen_15_00");//Zabloudil jsem.
	AI_Output (self, other, "DIA_Carl_Hallo_verlaufen_05_01");//Tak si dávej pozor, aby tę nikdo neokradl.
	B_CarlSayHallo();
	Info_ClearChoices (DIA_Carl_Hallo);
	
};
FUNC VOID DIA_Carl_Hallo_umsehen()
{
	AI_Output (other, self, "DIA_Carl_Hallo_umsehen_15_00");//Jen se dívám kolem.
	AI_Output (self, other, "DIA_Carl_Hallo_umsehen_05_01");//Aha. Tak si dávej bacha, aă tę nikdo nechytí, jak tu čenicháš.
	B_CarlSayHallo();
	Info_ClearChoices (DIA_Carl_Hallo);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebe
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Carl_Diebe   (C_INFO)
{
	npc         = VLK_461_Carl;
	nr          = 3;
	condition   = DIA_Carl_Diebe_Condition;
	information = DIA_Carl_Diebe_Info;
	permanent   = FALSE;
	description	= "Co víš o tęch zlodęjích?";
};

FUNC INT DIA_Carl_Diebe_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Carl_Diebe_Info()
{
	AI_Output (other, self, "DIA_Carl_Diebe_15_00");//Co víš o tęch zlodęjích?
	AI_Output (self, other, "DIA_Carl_Diebe_05_01");//Nic. Ale všichni męšăané jsou vydęšení a začínají být nedůvęâiví - obzvlášă vůči cizincům.
	AI_Output (self, other, "DIA_Carl_Diebe_05_02");//Nenech se nachytat v cizím domę - na to se tady nikdo nekouká moc vlídnę.
	AI_Output (self, other, "DIA_Carl_Diebe_05_03");//Ano, musíš se umęt bránit zlodęjům. Nejlíp na to jít s poâádnę tlustým klackem.
};
///////////////////////////////////////////////////////////////////////
//	Info Lernen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Carl_Lernen   (C_INFO)
{
	npc         = VLK_461_Carl;
	nr          = 3;
	condition   = DIA_Carl_Lernen_Condition;
	information = DIA_Carl_Lernen_Info;
	permanent   = FALSE;
	description	= "Můžeš mę nęčemu naučit?";
};

FUNC INT DIA_Carl_Lernen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Carl_Lernen_Info()
{
	AI_Output (other, self, "DIA_Carl_Lernen_15_00");//Můžu se u tebe nęčemu pâiučit?
	AI_Output (self, other, "DIA_Carl_Lernen_05_01");//No, vyrobil jsem nękolik klik a nęco hâebíků a opravuju kovové součástky.
	AI_Output (self, other, "DIA_Carl_Lernen_05_02");//Ale o kování zbraní toho nevím tolik, abych tę mohl učit.
	AI_Output (self, other, "DIA_Carl_Lernen_05_03");//Jestli se chceš nęco naučit, zajdi za Haradem. On určitę ví, jak se vyrábęjí zbranę!
	AI_Output (self, other, "DIA_Carl_Lernen_05_04");//Ale jestli si chceš trochu vypracovat svaly, tak s tím ti můžu pomoct.
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Carl, kováâ z pâístavní čtvrti, mi může pomoci vylepšit sílu.");
};
///////////////////////////////////////////////////////////////////////
//	Info Für's lernen bezahlen 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Carl_Wieviel   (C_INFO)
{
	npc         = VLK_461_Carl;
	nr          = 3;
	condition   = DIA_Carl_Wieviel_Condition;
	information = DIA_Carl_Wieviel_Info;
	permanent   = FALSE;
	description	= "Kolik si za výcvik necháváš platit?";
};

FUNC INT DIA_Carl_Wieviel_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Carl_Lernen)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Carl_Wieviel_Info()
{
	AI_Output (other, self, "DIA_Carl_Wieviel_15_00");//Kolik si necháváš platit za výcvik?
	
	if Npc_KnowsInfo (other,DIA_Edda_Statue)
	{
		AI_Output (self, other, "DIA_Carl_Wieviel_05_01");//Slyšel jsem, žes pracoval pro Eddu. Budu tę cvičit zadarmo.
		Carl_TeachSTR = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Carl_Wieviel_05_02");//50 zlatých a já ti dopomůžu k vętší síle.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Gold zahlen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Carl_bezahlen   (C_INFO)
{
	npc         = VLK_461_Carl;
	nr          = 3;
	condition   = DIA_Carl_bezahlen_Condition;
	information = DIA_Carl_bezahlen_Info;
	permanent   = TRUE;
	description	= "Rád bych se u tebe nechal vycvičit (zaplatit 50 zlaăáků).";
};
FUNC INT DIA_Carl_bezahlen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Carl_Wieviel)
	&& (Carl_TeachSTR == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Carl_bezahlen_Info()
{
	AI_Output (other, self, "DIA_Carl_bezahlen_15_00");//Chtęl bych s tebou cvičit.
	
	if Npc_KnowsInfo (other,DIA_Edda_Statue)
	{
		AI_Output (self, other, "DIA_Carl_bezahlen_05_01");//Slyšel jsem, žes pracoval pro Eddu. Budu tę cvičit zadarmo.
		Carl_TeachSTR = TRUE;
	}
	else 
	{
		if B_GiveInvItems (other, self, ItMi_Gold, 50)
		{
			AI_Output (self, other, "DIA_Carl_bezahlen_05_02");//Dobâe, můžeme začít hned, jak budeš pâipraven.
			Carl_TeachSTR = TRUE;
		}
		else 
		{
			AI_Output (self, other, "DIA_Carl_bezahlen_05_03");//Dej mi zlato a pak tę budu trénovat.
		};
	};
};
//*******************************************
//	TechPlayer
//*******************************************

INSTANCE DIA_Carl_Teach(C_INFO)
{
	npc			= VLK_461_Carl;
	nr			= 7;
	condition	= DIA_Carl_Teach_Condition;
	information	= DIA_Carl_Teach_Info;
	permanent	= TRUE;
	description = "Chtęl bych se stát silnęjším.";
};                       

FUNC INT DIA_Carl_Teach_Condition()
{
	if (Carl_TeachSTR == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Carl_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Carl_Teach_15_00"); //Chtęl bych se stát silnęjším.

	Info_ClearChoices (DIA_Carl_Teach);
	Info_AddChoice		(DIA_Carl_Teach, DIALOG_BACK, DIA_Carl_Teach_Back);
	Info_AddChoice		(DIA_Carl_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Carl_Teach_STR_1);
	Info_AddChoice		(DIA_Carl_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Carl_Teach_STR_5);
};

FUNC VOID DIA_Carl_Teach_Back ()
{
	Info_ClearChoices (DIA_Carl_Teach);
};

FUNC VOID DIA_Carl_Teach_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_HIGH);
	
	Info_ClearChoices 	(DIA_Carl_Teach);
	Info_AddChoice		(DIA_Carl_Teach, DIALOG_BACK, DIA_Carl_Teach_Back);
	Info_AddChoice		(DIA_Carl_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Carl_Teach_STR_1);
	Info_AddChoice		(DIA_Carl_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Carl_Teach_STR_5);
};

FUNC VOID DIA_Carl_Teach_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_HIGH);
	
	Info_ClearChoices 	(DIA_Carl_Teach);
	Info_AddChoice		(DIA_Carl_Teach, DIALOG_BACK, DIA_Carl_Teach_Back);
	Info_AddChoice		(DIA_Carl_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Carl_Teach_STR_1);
	Info_AddChoice		(DIA_Carl_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Carl_Teach_STR_5);
};
