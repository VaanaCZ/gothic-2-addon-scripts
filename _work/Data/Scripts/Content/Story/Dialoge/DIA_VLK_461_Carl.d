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
	AI_Output (self, other, "DIA_Carl_Hallo_05_00"); //Sembrerebbe che ci siano alcuni ladri in città che derubano la gente ricca.
	AI_Output (self, other, "DIA_Carl_Hallo_05_01"); //La guardia cittadina ha recentemente messo a soqquadro il distretto del porto, ma non hanno trovato nulla.
	
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
	AI_Output (self, other, "DIA_Carl_Hallo_05_02"); //Che cosa ti ha condotto in questa regione povera? Che cosa stai cercando qui?
	
	Info_ClearChoices (DIA_Carl_Hallo);
	Info_AddChoice (DIA_Carl_Hallo,"Mi sono perso.",DIA_Carl_Hallo_verlaufen);
	Info_AddChoice (DIA_Carl_Hallo,"Sto solo dando un’occhiata in giro.",DIA_Carl_Hallo_umsehen);
	
	
};
FUNC VOID DIA_Carl_Hallo_verlaufen()
{
	AI_Output (other, self, "DIA_Carl_Hallo_verlaufen_15_00");//Mi sono perso.
	AI_Output (self, other, "DIA_Carl_Hallo_verlaufen_05_01");//Allora fai attenzione a non farti derubare.
	B_CarlSayHallo();
	Info_ClearChoices (DIA_Carl_Hallo);
	
};
FUNC VOID DIA_Carl_Hallo_umsehen()
{
	AI_Output (other, self, "DIA_Carl_Hallo_umsehen_15_00");//Sto solo dando un’occhiata in giro.
	AI_Output (self, other, "DIA_Carl_Hallo_umsehen_05_01");//Ah! Allora faresti meglio a non farti sorprendere a dare occhiate in giro...
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
	description	= "Cosa sai sui ladri?";
};

FUNC INT DIA_Carl_Diebe_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Carl_Diebe_Info()
{
	AI_Output (other, self, "DIA_Carl_Diebe_15_00");//Cosa sai sui ladri?
	AI_Output (self, other, "DIA_Carl_Diebe_05_01");//Niente Ma tutti i cittadini sono spaventati e sono diventati diffidenti, in particolar modo verso gli stranieri.
	AI_Output (self, other, "DIA_Carl_Diebe_05_02");//Non farti sorprendere in case altrui, nessuno la prende troppo bene...
	AI_Output (self, other, "DIA_Carl_Diebe_05_03");//Sì, devi proteggerti dai ladri. Un bel randello è quello che ti serve.
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
	description	= "Puoi insegnarmi qualcosa?";
};

FUNC INT DIA_Carl_Lernen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Carl_Lernen_Info()
{
	AI_Output (other, self, "DIA_Carl_Lernen_15_00");//Cosa puoi insegnarmi?
	AI_Output (self, other, "DIA_Carl_Lernen_05_01");//Oh, sto forgiando accessori, chiodi, e sto riparando parti di ferro.
	AI_Output (self, other, "DIA_Carl_Lernen_05_02");//Ma non so molto sulla forgiatura, almeno non tanto da poterti insegnare qualcosa.
	AI_Output (self, other, "DIA_Carl_Lernen_05_03");//Se vuoi impararla, vai da Harad. Lui sa sicuramente come forgiare armi!
	AI_Output (self, other, "DIA_Carl_Lernen_05_04");//Ma se vuoi sgranchirti un po' i muscoli, posso aiutarti.
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Carl, il fabbro del porto, può aiutarmi a diventare più forte.");
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
	description	= "Quanto vuoi per l’allenamento?";
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
	AI_Output (other, self, "DIA_Carl_Wieviel_15_00");//Quanto vuoi per l’allenamento?
	
	if Npc_KnowsInfo (other,DIA_Edda_Statue)
	{
		AI_Output (self, other, "DIA_Carl_Wieviel_05_01");//Ho sentito ciò che hai fatto per Edda. Ti allenerò gratuitamente.
		Carl_TeachSTR = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Carl_Wieviel_05_02");//50 pezzi d'oro e ti aiuterò a diventare più forte.
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
	description	= "Voglio allenarmi con te (paga 50 monete d’oro).";
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
	AI_Output (other, self, "DIA_Carl_bezahlen_15_00");//Voglio allenarmi con te.
	
	if Npc_KnowsInfo (other,DIA_Edda_Statue)
	{
		AI_Output (self, other, "DIA_Carl_bezahlen_05_01");//Ho sentito ciò che hai fatto per Edda. Ti allenerò gratuitamente.
		Carl_TeachSTR = TRUE;
	}
	else 
	{
		if B_GiveInvItems (other, self, ItMi_Gold, 50)
		{
			AI_Output (self, other, "DIA_Carl_bezahlen_05_02");//Bene, quando sei pronto possiamo cominciare.
			Carl_TeachSTR = TRUE;
		}
		else 
		{
			AI_Output (self, other, "DIA_Carl_bezahlen_05_03");//Trova l'oro, poi ti allenerò.
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
	description = "Voglio diventare più forte.";
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
	AI_Output (other,self ,"DIA_Carl_Teach_15_00"); //Voglio diventare più forte.

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
