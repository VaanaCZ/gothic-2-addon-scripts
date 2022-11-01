///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fed_EXIT   (C_INFO)
{
	npc         = STRF_1106_Fed;
	nr          = 999;
	condition   = DIA_Fed_EXIT_Condition;
	information = DIA_Fed_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fed_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fed_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_HALLO		(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  2;
	condition	 = 	DIA_Fed_HALLO_Condition;
	information	 = 	DIA_Fed_HALLO_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};

func int DIA_Fed_HALLO_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Fed_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Fed_HALLO_08_00"); //Cosa vuoi da me? Non andrò da nessuna parte!
	AI_Output (other, self, "DIA_Fed_HALLO_15_01"); //Stai calmo, rilassati. Nessuno vuole che tu vada da qualche parte.
	AI_Output (self, other, "DIA_Fed_HALLO_08_02"); //Grazie a Innos. Sai, negli ultimi giorni molti uomini hanno lasciato il campo e nessuno di loro è più tornato.
	AI_Output (self, other, "DIA_Fed_HALLO_08_03"); //Sono stati tutti mangiati dagli squartatori. Ma non io. Me ne resterò qui fino a quando non sarà tutto finito.
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_Snapper	(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  3;
	condition	 = 	DIA_Fed_Snapper_Condition;
	information	 = 	DIA_Fed_Snapper_Info;
	permanent	 =  FALSE;
	description	 = 	"Cosa sai dirmi sugli squartatori?";
};
func int DIA_Fed_Snapper_Condition ()
{	
	if (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fed_Snapper_Info ()
{
	AI_Output (other, self, "DIA_Fed_Snapper_15_00"); //Cosa sai dirmi sugli squartatori?
	AI_Output (self, other, "DIA_Fed_Snapper_08_01"); //Bilgot li tiene d'occhio di notte. Alcuni di loro sono giù al lago ai pieni della torre oscura.
	AI_Output (self, other, "DIA_Fed_Snapper_08_02"); //Altri sono proprio sopra di noi, in cima alla collina. Stanno prendendoci per stanchezza.
	AI_Output (self, other, "DIA_Fed_Snapper_08_03"); //Siamo riusciti a intrappolarci qui. Presto attaccheranno il campo e avranno il loro festino di sangue...
	AI_Output (other, self, "DIA_Fed_Snapper_15_04"); //Capisco.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_Perm	(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  5;
	condition	 = 	DIA_Fed_Perm_Condition;
	information	 = 	DIA_Fed_Perm_Info;
	permanent	 =  TRUE;
	description	 = 	"Sei impazzito?";
};
func int DIA_Fed_Perm_Condition ()
{	
		return TRUE;
};
func void DIA_Fed_Perm_Info ()
{
	AI_Output (other, self, "DIA_Fed_Perm_15_00"); //Tutto bene?
	
	if (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_01"); //Gli squartatori sono là fuori. Riesci a sentire il loro odore? Io li sento...
	}
	else 
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_02"); //Gli squartatori si sono ritirati, ma non significa nulla. Torneranno ancora, oppure i lupi, o le lucertole, o gli orchi.
		AI_Output (self, other, "DIA_Fed_Perm_08_03"); //E prima o poi si ciberanno dei nostri cadaveri...
	};
	AI_StopProcessInfos(self);
	

};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fed_PICKPOCKET (C_INFO)
{
	npc			= STRF_1106_Fed;
	nr			= 900;
	condition	= DIA_Fed_PICKPOCKET_Condition;
	information	= DIA_Fed_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Fed_PICKPOCKET_Condition()
{
	C_Beklauen (32, 8);
};
 
FUNC VOID DIA_Fed_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fed_PICKPOCKET);
	Info_AddChoice		(DIA_Fed_PICKPOCKET, DIALOG_BACK 		,DIA_Fed_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fed_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fed_PICKPOCKET_DoIt);
};

func void DIA_Fed_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fed_PICKPOCKET);
};
	
func void DIA_Fed_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fed_PICKPOCKET);
};




















