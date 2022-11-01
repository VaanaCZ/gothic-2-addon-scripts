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

	description = "Je všechno v pořádku?";

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
	AI_Output (other,self ,"DIA_Jorgen_DI_Hallo_15_00"); //Je všechno v pořádku?

	if (ORkSturmDI == FALSE)
	{
		AI_Output (self ,other,"DIA_Jorgen_DI_Hallo_07_01"); //Jasně že jo - aspoň dokud se ty potvory od nás drží dál.
	}
	else
	{
		AI_Output (self ,other,"DIA_Jorgen_DI_Hallo_07_02"); //Další podobný skřetí útok už nepřežijeme, takže si pospěš - musíme odsud rychle zmizet.
		B_StartOtherRoutine	(Jorgen_DI,"Začít");
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
	
	description = 	"Nepřítel je už po smrti.";

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
	AI_Output			(other ,self, "DIA_Jorgen_DI_UndeadDragonDead_15_00"); //Nepřítel je už po smrti.
	AI_Output			(self ,other, "DIA_Jorgen_DI_UndeadDragonDead_07_01"); //To je dobrá zpráva. Víc už jsme na tomhle ostrově udělat neměli?

	Info_ClearChoices	(DIA_Jorgen_DI_UndeadDragonDead);
	Info_AddChoice	(DIA_Jorgen_DI_UndeadDragonDead, "Ještě minutku.", DIA_Jorgen_DI_UndeadDragonDead_moment );
	Info_AddChoice	(DIA_Jorgen_DI_UndeadDragonDead, "Ano, to je ono - pojďme.", DIA_Jorgen_DI_UndeadDragonDead_over );
	
};
func void DIA_Jorgen_DI_UndeadDragonDead_moment ()
{
	AI_Output			(other, self, "DIA_Jorgen_DI_UndeadDragonDead_moment_15_00"); //Ještě minutku - musím si tu něco zařídit.
	AI_Output			(self, other, "DIA_Jorgen_DI_UndeadDragonDead_moment_07_01"); //Tak dobře, ale pospěš si.
	AI_StopProcessInfos (self);
};

func void DIA_Jorgen_DI_UndeadDragonDead_over ()
{
	AI_StopProcessInfos (self);
	B_Extro_Avi ();
};





