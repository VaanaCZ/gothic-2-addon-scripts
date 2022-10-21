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
	AI_Output (self, other, "DIA_328_Miliz_Hi_08_00"); //Hé ! Vous n'avez rien à faire ici, c'est compris ?
	AI_Output (other, self, "DIA_328_Miliz_Hi_15_01"); //Qui êtes-vous ?
	AI_Output (self, other, "DIA_328_Miliz_Hi_08_02"); //Ça ne vous regarde pas ! C'est moi le patron, ici, pigé ?
	AI_Output (other, self, "DIA_328_Miliz_Hi_15_03"); //Le patron ? De quoi ? De ces coffres ?
	AI_Output (self, other, "DIA_328_Miliz_Hi_08_04"); //Hé ! La réserve est sous ma responsabilité, pigé ? Tirez-vous si vous ne voulez pas que je vous défonce le crâne !
	
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
	AI_Output (self, other, "DIA_328_Miliz_Kill_08_00"); //Hé, vous êtes encore là ? Je vous ai pourtant bien dit de vous tirer, non ?
	AI_Output (self, other, "DIA_328_Miliz_Kill_08_01"); //Je vais vous montrer qui commande, ici...
	
	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,20);
	B_Attack (self, other, AR_KILL, 1);
};		
