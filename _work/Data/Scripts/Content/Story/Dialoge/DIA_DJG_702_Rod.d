

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################



///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_RodDJG_EXIT   (C_INFO)
{
	npc         = DJG_702_Rod;
	nr          = 999;
	condition   = DIA_RodDJG_EXIT_Condition;
	information = DIA_RodDJG_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_RodDJG_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RodDJG_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_RodDJG_HALLO		(C_INFO)
{
	npc		 = 	DJG_702_Rod;
	condition	 = 	DIA_RodDJG_HALLO_Condition;
	information	 = 	DIA_RodDJG_HALLO_Info;

	description	 = 	"Jsi v po��dku?";
};

func int DIA_RodDJG_HALLO_Condition ()
{
	if (DJG_SwampParty == FALSE)
	{
		return TRUE;
	};
};

func void DIA_RodDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_15_00"); //Jsi v po��dku?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_06_01"); //Ty boty m� zabijou! Ta nov� zbroj je v�born�, ale pro� je to �emen� na bot�ch tak nat�sno?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_06_02"); //Kdy� jsem je rozv�zal, zase mi m�lem spadly.

	if 	(
		((Npc_IsDead(Swampdragon)) == FALSE)
		&& (DJG_SwampParty == FALSE)
		)
			{
			Info_AddChoice	(DIA_RodDJG_HALLO, "Na co �ek�?", DIA_RodDJG_HALLO_warten );
			};
	Info_AddChoice	(DIA_RodDJG_HALLO, "Kdes sebral ty boty?", DIA_RodDJG_HALLO_Woher );

};
func void DIA_RodDJG_HALLO_Woher ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_Woher_15_00"); //Kdes sebral ty boty?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_Woher_06_01"); //Ten starej skunk Bennet je ud�lal pro drakobijce a nechal si za ty �krp�ly kr�lovsky zaplatit.
	AI_Output			(self, other, "DIA_RodDJG_HALLO_Woher_06_02"); //A� se mi n�kdy dostane do rukou, nech�m ho nejd��v ty v�ci se�rat a pak z n�j vyml�tim svoje prachy.

};

func void DIA_RodDJG_HALLO_warten ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_15_00"); //Na co �ek�?
	
	Info_ClearChoices	(DIA_RodDJG_HALLO);

	if ((Npc_IsDead(DJG_Cipher))== FALSE)
		{
		AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_06_01"); //Na to, a� se Cipher ur��� p�inejmen��m zvednout ten sv�j zadek. U� je na�ase, abysme vypadli.
		AI_StopProcessInfos (self);
		}
		else
		{
		AI_Output		(self, other, "DIA_RodDJG_HALLO_warten_06_02"); //P�em��lel jsem o tom, �e bychom m�li bl� prozkoumat tamtu ba�inatou oblast.
		AI_Output		(self, other, "DIA_RodDJG_HALLO_warten_06_03"); //Co m� na mysli? M�me tam spolu zaj�t a pod�vat se, co by se tam dalo naj�t?

		Info_AddChoice	(DIA_RodDJG_HALLO, "Zajdu tam s�m.", DIA_RodDJG_HALLO_warten_allein );
		Info_AddChoice	(DIA_RodDJG_HALLO, "Co v� o t�ch ba�in�ch?", DIA_RodDJG_HALLO_warten_wasweisstdu );
		Info_AddChoice	(DIA_RodDJG_HALLO, "Tak jdeme.", DIA_RodDJG_HALLO_warten_zusammen );
		};
};
func void DIA_RodDJG_HALLO_warten_zusammen ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_zusammen_15_00"); //Tak jdeme.
	AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_zusammen_06_01"); //Dobr�, tak jdeme.

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	Npc_ExchangeRoutine	(self,	"SwampWait2");
	
};

func void DIA_RodDJG_HALLO_warten_wasweisstdu ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_wasweisstdu_15_00"); //Co v� o t�ch ba�in�ch?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_wasweisstdu_06_01"); //Jen to, �e smrd� a� do nebe a �e je tam mo�n� hora zlata. To by mohlo sta�it, ne?

};

func void DIA_RodDJG_HALLO_warten_allein ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_allein_15_00"); //Zajdu tam s�m.
	AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_allein_06_01"); //Fajn, tak ti p�eju hodn� �t�st�.

	AI_StopProcessInfos (self);
};



///////////////////////////////////////////////////////////////////////
//	Info WarteMal
///////////////////////////////////////////////////////////////////////
instance DIA_RodDJG_WARTEMAL		(C_INFO)
{
	npc		 = 	DJG_702_Rod;
	condition	 = 	DIA_RodDJG_WARTEMAL_Condition;
	information	 = 	DIA_RodDJG_WARTEMAL_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co to s tebou je?";
};

func int DIA_RodDJG_WARTEMAL_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_RodDJG_HALLO))
	|| (DJG_SwampParty == TRUE))
		{
				return TRUE;
		};
};

func void DIA_RodDJG_WARTEMAL_Info ()
{
	AI_Output			(other, self, "DIA_RodDJG_WARTEMAL_15_00"); //Co to s tebou je?

	if 	(
		((DJG_SwampParty == TRUE) || (Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_02")<1000))
		&& (Npc_IsDead(DJG_Cipher))
		)
		{
			AI_Output			(self, other, "DIA_RodDJG_WARTEMAL_06_01"); //Hele, chlape. M�m dojem, �e se n�m tahle v�c za��n� vymykat z rukou. Prost� odsud potichou�ku miz�m.
			DJG_SwampParty = FALSE;
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,	"Za��t");
		}
	else
		{
			AI_Output			(self, other, "DIA_RodDJG_WARTEMAL_06_02"); //(kleje) Tyhle boty! Tyhle zpropaden� boty!
		};

	if 	(Npc_IsDead(SwampDragon))
		{
			AI_Output			(other, self, "DIA_RodDJG_WARTEMAL_15_03"); //A co bude� d�lat te�?
			AI_Output			(self, other, "DIA_RodDJG_WARTEMAL_06_04"); //Ty se teda dok�e� pt�t! Ze v�eho nejd��v si koup�m n�jak� nov� boty, chlape!
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,	"Za��t");
		};
		AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rod_PICKPOCKET (C_INFO)
{
	npc			= DJG_702_Rod;
	nr			= 900;
	condition	= DIA_Rod_PICKPOCKET_Condition;
	information	= DIA_Rod_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Rod_PICKPOCKET_Condition()
{
	C_Beklauen (16, 320);
};
 
FUNC VOID DIA_Rod_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rod_PICKPOCKET);
	Info_AddChoice		(DIA_Rod_PICKPOCKET, DIALOG_BACK 		,DIA_Rod_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rod_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rod_PICKPOCKET_DoIt);
};

func void DIA_Rod_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rod_PICKPOCKET);
};
	
func void DIA_Rod_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rod_PICKPOCKET);
};























