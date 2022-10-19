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
	description	 = 	"Co s�ycha�?";
};
func int DIA_PAL_297_TRESPAS_Condition ()
{
		return TRUE;
};
func void DIA_PAL_297_TRESPAS_Info ()
{
	AI_Output (other, self, "DIA_PAL_297_TRESPAS_15_00"); //Jak leci?
	
	if (Kapitel == 1)
	{
		AI_Output (self, other, "DIA_PAL_297_TRESPAS_04_01"); //Te tereny s� wyj�tkowo niebezpieczne, musisz wi�c na siebie uwa�a�. Nie chcieliby�my, by co� ci si� sta�o.
	}
	else
	{
		AI_Output (self, other, "DIA_PAL_297_TRESPAS_04_02"); //Wej�cie do doliny wymaga wiele odwagi i ca�kiem poka�nych zapas�w eliksir�w leczniczych.
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

	description	 = 	"Przechodzili t�dy ostatnio bandyci?";
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
	AI_Output	(other, self, "DIA_Addon_PAL_297_Rangerbandits_15_00"); //Przechodzili t�dy ostatnio bandyci?
	AI_Output	(self, other, "DIA_Addon_PAL_297_Rangerbandits_04_01"); //Nie wiem, o czym m�wisz. Dop�ki pilnujemy tego miejsca, nikt t�dy nie przejdzie - a ju� na pewno nie n�dzne bandziory.
	AI_Output	(self, other, "DIA_Addon_PAL_297_Rangerbandits_04_02"); //Spytaj tamtych farmer�w - mo�e oni co� widzieli.
};
 



