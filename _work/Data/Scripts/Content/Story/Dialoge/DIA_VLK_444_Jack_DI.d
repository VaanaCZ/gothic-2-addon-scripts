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
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_00"); //Douf�m, �e v�, co d�l�, chlap�e.
		AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_01"); //U� to nebude trvat dlouho.
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_02"); //Zachovej si chladnou hlavu a vra� se v jednom kuse.
		AI_StopProcessInfos (self);
	}
	else
	{
		if (DIA_Jack_DI_GREET_OneTime == FALSE)
		{
			AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_03"); //Co tam dole d�l�?
			B_GivePlayerXP (XP_Ambient);
			DIA_Jack_DI_GREET_OneTime = TRUE;
		};

		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_04"); //I kdyby se m�lo samo peklo zjevit, j� tu lo� odsud dostanu. S tebou, nebo bez tebe. Sly��?
		AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_05"); //Nic takov�ho. Jdu do toho.
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_06"); //Tak to sebou ho�.
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"Za��t");	
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
	
	description = 	"Dok�zal jsem to. Zni�il jsem nep��tele.";

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
	AI_Output			(other ,self, "DIA_Jack_DI_UndeadDragonDead_15_00"); //Dok�zal jsem to. Zni�il jsem nep��tele.
	AI_Output			(self ,other, "DIA_Jack_DI_UndeadDragonDead_14_01"); //Doufal jsem, �e v�echno dob�e dopadne. Ale musim p�iznat, �e posledn�ch p�r hodin jsem si t�m nebyl v�bec jistej.
	AI_Output			(self ,other, "DIA_Jack_DI_UndeadDragonDead_14_02"); //Tak u� m��em znovu vyplout?

	Info_ClearChoices	(DIA_Jack_DI_UndeadDragonDead);
	Info_AddChoice	(DIA_Jack_DI_UndeadDragonDead, "Je�t� minutku.", DIA_Jack_DI_UndeadDragonDead_moment );
	Info_AddChoice	(DIA_Jack_DI_UndeadDragonDead, "Ano, tak to skon�eme.", DIA_Jack_DI_UndeadDragonDead_over );
	
};
func void DIA_Jack_DI_UndeadDragonDead_moment ()
{
	AI_Output			(other, self, "DIA_Jack_DI_UndeadDragonDead_moment_15_00"); //Je�t� po�kej. Je tu n�co dal��ho, co mus�m ud�lat.
	AI_Output			(self, other, "DIA_Jack_DI_UndeadDragonDead_moment_14_01"); //Ho� sebou, jasn�? Nechci tu dostat kurd�je.
	AI_StopProcessInfos (self);
};

func void DIA_Jack_DI_UndeadDragonDead_over ()
{
	AI_StopProcessInfos (self);
	B_Extro_Avi ();
};




