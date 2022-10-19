///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_PAL_297_EXIT   (C_INFO)
{
	npc         = PAL_297_Ritter;
	nr          = 999;
	condition   = DIA_PAL_297_EXIT_Condition;
	information = DIA_PAL_297_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_PAL_297_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_PAL_297_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info TRESPAS
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_297_TRESPAS		(C_INFO)
{
	npc			 = 	PAL_297_Ritter;
	nr			 = 	2;
	condition	 = 	DIA_PAL_297_TRESPAS_Condition;
	information	 = 	DIA_PAL_297_TRESPAS_Info;
	permanent	 = 	TRUE;
	description	 = 	"Jak se vede?";
};
func int DIA_PAL_297_TRESPAS_Condition ()
{
		return TRUE;
};
func void DIA_PAL_297_TRESPAS_Info ()
{
	AI_Output (other, self, "DIA_PAL_297_TRESPAS_15_00"); //Jak se vede?
	
	if (Kapitel == 1)
	{
		AI_Output (self, other, "DIA_PAL_297_TRESPAS_04_01"); //Okol� je hodn� nebezpe�n�, tak�e by ses m�l mo�n� vr�tit - rozhodn� nechceme, aby se ti n�co stalo.
	}
	else
	{
		AI_Output (self, other, "DIA_PAL_297_TRESPAS_04_02"); //Vstoupit do �dol� chce hodn� odvahy. Alespo� �e u sebe m� dostatek l��iv�ch lektvar�.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Rangerbandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_PAL_297_Rangerbandits		(C_INFO)
{
	npc		 = 	PAL_297_Ritter;
	nr		 = 	5;
	condition	 = 	DIA_Addon_PAL_297_Rangerbandits_Condition;
	information	 = 	DIA_Addon_PAL_297_Rangerbandits_Info;

	description	 = 	"Zahl�dls tu posledn� dobou n�jak� bandity?";
};

func int DIA_Addon_PAL_297_Rangerbandits_Condition ()
{
	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)	
		{
			return TRUE;
		};
};

func void DIA_Addon_PAL_297_Rangerbandits_Info ()
{
	AI_Output	(other, self, "DIA_Addon_PAL_297_Rangerbandits_15_00"); //Nepro�li tudy v posledn� dob� n�jac� banditi?
	AI_Output	(self, other, "DIA_Addon_PAL_297_Rangerbandits_04_01"); //Nev�m, o �em to mluv�. Co jsme tu na str�i, tak tudy nepro�el nikdo. Nato� n�jak� v�iv�ck� banditi.
	AI_Output	(self, other, "DIA_Addon_PAL_297_Rangerbandits_04_02"); //Ale optej se tam t�ch vidl�k�, t�eba n�co zahl�dli.
};
 



