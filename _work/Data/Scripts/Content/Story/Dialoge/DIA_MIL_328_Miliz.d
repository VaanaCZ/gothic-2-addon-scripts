///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_328_Miliz_EXIT   (C_INFO)
{
	npc         = MIL_328_Miliz;
	nr          = 999;
	condition   = DIA_328_Miliz_EXIT_Condition;
	information = DIA_328_Miliz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_328_Miliz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_328_Miliz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_328_Miliz_Hi		(C_INFO)
{
	npc		 	 = 	MIL_328_Miliz;
	nr			 =  1;
	condition	 = 	DIA_328_Miliz_Hi_Condition;
	information	 = 	DIA_328_Miliz_Hi_Info;
	permanent    =  FALSE;
	important 	 =  TRUE;
};
func int DIA_328_Miliz_Hi_Condition ()
{
	return TRUE;
};
func void DIA_328_Miliz_Hi_Info ()
{
	AI_Output (self, other, "DIA_328_Miliz_Hi_08_00"); //Ej, nie masz tu czego szuka�, zrozumia�e�?
	AI_Output (other, self, "DIA_328_Miliz_Hi_15_01"); //Kim jeste�?
	AI_Output (self, other, "DIA_328_Miliz_Hi_08_02"); //To nie twoja sprawa! Ja tu jestem szefem, jasne?
	AI_Output (other, self, "DIA_328_Miliz_Hi_15_03"); //Szefem? Czego? Tych skrzy�?
	AI_Output (self, other, "DIA_328_Miliz_Hi_08_04"); //Magazyn jest pod moim nadzorem, zrozumia�e�? Wi�c sp�ywaj, bo dostaniesz po �bie.
	
	AI_StopProcessInfos (self);
	
	Npc_SetRefuseTalk (self,30);
};
///////////////////////////////////////////////////////////////////////
//	Info Kill
///////////////////////////////////////////////////////////////////////
instance DIA_328_Miliz_Kill		(C_INFO)
{
	npc		 	 = 	MIL_328_Miliz;
	nr			 =  2;
	condition	 = 	DIA_328_Miliz_Kill_Condition;
	information	 = 	DIA_328_Miliz_Kill_Info;
	permanent    =  TRUE;
	important 	 =  TRUE;
};
func int DIA_328_Miliz_Kill_Condition ()
{	
	if (Npc_RefuseTalk(self) == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_328_Miliz_Kill_Info ()
{
	AI_Output (self, other, "DIA_328_Miliz_Kill_08_00"); //Ci�gle tu jeste�? Chyba m�wi�em, �eby� st�d wypad�.
	AI_Output (self, other, "DIA_328_Miliz_Kill_08_01"); //Zaraz ci poka��, kto tu jest szefem!
	
	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,20);
	B_Attack (self, other, AR_KILL, 1);
};		
