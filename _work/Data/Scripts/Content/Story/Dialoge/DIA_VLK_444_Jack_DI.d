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
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_00"); //Doufám, že víš, co dêláš, chlapèe.
		AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_01"); //Už to nebude trvat dlouho.
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_02"); //Zachovej si chladnou hlavu a vraã se v jednom kuse.
		AI_StopProcessInfos (self);
	}
	else
	{
		if (DIA_Jack_DI_GREET_OneTime == FALSE)
		{
			AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_03"); //Co tam dole dêláš?
			B_GivePlayerXP (XP_Ambient);
			DIA_Jack_DI_GREET_OneTime = TRUE;
		};

		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_04"); //I kdyby se mêlo samo peklo zjevit, já tu loë odsud dostanu. S tebou, nebo bez tebe. Slyšíš?
		AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_05"); //Nic takovýho. Jdu do toho.
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_06"); //Tak to sebou hoë.
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"Zaèít");	
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
	
	description = 	"Dokázal jsem to. Znièil jsem nepâítele.";

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
	AI_Output			(other ,self, "DIA_Jack_DI_UndeadDragonDead_15_00"); //Dokázal jsem to. Znièil jsem nepâítele.
	AI_Output			(self ,other, "DIA_Jack_DI_UndeadDragonDead_14_01"); //Doufal jsem, že všechno dobâe dopadne. Ale musim pâiznat, že posledních pár hodin jsem si tím nebyl vùbec jistej.
	AI_Output			(self ,other, "DIA_Jack_DI_UndeadDragonDead_14_02"); //Tak už mùžem znovu vyplout?

	Info_ClearChoices	(DIA_Jack_DI_UndeadDragonDead);
	Info_AddChoice	(DIA_Jack_DI_UndeadDragonDead, "Ještê minutku.", DIA_Jack_DI_UndeadDragonDead_moment );
	Info_AddChoice	(DIA_Jack_DI_UndeadDragonDead, "Ano, tak to skonèeme.", DIA_Jack_DI_UndeadDragonDead_over );
	
};
func void DIA_Jack_DI_UndeadDragonDead_moment ()
{
	AI_Output			(other, self, "DIA_Jack_DI_UndeadDragonDead_moment_15_00"); //Ještê poèkej. Je tu nêco dalšího, co musím udêlat.
	AI_Output			(self, other, "DIA_Jack_DI_UndeadDragonDead_moment_14_01"); //Hoë sebou, jasný? Nechci tu dostat kurdêje.
	AI_StopProcessInfos (self);
};

func void DIA_Jack_DI_UndeadDragonDead_over ()
{
	AI_StopProcessInfos (self);
	B_Extro_Avi ();
};




