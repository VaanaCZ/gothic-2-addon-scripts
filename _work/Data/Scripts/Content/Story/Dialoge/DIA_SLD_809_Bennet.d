// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Bennet_EXIT   (C_INFO)
{
	npc         = SLD_809_Bennet;
	nr          = 999;
	condition   = DIA_Bennet_EXIT_Condition;
	information = DIA_Bennet_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bennet_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Bennet_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Hallo 
// ************************************************************
instance DIA_Bennet_HALLO	(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 1;
	condition	= DIA_Bennet_HALLO_Condition;
	information	= DIA_Bennet_HALLO_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Bennet_HALLO_Condition ()
{
	if (Kapitel < 3)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bennet_HALLO_06_00"); //Ce n'est pas moi qui vend les armes, mais Khaled. Il est dans la maison avec Onar.
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Khaled est un fournisseur d'armes.");
};

// ************************************************************
// 			  				TRADE 
// ************************************************************
instance DIA_Bennet_TRADE		(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 700;
	condition	= DIA_Bennet_TRADE_Condition;
	information	= DIA_Bennet_TRADE_Info;
	permanent	= TRUE;
	description	= "Et en ce qui concerne la fabrication d'équipements ?";
	trade		= TRUE;
};

func int DIA_Bennet_TRADE_Condition ()
{
	if ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TRADE_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TRADE_15_00"); //Vous fabriquez de l'équipement ?
	B_GiveTradeInv (self);

	//Joly: Mc ArrowBolt
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
	//////////////////////////////////////////////////////////////////////////////////////

	AI_Output (self, other, "DIA_Bennet_TRADE_06_01"); //Qu'est-ce qu'il vous faut ?
	
	if (BennetLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry (Topic_SoldierTrader,"Bennet vend de l'équipement pour la forge.");
		BennetLOG = TRUE;
	};
};

// ************************************************************
// 			  				WhichWeapons 
// ************************************************************
instance DIA_Bennet_WhichWeapons (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 2;
	condition	= DIA_Bennet_WhichWeapons_Condition;
	information	= DIA_Bennet_WhichWeapons_Info;
	permanent	= FALSE;
	description	= "Quel genre d'armes fabriquez-vous ?";
};

func int DIA_Bennet_WhichWeapons_Condition ()
{
	if ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	&& (MIS_Bennet_BringOre == FALSE)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhichWeapons_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_00"); //Qu'est-ce que vous faites comme armes ?
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_01"); //Pour le moment des épées toutes simples, et c'est à peu près tout.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_02"); //Mais si j'avais du minerai magique, je pourrais forger des armes de meilleure qualité que celles en acier.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_03"); //Vous ne savez pas où en trouver dans le coin des fois ? (éclate de rire) A part dans la Vallée des mines, je veux dire.
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_04"); //Non.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_05"); //Je m'en doutais.
};

// ************************************************************
// 			  				BauOrSld 
// ************************************************************
instance DIA_Bennet_BauOrSld (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 3;
	condition	= DIA_Bennet_BauOrSld_Condition;
	information	= DIA_Bennet_BauOrSld_Info;
	permanent	= FALSE;
	description	= "Etes-vous avec les fermiers ou avec les mercenaires ?";
};

func int DIA_Bennet_BauOrSld_Condition ()
{
	return TRUE;
};

func void DIA_Bennet_BauOrSld_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_00"); //Vous êtes un fermier ou un mercenaire ?
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_01"); //Vous vous fichez de moi là ?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_02"); //Simple curiosité de ma part.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_03"); //Vous avez déjà vu un fermier capable de forger des armes ?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_04"); //Non.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_05"); //Alors, pourquoi posez-vous des questions aussi stupides ?
};

// ************************************************************
// 			  				WannaJoin 
// ************************************************************
instance DIA_Bennet_WannaJoin (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 4;
	condition	= DIA_Bennet_WannaJoin_Condition;
	information	= DIA_Bennet_WannaJoin_Info;
	permanent	= TRUE;
	description	= "Je veux me joindre aux mercenaires !";
};

func int DIA_Bennet_WannaJoin_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bennet_BauOrSld))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaJoin_15_00"); //Je voudrais rejoindre les mercenaires.
	AI_Output (self, other, "DIA_Bennet_WannaJoin_06_01"); //Dans ce cas, arrêtez de m'importuner et allez voir Torlof pour qu'il vous fasse passer l'épreuve.
	if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Bennet_WannaJoin_15_02"); //J'ai réussi l'épreuve.
		AI_Output (self, other, "DIA_Bennet_WannaJoin_06_03"); //Très bien. Dans ce cas, ma voix vous est acquise.
	};
};

// ************************************************************
// 			  				WannaSmith 
// ************************************************************

instance DIA_Bennet_WannaSmith (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 5;
	condition	= DIA_Bennet_WannaSmith_Condition;
	information	= DIA_Bennet_WannaSmith_Info;
	permanent	= TRUE;
	description	= "Pouvez-vous m'apprendre à forger une épée ?";
};

func int DIA_Bennet_WannaSmith_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == FALSE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmith_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_15_00"); //Pouvez-vous m'apprendre à forger une épée ?
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_01"); //Bien sûr.
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_02"); //Mais ce ne sera pas gratuit. Disons... 30 pièces d'or.
	
	Info_ClearChoices (DIA_Bennet_WannaSmith);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Peut-être plus tard.", DIA_Bennet_WannaSmith_Later);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Très bien, voici vos 30 pièces d'or.", DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Pay_15_00"); //D'accord. Les voilà.
	
	if (B_GiveInvItems (other, self, itmi_gold, 30))
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_01"); //Et c'est un prix d'ami. Bien, prévenez-moi quand vous voudrez commencer.
		
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Bennet peut m'apprendre l'art de la forge.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_02"); //N'essayez pas de me prendre pour un pigeon. Ce sera 30 pièces d'or, et pas une de moins !
	};
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Later_15_00"); //Peut-être plus tard.
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};


// ************************************************************
// 			  				Teach COMMON 
// ************************************************************
instance DIA_Bennet_TeachCOMMON (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 6;
	condition	= DIA_Bennet_TeachCOMMON_Condition;
	information	= DIA_Bennet_TeachCOMMON_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString("Apprendre l'art de la forge", B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
};

func int DIA_Bennet_TeachCOMMON_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == TRUE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachCOMMON_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TeachCOMMON_15_00"); //Apprenez-moi à forger une épée !
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_01"); //C'est très simple : trouvez-vous une barre d'acier et plongez-la dans les flammes jusqu'à ce qu'elle se mette à luire.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_02"); //Puis, placez-la sur l'enclume et martelez-la pour lui donner une forme de lame.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_03"); //Attention surtout à ce qu'elle ne refroidisse pas trop. Vous ne disposez que de quelques minutes pour travailler votre arme avant de devoir la plonger de nouveau dans le feu.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_04"); //Quant au reste, vous l'apprendrez par vous-même. Ce n'est qu'une question de pratique.
	};
};

// ************************************************************
// 			  				WannaSmithORE
// ************************************************************
instance DIA_Bennet_WannaSmithORE (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 7;
	condition	= DIA_Bennet_WannaSmithORE_Condition;
	information	= DIA_Bennet_WannaSmithORE_Info;
	permanent	= TRUE;
	description	= "Apprenez-moi à fabriquer des armes en minerai magique !";
};

func int DIA_Bennet_WannaSmithORE_Condition ()
{
	if (Bennet_TeachSmith == FALSE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))	
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmithORE_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_00"); //Apprenez-moi à forger des armes à base de minerai magique !
		
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_01"); //Mais vous ne connaissez même pas les bases !
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_02"); //Commencez par apprendre comment forger une épée normale et après, on verra.
	}
	else if (other.guild != GIL_SLD)
	&& 		(other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_03"); //Tant que vous ne serez pas des nôtres, il est hors de question que je vous révèle le secret des armes en minerai magique !
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_04"); //Seuls quelques forgerons le connaissent et croyez-moi, ceux qu'on trouve en ville n'en font pas partie.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_05"); //Tant mieux d'ailleurs, sans quoi ces minables de la garde auraient tous une épée magique à l'heure qu'il est.
		if (other.guild == GIL_MIL)
		{	
			AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_06"); //Je n'ai rien contre vous. (sourit) Vous avez l'air d'être un type correct.
		};
	}
	else if (MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_07"); //Je le ferais peut-être, si j'avais du minerai magique.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_08");//Allons, je fais partie des mercenaires et je sais forger une arme ! Qu'est-ce qu'il vous faut de plus ?
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_09"); //Et si vous m'expliquiez comment je suis censé forger une arme magique sans minerai magique ?
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_10");//Euh...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_11"); //C'est bien ce qu'il me semblait. Il me faut au moins cinq blocs de minerai. Sinon ce n'est même pas la peine d'y penser.
		if (MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_RUNNING;
		};
	}
	else //alles OK
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_12"); //Excellent ! Vous m'avez apporté le minerai et vous savez comment forger une épée.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_13");//Je vous écoute.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_14"); //Le plus important, c'est qu'il n'y a aucune différence entre une arme intégralement en minerai magique et une lame normale recouverte d'une fine couche de ce minerai. Ce qui compte, c'est la surface de l'arme.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_15"); //Et le minerai magique coûte si cher qu'il vaut mieux s'en servir pour plaquer du métal ordinaire.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_16"); //Evidemment, recouvrir une épée existante d'une fine couche de minerai magique ne donne pas le résultat escompté. Il faut forger l'arme à partir de rien.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_17"); //Pour le reste, tout dépend de l'arme que vous cherchez à obtenir.
		Bennet_TeachSmith = TRUE;
	};
};

// ************************************************************
// 			  				WhereOre
// ************************************************************
instance DIA_Bennet_WhereOre (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 8;
	condition	= DIA_Bennet_WhereOre_Condition;
	information	= DIA_Bennet_WhereOre_Info;
	permanent	= FALSE;
	description	= "Où puis-je trouver du minerai magique ?";
};

func int DIA_Bennet_WhereOre_Condition ()
{
	if (MIS_Bennet_BringOre == LOG_RUNNING)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhereOre_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WhereOre_15_00"); //Où puis-je trouver du minerai magique ?
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_01"); //Si seulement je le savais ! Il doit y en avoir à la colonie minière.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_02"); //Mais peut-être que vous aurez de la chance et que vous en trouverez quelques blocs dans les environs.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_03"); //Il me semble qu'il y a des galeries minières dans les montagnes situées au sud d'ici.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_04"); //Mais attention, j'ai entendu dire que ça grouillait de brigands par là-bas !
};

// ************************************************************
// 			  				BringOre
// ************************************************************
instance DIA_Bennet_BringOre (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 9;
	condition	= DIA_Bennet_BringOre_Condition;
	information	= DIA_Bennet_BringOre_Info;
	permanent	= FALSE;
	description	= "Tenez - 5 pépites de minerai.";
};

func int DIA_Bennet_BringOre_Condition ()
{
	if (MIS_Bennet_BringOre == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Nugget) >= 5)
	{
		return TRUE;
	};
};

func void DIA_Bennet_BringOre_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BringOre_15_00"); //Tenez.
	AI_Output (self, other, "DIA_Bennet_BringOre_06_01"); //(éclate de rire) Montrez-moi ça !
	B_GiveInvItems (other, self, itmi_nugget, 5);
	AI_Output (self, other, "DIA_Bennet_BringOre_06_02"); //Vraiment ? Ça alors !
	AI_Output (self, other, "DIA_Bennet_BringOre_06_03"); //Vous pouvez en garder deux. Vous en aurez besoin pour forger votre propre arme.
	B_GiveInvItems (self,other, itmi_nugget, 2);
	MIS_Bennet_BringOre = LOG_SUCCESS;
};

// ************************************************************
// 			  				  Teach 
// ************************************************************
var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;
// ---------------------------------

FUNC VOID B_SayBennetLATER()
{
	AI_Output	(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Non, pas encore. Revenez plus tard.
};
instance DIA_Bennet_TeachSmith		(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 30;
	condition	= DIA_Bennet_TeachSmith_Condition;
	information	= DIA_Bennet_TeachSmith_Info;
	permanent	= TRUE;
	description	= "Je veux en savoir plus sur la fabrication d'armes en minerai magique.";
};

func int DIA_Bennet_TeachSmith_Condition ()
{
	if (Bennet_TeachSmith == TRUE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSmith_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TeachSmith_15_00"); //Je voudrais en savoir davantage sur la fabrication des armes magiques.
	
	if (Kapitel == 1)//HACK Mattes  
	{
		B_SayBennetLATER();
	}
	else if (Kapitel == 2)
	&& (Bennet_Kap2Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_01"); //Je peux vous apprendre à forger une épée à une main ou à deux mains en utilisant du minerai magique.
		Bennet_Kap2Smith = TRUE;
	}
	else if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (Bennet_Kap3Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_02"); //J'ai amélioré ma technique. Je peux désormais vous apprendre à forger une épée bâtarde ou une épée lourde à deux mains à l'aide de minerai magique.
		Bennet_Kap3Smith = TRUE;
	}
	else if (MIS_ReadyForChapter4 == TRUE)
	&& (Kapitel < 5)
	&& (Bennet_Kap4Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_03"); //Cette fois-ci, je crois bien que je me suis surpassé. J'ai fabriqué deux lames de combat. Je n'ai jamais vu d'armes de cette qualité.
		Bennet_Kap4Smith = TRUE;
	}
	else if (Kapitel >= 5)
	&& (Bennet_Kap5Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_04"); //Ecoutez, je crois bien que je viens d'avoir une inspiration : des armes en minerai magique trempées dans du sang de dragon. Et je sais exactement comment procéder !
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_05"); //(sourit) Ça vous intéresse ?
		Bennet_Kap5Smith = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_06"); //Quel genre d'arme aimeriez-vous fabriquer ?
	};
	
	Info_ClearChoices (DIA_Bennet_TeachSmith);
	Info_AddChoice (DIA_Bennet_TeachSmith, DIALOG_BACK, DIA_Bennet_TeachSmith_BACK);
	// ------ Kapitel 2 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_01 , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_01))		,DIA_Bennet_TeachSmith_1hSpecial1);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_01))		,DIA_Bennet_TeachSmith_2hSpecial1);
	};
	// ------ Kapitel 3 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_02))		,DIA_Bennet_TeachSmith_1hSpecial2);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_02))		,DIA_Bennet_TeachSmith_2hSpecial2);
	};
	// ------ Kapitel 4 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_03))		,DIA_Bennet_TeachSmith_1hSpecial3);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_03))		,DIA_Bennet_TeachSmith_2hSpecial3);
	};
	// ------ Kapitel 5 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
	&& (Kapitel >= 5)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_04))		,DIA_Bennet_TeachSmith_1hSpecial4);
	};  
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
	&& (Kapitel >= 5)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_04))		,DIA_Bennet_TeachSmith_2hSpecial4);
	};
};

FUNC VOID DIA_Bennet_TeachSmith_Back ()
{
	Info_ClearChoices (DIA_Bennet_TeachSmith);
};
func VOID DIA_Bennet_TeachSmith_1hSpecial1 ()
{
	
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_01);	
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial1 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_01);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_02);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_02);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial3 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_03);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial3 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_03);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial4 ()
{
	
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_04);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial4 ()
{

	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_04);
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Bennet_KAP3_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP3_EXIT_Condition;
	information	= DIA_Bennet_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//*********************************************************************
//	Was machst du hier im Knast?
//*********************************************************************
instance DIA_Bennet_WhyPrison		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_WhyPrison_Condition;
	information	 = 	DIA_Bennet_WhyPrison_Info;
	permanent	 = 	FALSE;
	description	 = 	"Comment se fait-il que vous soyez en taule ?";
};

func int DIA_Bennet_WhyPrison_Condition ()
{
	IF (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhyPrison_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_00"); //Que faites-vous au cachot ?
	AI_Output	(self , other,"DIA_Bennet_WhyPrison_06_01"); //Ces fumiers m'ont balancé là. Je suis censé avoir tué un paladin.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_02"); //Mais je n'y suis pour rien. C'est un coup monté.
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_03"); //Un coup monté ? Pour quelle raison ?
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_04"); //Aucune idée, mais vous devez me sortir d'ici.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_05"); //Allez voir le seigneur Hagen, détruisez le mur de ma cellule... Je ne sais pas moi, mais faites quelque chose !
	
	MIS_RescueBennet = LOG_RUNNING; 
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Bennet est dans de sales draps. Il ferait n'importe quoi pour sortir de prison."); 
};

//*********************************************************************
//	Was ist passiert?
//*********************************************************************
instance DIA_Bennet_WhatHappened		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_WhatHappened_Condition;
	information	 = 	DIA_Bennet_WhatHappened_Info;
	permanent	 = 	FALSE;
	description	 = 	"Que s'est-il passé ?";
};

func int DIA_Bennet_WhatHappened_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhatHappened_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_00"); //Que s'est-il passé ?
	AI_Output	(self , other,"DIA_Bennet_WhatHappened_06_01"); //J'étais allé au centre ville avec Hodges pour acheter des provisions pour nos hommes.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_02"); //Et puis, brusquement, on a entendu un cri et un bruit de course.
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_03"); //Venez-en au fait.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_04"); //On a tout de suite compris que quelque chose venait de se produire et qu'on finirait en taule si la garde nous trouvait là.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_05"); //Alors, on a filé sans demander notre reste. Mais juste avant d'arriver aux portes de la ville, j'ai trébuché et je me suis tordu la cheville.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_06"); //Le reste se passe de commentaire. La milice m'est tombée dessus et m'a jeté dans ce trou.
};

//*********************************************************************
//	Wer ist ermordet worden?
//*********************************************************************
instance DIA_Bennet_Victim		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Victim_Condition;
	information	 = 	DIA_Bennet_Victim_Info;
	permanent	 = 	FALSE;
	description	 = 	"Qui a été assassiné ?";
};

func int DIA_Bennet_Victim_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Victim_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_00"); //Qui a été tué ?
	AI_Output	(self , other,"DIA_Bennet_Victim_06_01"); //Je n'en ai pas la moindre idée. Un des paladins, mais je n'en connais aucun.
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_02"); //Vous connaissez son nom ?
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_03"); //Quelque chose comme Lothar, je crois bien, mais je n'en suis pas sûr.
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_04"); //Demandez au seigneur Hagen, il connaît tous les détails de l'affaire.

	B_LogEntry (TOPIC_RESCUEBENNET,"Lothar, un des paladins, a été assassiné. Le seigneur Hagen devrait pouvoir m'en dire plus, il est responsable de l'enquête.");
};

//*********************************************************************
//	Haben sie Beweise gegen dich?
//*********************************************************************
instance DIA_Bennet_Evidence		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Evidence_Condition;
	information	 = 	DIA_Bennet_Evidence_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ont-ils des preuves contre vous ?";
};

func int DIA_Bennet_Evidence_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Evidence_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_00"); //Y a-t-il des preuves contre vous ?
	AI_Output	(self , other,"DIA_Bennet_Evidence_06_01"); //Il paraît qu'un témoin m'aurait reconnu.
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_02"); //Savez-vous de qui il s'agit ?
	AI_Output 	(self ,other ,"DIA_Bennet_Evidence_06_03"); //Non. Tout ce que je sais c'est qu'il ment.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Un témoin affirme avoir vu Bennet. Je dois le trouver si je veux connaître la vérité.");
	
	RescueBennet_KnowsWitness = TRUE; 
};


//*********************************************************************
//	Wer führt die Untersuchungen durch?
//*********************************************************************
instance DIA_Bennet_Investigation		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Investigation_Condition;
	information	 = 	DIA_Bennet_Investigation_Info;
	permanent	 = 	FALSE;
	description	 = 	"Qui dirige l'enquête ?";
};

func int DIA_Bennet_Investigation_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_Evidence))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Investigation_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_00"); //Qui est chargé de l'enquête ?
	AI_Output	(self , other,"DIA_Bennet_Investigation_06_01"); //Le seigneur Hagen en personne. Comme la victime était un paladin, l'affaire tombe sous le coup de la loi martiale.
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_02"); //Qu'est-ce que cela signifie ?
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_03"); //C'est facile à deviner. Si je ne sors pas d'ici, ils vont me pendre sans se poser la moindre question.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_04"); //Aidez-moi ou ce sera la guerre. Lee n'acceptera jamais ça !
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_05"); //Vous pouvez imaginer ce que ça signifie...
};


//*********************************************************************
//	Mann, ich hatte echt schon geglaubt, dass die mich hängen! 
//*********************************************************************
instance DIA_Bennet_ThankYou		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_ThankYou_Condition;
	information	 = 	DIA_Bennet_ThankYou_Info;
	permanent	 = 	FALSE;
	Important	 =	TRUE;
};

func int DIA_Bennet_ThankYou_Condition ()
{
	IF (MIS_RescueBennet == LOG_SUCCESS)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_ThankYou_Info ()
{
	if (hero.guild == GIL_SLD)
	{
		other.guild = GIL_DJG;
		Npc_SetTrueGuild (other, GIL_DJG);
	};

	AI_Output	(self ,other,"DIA_Bennet_ThankYou_06_00"); //Et moi qui pensais que j'allais finir pendu !
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_01"); //Cette histoire se termine bien finalement.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_02"); //Ça, vous pouvez le dire ! Vous auriez dû voir la tête du soldat qui m'a libéré !
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_03"); //(éclate de rire) Il était si terrifié qu'il a failli mouiller ses chausses !
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_04"); //Ce qui me fait penser que j'ai quelque chose pour vous...
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_05"); //Que voulez-vous dire ?
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_06"); //(sourit) Un cadeau.
	
};

//*********************************************************************
//	Was für ein Geschenk?
//*********************************************************************

instance DIA_Bennet_Present		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Present_Condition;
	information	 = 	DIA_Bennet_Present_Info;
	permanent	 = 	FALSE;
	description	 =	"Quel présent ?";
};

func int DIA_Bennet_Present_Condition ()
{
	IF (Npc_KnowsInfo (other,DIA_Bennet_ThankYou))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Present_Info ()
{
	AI_Output	(other,self ,"DIA_Bennet_Present_15_00"); //Quoi comme cadeau ?
	
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_01"); //Nous avons entendu parler des dragons censés se trouver dans la vallée.
	AI_Output	(other,self ,"DIA_Bennet_Present_15_02"); //Ils existent bel et bien !
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_03"); //Très bien, je vous crois.
	
	if (hero.guild == GIL_DJG)
	{
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_04"); //Quoi qu'il en soit, quelques-uns d'entre nous ont décidé d'aller eux-aussi dans la vallée.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_05"); //(sourit) Ils ont l'intention d'y faire le ménage.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_06"); //Qu'est-ce que cela a à voir avec moi ?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_07"); //(fièrement) J'ai mis au point un nouveau modèle d'armure : l'armure de chasseur de dragons !
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_08"); //Elle est plus solide et plus légère qu'une armure classique.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_09"); //Comme vous m'avez sauvé, je tiens à ce que le tout premier modèle existant vous revienne. Je vous l'offre !
			
		CreateInvItems (self,ITAR_DJG_L,1);
		B_GiveInvItems (self,other,ITAR_DJG_L,1);
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_10"); //Je me suis dit que vous voudriez sûrement en être et vous allez avoir besoin d'un équipement fiable quand vous irez dans cette vallée.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_11"); //Ah, au fait, les écailles de dragon m'intéressent. Les vraies, je veux dire. Je suis prêt à vous en offrir un bon prix.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_12"); //Combien par écaille ?
		B_Say_Gold (self,other,Value_DragonScale); 
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_13"); //Bref, je me suis dit que vous voudriez sûrement prendre part à la chasse aux dragons qui se prépare...
		AI_Output	(other,self ,"DIA_Bennet_Present_15_14"); //Et ?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_15"); //Tenez, prenez cette amulette. A mon avis, elle vous sera plus utile qu'à moi.
	
		CreateInvItems (self,ItAm_Hp_01,1); 
		B_GiveInvItems (self,other,ItAm_Hp_01,1);
	};
};


//*********************************************************************
//		DragonScale
//*********************************************************************

//-------------------------------------------------
	var int Bennet_DragonScale_Counter;
	var int Show_DJG_Armor_M;
//-------------------------------------------------

instance DIA_Bennet_DragonScale		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DragonScale_Condition;
	information	 = 	DIA_Bennet_DragonScale_Info;
	permanent	 = 	TRUE;
	description	 =	"J'ai quelques écailles de dragon pour vous.";
};

func int DIA_Bennet_DragonScale_Condition ()
{
	IF (Npc_HasItems (other,ItAt_Dragonscale) > 0)
	&& (hero.guild == GIL_DJG)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DragonScale_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DragonScale_15_00"); //J'ai quelques écailles de dragon pour vous.
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_01"); //De véritables écailles de dragon ?
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_02"); //Tenez, voici votre or !
	
	Bennet_DragonScale_Counter = (Bennet_DragonScale_Counter +(Npc_HasItems (other,ItAT_Dragonscale)));
	
	B_GiveInvItems (self ,other,ItMi_Gold,(Npc_HasItems(other,ItAT_Dragonscale) * Value_DragonScale) ); 
	B_GiveInvItems (other,self ,ItAt_Dragonscale,(Npc_HasItems (other,ItAT_Dragonscale)));
	
	
	if (Bennet_DragonScale_Counter >= 20)
	&& (Show_DJG_Armor_M == FALSE)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_03"); //Merci, ça devrait me suffire. Si vous voulez, je peux vous vendre une armure toute nouvelle et de meilleure qualité.
		
		Show_DJG_Armor_M = TRUE;
	};
};

//*********************************************************************
//		DJG_ARMOR_M
//*********************************************************************

//-----------------------------
var int Bennet_DIA_Bennet_DJG_ARMOR_M_permanent;
//-----------------------------

instance DIA_Bennet_DJG_ARMOR_M		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DJG_ARMOR_M_Condition;
	information	 = 	DIA_Bennet_DJG_ARMOR_M_Info;
	permanent	 = 	TRUE;
	description	 =	"Armure moyenne chasseur de dragons. Prot. : Armes 80, flèches 80 (12 000 po)"; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Bennet_DJG_ARMOR_M_Condition ()
{
	IF (Bennet_DIA_Bennet_DJG_ARMOR_M_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (Show_DJG_Armor_M == TRUE)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DJG_ARMOR_M_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_00"); //Je veux acheter l'armure.
	
	if (Npc_HasItems (other,itmi_Gold) >= 12000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_01"); //Très bien. Je suis sûr qu'elle vous donnera entière satisfaction.
		AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_02"); //Vu son prix, j'ose l'espérer...
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_03"); //Vous verrez qu'elle le vaut amplement.
		
		B_GiveInvItems (other,self,ItMi_Gold,12000);
		CreateInvItems (self,ITAR_DJG_M,1);
		B_GiveInvItems (self,other,ITAR_DJG_M,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_04"); //Vous n'avez pas assez d'or.
	};	
	
};

//*********************************************************************
//		Ich weiss, wie man die Rüstung noch mehr verbessern kann.
//*********************************************************************

instance DIA_Bennet_BetterArmor		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_BetterArmor_Condition;
	information	 = 	DIA_Bennet_BetterArmor_Info;
	permanent	 = 	FALSE;
	description	 =	"Je sais comment améliorer davantage une armure.";
};

func int DIA_Bennet_BetterArmor_Condition ()
{
	IF (PlayerGetsFinalDJGArmor == TRUE)
	&& (hero.guild == GIL_DJG)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_BetterArmor_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_00"); //Je sais comment faire pour améliorer encore cette armure.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_01"); //(sourit) Je vous écoute.
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_02"); //Pourquoi ne pas recouvrir les écailles de dragon de minerai magique ?
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_03"); //(éclate de rire) C'est exactement ce à quoi je pensais ! Vous avez raison bien sûr.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_04"); //Ma dernière armure en date est la meilleure que j'aie jamais fabriquée. Elle est légère et résistante à la fois.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_05"); //En un mot, elle est parfaite.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_06"); //Si vous la voulez, je vous la vends. Je ne ferai pas cette offre à n'importe qui, mais le prix auquel je vous la propose couvre à peine mes frais de fabrication.
};


//*********************************************************************
//		DJG_ARMOR_H
//*********************************************************************

//---------------------------------------------------
var int Bennet_DIA_Bennet_DJG_ARMOR_H_permanent;
//---------------------------------------------------

instance DIA_Bennet_DJG_ARMOR_H		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DJG_ARMOR_H_Condition;
	information	 = 	DIA_Bennet_DJG_ARMOR_H_Info;
	permanent	 = 	TRUE;
	description	 =	"Armure lourde chasseur de dragons : Prot. : Armes 90, Flèches 90. (20 000 po)"; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Bennet_DJG_ARMOR_H_Condition ()
{
	IF (Bennet_DIA_Bennet_DJG_ARMOR_H_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo (other,DIA_Bennet_BetterArmor))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DJG_ARMOR_H_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_H_15_00"); //Donnez-moi l'armure.
	
	if (Npc_HasItems (other,itmi_Gold) >= 20000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_01"); //C'est la meilleure armure que j'aie jamais forgée.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_02"); //Un véritable chef-d'œuvre.
		
		B_GiveInvItems (other,self,ItMi_Gold,20000);
		CreateInvItems (self,ITAR_DJG_H,1);
		B_GiveInvItems (self,other,ITAR_DJG_H,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_03"); //Vous n'avez pas assez d'or.
	};	
	
};
//*********************************************************************
//	Kannst du auch Schmuckstücke reparieren?
//*********************************************************************
instance DIA_Bennet_RepairNecklace		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_RepairNecklace_Condition;
	information	 = 	DIA_Bennet_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"Pouvez-vous réparer un bijou ?";
};

func int DIA_Bennet_RepairNecklace_Condition ()
{
	if 	(MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	&&	((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) 
	||   (MIS_SCKnowsInnosEyeIsBroken  == TRUE)) 
  	{
  		return TRUE;
  	};
};

func void DIA_Bennet_RepairNecklace_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_RepairNecklace_15_00"); //Vous réparez les bijoux ?
	AI_Output			(self, other, "DIA_Bennet_RepairNecklace_06_01"); //Ça dépend. Je dois d'abord voir la pièce avant de pouvoir vous répondre.
	
	if (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_02"); //Il faut aussi que je sorte d'ici.
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_03"); //D'ici là, je ne pourrai manifestement rien faire.
	};	
	
	MIS_SCKnowsInnosEyeIsBroken  = TRUE; 	
};

//*********************************************************************
//		Hier wird das Amulett repariert
//*********************************************************************

//*********************************************************************
//	Kannst du mir dieses Amulett reparieren?
//*********************************************************************
instance DIA_Bennet_ShowInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_ShowInnosEye_Condition;
	information	 = 	DIA_Bennet_ShowInnosEye_Info;
	permanent	 = 	FALSE;
	description	 = 	"Pouvez-vous jeter un coup d'œil à cette amulette ?";
};

func int DIA_Bennet_ShowInnosEye_Condition ()
{
	if (Npc_HasItems (other,ItMi_InnosEye_Broken_MIS))
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
 	{
    	return TRUE;
  	};

};

func void DIA_Bennet_ShowInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_00"); //Pouvez-vous jeter un œil à cette amulette ?
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_01"); //Bien sûr. Montrez-la moi.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_02"); //Hmm... très jolie pièce. La monture est cassée, mais je pense pouvoir la réparer.
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_03"); //Combien de temps cela vous prendra-t-il ?
	if (MIS_REscueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_04"); //Pour le moment, je suis coincé ici et je ne vois pas de forge dans les environs. Vous, si ?
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_05"); //Si j'étais dans ma forge, une journée me suffirait. Mais il faudrait déjà commencer par me sortir d'ici bien sûr.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_06"); //Si vous me la laissez maintenant, elle sera prête demain.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_07"); //Et je vous fais ça gratuitement. Vous m'avez sorti de prison après tout.
	};
	
	B_LogEntry (TOPIC_INNOSEYE, "Bennet est le forgeron dont j'ai besoin pour réparer l'amulette.");

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
};

//*********************************************************************
//	Kannst du mir dieses Amulett reparieren?
//*********************************************************************
instance DIA_Bennet_GiveInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_GiveInnosEye_Condition;
	information	 = 	DIA_Bennet_GiveInnosEye_Info;
	permanent	 = 	FALSE;
	description	 = 	"Voici l'amulette, réparez-la s'il vous plaît.";
};

func int DIA_Bennet_GiveInnosEye_Condition ()
{
	IF (Npc_HasItems (other,ItMi_InnosEye_Broken_Mis)	>=1)
	&& (MIS_SCKnowsInnosEyeIsBroken  == TRUE)
	&& (MIS_REscueBennet == LOG_SUCCESS)
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	{
		return TRUE;
	};	                                                                             
};

func void DIA_Bennet_GiveInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_GiveInnosEye_15_00"); //Voici l'amulette. Réparez-la pour moi, s'il vous plaît.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_01"); //Très bien. La nouvelle monture sera finie demain.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_02"); //Vous n'avez qu'à revenir la chercher à ce moment là.
	
	Npc_RemoveInvItems	(other,	ItMi_InnosEye_Broken_Mis,1);
	AI_PrintScreen (Print_InnoseyeGiven, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
	Bennet_RepairDay = Wld_GetDay ();	
};



///////////////////////////////////////////////////////////////////////
//	Kannst du mir dieses Amulett reparieren?
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_GetInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_GetInnosEye_Condition;
	information	 = 	DIA_Bennet_GetInnosEye_Info;
	permanent	 = 	TRUE;
	description	 = 	"L'amulette est-elle prête ?";
};

func int DIA_Bennet_GetInnosEye_Condition ()
{
	IF (Npc_KnowsInfo (other,DIA_Bennet_GiveInnosEye)
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)) 
	{
		return TRUE;
	};	
};

func void DIA_Bennet_GetInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_GetInnosEye_15_00"); //L'amulette est-elle prête ?
	
	if (Bennet_RepairDay < Wld_GetDay())
	{
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_01"); //Oui, tenez.
	
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems (other,ItMi_InnosEye_Broken_Mis,1);
		AI_PrintScreen (Print_InnoseyeGet, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_02"); //Il m'a fallu refaire la monture de la pierre précieuse.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_03"); //J'y ai travaillé toute la nuit, mais l'amulette est comme neuve désormais.
		
		B_LogEntry (TOPIC_INNOSEYE, "L'amulette est enfin réparée. Bennet a fait du bon travail.");
		
		MIS_Bennet_InnosEyeRepairedSetting   = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_InnosEyeIsRepaired);
	}
	else
	{	//Hack Mattes
		B_SayBennetLATER();
		//AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nein, noch nicht. Komm später wieder.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_05"); //Si vous n'arrêtez pas de m'interrompre, il me faudra encore plus de temps.
		
		AI_StopProcessInfos (self);
	};	 
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Bennet_KAP4_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP4_EXIT_Condition;
	information	= DIA_Bennet_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Dracheneier
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DRACHENEIER		(C_INFO)
{
	npc		 = 	SLD_809_Bennet;
	nr		 = 	5;
	condition	 = 	DIA_Bennet_DRACHENEIER_Condition;
	information	 = 	DIA_Bennet_DRACHENEIER_Info;
	permanent	 = 	TRUE;

	description	 = 	"Pouvez-vous faire quelque chose avec des œufs de dragon ?";
};

func int DIA_Bennet_DRACHENEIER_Condition ()
{
	if (Kapitel >= 4)
	&& (BennetsDragonEggOffer == 0)
	&& (Npc_HasItems (other,ItAt_DragonEgg_MIS) >= 1)
	&& (hero.guild == GIL_DJG)
		{
				return TRUE;
		};
};
var int BennetsDragonEggOffer;
var int DRACHENEIER_angebotenXP_OneTime;
func void DIA_Bennet_DRACHENEIER_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_00"); //Pouvez-vous travailler les œufs de dragon ?
	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_01"); //Des œufs de dragon ? Comment diable avez-vous réussi à vous en procurer ?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_02"); //Je les ai pris aux hommes-lézards.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_03"); //Montrez-moi ça.
	};

	Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	

	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_04"); //Hmm... voilà un matériau extrêmement résistant... Idéal pour la finition des armures, à condition qu'ils éclosent, bien sûr.
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_05"); //Alors, ça vous intéresse, oui ou non ?
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_06"); //Bien sûr ! Donnez-le moi.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_07"); //Combien de fois allez-vous me le montrer ? Vous voulez que je vous l'achète ou pas ?
	};

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_08"); //Je vous offre... hmm... disons 300 pièces d'or par œuf que vous me ramènerez.

	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Alors économisez votre or, je crois que je vais les garder.", DIA_Bennet_DRACHENEIER_nein );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Ce sont des œufs de dragon, pas de poule…", DIA_Bennet_DRACHENEIER_mehr );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Marché conclu.", DIA_Bennet_DRACHENEIER_ok );

	IF (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet veut bien acheter un bon prix tous les œufs de dragon que je trouverai."); 
	B_GivePlayerXP (XP_DJG_BringDragonEgg);
	DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Bennet_DRACHENEIER_ok ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_00"); //Marché conclu.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_01"); //Excellent !
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_02"); //Dans ce cas, amenez-m'en autant que vous le pourrez.

	if (BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;	
	};

	CreateInvItems (self, ItMi_Gold, BennetsDragonEggOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	BennetsDragonEggOffer);

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_03"); //Euh... vous dites l'avoir pris aux hommes-lézards ?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_04"); //Exact.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_05"); //Que je sache, ils vivent généralement dans des grottes.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_06"); //Peut-être en trouverez-vous davantage si vous explorez les cavernes de la région.
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet pense que je devrais chercher les œufs dans les cavernes de Khorinis. On raconte que bon nombre d'entre elles sont habitées par le peuple lézard."); 
	
	AI_Output (self, other, "DIA_Bennet_DRACHENEIER_ok_06_07"); //Tenez, cette carte vous aidera à les trouver.
	CreateInvItems (self, ItWr_Map_Caves_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_Caves_MIS,1);
	B_LogEntry (TOPIC_DRACHENEIER,"Il m'a donné la carte des cavernes pour m'aider."); 
	
	if (1 == 2) //MH: Besser Karte direkt (war sowieso so - wegen Bug)
	{
		AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_08"); //Mais il vous faut tout d'abord aller voir un cartographe afin de vous procurer une carte indiquant l'emplacement de toutes les grottes. Ce serait dommage d'en rater !
		B_LogEntry (TOPIC_DRACHENEIER,"Je devrais pouvoir obtenir la carte des cavernes chez un cartographe de la ville. C'est juste pour s'assurer de ne rater aucun œuf."); 
	};
	
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_mehr_15_00"); //Je vous rappelle qu'il s'agit d'œufs de dragon, pas d'œufs de poule.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_mehr_06_01"); //(exaspéré) Bon d'accord, disons 350 pièce. Mais je ne peux pas aller au-delà, sans quoi je ne m'en sortirai pas financièrement.
	BennetsDragonEggOffer =	350;
};

func void DIA_Bennet_DRACHENEIER_nein ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_nein_15_00"); //Dans ce cas, gardez votre argent. Moi, je conserve mon œuf.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_nein_06_01"); //Si jamais vous changez d'avis, faites-le moi savoir.

	CreateInvItems (other, ItAt_DragonEgg_MIS, 1);									
	AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

	BennetsDragonEggOffer = 0;
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

///////////////////////////////////////////////////////////////////////
//	Info EierBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_EierBringen		(C_INFO)
{
	npc		 = 	SLD_809_Bennet;
	nr		 = 	5;
	condition	 = 	DIA_Bennet_EierBringen_Condition;
	information	 = 	DIA_Bennet_EierBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Etes-vous intéressé par d'autres œufs de dragon ?";
};

func int DIA_Bennet_EierBringen_Condition ()
{
	if (BennetsDragonEggOffer > 0)
	&& (Kapitel >= 4)
	&& (Npc_HasItems (other,ItAt_DragonEgg_MIS) >= 1)
	&& (hero.guild == GIL_DJG)
		{
				return TRUE;
		};
};

var int DragonEggCounter;

func void DIA_Bennet_EierBringen_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_EierBringen_15_00"); //Vous êtes toujours intéressé par les œufs de dragon ?
	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_01"); //Bien sûr.

	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;
	
	DragonEggCount = Npc_HasItems(other, ItAt_DragonEgg_MIS);


	if (DragonEggCount == 1)
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_02"); //Tenez, en voilà un autre.
			B_GivePlayerXP (XP_DJG_BringDragonEgg);
			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
			AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
			DragonEggCounter = DragonEggCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_03"); //Tenez, en voilà d'autres.

			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	DragonEggCount);
			concatText = ConcatStrings(IntToString(DragonEggCount), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
			AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			XP_DJG_BringDragonEggs = (DragonEggCount * XP_DJG_BringDragonEgg);
			DragonEggCounter = (DragonEggCounter + DragonEggCount); 

			B_GivePlayerXP (XP_DJG_BringDragonEggs);
		};

	if (DragonEggCounter <= 7)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_04"); //Splendide ! Donnez-moi ça. Vous avez cherché partout ? Il doit bien y en avoir d'autres, non ?
	}
	else if	(DragonEggCounter <= 11)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_05"); //Mais où les trouvez-vous donc ? J'imagine qu'il ne doit plus guère en rester maintenant...
	}
	else
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_06"); //Je ne pense pas que vous en trouviez encore beaucoup. Et de toute façon, j'en ai déjà tellement que je ne sais pour ainsi dire pas quoi en faire.
		TOPIC_END_DRACHENEIER = TRUE;
	};

	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_07"); //Oh, c'est vrai... voilà votre argent.

	DragonEggGeld	= (DragonEggCount * BennetsDragonEggOffer);

	CreateInvItems (self, ItMi_Gold, DragonEggGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, DragonEggGeld);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Bennet_KAP5_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP5_EXIT_Condition;
	information	= DIA_Bennet_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_KnowWhereEnemy_Condition;
	information	 = 	DIA_Bennet_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Je dois me rendre sur une île. Je pourrais avoir besoin d'un forgeron.";
};
func int DIA_Bennet_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Bennet_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Bennet_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_00"); //Je dois me rendre sur une île. Un forgeron pourrait m'être utile.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_01"); //Et vous avez pensé à moi ?
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_02"); //Oui. Qu'en dites-vous ? Ça vous permettrait au moins de partir d'ici.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_03"); //Ce sera forcément mieux que la ferme d'Onar. Même l'enfer serait préférable à ce trou paumé. D'accord, je suis partant.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	B_LogEntry (TOPIC_Crew,"Bennet peut partir. Sa maîtrise de la forge est sans égale. Je suis sûr qu'il pourrait m'apprendre quelques trucs.");
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Bennet_KnowWhereEnemy_15_04"); //Mon équipage est complet à l'heure actuelle.
		AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_05"); //Alors, débarrassez-vous de quelqu'un.
	}
	else 
	{
		Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Je vous ferais savoir quand j'aurai besoin de vous.",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Alors soyez mon forgeron. On se voit au port.",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_Yes_15_00"); //Dans ce cas, je vous engage comme forgeron. Retrouvez-moi au port.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01"); //D'accord. A plus tard.
	
	B_GivePlayerXP (XP_Crewmember_Success); 
	
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Bennet_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_No_15_00"); //Quand j'aurai besoin de vous, je vous le ferai savoir.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_No_06_01"); //Très bien. D'ici là, je reste ici.

	Bennet_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_LeaveMyShip		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_LeaveMyShip_Condition;
	information	 = 	DIA_Bennet_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Je vais trouver un autre forgeron.";
};
func int DIA_Bennet_LeaveMyShip_Condition ()
{	
	if (Bennet_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Bennet_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_LeaveMyShip_15_00"); //Je vais me trouver un autre forgeron.
	AI_Output			(self, other, "DIA_Bennet_LeaveMyShip_06_01"); //Vous changez d'avis d'une minute à l'autre, vous. Décidez-vous une bonne fois pour toutes ! Quand vous aurez enfin pris votre décision, faites-le moi savoir.
	
	Bennet_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Start"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_StillNeedYou		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_StillNeedYou_Condition;
	information	 = 	DIA_Bennet_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Revenez. Je ne trouve pas d'autre forgeron.";
};

func int DIA_Bennet_StillNeedYou_Condition ()
{	
	if ((Bennet_IsOnBOard == LOG_OBSOLETE)	
	|| (Bennet_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_Bennet_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_Bennet_StillNeedYou_15_00"); //Revenez, je n'arrive pas à trouver d'autre forgeron.
	AI_Output	(self, other, "DIA_Bennet_StillNeedYou_06_01"); //(irrité) Ben voyons ! Ce n'est que moi, alors vous pouvez bien me traiter comme un chien ! Je vous retrouve sur les quais.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Bennet_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	AI_StopProcessInfos (self);

		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bennet_PICKPOCKET (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 900;
	condition	= DIA_Bennet_PICKPOCKET_Condition;
	information	= DIA_Bennet_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bennet_PICKPOCKET_Condition()
{
	C_Beklauen (35, 45);
};
 
FUNC VOID DIA_Bennet_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bennet_PICKPOCKET);
	Info_AddChoice		(DIA_Bennet_PICKPOCKET, DIALOG_BACK 		,DIA_Bennet_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bennet_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bennet_PICKPOCKET_DoIt);
};

func void DIA_Bennet_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bennet_PICKPOCKET);
};
	
func void DIA_Bennet_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bennet_PICKPOCKET);
};


























