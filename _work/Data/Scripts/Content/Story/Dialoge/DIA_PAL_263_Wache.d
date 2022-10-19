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
	description	 = 	"Bericht, Soldat!";
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
	AI_Output			(other, self, "DIA_PAL_263_PERM_15_00"); //Bericht, Soldat!
	AI_Output			(self, other, "DIA_PAL_263_PERM_04_01"); //Jawohl! Halten wie befohlen die Stellung. Keine weiteren Verluste. Nahrung wird knapper, die Orks verhalten sich ruhig.
	AI_Output			(self, other, "DIA_PAL_263_PERM_04_02"); //Der letzte Drachenangriff hat den Außenwall nun komplett zerstört. Aber seitdem keine ungewöhnlichen Vorkommnisse.
	AI_Output			(other, self, "DIA_PAL_263_PERM_15_03"); //Gut, weitermachen.
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
	description	 = 	"Wie ist die Lage?";
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
	AI_Output			(other, self, "DIA_PAL_263_PERM_OTH_15_00"); //Wie ist die Lage?
	AI_Output			(self, other, "DIA_PAL_263_PERM_OTH_04_01"); //Wir haben die Situation im Griff. Mach dir keine Sorgen, Zivilist. Alles wird gut.
};



 




