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
	AI_Output (self, other, "DIA_Parlaf_HALLO_03_01"); //A jak ci si� wydaje? Ca�e dnie sp�dzam przy toczydle, ostrz�c bro�.
	if ((Npc_IsDead(Engor))== FALSE)
	{
		AI_Output (self, other, "DIA_Parlaf_HALLO_03_02"); //Wczoraj Engor zn�w zmniejszy� nam racje �ywno�ciowe. Jak tak dalej p�jdzie - pozdychamy z g�odu.
		AI_Output (self, other, "DIA_Parlaf_HALLO_03_03"); //Chyba �e wcze�niej powybijaj� nas orkowie. Tak czy siak - niemi�a perspektywa.
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
	AI_Output (self, other, "DIA_Parlaf_ENGOR_03_01"); //Engor zarz�dza zapasami i przydziela racje �ywno�ciowe. Co tydzie� mniejsze.
	AI_Output (self, other, "DIA_Parlaf_ENGOR_03_02"); //Jasne, mo�na si� z nim potargowa�, ale do tego trzeba mie� got�wk�.
	AI_Output (other, self, "DIA_Parlaf_ENGOR_15_03"); //A ciebie na to nie sta�?
	AI_Output (self, other, "DIA_Parlaf_ENGOR_03_04"); //Z tego, co tu zarabiam, starcza najwy�ej na kilka rzep.
	
	Log_CreateTopic (TOPIC_Trader_OC, LOG_NOTE);
	Log_AddEntry(TOPIC_Trader_OC, "Engor zarz�dza zapasami na zamku. Od czasu do czasu zdarza mu si� robi� ma�e interesy na boku.");     
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
	description	 = 	"Gdzie znajd� tego Engora?";
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
	AI_Output (other, self, "DIA_Parlaf_Wo_15_00"); //Gdzie znajd� tego Engora?
	AI_Output (self, other, "DIA_Parlaf_Wo_03_01"); //Jest w komnatach rycerzy. Dostaniesz si� tam przez najbli�sze otwarte przej�cie obok ku�ni.
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
	description	 = 	"Co s�ycha�?";
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
	AI_Output (other, self, "DIA_Parlaf_HUNGRIG_15_00"); //Co s�ycha�?
	AI_Output (self, other, "DIA_Parlaf_HUNGRIG_03_01"); //Ten cholerny Engor chce nas chyba zag�odzi�.
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
	description	 = 	"Co s�ycha�?";
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
	AI_Output (other, self, "DIA_Parlaf_SATT_15_00"); //Co s�ycha�?
	
	if (DIA_Parlaf_SATT_OneTime == FALSE)
	&& ((Npc_IsDead(Engor))== FALSE)
	{
		AI_Output (self, other, "DIA_Parlaf_SATT_03_01"); //Engor rozdzieli� nowy zapas mi�sa. Najwy�szy czas.
		DIA_Parlaf_SATT_OneTime = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Parlaf_SATT_03_02"); //Opr�cz twego przybycia, nie zdarzy�o si� nic ciekawego.
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















