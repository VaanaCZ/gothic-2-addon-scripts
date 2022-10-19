// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_13_EXIT_Condition;
	information	= DIA_BAU_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_13_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_13_JOIN_Condition;
	information	= DIA_BAU_13_JOIN_Info;
	permanent	= TRUE;
	description = "Pov�z mi v�c o t�ch �oldn���ch!";
};                       

FUNC INT DIA_BAU_13_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_13_JOIN_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_JOIN_15_00"); //�ekni mi v�c o t�ch �oldn���ch!
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_01"); //Pokud jsi s nima je�t� nem�l ��dn� probl�my, zajdi za Leem. On je ten, pro koho my farm��i d�l�me. Je na sv� lidi v�n� p��snej.
	AI_Output (self, other, "DIA_BAU_13_JOIN_13_02"); //Kdy� kdokoli z nich ud�l� n�co �patn�, nech� mu to p�kn� se�rat.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_13_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_13_PEOPLE_Condition;
	information	= DIA_BAU_13_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tady tomu vel�?";
};                       

FUNC INT DIA_BAU_13_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_PEOPLE_15_00"); //Kdo tady tomu vel�?
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_01"); //Kdy� to chce� v�d�t, tak �old�ci. Jasn�, Onar je plat�, ale jen Innos v�, jak dlouho se jim bude je�t� cht�t poslouchat jeho rozkazy.
	AI_Output (self, other, "DIA_BAU_13_PEOPLE_13_02"); //A� si �old�ci vzpomenou, �e u� jim tady k ni�emu neni, necht�l bych bejt v jeho k��i.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_13_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_13_LOCATION_Condition;
	information	= DIA_BAU_13_LOCATION_Info;
	permanent	= TRUE;
	description = "Co mi m��e� ��ct o tomhle m�st�?";
};                       

FUNC INT DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_13_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_LOCATION_15_00"); //Co mi m��e� ��ct o tomhle m�st�?
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_01"); //Jsou tady t�i farmy. Onarova na v�chod� a Sekobova na severn�m konci �dol�.
	AI_Output (self, other, "DIA_BAU_13_LOCATION_13_02"); //Po cest� se dostane� na n�horn� planinu na jihov�chod�. Tam je Bengarova farma.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_BAU_13_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_BAU_13_STANDARD_Condition;
	information	= DIA_BAU_13_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nov�ho?";
};                       
func INT DIA_BAU_13_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BAU_13_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_BAU_13_STANDARD_15_00"); //Co je nov�ho?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_01"); //Voj�ci z m�sta u� n�m nebudou odv�d�t n� dobytek a br�t �rodu! Te�, kdy� u� se m��eme br�nit, n�jak ztratili z�jem!
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_02"); //Paladin�m ve m�st� jsme my farm��i �pln� ukraden�. Jestli sk�eti za�to��, mus�me se spolehnout jen sami na sebe.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_03"); //Draci! Prosl�ch� se, �e se v Hornick�m �dol� objevili draci. Ur�it� se brzo dostanou p�es br�nu!
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_04"); //U� vid�li n�kolik bandit� z hor, jak m��� do Hornick�ho �dol�. To je pro m� moc nebezpe�n�.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_BAU_13_STANDARD_13_05"); //Jestli se sn�� dan� a my dostaneme za svou pr�ci odpov�daj�c� odm�nu, pak m��eme s m�stem za��t znovu obchodovat.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_13 (var c_NPC slf)
{
	DIA_BAU_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_13_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_13_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
