//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_1052_Wegelagerer_EXIT   (C_INFO)
{
	npc         = BDT_1052_Wegelagerer;
	nr          = 999;
	condition   = DIA_1052_Wegelagerer_EXIT_Condition;
	information = DIA_1052_Wegelagerer_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_1052_Wegelagerer_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_1052_Wegelagerer_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hallo 
//*********************************************************************
INSTANCE DIA_1052_Wegelagerer_Hello   (C_INFO)
{
	npc         = BDT_1052_Wegelagerer;
	nr          = 1;
	condition   = DIA_1052_Wegelagerer_Hello_Condition;
	information = DIA_1052_Wegelagerer_Hello_Info;
	permanent   = FALSE;
	description = "Kim jesteś?";
};

FUNC INT DIA_1052_Wegelagerer_Hello_Condition()
{
		var C_NPC Pal;
		Pal = Hlp_GetNpc (BDT_1051_Wegelagerer);
		
		if (C_NpcIsDown(Pal)==FALSE) 
			{
				return TRUE;
			};
};

FUNC VOID DIA_1052_Wegelagerer_Hello_Info()
{
	AI_Output (other,self ,"DIA_1052_Wegelagerer_Hello_15_00"); //Kim jesteś?
	AI_Output (self ,other,"DIA_1052_Wegelagerer_Hello_06_01"); //Co to ma być? Przesłuchanie?
	AI_Output (self ,other,"DIA_1052_Wegelagerer_Hello_06_02"); //Nie mam ci nic do powiedzenia, ale może chcesz pogadać z moim kolegą.
	AI_Output (self ,other,"DIA_1052_Wegelagerer_Hello_06_03"); //Tylko uważaj, on nie lubi obcych.
};

///////////////////////////////////////////////////////////////////////
//	Info Angriff
///////////////////////////////////////////////////////////////////////
instance DIA_Wegelagerer_ANGRIFF2		(C_INFO)
{
	npc		 = 	BDT_1052_Wegelagerer;
	nr		 = 	2;
	condition	 = 	DIA_Wegelagerer_ANGRIFF2_Condition;
	information	 = 	DIA_Wegelagerer_ANGRIFF2_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Wegelagerer_ANGRIFF2_Condition ()
{
		if (Npc_RefuseTalk(self) == FALSE)
		&& (C_NpcIsDown(BDT_1051_Wegelagerer)) 
			{
				return TRUE;
			};
};

func void DIA_Wegelagerer_ANGRIFF2_Info ()
{
	AI_Output			(self, other, "DIA_Wegelagerer_ANGRIFF2_06_00"); //No i dobrze, koleżko. Doigrałeś się.
	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,40);

	self.aivar[AIV_EnemyOverride] = FALSE; 
	BDT_1051_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE; 
};



