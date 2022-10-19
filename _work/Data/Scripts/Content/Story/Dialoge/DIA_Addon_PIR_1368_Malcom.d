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
	description = "Muszê iœæ.";
};                       
FUNC INT DIA_Addon_Malcom_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Malcom_EXIT_Info()
{	
	AI_Output (other, self, "DIA_Addon_Malcom_perm_15_00"); //Muszê iœæ.
	
	if (MalcomBotschaft == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Malcom_perm_04_01"); //Nie daj siê po¿reæ ¿adnym bestiom. To niebezpieczna okolica.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_03"); //Hej! Je¿eli wracasz do obozu, to przeka¿ coœ Henry'emu.
		AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_04"); //Te drzewa s¹ strasznie twarde.
		AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_05"); //Wycinka jest ciê¿ka, wiêc jeszcze przez jakiœ czas drewna nie bêdzie. Powiedz mu to.
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
	AI_Output	(self, other, "DIA_Addon_Malcom_Hello_04_01"); //Nie jesteœ st¹d, prawda?
	AI_Output	(self, other, "DIA_Addon_Malcom_Hello_04_02"); //Wygl¹dasz na kogoœ, kto widzia³ ju¿ spory kawa³ek œwiata.
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

	description	= "Zajêty?";
};
func int DIA_Addon_Malcom_WasMachen_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Malcom_WasMachen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Malcom_WasMachen_15_00"); //Zajêty?
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_01"); //S³uchaj uwa¿nie, bo nie bêdê powtarza³. Henry chce drewna, co oznacza, ¿e muszê wyci¹æ jeszcze sporo drzew.
	if (Henry.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Malcom_WasMachen_15_02"); //Henry?
		AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_00"); //Dowodzi nasz¹ grup¹.
	};
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_04"); //Stoi przed obozem i lubi sobie pogadaæ.
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_05"); //Wiesz, ró¿ne rzeczy o tym, ¿e musimy robiæ to, co do nas nale¿y, dla dobra innych i takie tam brednie.
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_06"); //Oczywiœcie on nawet palcem nie kiwnie.
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

	description	 = 	"Henry jest waszym przywódc¹?";
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
	AI_Output	(other, self, "DIA_Addon_Malcom_Entertrupp_15_00"); //Henry jest waszym przywódc¹?
	AI_Output	(self, other, "DIA_Addon_Malcom_WasMachen_04_03"); //Tak. Jest dowódc¹ naszej grupy aborda¿owej.
	AI_Output	(self, other, "DIA_Addon_Malcom_Add_04_01"); //Za to naszym kapitanem jest Greg.
	if (GregIsBack == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Malcom_Add_04_02"); //Ale nie ma go w tej chwili.
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

	description	= "Gdzie le¿y wasz obóz?";
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
	AI_Output	(other, self, "DIA_Addon_Malcom_Lager_15_00"); //Gdzie le¿y wasz obóz?
	AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_01"); //IdŸ t¹ œcie¿k¹ na zachód.
	AI_Output	(self, other, "DIA_Addon_Malcom_Lager_04_02"); //Na pewno spotkasz Henry'ego.
};

