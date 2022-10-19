

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

	description	 = 	"Tout va bien ?";
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
	AI_Output			(other, self, "DIA_RodDJG_HALLO_15_00"); //Vous allez bien ?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_06_01"); //Ces bottes me tuent ! La nouvelle armure est vraiment bien mais pourquoi les lanières des bottes doivent-elles être si serrées ?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_06_02"); //Si je les desserre, je perds presque mes bottes.

	if 	(
		((Npc_IsDead(Swampdragon)) == FALSE)
		&& (DJG_SwampParty == FALSE)
		)
			{
			Info_AddChoice	(DIA_RodDJG_HALLO, "Qu'attendez-vous ?", DIA_RodDJG_HALLO_warten );
			};
	Info_AddChoice	(DIA_RodDJG_HALLO, "Où avez-vous eu ces bottes ?", DIA_RodDJG_HALLO_Woher );

};
func void DIA_RodDJG_HALLO_Woher ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_Woher_15_00"); //Où avez-vous eu ces bottes ?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_Woher_06_01"); //C'est le vieux Bennet qui les a faites pour nous, les chasseurs de dragons. Et en plus on a dû le payer généreusement pour cette saleté.
	AI_Output			(self, other, "DIA_RodDJG_HALLO_Woher_06_02"); //Si je mets la main sur lui, je vais les lui faire manger avant de le forcer à me rembourser.

};

func void DIA_RodDJG_HALLO_warten ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_15_00"); //Qu'attendez-vous ?
	
	Info_ClearChoices	(DIA_RodDJG_HALLO);

	if ((Npc_IsDead(DJG_Cipher))== FALSE)
		{
		AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_06_01"); //Que Cipher bouge ses fesses. Il est temps qu'on parte.
		AI_StopProcessInfos (self);
		}
		else
		{
		AI_Output		(self, other, "DIA_RodDJG_HALLO_warten_06_02"); //Je pensais d'abord jeter un coup d'œil à cette zone marécageuse là-bas.
		AI_Output		(self, other, "DIA_RodDJG_HALLO_warten_06_03"); //Qu'en pensez-vous ? Pourquoi n'irions-nous pas là-bas ensemble et voir ce qu'on peut trouver ?

		Info_AddChoice	(DIA_RodDJG_HALLO, "J'irai moi-même.", DIA_RodDJG_HALLO_warten_allein );
		Info_AddChoice	(DIA_RodDJG_HALLO, "Que savez-vous sur la région des marais ?", DIA_RodDJG_HALLO_warten_wasweisstdu );
		Info_AddChoice	(DIA_RodDJG_HALLO, "Allons-y ensemble.", DIA_RodDJG_HALLO_warten_zusammen );
		};
};
func void DIA_RodDJG_HALLO_warten_zusammen ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_zusammen_15_00"); //Allons-y ensemble.
	AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_zusammen_06_01"); //Très bien, suivez-moi.

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	Npc_ExchangeRoutine	(self,	"SwampWait2");
	
};

func void DIA_RodDJG_HALLO_warten_wasweisstdu ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_wasweisstdu_15_00"); //Que savez-vous au sujet de la région des marais ?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_wasweisstdu_06_01"); //Seulement que ça pue et qu'il y a probablement pas mal d'or. N'est-ce pas suffisant ?

};

func void DIA_RodDJG_HALLO_warten_allein ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_allein_15_00"); //J'irai moi-même.
	AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_allein_06_01"); //Alors je vous souhaite bonne chance.

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

	description	 = 	"Qu'est-ce qui ne va pas ?";
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
	AI_Output			(other, self, "DIA_RodDJG_WARTEMAL_15_00"); //Quel est votre problème ?

	if 	(
		((DJG_SwampParty == TRUE) || (Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_02")<1000))
		&& (Npc_IsDead(DJG_Cipher))
		)
		{
			AI_Output			(self, other, "DIA_RodDJG_WARTEMAL_06_01"); //Ecoutez, mon gars. J'ai l'impression que c'est en train de dégénérer. Je vais m'éclipser.
			DJG_SwampParty = FALSE;
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,	"Start");
		}
	else
		{
			AI_Output			(self, other, "DIA_RodDJG_WARTEMAL_06_02"); //(maudissant) Ces bottes ! Ces foutues bottes !
		};

	if 	(Npc_IsDead(SwampDragon))
		{
			AI_Output			(other, self, "DIA_RodDJG_WARTEMAL_15_03"); //Et qu'allez-vous faire maintenant ?
			AI_Output			(self, other, "DIA_RodDJG_WARTEMAL_06_04"); //Quelle drôle de question ! Je vais commencer par m'acheter de nouvelles bottes .
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,	"Start");
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























