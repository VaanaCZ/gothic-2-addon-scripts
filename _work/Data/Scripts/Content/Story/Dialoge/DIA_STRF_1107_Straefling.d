///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_STRF_1107_EXIT   (C_INFO)
{
	npc         = STRF_1107_Straefling;
	nr          = 999;
	condition   = DIA_STRF_1107_EXIT_Condition;
	information = DIA_STRF_1107_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_STRF_1107_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_STRF_1107_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info FINGER
///////////////////////////////////////////////////////////////////////
instance DIA_STRF_1107_FINGER		(C_INFO)
{
	npc			 = 	STRF_1107_Straefling;
	condition	 = 	DIA_STRF_1107_FINGER_Condition;
	information	 = 	DIA_STRF_1107_FINGER_Info;
	important	 = 	TRUE;
};

func int DIA_STRF_1107_FINGER_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk) 
	{
		return TRUE;
	};
};
func void DIA_STRF_1107_FINGER_Info ()
{
	AI_Output (self, other, "DIA_STRF_1107_FINGER_01_00"); //Giù le mani delle mie pentole! Nessuno tocca le mie pentole, intesi?!?
	AI_Output (self, other, "DIA_STRF_1107_FINGER_01_01"); //Sono il responsabile per il cibo e questo significa che nessun altro deve impicciarsi! Spero di essere stato chiaro!
};
///////////////////////////////////////////////////////////////////////
//	Info COOK
///////////////////////////////////////////////////////////////////////
instance DIA_STRF_1107_COOK		(C_INFO)
{
	npc			 = 	STRF_1107_Straefling;
	condition	 = 	DIA_STRF_1107_COOK_Condition;
	information	 = 	DIA_STRF_1107_COOK_Info;
	description	 =  "Chi ha fatto diventare un cuoco proprio te?";
};

func int DIA_STRF_1107_COOK_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_STRF_1107_FINGER)
	{
		return TRUE;
	};
};
func void DIA_STRF_1107_COOK_Info ()
{
	AI_Output (other, self, "DIA_STRF_1107_COOK_15_00"); //Chi ha fatto diventare un cuoco proprio te?
	AI_Output (self, other, "DIA_STRF_1107_COOK_01_01"); //Il comandante Garond. Prima di diventare un detenuto, ero il cuoco del Cinghiale Infuriato.
	AI_Output (other, self, "DIA_STRF_1107_COOK_15_02"); //E perché ti hanno rinchiuso?
	AI_Output (self, other, "DIA_STRF_1107_COOK_01_03"); //C'è stato un piccolo malinteso tra un ospite, una mannaia e me.
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_STRF_1107_PERM		(C_INFO)
{
	npc			 = 	STRF_1107_Straefling;
	nr 			 =  900;
	condition	 = 	DIA_STRF_1107_PERM_Condition;
	information	 = 	DIA_STRF_1107_PERM_Info;
	permanent	 =  TRUE;
	description	 =  "Novità?";
};

func int DIA_STRF_1107_PERM_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_STRF_1107_FINGER)
	{
		return TRUE;
	};
};
func void DIA_STRF_1107_PERM_Info ()
{
	AI_Output (other, self, "DIA_STRF_1107_PERM_15_00"); //Novità?
	AI_Output (self, other, "DIA_STRF_1107_PERM_01_01"); //Se vuoi sapere le ultime novità, allora chiedi ai cavalieri. Sono solo un cuoco imprigionato.
};
 



