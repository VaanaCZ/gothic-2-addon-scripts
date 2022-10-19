///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_PAL_263_EXIT   (C_INFO)
{
	npc         = PAL_263_Wache;
	nr          = 999;
	condition   = DIA_PAL_263_EXIT_Condition;
	information = DIA_PAL_263_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_PAL_263_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_263_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_263_PERM		(C_INFO)
{
	npc			 = 	PAL_263_Wache;
	nr			 = 	2;
	condition	 = 	DIA_PAL_263_PERM_Condition;
	information	 = 	DIA_PAL_263_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Melduj, �o�nierzu!";
};

func int DIA_PAL_263_PERM_Condition ()
{
	if hero.guild == GIL_MIL
	|| hero.guild == GIL_PAL
	{
		return TRUE;
	};
};
func void DIA_PAL_263_PERM_Info ()
{
	AI_Output			(other, self, "DIA_PAL_263_PERM_15_00"); //Melduj, �o�nierzu!
	AI_Output			(self, other, "DIA_PAL_263_PERM_04_01"); //Tak jest! Zgodnie z rozkazem utrzymujemy pozycje. �adnych dodatkowych strat. Zapasy na wyczerpaniu, orkowie jak na razie spokojni.
	AI_Output			(self, other, "DIA_PAL_263_PERM_04_02"); //Ostatni atak smok�w doszcz�tnie zniszczy� zewn�trzne mury. Od tamtego czasu nic wa�nego si� nie wydarzy�o.
	AI_Output			(other, self, "DIA_PAL_263_PERM_15_03"); //W porz�dku, wracaj do s�u�by.
};
///////////////////////////////////////////////////////////////////////
//	Info PERM_OTH
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_263_PERM_OTH		(C_INFO)
{
	npc			 = 	PAL_263_Wache;
	nr			 = 	2;
	condition	 = 	DIA_PAL_263_PERM_OTH_Condition;
	information	 = 	DIA_PAL_263_PERM_OTH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Jak wygl�da sytuacja?";
};

func int DIA_PAL_263_PERM_OTH_Condition ()
{
	if hero.guild != GIL_MIL
	|| hero.guild != GIL_PAL
	{
		return TRUE;
	};
};
func void DIA_PAL_263_PERM_OTH_Info ()
{
	AI_Output			(other, self, "DIA_PAL_263_PERM_OTH_15_00"); //Jak wygl�da sytuacja?
	AI_Output			(self, other, "DIA_PAL_263_PERM_OTH_04_01"); //Kontrolujemy sytuacj�. Nie martw si�, cywilu. Wszystko dobrze si� sko�czy.
};



 




