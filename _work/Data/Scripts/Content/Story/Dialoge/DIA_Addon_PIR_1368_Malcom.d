// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Malcom_EXIT(C_INFO)
{
	npc			= PIR_1368_Addon_Malcom;
	nr			= 999;
	condition	= DIA_Addon_Malcom_EXIT_Condition;
	information	= DIA_Addon_Malcom_EXIT_Info;
	permanent	= TRUE;
	description = "Musím jít.";
};                       
FUNC INT DIA_Addon_Malcom_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Malcom_EXIT_Info()
{	
	AI_Output (other, self, "DIA_Addon_Malcom_perm_15_00"); //Musím jít.
	
	if (MalcomBotschaft == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Malcom_perm_04_01"); //Nenech se sežrat od têch potvor. Tady je to fakt nebezpeèný.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_03"); //Hele, až dorazíš do tábora, vyâië ode mê nêco Henrymu.
		AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_04"); //Tady ty stromy jsou sakra odolný.
		AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_05"); //Takže si na dâevo bude muset ještê àákou chvíli poèkat. Vyâië mu to.
		MalcomBotschaft = TRUE;
	};
	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Malcom_PICKPOCKET (C_INFO)
{
	npc			= PIR_1368_Addon_Malcom;
	nr			= 900;
	condition	= DIA_Addon_Malcom_PICKPOCKET_Condition;
	information	= DIA_Addon_Malcom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Malcom_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Addon_Malcom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Malcom_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Malcom_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Malcom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Malcom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Malcom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Malcom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Malcom_PICKPOCKET);
};
	
func void DIA_Addon_Malcom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Malcom_PICKPOCKET);
};
// ************************************************************
//								Hello
// ************************************************************
instance DIA_Addon_Malcom_Hello		(C_INFO)
{
	npc		 	= PIR_1368_Addon_Malcom;
	nr		 	= 1;
	condition	= DIA_Addon_Malcom_Hello_Condition;
	information	= DIA_Addon_Malcom_Hello_Info;

	important 	= TRUE;
};

func int DIA_Addon_Malcom_Hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Hello_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Malcom_Hello_04_01"); //Ty nejsi zdejší, co?
	AI_Output	(self, other, "DIA_Addon_Malcom_Hello_04_02"); //Koukám, že jdeš zdaleka.
};

// ************************************************************
//					Hallo 2 	(Was machst du?)
// ************************************************************
instance DIA_Addon_Malcom_WasMachen		(C_INFO)
{
	npc		 	= PIR_1368_Addon_Malcom;
	nr		 	= 2;
	condition	= DIA_Addon_Malcom_WasMachen_Condition;
	information	= DIA_Addon_Malcom_WasMachen_Info;

	description	= "Máš práci?";
};
func int DIA_Addon_Malcom_WasMachen_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Malcom_WasMachen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Malcom_WasMachen_15_00"); //Máš práci?
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_01"); //Ani se neptej. Henry chce, abych tu vykácel všecky stromy.
	if (Henry.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Malcom_WasMachen_15_02"); //Henry?
		AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_00"); //Velitel našeho oddílu.
	};
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_04"); //Furt postává u tábora a má plnou hubu kecù.
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_05"); //Vo nadšený službê naší spoleènosti a podobný žvásty.
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_06"); //Ale sám nehne ani prstem.
};

// ************************************************************
// 					Holz - Nachricht für Henry
// ************************************************************
instance DIA_Addon_Malcom_Entertrupp		(C_INFO)
{
	npc		 = 	PIR_1368_Addon_Malcom;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Malcom_Entertrupp_Condition;
	information	 = 	DIA_Addon_Malcom_Entertrupp_Info;

	description	 = 	"Henry je váš velitel?";
};
func int DIA_Addon_Malcom_Entertrupp_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};
func void DIA_Addon_Malcom_Entertrupp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Malcom_Entertrupp_15_00"); //Henry je váš šéf?
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_03"); //Jo, velitel naší nájezdnický jednotky.
	AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_01"); //Náš KAPITÁN je Greg.
	if (GregIsBack == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Malcom_Add_04_02"); //Ale ten tu teë není.
	};
};

// ************************************************************
// 						Wo ist Lager
// ************************************************************
instance DIA_Addon_Malcom_Lager		(C_INFO)
{
	npc		 	= PIR_1368_Addon_Malcom;
	nr		 	= 3;
	condition	= DIA_Addon_Malcom_Lager_Condition;
	information	= DIA_Addon_Malcom_Lager_Info;

	description	= "Kde je váš tábor?";
};
func int DIA_Addon_Malcom_Lager_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};
func void DIA_Addon_Malcom_Lager_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Malcom_Lager_15_00"); //Kde je váš tábor?
	AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_01"); //Bêž tady touhle cestou na západ a dojdeš tam.
	AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_02"); //Henryho urèitê hned uvidíš, jak tam nêkde postává.
};

