///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Geppert_EXIT   (C_INFO)
{
	npc         = STRF_1115_Geppert;
	nr          = 999;
	condition   = DIA_Geppert_EXIT_Condition;
	information = DIA_Geppert_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Geppert_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Geppert_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Geppert_HALLO		(C_INFO)
{
	npc		 = 	STRF_1115_Geppert;
	nr		 = 	4;
	condition	 = 	DIA_Geppert_HALLO_Condition;
	information	 = 	DIA_Geppert_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Geppert_HALLO_Condition ()
{
	return TRUE;
};
var int Kervo_GotStuff;
func void DIA_Geppert_HALLO_Info ()
{
	if ((Npc_IsDead(Kervo))==FALSE)
	&& (Kervo_GotStuff == FALSE)
	{
		if (hero.guild == GIL_KDF)
		{
			CreateInvItems (Kervo, ItMi_RuneBlank, 1);									
		}
		else
		{
			CreateInvItems (Kervo, ItMi_Nugget, 1);									
		};
		Kervo_GotStuff = TRUE;
	};	
	
	AI_Output			(self, other, "DIA_Geppert_HALLO_10_00"); //St˘j! Kdo tam?
	AI_Output			(self, other, "DIA_Geppert_HALLO_10_01"); //Nep¯iöel jsi kv˘li tomu, abys mÏ poslal zp·tky do dol˘, ûe ne?
	AI_Output			(self, other, "DIA_Geppert_HALLO_10_02"); //V tom p¯ÌpadÏ tÏ musÌm zklamat. NenÌ û·dnej zp˘sob, jak mÏ dostat zp·tky.
	

	Info_ClearChoices	(DIA_Geppert_HALLO);
	Info_AddChoice	(DIA_Geppert_HALLO, "Co tady dÏl·ö?", DIA_Geppert_HALLO_Wasmachtihr );
	Info_AddChoice	(DIA_Geppert_HALLO, "Ty jsi trestanec na ˙tÏku, co?", DIA_Geppert_HALLO_Flucht );
};

func void DIA_Geppert_HALLO_Flucht ()
{
	AI_Output			(other, self, "DIA_Geppert_HALLO_Flucht_15_00"); //Ty jsi trestanec na ˙tÏku, co?
	AI_Output			(self, other, "DIA_Geppert_HALLO_Flucht_10_01"); //Jak bystr˝ ˙sudek. ProË bych se jinak hrabal v t˝hle öpinav˝ dÌ¯e?
	Info_ClearChoices	(DIA_Geppert_HALLO);
};

func void DIA_Geppert_HALLO_Wasmachtihr ()
{
	AI_Output			(other, self, "DIA_Geppert_HALLO_Wasmachtihr_15_00"); //Co tady dÏl·ö?
	
	if 	((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
			{
				AI_Output			(self, other, "DIA_Geppert_HALLO_Wasmachtihr_10_01"); //Co je to za pitomou ot·zku? Schov·v·m se tu p¯ed voj·kama.
				AI_Output			(self, other, "DIA_Geppert_HALLO_Wasmachtihr_10_02"); //P¯estaÚ chodit kolem hork˝ kaöe. BuÔ mÏ zabij, nebo se ztraù.
			}
			else
			{
				AI_Output			(self, other, "DIA_Geppert_HALLO_Wasmachtihr_10_03"); //Blb· ot·zka. Schov·v·m se, co jin˝ho? Ty vojensk˝ svinÏ maj sv˝ öpehy ˙plnÏ vöude.
			};

	AI_Output			(self, other, "DIA_Geppert_HALLO_Wasmachtihr_10_04"); //Nevr·tÌm se do toho dolu, a tÌm to vadne.
	Info_ClearChoices	(DIA_Geppert_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info Braten
///////////////////////////////////////////////////////////////////////
instance DIA_Geppert_BRATEN		(C_INFO)
{
	npc		 = 	STRF_1115_Geppert;
	nr		 = 	5;
	condition	 = 	DIA_Geppert_BRATEN_Condition;
	information	 = 	DIA_Geppert_BRATEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ta peËenÏ pÏknÏ vonÌ.";
};

func int DIA_Geppert_BRATEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Geppert_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Geppert_BRATEN_Info ()
{
	AI_Output			(other, self, "DIA_Geppert_BRATEN_15_00"); //Ta peËenÏ pÏknÏ vonÌ.
	AI_Output			(self, other, "DIA_Geppert_BRATEN_10_01"); //Nedot˝kat se!
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Geppert_PICKPOCKET (C_INFO)
{
	npc			= STRF_1115_Geppert;
	nr			= 900;
	condition	= DIA_Geppert_PICKPOCKET_Condition;
	information	= DIA_Geppert_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Geppert_PICKPOCKET_Condition()
{
	C_Beklauen (56, 5);
};
 
FUNC VOID DIA_Geppert_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Geppert_PICKPOCKET);
	Info_AddChoice		(DIA_Geppert_PICKPOCKET, DIALOG_BACK 		,DIA_Geppert_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Geppert_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Geppert_PICKPOCKET_DoIt);
};

func void DIA_Geppert_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Geppert_PICKPOCKET);
};
	
func void DIA_Geppert_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Geppert_PICKPOCKET);
};


