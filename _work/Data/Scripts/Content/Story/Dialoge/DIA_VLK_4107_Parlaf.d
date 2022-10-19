///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlaf_EXIT   (C_INFO)
{
	npc         = VLK_4107_Parlaf;
	nr          = 999;
	condition   = DIA_Parlaf_EXIT_Condition;
	information = DIA_Parlaf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Parlaf_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Parlaf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_HALLO		(C_INFO)
{
	npc		 	 = 	VLK_4107_Parlaf;
	nr		 	 = 	1;
	condition	 = 	DIA_Parlaf_HALLO_Condition;
	information	 = 	DIA_Parlaf_HALLO_Info;
	description	 = 	"Hej! Co u ciebie?";
};

func int DIA_Parlaf_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Parlaf_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Parlaf_HALLO_15_00"); //Hej! Co u ciebie?
	AI_Output (self, other, "DIA_Parlaf_HALLO_03_01"); //A jak ci siê wydaje? Ca³e dnie spêdzam przy toczydle, ostrz¹c broñ.
	if ((Npc_IsDead(Engor))== FALSE)
	{
		AI_Output (self, other, "DIA_Parlaf_HALLO_03_02"); //Wczoraj Engor znów zmniejszy³ nam racje ¿ywnoœciowe. Jak tak dalej pójdzie - pozdychamy z g³odu.
		AI_Output (self, other, "DIA_Parlaf_HALLO_03_03"); //Chyba ¿e wczeœniej powybijaj¹ nas orkowie. Tak czy siak - niemi³a perspektywa.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info ENGOR
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_ENGOR		(C_INFO)
{
	npc		 	 = 	VLK_4107_Parlaf;
	nr			 = 	2;
	condition	 = 	DIA_Parlaf_ENGOR_Condition;
	information	 = 	DIA_Parlaf_ENGOR_Info;
	description	 = 	"Kim jest Engor?";
};

func int DIA_Parlaf_ENGOR_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Parlaf_HALLO)
	&& ((Npc_IsDead(Engor))== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Parlaf_ENGOR_Info ()
{
	AI_Output (other, self, "DIA_Parlaf_ENGOR_15_00"); //Kim jest Engor?
	AI_Output (self, other, "DIA_Parlaf_ENGOR_03_01"); //Engor zarz¹dza zapasami i przydziela racje ¿ywnoœciowe. Co tydzieñ mniejsze.
	AI_Output (self, other, "DIA_Parlaf_ENGOR_03_02"); //Jasne, mo¿na siê z nim potargowaæ, ale do tego trzeba mieæ gotówkê.
	AI_Output (other, self, "DIA_Parlaf_ENGOR_15_03"); //A ciebie na to nie staæ?
	AI_Output (self, other, "DIA_Parlaf_ENGOR_03_04"); //Z tego, co tu zarabiam, starcza najwy¿ej na kilka rzep.
	
	Log_CreateTopic (TOPIC_Trader_OC, LOG_NOTE);
	Log_AddEntry(TOPIC_Trader_OC, "Engor zarz¹dza zapasami na zamku. Od czasu do czasu zdarza mu siê robiæ ma³e interesy na boku.");     
};
///////////////////////////////////////////////////////////////////////
//	Info Wo Engor
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_Wo		(C_INFO)
{
	npc		 	 = 	VLK_4107_Parlaf;
	nr		 	 = 	3;
	condition	 = 	DIA_Parlaf_Wo_Condition;
	information	 = 	DIA_Parlaf_Wo_Info;
	permanent	 = 	FALSE;
	description	 = 	"Gdzie znajdê tego Engora?";
};

func int DIA_Parlaf_Wo_Condition ()
{
	if Npc_KnowsInfo (other,DIA_Parlaf_ENGOR)
	&& ((Npc_IsDead(Engor))== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Parlaf_Wo_Info ()
{
	AI_Output (other, self, "DIA_Parlaf_Wo_15_00"); //Gdzie znajdê tego Engora?
	AI_Output (self, other, "DIA_Parlaf_Wo_03_01"); //Jest w komnatach rycerzy. Dostaniesz siê tam przez najbli¿sze otwarte przejœcie obok kuŸni.
};
///////////////////////////////////////////////////////////////////////
//	Info HUNGRIG
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_HUNGRIG		(C_INFO)
{
	npc		     = 	VLK_4107_Parlaf;
	nr		     = 	2;
	condition	 = 	DIA_Parlaf_HUNGRIG_Condition;
	information	 = 	DIA_Parlaf_HUNGRIG_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co s³ychaæ?";
};

func int DIA_Parlaf_HUNGRIG_Condition ()
{
	if (MIS_Engor_BringMeat != LOG_SUCCESS)
	&& Npc_KnowsInfo (hero,DIA_Parlaf_HALLO)
	&& ((Npc_IsDead(Engor))== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Parlaf_HUNGRIG_Info ()
{
	AI_Output (other, self, "DIA_Parlaf_HUNGRIG_15_00"); //Co s³ychaæ?
	AI_Output (self, other, "DIA_Parlaf_HUNGRIG_03_01"); //Ten cholerny Engor chce nas chyba zag³odziæ.
};
///////////////////////////////////////////////////////////////////////
//	Info SATT
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_SATT		(C_INFO)
{
	npc		 	 = 	VLK_4107_Parlaf;
	nr		 	 = 	3;
	condition	 = 	DIA_Parlaf_SATT_Condition;
	information	 = 	DIA_Parlaf_SATT_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co s³ychaæ?";
};

func int DIA_Parlaf_SATT_Condition ()
{
	if ((MIS_Engor_BringMeat == LOG_SUCCESS) || (Npc_IsDead(Engor)))
	&& (Npc_KnowsInfo (hero,DIA_Parlaf_HALLO))
	{
		return TRUE;
	};
};
var int DIA_Parlaf_SATT_OneTime;
func void DIA_Parlaf_SATT_Info ()
{
	AI_Output (other, self, "DIA_Parlaf_SATT_15_00"); //Co s³ychaæ?
	
	if (DIA_Parlaf_SATT_OneTime == FALSE)
	&& ((Npc_IsDead(Engor))== FALSE)
	{
		AI_Output (self, other, "DIA_Parlaf_SATT_03_01"); //Engor rozdzieli³ nowy zapas miêsa. Najwy¿szy czas.
		DIA_Parlaf_SATT_OneTime = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Parlaf_SATT_03_02"); //Oprócz twego przybycia, nie zdarzy³o siê nic ciekawego.
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Parlaf_PICKPOCKET (C_INFO)
{
	npc			= VLK_4107_Parlaf;
	nr			= 900;
	condition	= DIA_Parlaf_PICKPOCKET_Condition;
	information	= DIA_Parlaf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Parlaf_PICKPOCKET_Condition()
{
	C_Beklauen (34, 12);
};
 
FUNC VOID DIA_Parlaf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Parlaf_PICKPOCKET);
	Info_AddChoice		(DIA_Parlaf_PICKPOCKET, DIALOG_BACK 		,DIA_Parlaf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Parlaf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Parlaf_PICKPOCKET_DoIt);
};

func void DIA_Parlaf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Parlaf_PICKPOCKET);
};
	
func void DIA_Parlaf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Parlaf_PICKPOCKET);
};















