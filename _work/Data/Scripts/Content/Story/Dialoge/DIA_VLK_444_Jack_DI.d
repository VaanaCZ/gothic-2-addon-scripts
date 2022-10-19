///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jack_DI_EXIT   (C_INFO)
{
	npc         = VLK_444_Jack_DI;
	nr          = 999;
	condition   = DIA_Jack_DI_EXIT_Condition;
	information = DIA_Jack_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jack_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jack_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_DI_GREET		(C_INFO)
{
	npc			 = 	VLK_444_Jack_DI;
	nr			 = 	4;
	condition	 = 	DIA_Jack_DI_GREET_Condition;
	information	 = 	DIA_Jack_DI_GREET_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Jack_DI_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};
var int DIA_Jack_DI_GREET_OneTime;
func void DIA_Jack_DI_GREET_Info ()
{
	if (ORkSturmDI == FALSE)
	{
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_00"); //Mam nadziej�, �e wiesz, co robisz, ch�opcze.
		AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_01"); //To nie potrwa d�ugo.
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_02"); //Miej g�ow� na karku i wracaj ca�y, i zdrowy.
		AI_StopProcessInfos (self);
	}
	else
	{
		if (DIA_Jack_DI_GREET_OneTime == FALSE)
		{
			AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_03"); //Co tu robisz?
			B_GivePlayerXP (XP_Ambient);
			DIA_Jack_DI_GREET_OneTime = TRUE;
		};

		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_04"); //Je�li znowu rozp�ta si� tu takie piek�o, wyprowadz� st�d statek. Z tob� czy bez ciebie! Jasne?
		AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_05"); //Spokojnie. Poradz� sobie.
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_06"); //No to lepiej si� po�piesz.
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"Start");	
	};
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	VLK_444_Jack_DI;
	nr			 = 	4;
	condition	 = 	DIA_Jack_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Jack_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	
	description = 	"Zrobione! Wr�g pokonany.";

};

func int DIA_Jack_DI_UndeadDragonDead_Condition ()
{	
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};
func void DIA_Jack_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other ,self, "DIA_Jack_DI_UndeadDragonDead_15_00"); //Zrobione! Wr�g pokonany.
	AI_Output			(self ,other, "DIA_Jack_DI_UndeadDragonDead_14_01"); //Mia�em nadziej�, �e wszystko jako� si� u�o�y, ale przez ostatnie par� godzin troch� w to zw�tpi�em.
	AI_Output			(self ,other, "DIA_Jack_DI_UndeadDragonDead_14_02"); //Mo�emy wreszcie rusza� w drog�?

	Info_ClearChoices	(DIA_Jack_DI_UndeadDragonDead);
	Info_AddChoice	(DIA_Jack_DI_UndeadDragonDead, "Chwileczk�...", DIA_Jack_DI_UndeadDragonDead_moment );
	Info_AddChoice	(DIA_Jack_DI_UndeadDragonDead, "Tak. Sko�czmy to wreszcie.", DIA_Jack_DI_UndeadDragonDead_over );
	
};
func void DIA_Jack_DI_UndeadDragonDead_moment ()
{
	AI_Output			(other, self, "DIA_Jack_DI_UndeadDragonDead_moment_15_00"); //Jeszcze chwila. Musz� najpierw co� za�atwi�.
	AI_Output			(self, other, "DIA_Jack_DI_UndeadDragonDead_moment_14_01"); //Tylko si� po�piesz. Nie chc� tu zapu�ci� korzeni.
	AI_StopProcessInfos (self);
};

func void DIA_Jack_DI_UndeadDragonDead_over ()
{
	AI_StopProcessInfos (self);
	B_Extro_Avi ();
};




