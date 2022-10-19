// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gunnar_EXIT   (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 999;
	condition   = DIA_Gunnar_EXIT_Condition;
	information = DIA_Gunnar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Gunnar_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gunnar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Hallo 
// ************************************************************
var int Gunnar_HalloGesagt;
// ------------------------

INSTANCE DIA_Gunnar_Hallo   (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 1;
	condition   = DIA_Gunnar_Hallo_Condition;
	information = DIA_Gunnar_Hallo_Info;
	permanent   = TRUE;
	description = "Jak to jde?";
};
FUNC INT DIA_Gunnar_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gunnar_Hallo_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Hallo_15_00"); //Co se stalo?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_01"); //Od t� doby, co Onar vyhl�sil, �e si najal �oldn��e, poflakuje se na dvo�e akor�t tak banda ni�emn�ch dareb�k�.
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_02"); //V�echna ta ch�tra, co nem�la co do huby, se vyrojila z lesa je�t� p�ed t�m, ne� jsme sem p�i�li my.
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_03"); //Ty bastardi v�n� vylejzaj snad odev�ad.
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_04"); //Tak ty se� te� taky �old�k, hm?
	};	
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_05"); //Innos s tebou!
	};
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Gunnar_Hallo_10_06"); //Tady nejsou lidi z m�sta v�t�ni.
	};
	
	Gunnar_HalloGesagt = TRUE;
};

// ************************************************************
// 			  				  Everywhere 
// ************************************************************
INSTANCE DIA_Gunnar_Everywhere   (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 2;
	condition   = DIA_Gunnar_Everywhere_Condition;
	information = DIA_Gunnar_Everywhere_Info;
	permanent   = TRUE;
	description = "Kde se tu vzalo tolik �oldn���?";
};
FUNC INT DIA_Gunnar_Everywhere_Condition()
{
	if (Gunnar_HalloGesagt == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gunnar_Everywhere_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Everywhere_15_00"); //Kde se tu vzalo tolik �oldn���?
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_01"); //V�t�ina z nich je z trestaneck� kolonie.
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_02"); //Dal�� skupina �oldn��� poch�z� odn�kud z jihu, kde nejsp� lovili sk�ety.
	AI_Output (self, other, "DIA_Gunnar_Everywhere_10_03"); //A vsad�m se, �e se tu te� taky objevilo n�kolik bandit� z hor, aby se mohli zadarmo naj�st!
};

// ************************************************************
// 			  			Aud dem S�den
// ************************************************************
INSTANCE DIA_Gunnar_South (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 3;
	condition   = DIA_Gunnar_South_Condition;
	information = DIA_Gunnar_South_Info;
	permanent   = TRUE;
	description = "Co v� o �oldn���ch z jihu?";
};
FUNC INT DIA_Gunnar_South_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gunnar_South_Info()
{
	AI_Output (other, self, "DIA_Gunnar_South_15_00"); //Co v� o �oldn���ch z jihu?
	AI_Output (self, other, "DIA_Gunnar_South_10_01"); //Nic moc. Co v�m, tak tam lovili sk�ety.
	AI_Output (self, other, "DIA_Gunnar_South_10_02"); //Sylvio je jejich ��f. Bullco, Sentenza, Raoul a n�kolik dal��ch pro n�j pracuje.
};

// ************************************************************
// 			  			Aus der Barriere
// ************************************************************
INSTANCE DIA_Gunnar_Colony (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 4;
	condition   = DIA_Gunnar_Colony_Condition;
	information = DIA_Gunnar_Colony_Info;
	permanent   = TRUE;
	description = "Kter� z nich sem p�i�el z kolonie?";
};
FUNC INT DIA_Gunnar_Colony_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gunnar_Colony_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Colony_15_00"); //Kdo v�echno p�i�el z kolonie?
	AI_Output (self, other, "DIA_Gunnar_Colony_10_01"); //Lee a jeho lid�. Torlof, Cord, Jarvis, Vlk a buhv�kdo je�t�.
};

// ************************************************************
// 			  				Banditen
// ************************************************************
INSTANCE DIA_Gunnar_Bandits (C_INFO)
{
	npc         = BAU_902_Gunnar;
	nr          = 5;
	condition   = DIA_Gunnar_Bandits_Condition;
	information = DIA_Gunnar_Bandits_Info;
	permanent   = TRUE;
	description = "Co ti banditi, co jsi o nich mluvil?";
};
FUNC INT DIA_Gunnar_Bandits_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gunnar_Bandits_Info()
{
	AI_Output (other, self, "DIA_Gunnar_Bandits_15_00"); //Co ti banditi, co jsi o nich mluvil?
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_01"); //Ale, jen jsem �vanil. Nejsem si t�m v�bec jist�.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_02"); //Na jihu �dol� jsou hory s opu�t�n�mi doly. Ukr�v� se tam n�kolik bandit�.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_03"); //Jsou tam taky trestanci z kolonie, stejn� jako tihle �old�ci na na�em statku.
	AI_Output (self, other, "DIA_Gunnar_Bandits_10_04"); //Jedinej rozd�l mezi nima je, �e jsou je�t� hor�� bahno. Zabijou ka�d�ho, kdo se k nim p�ibl��.
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gunnar_PICKPOCKET (C_INFO)
{
	npc			= BAU_902_Gunnar;
	nr			= 900;
	condition	= DIA_Gunnar_PICKPOCKET_Condition;
	information	= DIA_Gunnar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Gunnar_PICKPOCKET_Condition()
{
	C_Beklauen (45, 70);
};
 
FUNC VOID DIA_Gunnar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gunnar_PICKPOCKET);
	Info_AddChoice		(DIA_Gunnar_PICKPOCKET, DIALOG_BACK 		,DIA_Gunnar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gunnar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gunnar_PICKPOCKET_DoIt);
};

func void DIA_Gunnar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gunnar_PICKPOCKET);
};
	
func void DIA_Gunnar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gunnar_PICKPOCKET);
};


