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
		AI_Output (self, other, "DIA_PAL_297_TRESPAS_04_01"); //Okolí je hodnę nebezpečné, takže by ses męl možná vrátit - rozhodnę nechceme, aby se ti nęco stalo.
	}
	else
	{
		AI_Output (self, other, "DIA_PAL_297_TRESPAS_04_02"); //Vstoupit do údolí chce hodnę odvahy. Alespoŕ že u sebe máš dostatek léčivých lektvarů.
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

	description	 = 	"Zahlédls tu poslední dobou nęjaké bandity?";
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
	AI_Output	(other, self, "DIA_Addon_PAL_297_Rangerbandits_15_00"); //Neprošli tudy v poslední dobę nęjací banditi?
	AI_Output	(self, other, "DIA_Addon_PAL_297_Rangerbandits_04_01"); //Nevím, o čem to mluvíš. Co jsme tu na stráži, tak tudy neprošel nikdo. Natož nęjaký všivácký banditi.
	AI_Output	(self, other, "DIA_Addon_PAL_297_Rangerbandits_04_02"); //Ale optej se tam tęch vidláků, tâeba nęco zahlídli.
};
 



