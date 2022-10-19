

//#####################################################################
//##
//##
//##				TALBIN_NW
//##
//##
//#####################################################################
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talbin_NW_EXIT   (C_INFO)
{
	npc         = VLK_4132_Talbin_NW;
	nr          = 999;
	condition   = DIA_Talbin_EXIT_Condition;
	information = DIA_Talbin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Talbin_NW_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Talbin_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_NW		(C_INFO)
{
	npc		 = 	VLK_4132_Talbin_NW;
	nr		 = 	15;
	condition	 = 	DIA_Talbin_NW_Condition;
	information	 = 	DIA_Talbin_NW_Info;

	description	 = 	"Ce n'était pas si difficile, n'est-ce pas ?";
};

func int DIA_Talbin_NW_Condition ()
{
	return TRUE;
};

func void DIA_Talbin_NW_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_NW_15_00"); //Alors, le franchissement du col n'était pas si terrible que ça, si ?
	AI_Output			(self, other, "DIA_Talbin_NW_07_01"); //Merci de m'avoir sauvé.
	AI_Output			(self, other, "DIA_Talbin_NW_07_02"); //Tenez, j'ai trouvé cette pierre au niveau du col. Peut-être vous sera-t-elle utile...

	if (hero.guild == GIL_KDF)
	{
	AI_Output			(self, other, "DIA_Talbin_NW_07_03"); //On dirait une pierre runique.
	CreateInvItems (self, ItMi_RuneBlank, 1);									
	B_GiveInvItems (self, other, ItMi_RuneBlank, 1);					
	}
	else
	{
	AI_Output			(self, other, "DIA_Talbin_NW_07_04"); //On dirait un bloc de minerai.
	CreateInvItems (self, ItMi_Nugget, 1);									
	B_GiveInvItems (self, other, ItMi_Nugget, 1);					
	};
	
	AI_Output			(self, other, "DIA_Talbin_NW_07_05"); //Qu'Innos vous protège.

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Farm"); 
	TOPIC_END_Talbin_Runs = TRUE;
	B_GivePlayerXP (XP_SavedTalbin);
};

 
///////////////////////////////////////////////////////////////////////
//	Info verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_NW_PERM		(C_INFO)
{
	npc		 = 	VLK_4132_Talbin_NW;
	nr		 = 	15;
	condition	 = 	DIA_Talbin_NW_PERM_Condition;
	information	 = 	DIA_Talbin_NW_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Tout va bien ?";
};

func int DIA_Talbin_NW_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_NW))
		{
				return TRUE;
		};
};

func void DIA_Talbin_NW_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_NW_PERM_15_00"); //Tout va bien ?
	AI_Output			(self, other, "DIA_Talbin_NW_PERM_07_01"); //Oui, merci. Vous pouvez y aller, tout va bien pour moi.
	AI_StopProcessInfos (self);
};




