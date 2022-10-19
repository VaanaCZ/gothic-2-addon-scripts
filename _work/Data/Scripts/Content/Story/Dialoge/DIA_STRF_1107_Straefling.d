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
	AI_Output (self, other, "DIA_STRF_1107_FINGER_01_00"); //Od m�ch hrnc� ruce pry�! Nikdo se m�ch hrnc� nesm� ani dotknout, jasn�?!
	AI_Output (self, other, "DIA_STRF_1107_FINGER_01_01"); //Jsem zodpov�dn� za j�dlo, a to znamen�, �e nikdo jin� tady nem� co d�lat! Douf�m, �e jsem se vyj�d�il jasn�!
};
///////////////////////////////////////////////////////////////////////
//	Info COOK
///////////////////////////////////////////////////////////////////////
instance DIA_STRF_1107_COOK		(C_INFO)
{
	npc			 = 	STRF_1107_Straefling;
	condition	 = 	DIA_STRF_1107_COOK_Condition;
	information	 = 	DIA_STRF_1107_COOK_Info;
	description	 =  "Kdo z tebe ud�lal kucha�e?";
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
	AI_Output (other, self, "DIA_STRF_1107_COOK_15_00"); //Kdo z tebe ud�lal kucha�e?
	AI_Output (self, other, "DIA_STRF_1107_COOK_01_01"); //Byl to velitel Garond. Ne� jsem stal trestancem, b�val jsem kucha�em U Divo��ka.
	AI_Output (other, self, "DIA_STRF_1107_COOK_15_02"); //A za co t� zav�eli?
	AI_Output (self, other, "DIA_STRF_1107_COOK_01_03"); //Bylo to takov� men�� nedorozum�n� mezi hostem, sek��kem na maso a mnou.
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
	description	 =  "N�co nov�ho?";
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
	AI_Output (other, self, "DIA_STRF_1107_PERM_15_00"); //N�co nov�ho?
	AI_Output (self, other, "DIA_STRF_1107_PERM_01_01"); //Jestli se chce� dozv�d�t n�jak� novinky, promluv si s ryt��i. J� tady jen va��m.
};
 



