///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nadja_EXIT   (C_INFO)
{
	npc         = VLK_435_Nadja;
	nr          = 999;
	condition   = DIA_Nadja_EXIT_Condition;
	information = DIA_Nadja_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Nadja_EXIT_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Nadja_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Nadja_PICKPOCKET (C_INFO)
{
	npc			= VLK_435_Nadja;
	nr			= 900;
	condition	= DIA_Nadja_PICKPOCKET_Condition;
	information	= DIA_Nadja_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Nadja_PICKPOCKET_Condition()
{
	C_Beklauen (40, 40);
};
 
FUNC VOID DIA_Nadja_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Nadja_PICKPOCKET);
	Info_AddChoice		(DIA_Nadja_PICKPOCKET, DIALOG_BACK 		,DIA_Nadja_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Nadja_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Nadja_PICKPOCKET_DoIt);
};

func void DIA_Nadja_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Nadja_PICKPOCKET);
};
	
func void DIA_Nadja_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Nadja_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_STANDARD		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  3;
	condition	 = 	DIA_Nadja_STANDARD_Condition;
	information	 = 	DIA_Nadja_STANDARD_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Nadja_STANDARD_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Bromor_Pay == FALSE)
	{
		return TRUE;
	};
};
var int Nadja_LuciaInfo;
func void DIA_Nadja_STANDARD_Info ()
{
	if (Nadja_LuciaInfo == TRUE)
	{
		AI_Output (self, other, "DIA_ADDON_Nadja_STANDARD_16_00"); //Je ne pourrai vous parler que quand vous aurez rencontré à Bromor.
	}
	else
	{
		AI_Output (self, other, "DIA_Nadja_STANDARD_16_00"); //Je ne peux pas m'occuper de vous maintenant, mon grand loup. Allez voir Bromor si vous voulez vous amuser.
	};
	
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
	&& (Nadja_LuciaInfo == FALSE) 
	{
		AI_Output (other, self, "DIA_ADDON_Nadja_STANDARD_15_01"); //Je veux seulement vous poser quelques questions sur ces disparus.
		AI_Output (self, other, "DIA_ADDON_Nadja_STANDARD_16_02"); //Je ne peux vous dire que peu de choses, mais pas ici, chéri.
		AI_Output (other, self, "DIA_ADDON_Nadja_STANDARD_15_03"); //Montons.
		AI_Output (self, other, "DIA_ADDON_Nadja_STANDARD_16_04"); //Bien. Vous devez d'abord régler ça avec Bromor. Je ne veux pas de problème.
		Nadja_LuciaInfo = TRUE;
	};	
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Danach
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_Danach		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  2;
	condition	 = 	DIA_Nadja_Danach_Condition;
	information	 = 	DIA_Nadja_Danach_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Nadja_Danach_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Bromor_Pay == FALSE)
	&& (Nadja_Nacht == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Nadja_Danach_Info ()
{
	AI_Output (self, other, "DIA_Nadja_Danach_16_00"); //Revenez me voir la prochaine fois.
	Nadja_Nacht = FALSE;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_hochgehen		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  3;
	condition	 = 	DIA_Nadja_hochgehen_Condition;
	information	 = 	DIA_Nadja_hochgehen_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;
	description	 =	"Allons là-haut.";
};

func int DIA_Nadja_hochgehen_Condition ()
{	
	if (Bromor_Pay == 1)
	{
		return TRUE;
	};
};
func void DIA_Nadja_hochgehen_Info ()
{
	AI_Output (other, self, "DIA_Nadja_hochgehen_15_00"); //Montons.
	AI_Output (self, other, "DIA_Nadja_hochgehen_16_01"); //C'est votre jour de chance, mon mignon. Allons-y.
	
	Bromor_Pay = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"DANCE");
};
///////////////////////////////////////////////////////////////////////
//	Info LuciaInfo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nadja_LuciaInfo		(C_INFO)
{
	npc		 = 	VLK_435_Nadja;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nadja_LuciaInfo_Condition;
	information	 = 	DIA_Addon_Nadja_LuciaInfo_Info;

	description	 = 	"Nous pouvons parler, maintenant ?";
};
func int DIA_Addon_Nadja_LuciaInfo_Condition ()
{
	if (Bromor_Pay == 2)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_NADJA") < 200) 
	&& (Nadja_LuciaInfo == TRUE)
		{
			return TRUE;
		};
};
var int Nadja_GaveLuciaInfo;
func void DIA_Addon_Nadja_LuciaInfo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_15_00"); //Bon pouvons-nous parler maintenant ?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_01"); //Nous sommes plus tranquilles ici à l'étage.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_02"); //Bromor n'aime pas nous voir parler aux clients pendant le travail, si ça ne lui rapporte pas un petit quelque chose.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_03"); //Alors comme ça vous voulez en savoir plus sur les gens qui ont disparu ici dans le port, n'est-ce pas ?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_16_04"); //Je ne sais pas si je vous serai d'une grande aide mais au moins je peux vous dire ce qu'il est advenu de Lucia.

	Nadja_GaveLuciaInfo = TRUE;
	
	Info_ClearChoices	(DIA_Addon_Nadja_LuciaInfo);
	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "Où s'est-elle enfuie ?", DIA_Addon_Nadja_LuciaInfo_wo );
	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "Parlez-moi de Lucia.", DIA_Addon_Nadja_LuciaInfo_lucia );
};
func void DIA_Addon_Nadja_LuciaInfo_lucia ()
{
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_lucia_15_00"); //Parlez-moi de Lucia.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_01"); //Personne ici, ne regrette son départ.
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_lucia_15_02"); //Pourquoi ?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_03"); //Je ne pense pas qu'il n'y ait une personne ici dont elle n'a pas essayé de se servir.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_04"); //C'était une vraie garce !
};
func void DIA_Addon_Nadja_LuciaInfo_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Nadja_LuciaInfo_wo_15_00"); //Où s'est-elle enfuie ?
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_wo_16_01"); //Elle voyait beaucoup Elvrich, l'apprenti de Thorben le charpentier du quartier bas de la ville.
	AI_Output	(self, other, "DIA_Addon_Nadja_LuciaInfo_wo_16_02"); //Je parie qu'elle s'est fait la belle avec ce jouvenceau.

	Log_CreateTopic (TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Lucia,"Lucia la prostituée a disparu de la maison close de Bromor dans la nuit. On raconte qu'elle se serait enfuie avec Elvrich, l'apprenti du charpentier Thorben."); 

	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "Où ont-ils pu aller, tous les deux ?", DIA_Addon_Nadja_LuciaInfo_Elvrich );
};
func void DIA_Addon_Nadja_LuciaInfo_Elvrich ()
{
	AI_Output			(other, self, "DIA_Addon_Nadja_LuciaInfo_Elvrich_15_00"); //Où ces deux-là ont-ils pu aller ?
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_Elvrich_16_01"); //Si les loups ne les ont pas mangés, je suppose qu'ils sont partis s'installer avec les fermiers.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_Elvrich_16_02"); //Y-a-t-il un autre endroit où ils auraient pu aller ?

	Info_AddChoice	(DIA_Addon_Nadja_LuciaInfo, "Que savez-vous d'autre ?", DIA_Addon_Nadja_LuciaInfo_sonst );
};
func void DIA_Addon_Nadja_LuciaInfo_sonst ()
{
	AI_Output			(other, self, "DIA_Addon_Nadja_LuciaInfo_sonst_15_00"); //Que savez-vous d'autre ?
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_01"); //J'ai entendu beaucoup d'histoires sur ces gens qui ont disparu par ici près du port.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_02"); //Mais je ne sais pas si je dois y croire ou pas.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_03"); //Vous devriez avoir une petite discussion avec les marchands près d'ici.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_04"); //C'est tout ce que je peux vous dire hélas.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_05"); //Maintenant, que faisons-nous tous les deux, mon chou ? Après tout, vous avez payé pour cela.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_06"); //Ça ne vous dirait pas de prendre un peu de bon temps avant de partir ?

	Info_ClearChoices (DIA_Addon_Nadja_LuciaInfo);
	
	//Zusatz 
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	&& (Knows_Borka_Dealer == FALSE)
	{
		
		Info_AddChoice (DIA_Addon_Nadja_LuciaInfo,PRINT_Addon_NadjaWait,DIA_Addon_Nadja_WAIT);
	};
	Info_AddChoice (DIA_Addon_Nadja_LuciaInfo,"Merci, mais je dois partir.",DIA_Addon_Nadja_LuciaInfo_weiter);
	Info_AddChoice (DIA_Addon_Nadja_LuciaInfo,"Pourquoi pas...?",DIA_Nadja_Poppen_Start);
};
func void DIA_Addon_Nadja_LuciaInfo_weiter ()
{
	AI_Output			(other, self, "DIA_Addon_Nadja_LuciaInfo_weiter_15_00"); //Merci, mais je dois y aller maintenant.
	AI_Output			(self, other, "DIA_Addon_Nadja_LuciaInfo_weiter_16_01"); //Tant pis. Et bien, à une prochaine fois peut-être.
	
	Bromor_Pay = FALSE;
	Nadja_Nacht = (Nadja_Nacht +1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID DIA_Addon_Nadja_WAIT()
{
	Info_ClearChoices (DIA_Addon_Nadja_LuciaInfo);
};


///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_Poppen	(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 =  3;
	condition	 = 	DIA_Nadja_Poppen_Condition;
	information	 = 	DIA_Nadja_Poppen_Info;
	permanent	 = 	TRUE;
	description  = "(S'amuser un peu)";
};

func int DIA_Nadja_Poppen_Condition ()
{	
	if (Bromor_Pay == 2)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_NADJA") < 300) 
	
	/* Das ist böse - wenn ich direkt mit Bromor spreche passiert nix mehr. M.F.
	&&  (
		((Nadja_LuciaInfo != 0) && (Nadja_GaveLuciaInfo == 0))
		|| (Nadja_GaveLuciaInfo == TRUE)
		)
	*/	
	
	{
		return TRUE;
	};
};
func void DIA_Nadja_Poppen_Info ()
{
	AI_Output (self, other, "DIA_Nadja_Poppen_16_00"); //Les heures qui viennent sont rien que pour nous deux.
	AI_Output (self, other, "DIA_Nadja_Poppen_16_01"); //Détendez-vous. Allongez-vous sur le dos et prenez votre pied...

	Info_ClearChoices (DIA_Nadja_Poppen);
	Info_AddChoice (DIA_Nadja_Poppen,"Très bien...",DIA_Nadja_Poppen_Start);
};
FUNC VOID DIA_Nadja_Poppen_Start()
{
	Bromor_Pay = FALSE;
	Nadja_Nacht = (Nadja_Nacht +1);
	
	PlayVideo ("LOVESCENE.BIK");
		
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	/*	
	if Wld_IsTime (00,00,06,00)
	{
		Wld_SetTime (09,00);
	}
	else if Wld_IsTime (06,00,12,00)
	{
		Wld_SetTime (15,00);
	}
	else if Wld_IsTime (12,00,18,00)
	{
		Wld_SetTime (21,00);
	}
	else 
	{
		Wld_SetTime (03,00);	
	};
	*/
	
};

func void DIA_Addon_Nadja_LuciaInfo_Pop ()
{
	DIA_Nadja_Poppen_Start ();
};

///////////////////////////////////////////////////////////////////////
//	Info BUYHERB
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_BUYHERB		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 = 	2;
	condition	 = 	DIA_Nadja_BUYHERB_Condition;
	information	 = 	DIA_Nadja_BUYHERB_Info;
	permanent	 =	TRUE;
	description	 = 	"Où puis-je acheter de l'herbe ici ?";
};
func int DIA_Nadja_BUYHERB_Condition ()
{	
	if 	(MIS_Andre_REDLIGHT == LOG_RUNNING) 
	&& (Npc_KnowsInfo (other,DIA_Nadja_WANT_HERB) == FALSE)
	&& (Nadja_Money == FALSE)
	&& (Undercover_Failed == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Nadja_BUYHERB_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Nadja_BUYHERB_15_00"); //Où puis-je acheter de l'herbe par ici ?
	
	if  (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_NADJA") < 500) 
	{	
		if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
		{
			AI_Output (self, other, "DIA_Nadja_BUYHERB_16_01"); //Comment voulez-vous que je le sache ? Et même si je le savais, pensez-vous que je le dirais à un garde ?
			Undercover_Failed = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Nadja_BUYHERB_16_02"); //Si vous voulez que je vous réponde, montrez-moi la couleur de votre argent.
			AI_Output (other, self, "DIA_Nadja_BUYHERB_15_03"); //Combien voulez-vous ?
			AI_Output (self, other, "DIA_Nadja_BUYHERB_16_04"); //50 pièces d'or devraient faire l'affaire.
			Nadja_Money = TRUE;
		};
	}
	else 
	{
		B_Say	(self, other,"$NOTNOW");
	};
};
///////////////////////////////////////////////////////////////////////
//	Info WANT_HERB
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_WANT_HERB		(C_INFO)
{
	npc			 = 	VLK_435_Nadja;
	nr			 = 	2;
	condition	 = 	DIA_Nadja_WANT_HERB_Condition;
	information	 = 	DIA_Nadja_WANT_HERB_Info;
	permanent	 =  FALSE;
	description	 = 	"Maintenant, dites-moi où je peux acheter de l'herbe (donner 50 pièces d'or).";
};
func int DIA_Nadja_WANT_HERB_Condition ()
{	
	if 	(Npc_HasItems (other, ITmi_Gold) >= 50)
	&&  (Nadja_Money == TRUE)		
	&&  (MIS_Andre_REDLIGHT == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Nadja_WANT_HERB_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	AI_Output (other, self, "DIA_Nadja_WANT_HERB_15_00"); //Et maintenant, dites-moi où je peux acheter de l'herbe.
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Nadja_WANT_HERB_16_01"); //Je regrette, mais j'ai oublié.
	}
	else
	{
		B_GiveInvItems	(other, self, ItMi_Gold, 50); 
		AI_Output (self, other, "DIA_Nadja_WANT_HERB_16_02"); //Allez voir Borka, mon grand loup. Il en aura à vous offrir.
		Knows_Borka_Dealer = TRUE;
	};
};




 












