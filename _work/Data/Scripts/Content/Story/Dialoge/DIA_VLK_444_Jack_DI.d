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
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_00"); //Ich hoffe, du weißt, was du tust, mein Jung.
		AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_01"); //Er wird nicht mehr lange dauern.
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_02"); //Behalte den Kopf auf den Schultern und komm wieder in einem Stück zurück.
		AI_StopProcessInfos (self);
	}
	else
	{
		if (DIA_Jack_DI_GREET_OneTime == FALSE)
		{
			AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_03"); //Was machst du denn hier unten?
			B_GivePlayerXP (XP_Ambient);
			DIA_Jack_DI_GREET_OneTime = TRUE;
		};

		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_04"); //Wenn diese Hölle noch mal über uns herein bricht, werde ich das Schiff hier raus bringen. Mit oder ohne dich, hörst du?
		AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_05"); //Mach keinen Mist. Ich krieg das schon hin.
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_06"); //Dann beeil dich.
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
	
	description = 	"Es ist vollbracht. Der Feind ist eliminiert.";

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
	AI_Output			(other ,self, "DIA_Jack_DI_UndeadDragonDead_15_00"); //Es ist vollbracht. Der Feind ist eliminiert.
	AI_Output			(self ,other, "DIA_Jack_DI_UndeadDragonDead_14_01"); //Ich hatte gehofft, dass alles gut wird. Aber ich muss zugeben, dass ich mir in den letzten Stunden nicht mehr so sicher war.
	AI_Output			(self ,other, "DIA_Jack_DI_UndeadDragonDead_14_02"); //Können wir jetzt endlich wieder in See stechen?

	Info_ClearChoices	(DIA_Jack_DI_UndeadDragonDead);
	Info_AddChoice	(DIA_Jack_DI_UndeadDragonDead, "Einen Moment noch.", DIA_Jack_DI_UndeadDragonDead_moment );
	Info_AddChoice	(DIA_Jack_DI_UndeadDragonDead, "Ja. Lass es uns beenden.", DIA_Jack_DI_UndeadDragonDead_over );
	
};
func void DIA_Jack_DI_UndeadDragonDead_moment ()
{
	AI_Output			(other, self, "DIA_Jack_DI_UndeadDragonDead_moment_15_00"); //Einen Moment noch. Ich hab noch etwas zu erledigen.
	AI_Output			(self, other, "DIA_Jack_DI_UndeadDragonDead_moment_14_01"); //Aber mach schnell. Ich will hier nicht versauern.
	AI_StopProcessInfos (self);
};

func void DIA_Jack_DI_UndeadDragonDead_over ()
{
	AI_StopProcessInfos (self);
	B_Extro_Avi ();
};




