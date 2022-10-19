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

	description = "Va tutto bene?";

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
	AI_Output (other,self ,"DIA_Jorgen_DI_Hallo_15_00"); //Va tutto bene?

	if (ORkSturmDI == FALSE)
	{
		AI_Output (self ,other,"DIA_Jorgen_DI_Hallo_07_01"); //Abbastanza, almeno finché questi mostri staranno lontani da noi...
	}
	else
	{
		AI_Output (self ,other,"DIA_Jorgen_DI_Hallo_07_02"); //Non sopravvivremo ad un altro attacco di orchi come quello. Perciò sbrighiamoci, dobbiamo uscire da qui.
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
	
	description = 	"Il nemico è morto.";

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
	AI_Output			(other ,self, "DIA_Jorgen_DI_UndeadDragonDead_15_00"); //Il nemico è morto.
	AI_Output			(self ,other, "DIA_Jorgen_DI_UndeadDragonDead_07_01"); //Questa è una buona notizia. È tutto quello che dovevamo fare su quest'isola?

	Info_ClearChoices	(DIA_Jorgen_DI_UndeadDragonDead);
	Info_AddChoice	(DIA_Jorgen_DI_UndeadDragonDead, "Ancora un minuto.", DIA_Jorgen_DI_UndeadDragonDead_moment );
	Info_AddChoice	(DIA_Jorgen_DI_UndeadDragonDead, "Sì. Ci siamo. Andiamo.", DIA_Jorgen_DI_UndeadDragonDead_over );
	
};
func void DIA_Jorgen_DI_UndeadDragonDead_moment ()
{
	AI_Output			(other, self, "DIA_Jorgen_DI_UndeadDragonDead_moment_15_00"); //Aspetta un attimo. Ho ancora una faccenda da risolvere.
	AI_Output			(self, other, "DIA_Jorgen_DI_UndeadDragonDead_moment_07_01"); //Va bene. Ma sbrigati.
	AI_StopProcessInfos (self);
};

func void DIA_Jorgen_DI_UndeadDragonDead_over ()
{
	AI_StopProcessInfos (self);
	B_Extro_Avi ();
};





