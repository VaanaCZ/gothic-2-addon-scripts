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

	description = "Je v�echno v po��dku?";

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
	AI_Output (other,self ,"DIA_Jorgen_DI_Hallo_15_00"); //Je v�echno v po��dku?

	if (ORkSturmDI == FALSE)
	{
		AI_Output (self ,other,"DIA_Jorgen_DI_Hallo_07_01"); //Jasn� �e jo - aspo� dokud se ty potvory od n�s dr�� d�l.
	}
	else
	{
		AI_Output (self ,other,"DIA_Jorgen_DI_Hallo_07_02"); //Dal�� podobn� sk�et� �tok u� nep�e�ijeme, tak�e si posp� - mus�me odsud rychle zmizet.
		B_StartOtherRoutine	(Jorgen_DI,"Za��t");
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
	
	description = 	"Nep��tel je u� po smrti.";

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
	AI_Output			(other ,self, "DIA_Jorgen_DI_UndeadDragonDead_15_00"); //Nep��tel je u� po smrti.
	AI_Output			(self ,other, "DIA_Jorgen_DI_UndeadDragonDead_07_01"); //To je dobr� zpr�va. V�c u� jsme na tomhle ostrov� ud�lat nem�li?

	Info_ClearChoices	(DIA_Jorgen_DI_UndeadDragonDead);
	Info_AddChoice	(DIA_Jorgen_DI_UndeadDragonDead, "Je�t� minutku.", DIA_Jorgen_DI_UndeadDragonDead_moment );
	Info_AddChoice	(DIA_Jorgen_DI_UndeadDragonDead, "Ano, to je ono - poj�me.", DIA_Jorgen_DI_UndeadDragonDead_over );
	
};
func void DIA_Jorgen_DI_UndeadDragonDead_moment ()
{
	AI_Output			(other, self, "DIA_Jorgen_DI_UndeadDragonDead_moment_15_00"); //Je�t� minutku - mus�m si tu n�co za��dit.
	AI_Output			(self, other, "DIA_Jorgen_DI_UndeadDragonDead_moment_07_01"); //Tak dob�e, ale posp� si.
	AI_StopProcessInfos (self);
};

func void DIA_Jorgen_DI_UndeadDragonDead_over ()
{
	AI_StopProcessInfos (self);
	B_Extro_Avi ();
};





