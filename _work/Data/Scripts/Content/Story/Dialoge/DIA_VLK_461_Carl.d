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
	AI_Output (self, other, "DIA_Carl_Hallo_05_00"); //Vypad· to, ûe tu ve mÏstÏ m·me p·r zlodÏj˘, co okr·dajÌ boh·Ëe.
	AI_Output (self, other, "DIA_Carl_Hallo_05_01"); //MÏstsk· str·û ned·vno obr·tila p¯ÌstavnÌ Ëtvrù vzh˘ru nohama, ale nenaöli v˘bec nic.
	
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
	AI_Output (self, other, "DIA_Carl_Hallo_05_02"); //Co dÏl·ö v t˝hle uboh˝ öpinav˝ dÌ¯e? Co tady hled·ö?
	
	Info_ClearChoices (DIA_Carl_Hallo);
	Info_AddChoice (DIA_Carl_Hallo,"Zabloudil jsem.",DIA_Carl_Hallo_verlaufen);
	Info_AddChoice (DIA_Carl_Hallo,"Jen se dÌv·m kolem.",DIA_Carl_Hallo_umsehen);
	
	
};
FUNC VOID DIA_Carl_Hallo_verlaufen()
{
	AI_Output (other, self, "DIA_Carl_Hallo_verlaufen_15_00");//Zabloudil jsem.
	AI_Output (self, other, "DIA_Carl_Hallo_verlaufen_05_01");//Tak si d·vej pozor, aby tÏ nikdo neokradl.
	B_CarlSayHallo();
	Info_ClearChoices (DIA_Carl_Hallo);
	
};
FUNC VOID DIA_Carl_Hallo_umsehen()
{
	AI_Output (other, self, "DIA_Carl_Hallo_umsehen_15_00");//Jen se dÌv·m kolem.
	AI_Output (self, other, "DIA_Carl_Hallo_umsehen_05_01");//Aha. Tak si d·vej bacha, aù tÏ nikdo nechytÌ, jak tu Ëenich·ö.
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
	description	= "Co vÌö o tÏch zlodÏjÌch?";
};

FUNC INT DIA_Carl_Diebe_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Carl_Diebe_Info()
{
	AI_Output (other, self, "DIA_Carl_Diebe_15_00");//Co vÌö o tÏch zlodÏjÌch?
	AI_Output (self, other, "DIA_Carl_Diebe_05_01");//Nic. Ale vöichni mÏöùanÈ jsou vydÏöenÌ a zaËÌnajÌ b˝t ned˘vÏ¯ivÌ - obzvl·öù v˘Ëi cizinc˘m.
	AI_Output (self, other, "DIA_Carl_Diebe_05_02");//Nenech se nachytat v cizÌm domÏ - na to se tady nikdo nekouk· moc vlÌdnÏ.
	AI_Output (self, other, "DIA_Carl_Diebe_05_03");//Ano, musÌö se umÏt br·nit zlodÏj˘m. NejlÌp na to jÌt s po¯·dnÏ tlust˝m klackem.
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
	description	= "M˘ûeö mÏ nÏËemu nauËit?";
};

FUNC INT DIA_Carl_Lernen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Carl_Lernen_Info()
{
	AI_Output (other, self, "DIA_Carl_Lernen_15_00");//M˘ûu se u tebe nÏËemu p¯iuËit?
	AI_Output (self, other, "DIA_Carl_Lernen_05_01");//No, vyrobil jsem nÏkolik klik a nÏco h¯ebÌk˘ a opravuju kovovÈ souË·stky.
	AI_Output (self, other, "DIA_Carl_Lernen_05_02");//Ale o kov·nÌ zbranÌ toho nevÌm tolik, abych tÏ mohl uËit.
	AI_Output (self, other, "DIA_Carl_Lernen_05_03");//Jestli se chceö nÏco nauËit, zajdi za Haradem. On urËitÏ vÌ, jak se vyr·bÏjÌ zbranÏ!
	AI_Output (self, other, "DIA_Carl_Lernen_05_04");//Ale jestli si chceö trochu vypracovat svaly, tak s tÌm ti m˘ûu pomoct.
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Carl, kov·¯ z p¯ÌstavnÌ Ëtvrti, mi m˘ûe pomoci vylepöit sÌlu.");
};
///////////////////////////////////////////////////////////////////////
//	Info F¸r's lernen bezahlen 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Carl_Wieviel   (C_INFO)
{
	npc         = VLK_461_Carl;
	nr          = 3;
	condition   = DIA_Carl_Wieviel_Condition;
	information = DIA_Carl_Wieviel_Info;
	permanent   = FALSE;
	description	= "Kolik si za v˝cvik nech·v·ö platit?";
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
	AI_Output (other, self, "DIA_Carl_Wieviel_15_00");//Kolik si nech·v·ö platit za v˝cvik?
	
	if Npc_KnowsInfo (other,DIA_Edda_Statue)
	{
		AI_Output (self, other, "DIA_Carl_Wieviel_05_01");//Slyöel jsem, ûes pracoval pro Eddu. Budu tÏ cviËit zadarmo.
		Carl_TeachSTR = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Carl_Wieviel_05_02");//50 zlat˝ch a j· ti dopom˘ûu k vÏtöÌ sÌle.
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
	description	= "R·d bych se u tebe nechal vycviËit (zaplatit 50 zlaù·k˘).";
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
	AI_Output (other, self, "DIA_Carl_bezahlen_15_00");//ChtÏl bych s tebou cviËit.
	
	if Npc_KnowsInfo (other,DIA_Edda_Statue)
	{
		AI_Output (self, other, "DIA_Carl_bezahlen_05_01");//Slyöel jsem, ûes pracoval pro Eddu. Budu tÏ cviËit zadarmo.
		Carl_TeachSTR = TRUE;
	}
	else 
	{
		if B_GiveInvItems (other, self, ItMi_Gold, 50)
		{
			AI_Output (self, other, "DIA_Carl_bezahlen_05_02");//Dob¯e, m˘ûeme zaËÌt hned, jak budeö p¯ipraven.
			Carl_TeachSTR = TRUE;
		}
		else 
		{
			AI_Output (self, other, "DIA_Carl_bezahlen_05_03");//Dej mi zlato a pak tÏ budu trÈnovat.
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
	description = "ChtÏl bych se st·t silnÏjöÌm.";
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
	AI_Output (other,self ,"DIA_Carl_Teach_15_00"); //ChtÏl bych se st·t silnÏjöÌm.

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
