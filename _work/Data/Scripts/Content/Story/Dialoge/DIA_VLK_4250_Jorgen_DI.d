// ************************************************************
// 	  				   EXIT 
// ************************************************************

INSTANCE DIA_Jorgen_DI_KAP3_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen_DI;
	nr			= 999;
	condition	= DIA_Jorgen_DI_KAP3_EXIT_Condition;
	information	= DIA_Jorgen_DI_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_DI_KAP3_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Jorgen_DI_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*********************************************************************
//	Info Hallo 
//*********************************************************************
INSTANCE DIA_Jorgen_DI_Hallo   (C_INFO)
{
	npc         = VLK_4250_Jorgen_DI;
	nr          = 4;
	condition   = DIA_Jorgen_DI_Hallo_Condition;
	information = DIA_Jorgen_DI_Hallo_Info;
	permanent	 = 	TRUE;

	description = "Alles im Griff?";

};

FUNC INT DIA_Jorgen_DI_Hallo_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
		{
			return TRUE;
		};
};

FUNC VOID DIA_Jorgen_DI_Hallo_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_DI_Hallo_15_00"); //Alles im Griff?

	if (ORkSturmDI == FALSE)
	{
		AI_Output (self ,other,"DIA_Jorgen_DI_Hallo_07_01"); //Klar doch. Wenn uns die ganzen Ungetüme hier in Ruhe lassen ...
	}
	else
	{
		AI_Output (self ,other,"DIA_Jorgen_DI_Hallo_07_02"); //Noch so einen Orkangriff werden wir nicht überleben. Also mach schnell, dass wir hier wieder weg können.
		B_StartOtherRoutine	(Jorgen_DI,"Start");
	};
	AI_StopProcessInfos (self);
}; 

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	VLK_4250_Jorgen_DI;
	nr			 = 	4;
	condition	 = 	DIA_Jorgen_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Jorgen_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	
	description = 	"Der Feind ist tot.";

};

func int DIA_Jorgen_DI_UndeadDragonDead_Condition ()
{	
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};
func void DIA_Jorgen_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other ,self, "DIA_Jorgen_DI_UndeadDragonDead_15_00"); //Der Feind ist tot.
	AI_Output			(self ,other, "DIA_Jorgen_DI_UndeadDragonDead_07_01"); //Das sind gute Nachrichten. Haben wir jetzt alles erledigt hier auf den Insel?

	Info_ClearChoices	(DIA_Jorgen_DI_UndeadDragonDead);
	Info_AddChoice	(DIA_Jorgen_DI_UndeadDragonDead, "Einen Moment noch.", DIA_Jorgen_DI_UndeadDragonDead_moment );
	Info_AddChoice	(DIA_Jorgen_DI_UndeadDragonDead, "Ja. Schluß jetzt. Lass uns aufbrechen.", DIA_Jorgen_DI_UndeadDragonDead_over );
	
};
func void DIA_Jorgen_DI_UndeadDragonDead_moment ()
{
	AI_Output			(other, self, "DIA_Jorgen_DI_UndeadDragonDead_moment_15_00"); //Einen Moment noch. Ich hab noch etwas zu erledigen.
	AI_Output			(self, other, "DIA_Jorgen_DI_UndeadDragonDead_moment_07_01"); //Gut. Aber beeil dich.
	AI_StopProcessInfos (self);
};

func void DIA_Jorgen_DI_UndeadDragonDead_over ()
{
	AI_StopProcessInfos (self);
	B_Extro_Avi ();
};





