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

	description = "Tout va bien ?";

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
	AI_Output (other,self ,"DIA_Jorgen_DI_Hallo_15_00"); //Tout va bien ?

	if (ORkSturmDI == FALSE)
	{
		AI_Output (self ,other,"DIA_Jorgen_DI_Hallo_07_01"); //Oui, oui... du moment que ces monstres restent loin de nous.
	}
	else
	{
		AI_Output (self ,other,"DIA_Jorgen_DI_Hallo_07_02"); //Nous ne survivrons pas à une autre attaque du même genre. Alors, faites vite ! Il nous faut absolument partir d'ici !
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
	
	description = 	"L'ennemi est mort.";

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
	AI_Output			(other ,self, "DIA_Jorgen_DI_UndeadDragonDead_15_00"); //L'ennemi est mort.
	AI_Output			(self ,other, "DIA_Jorgen_DI_UndeadDragonDead_07_01"); //Excellente nouvelle ! C'est tout ce que nous avions à faire ici ?

	Info_ClearChoices	(DIA_Jorgen_DI_UndeadDragonDead);
	Info_AddChoice	(DIA_Jorgen_DI_UndeadDragonDead, "Une petite minute.", DIA_Jorgen_DI_UndeadDragonDead_moment );
	Info_AddChoice	(DIA_Jorgen_DI_UndeadDragonDead, "Oui, ça y est. Allons-y.", DIA_Jorgen_DI_UndeadDragonDead_over );
	
};
func void DIA_Jorgen_DI_UndeadDragonDead_moment ()
{
	AI_Output			(other, self, "DIA_Jorgen_DI_UndeadDragonDead_moment_15_00"); //Un instant. J'ai encore une affaire à régler.
	AI_Output			(self, other, "DIA_Jorgen_DI_UndeadDragonDead_moment_07_01"); //D'accord, mais faites vite !
	AI_StopProcessInfos (self);
};

func void DIA_Jorgen_DI_UndeadDragonDead_over ()
{
	AI_StopProcessInfos (self);
	B_Extro_Avi ();
};





