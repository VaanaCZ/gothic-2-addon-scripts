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
	description	 = 	"Soldato, a rapporto!";
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
	AI_Output			(other, self, "DIA_PAL_263_PERM_15_00"); //Soldato, a rapporto!
	AI_Output			(self, other, "DIA_PAL_263_PERM_04_01"); //Sissignore! Sto mantenendo la posizione, come ordinato. Nessun'altra perdita. Le provviste stanno finendo, gli orchi sono tranquilli.
	AI_Output			(self, other, "DIA_PAL_263_PERM_04_02"); //L'ultimo attacco di drago ha completamente distrutto le mura esterne. Ma da allora non è più successo niente di speciale.
	AI_Output			(other, self, "DIA_PAL_263_PERM_15_03"); //D'accordo, continua.
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
	description	 = 	"Come vanno le cose?";
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
	AI_Output			(other, self, "DIA_PAL_263_PERM_OTH_15_00"); //Come vanno le cose?
	AI_Output			(self, other, "DIA_PAL_263_PERM_OTH_04_01"); //Abbiamo la situazione sotto controllo. Non preoccuparti, civile. Andrà tutto a posto.
};



 




