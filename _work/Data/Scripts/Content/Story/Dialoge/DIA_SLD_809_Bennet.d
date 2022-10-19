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
	description	= "Et en ce qui concerne la fabrication d'�quipements ?";
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
	AI_Output (other, self, "DIA_Bennet_TRADE_15_00"); //Vous fabriquez de l'�quipement�?
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

	AI_Output (self, other, "DIA_Bennet_TRADE_06_01"); //Qu'est-ce qu'il vous faut�?
	
	if (BennetLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry (Topic_SoldierTrader,"Bennet vend de l'�quipement pour la forge.");
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
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_00"); //Qu'est-ce que vous faites comme armes�?
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_01"); //Pour le moment des �p�es toutes simples, et c'est � peu pr�s tout.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_02"); //Mais si j'avais du minerai magique, je pourrais forger des armes de meilleure qualit� que celles en acier.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_03"); //Vous ne savez pas o� en trouver dans le coin des fois ? (�clate de rire) A part dans la Vall�e des mines, je veux dire.
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
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_00"); //Vous �tes un fermier ou un mercenaire�?
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_01"); //Vous vous fichez de moi l�?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_02"); //Simple curiosit� de ma part.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_03"); //Vous avez d�j� vu un fermier capable de forger des armes�?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_04"); //Non.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_05"); //Alors, pourquoi posez-vous des questions aussi stupides�?
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
	AI_Output (self, other, "DIA_Bennet_WannaJoin_06_01"); //Dans ce cas, arr�tez de m'importuner et allez voir Torlof pour qu'il vous fasse passer l'�preuve.
	if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Bennet_WannaJoin_15_02"); //J'ai r�ussi l'�preuve.
		AI_Output (self, other, "DIA_Bennet_WannaJoin_06_03"); //Tr�s bien. Dans ce cas, ma voix vous est acquise.
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
	description	= "Pouvez-vous m'apprendre � forger une �p�e ?";
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
	AI_Output (other, self, "DIA_Bennet_WannaSmith_15_00"); //Pouvez-vous m'apprendre � forger une �p�e�?
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_01"); //Bien s�r.
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_02"); //Mais ce ne sera pas gratuit. Disons... 30 pi�ces d'or.
	
	Info_ClearChoices (DIA_Bennet_WannaSmith);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Peut-�tre plus tard.", DIA_Bennet_WannaSmith_Later);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Tr�s bien, voici vos 30 pi�ces d'or.", DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Pay_15_00"); //D'accord. Les voil�.
	
	if (B_GiveInvItems (other, self, itmi_gold, 30))
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_01"); //Et c'est un prix d'ami. Bien, pr�venez-moi quand vous voudrez commencer.
		
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Bennet peut m'apprendre l'art de la forge.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_02"); //N'essayez pas de me prendre pour un pigeon. Ce sera 30 pi�ces d'or, et pas une de moins�!
	};
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Later_15_00"); //Peut-�tre plus tard.
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
	AI_Output (other, self, "DIA_Bennet_TeachCOMMON_15_00"); //Apprenez-moi � forger une �p�e�!
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_01"); //C'est tr�s simple�: trouvez-vous une barre d'acier et plongez-la dans les flammes jusqu'� ce qu'elle se mette � luire.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_02"); //Puis, placez-la sur l'enclume et martelez-la pour lui donner une forme de lame.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_03"); //Attention surtout � ce qu'elle ne refroidisse pas trop. Vous ne disposez que de quelques minutes pour travailler votre arme avant de devoir la plonger de nouveau dans le feu.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_04"); //Quant au reste, vous l'apprendrez par vous-m�me. Ce n'est qu'une question de pratique.
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
	description	= "Apprenez-moi � fabriquer des armes en minerai magique !";
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
	AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_00"); //Apprenez-moi � forger des armes � base de minerai magique�!
		
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_01"); //Mais vous ne connaissez m�me pas les bases�!
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_02"); //Commencez par apprendre comment forger une �p�e normale et apr�s, on verra.
	}
	else if (other.guild != GIL_SLD)
	&& 		(other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_03"); //Tant que vous ne serez pas des n�tres, il est hors de question que je vous r�v�le le secret des armes en minerai magique�!
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_04"); //Seuls quelques forgerons le connaissent et croyez-moi, ceux qu'on trouve en ville n'en font pas partie.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_05"); //Tant mieux d'ailleurs, sans quoi ces minables de la garde auraient tous une �p�e magique � l'heure qu'il est.
		if (other.guild == GIL_MIL)
		{	
			AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_06"); //Je n'ai rien contre vous. (sourit) Vous avez l'air d'�tre un type correct.
		};
	}
	else if (MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_07"); //Je le ferais peut-�tre, si j'avais du minerai magique.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_08");//Allons, je fais partie des mercenaires et je sais forger une arme�! Qu'est-ce qu'il vous faut de plus�?
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_09"); //Et si vous m'expliquiez comment je suis cens� forger une arme magique sans minerai magique�?
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_10");//Euh...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_11"); //C'est bien ce qu'il me semblait. Il me faut au moins cinq blocs de minerai. Sinon ce n'est m�me pas la peine d'y penser.
		if (MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_RUNNING;
		};
	}
	else //alles OK
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_12"); //Excellent�! Vous m'avez apport� le minerai et vous savez comment forger une �p�e.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_13");//Je vous �coute.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_14"); //Le plus important, c'est qu'il n'y a aucune diff�rence entre une arme int�gralement en minerai magique et une lame normale recouverte d'une fine couche de ce minerai. Ce qui compte, c'est la surface de l'arme.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_15"); //Et le minerai magique co�te si cher qu'il vaut mieux s'en servir pour plaquer du m�tal ordinaire.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_16"); //Evidemment, recouvrir une �p�e existante d'une fine couche de minerai magique ne donne pas le r�sultat escompt�. Il faut forger l'arme � partir de rien.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_17"); //Pour le reste, tout d�pend de l'arme que vous cherchez � obtenir.
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
	description	= "O� puis-je trouver du minerai magique ?";
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
	AI_Output (other, self, "DIA_Bennet_WhereOre_15_00"); //O� puis-je trouver du minerai magique�?
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_01"); //Si seulement je le savais�! Il doit y en avoir � la colonie mini�re.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_02"); //Mais peut-�tre que vous aurez de la chance et que vous en trouverez quelques blocs dans les environs.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_03"); //Il me semble qu'il y a des galeries mini�res dans les montagnes situ�es au sud d'ici.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_04"); //Mais attention, j'ai entendu dire que �a grouillait de brigands par l�-bas�!
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
	description	= "Tenez - 5 p�pites de minerai.";
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
	AI_Output (self, other, "DIA_Bennet_BringOre_06_01"); //(�clate de rire) Montrez-moi �a�!
	B_GiveInvItems (other, self, itmi_nugget, 5);
	AI_Output (self, other, "DIA_Bennet_BringOre_06_02"); //Vraiment�? �a alors�!
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
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_01"); //Je peux vous apprendre � forger une �p�e � une main ou � deux mains en utilisant du minerai magique.
		Bennet_Kap2Smith = TRUE;
	}
	else if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (Bennet_Kap3Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_02"); //J'ai am�lior� ma technique. Je peux d�sormais vous apprendre � forger une �p�e b�tarde ou une �p�e lourde � deux mains � l'aide de minerai magique.
		Bennet_Kap3Smith = TRUE;
	}
	else if (MIS_ReadyForChapter4 == TRUE)
	&& (Kapitel < 5)
	&& (Bennet_Kap4Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_03"); //Cette fois-ci, je crois bien que je me suis surpass�. J'ai fabriqu� deux lames de combat. Je n'ai jamais vu d'armes de cette qualit�.
		Bennet_Kap4Smith = TRUE;
	}
	else if (Kapitel >= 5)
	&& (Bennet_Kap5Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_04"); //Ecoutez, je crois bien que je viens d'avoir une inspiration�: des armes en minerai magique tremp�es dans du sang de dragon. Et je sais exactement comment proc�der�!
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_05"); //(sourit) �a vous int�resse�?
		Bennet_Kap5Smith = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_06"); //Quel genre d'arme aimeriez-vous fabriquer�?
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
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_00"); //Que faites-vous au cachot�?
	AI_Output	(self , other,"DIA_Bennet_WhyPrison_06_01"); //Ces fumiers m'ont balanc� l�. Je suis cens� avoir tu� un paladin.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_02"); //Mais je n'y suis pour rien. C'est un coup mont�.
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_03"); //Un coup mont�? Pour quelle raison�?
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_04"); //Aucune id�e, mais vous devez me sortir d'ici.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_05"); //Allez voir le seigneur Hagen, d�truisez le mur de ma cellule... Je ne sais pas moi, mais faites quelque chose�!
	
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
	description	 = 	"Que s'est-il pass� ?";
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
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_00"); //Que s'est-il pass� ?
	AI_Output	(self , other,"DIA_Bennet_WhatHappened_06_01"); //J'�tais all� au centre ville avec Hodges pour acheter des provisions pour nos hommes.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_02"); //Et puis, brusquement, on a entendu un cri et un bruit de course.
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_03"); //Venez-en au fait.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_04"); //On a tout de suite compris que quelque chose venait de se produire et qu'on finirait en taule si la garde nous trouvait l�.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_05"); //Alors, on a fil� sans demander notre reste. Mais juste avant d'arriver aux portes de la ville, j'ai tr�buch� et je me suis tordu la cheville.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_06"); //Le reste se passe de commentaire. La milice m'est tomb�e dessus et m'a jet� dans ce trou.
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
	description	 = 	"Qui a �t� assassin� ?";
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
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_00"); //Qui a �t� tu�?
	AI_Output	(self , other,"DIA_Bennet_Victim_06_01"); //Je n'en ai pas la moindre id�e. Un des paladins, mais je n'en connais aucun.
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_02"); //Vous connaissez son nom�?
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_03"); //Quelque chose comme Lothar, je crois bien, mais je n'en suis pas s�r.
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_04"); //Demandez au seigneur Hagen, il conna�t tous les d�tails de l'affaire.

	B_LogEntry (TOPIC_RESCUEBENNET,"Lothar, un des paladins, a �t� assassin�. Le seigneur Hagen devrait pouvoir m'en dire plus, il est responsable de l'enqu�te.");
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
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_00"); //Y a-t-il des preuves contre vous�?
	AI_Output	(self , other,"DIA_Bennet_Evidence_06_01"); //Il para�t qu'un t�moin m'aurait reconnu.
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_02"); //Savez-vous de qui il s'agit�?
	AI_Output 	(self ,other ,"DIA_Bennet_Evidence_06_03"); //Non. Tout ce que je sais c'est qu'il ment.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Un t�moin affirme avoir vu Bennet. Je dois le trouver si je veux conna�tre la v�rit�.");
	
	RescueBennet_KnowsWitness = TRUE; 
};


//*********************************************************************
//	Wer f�hrt die Untersuchungen durch?
//*********************************************************************
instance DIA_Bennet_Investigation		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Investigation_Condition;
	information	 = 	DIA_Bennet_Investigation_Info;
	permanent	 = 	FALSE;
	description	 = 	"Qui dirige l'enqu�te ?";
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
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_00"); //Qui est charg� de l'enqu�te�?
	AI_Output	(self , other,"DIA_Bennet_Investigation_06_01"); //Le seigneur Hagen en personne. Comme la victime �tait un paladin, l'affaire tombe sous le coup de la loi martiale.
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_02"); //Qu'est-ce que cela signifie ?
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_03"); //C'est facile � deviner. Si je ne sors pas d'ici, ils vont me pendre sans se poser la moindre question.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_04"); //Aidez-moi ou ce sera la guerre. Lee n'acceptera jamais �a�!
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_05"); //Vous pouvez imaginer ce que �a signifie...
};


//*********************************************************************
//	Mann, ich hatte echt schon geglaubt, dass die mich h�ngen! 
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

	AI_Output	(self ,other,"DIA_Bennet_ThankYou_06_00"); //Et moi qui pensais que j'allais finir pendu�!
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_01"); //Cette histoire se termine bien finalement.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_02"); //�a, vous pouvez le dire�! Vous auriez d� voir la t�te du soldat qui m'a lib�r�!
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_03"); //(�clate de rire) Il �tait si terrifi� qu'il a failli mouiller ses chausses�!
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_04"); //Ce qui me fait penser que j'ai quelque chose pour vous...
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_05"); //Que voulez-vous dire ?
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_06"); //(sourit) Un cadeau.
	
};

//*********************************************************************
//	Was f�r ein Geschenk?
//*********************************************************************

instance DIA_Bennet_Present		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Present_Condition;
	information	 = 	DIA_Bennet_Present_Info;
	permanent	 = 	FALSE;
	description	 =	"Quel pr�sent ?";
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
	AI_Output	(other,self ,"DIA_Bennet_Present_15_00"); //Quoi comme cadeau�?
	
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_01"); //Nous avons entendu parler des dragons cens�s se trouver dans la vall�e.
	AI_Output	(other,self ,"DIA_Bennet_Present_15_02"); //Ils existent bel et bien�!
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_03"); //Tr�s bien, je vous crois.
	
	if (hero.guild == GIL_DJG)
	{
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_04"); //Quoi qu'il en soit, quelques-uns d'entre nous ont d�cid� d'aller eux-aussi dans la vall�e.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_05"); //(sourit) Ils ont l'intention d'y faire le m�nage.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_06"); //Qu'est-ce que cela a � voir avec moi�?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_07"); //(fi�rement) J'ai mis au point un nouveau mod�le d'armure�: l'armure de chasseur de dragons�!
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_08"); //Elle est plus solide et plus l�g�re qu'une armure classique.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_09"); //Comme vous m'avez sauv�, je tiens � ce que le tout premier mod�le existant vous revienne. Je vous l'offre�!
			
		CreateInvItems (self,ITAR_DJG_L,1);
		B_GiveInvItems (self,other,ITAR_DJG_L,1);
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_10"); //Je me suis dit que vous voudriez s�rement en �tre et vous allez avoir besoin d'un �quipement fiable quand vous irez dans cette vall�e.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_11"); //Ah, au fait, les �cailles de dragon m'int�ressent. Les vraies, je veux dire. Je suis pr�t � vous en offrir un bon prix.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_12"); //Combien par �caille�?
		B_Say_Gold (self,other,Value_DragonScale); 
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_13"); //Bref, je me suis dit que vous voudriez s�rement prendre part � la chasse aux dragons qui se pr�pare...
		AI_Output	(other,self ,"DIA_Bennet_Present_15_14"); //Et ?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_15"); //Tenez, prenez cette amulette. A mon avis, elle vous sera plus utile qu'� moi.
	
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
	description	 =	"J'ai quelques �cailles de dragon pour vous.";
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
	AI_Output	(other,self ,"DIA_Bennet_DragonScale_15_00"); //J'ai quelques �cailles de dragon pour vous.
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_01"); //De v�ritables �cailles de dragon�?
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_02"); //Tenez, voici votre or�!
	
	Bennet_DragonScale_Counter = (Bennet_DragonScale_Counter +(Npc_HasItems (other,ItAT_Dragonscale)));
	
	B_GiveInvItems (self ,other,ItMi_Gold,(Npc_HasItems(other,ItAT_Dragonscale) * Value_DragonScale) ); 
	B_GiveInvItems (other,self ,ItAt_Dragonscale,(Npc_HasItems (other,ItAT_Dragonscale)));
	
	
	if (Bennet_DragonScale_Counter >= 20)
	&& (Show_DJG_Armor_M == FALSE)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_03"); //Merci, �a devrait me suffire. Si vous voulez, je peux vous vendre une armure toute nouvelle et de meilleure qualit�.
		
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
	description	 =	"Armure moyenne chasseur de dragons. Prot. : Armes 80, fl�ches 80 (12 000 po)"; //Wenn �ndern, dann bitte auch in der Info-Instanz. s.u.
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
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_01"); //Tr�s bien. Je suis s�r qu'elle vous donnera enti�re satisfaction.
		AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_02"); //Vu son prix, j'ose l'esp�rer...
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
//		Ich weiss, wie man die R�stung noch mehr verbessern kann.
//*********************************************************************

instance DIA_Bennet_BetterArmor		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_BetterArmor_Condition;
	information	 = 	DIA_Bennet_BetterArmor_Info;
	permanent	 = 	FALSE;
	description	 =	"Je sais comment am�liorer davantage une armure.";
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
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_00"); //Je sais comment faire pour am�liorer encore cette armure.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_01"); //(sourit) Je vous �coute.
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_02"); //Pourquoi ne pas recouvrir les �cailles de dragon de minerai magique�?
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_03"); //(�clate de rire) C'est exactement ce � quoi je pensais�! Vous avez raison bien s�r.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_04"); //Ma derni�re armure en date est la meilleure que j'aie jamais fabriqu�e. Elle est l�g�re et r�sistante � la fois.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_05"); //En un mot, elle est parfaite.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_06"); //Si vous la voulez, je vous la vends. Je ne ferai pas cette offre � n'importe qui, mais le prix auquel je vous la propose couvre � peine mes frais de fabrication.
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
	description	 =	"Armure lourde chasseur de dragons : Prot. : Armes 90, Fl�ches 90. (20 000 po)"; //Wenn �ndern, dann bitte auch in der Info-Instanz. s.u.
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
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_01"); //C'est la meilleure armure que j'aie jamais forg�e.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_02"); //Un v�ritable chef-d'�uvre.
		
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
//	Kannst du auch Schmuckst�cke reparieren?
//*********************************************************************
instance DIA_Bennet_RepairNecklace		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_RepairNecklace_Condition;
	information	 = 	DIA_Bennet_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"Pouvez-vous r�parer un bijou ?";
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
	AI_Output			(other, self, "DIA_Bennet_RepairNecklace_15_00"); //Vous r�parez les bijoux�?
	AI_Output			(self, other, "DIA_Bennet_RepairNecklace_06_01"); //�a d�pend. Je dois d'abord voir la pi�ce avant de pouvoir vous r�pondre.
	
	if (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_02"); //Il faut aussi que je sorte d'ici.
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_03"); //D'ici l�, je ne pourrai manifestement rien faire.
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
	description	 = 	"Pouvez-vous jeter un coup d'�il � cette amulette ?";
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
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_00"); //Pouvez-vous jeter un �il � cette amulette�?
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_01"); //Bien s�r. Montrez-la moi.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_02"); //Hmm... tr�s jolie pi�ce. La monture est cass�e, mais je pense pouvoir la r�parer.
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_03"); //Combien de temps cela vous prendra-t-il�?
	if (MIS_REscueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_04"); //Pour le moment, je suis coinc� ici et je ne vois pas de forge dans les environs. Vous, si�?
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_05"); //Si j'�tais dans ma forge, une journ�e me suffirait. Mais il faudrait d�j� commencer par me sortir d'ici bien s�r.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_06"); //Si vous me la laissez maintenant, elle sera pr�te demain.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_07"); //Et je vous fais �a gratuitement. Vous m'avez sorti de prison apr�s tout.
	};
	
	B_LogEntry (TOPIC_INNOSEYE, "Bennet est le forgeron dont j'ai besoin pour r�parer l'amulette.");

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
	description	 = 	"Voici l'amulette, r�parez-la s'il vous pla�t.";
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
	AI_Output			(other, self, "DIA_Bennet_GiveInnosEye_15_00"); //Voici l'amulette. R�parez-la pour moi, s'il vous pla�t.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_01"); //Tr�s bien. La nouvelle monture sera finie demain.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_02"); //Vous n'avez qu'� revenir la chercher � ce moment l�.
	
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
	description	 = 	"L'amulette est-elle pr�te ?";
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
	AI_Output			(other, self, "DIA_Bennet_GetInnosEye_15_00"); //L'amulette est-elle pr�te�?
	
	if (Bennet_RepairDay < Wld_GetDay())
	{
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_01"); //Oui, tenez.
	
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems (other,ItMi_InnosEye_Broken_Mis,1);
		AI_PrintScreen (Print_InnoseyeGet, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_02"); //Il m'a fallu refaire la monture de la pierre pr�cieuse.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_03"); //J'y ai travaill� toute la nuit, mais l'amulette est comme neuve d�sormais.
		
		B_LogEntry (TOPIC_INNOSEYE, "L'amulette est enfin r�par�e. Bennet a fait du bon travail.");
		
		MIS_Bennet_InnosEyeRepairedSetting   = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_InnosEyeIsRepaired);
	}
	else
	{	//Hack Mattes
		B_SayBennetLATER();
		//AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nein, noch nicht. Komm sp�ter wieder.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_05"); //Si vous n'arr�tez pas de m'interrompre, il me faudra encore plus de temps.
		
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

	description	 = 	"Pouvez-vous faire quelque chose avec des �ufs de dragon ?";
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
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_00"); //Pouvez-vous travailler les �ufs de dragon�?
	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_01"); //Des �ufs de dragon�? Comment diable avez-vous r�ussi � vous en procurer�?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_02"); //Je les ai pris aux hommes-l�zards.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_03"); //Montrez-moi �a.
	};

	Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	

	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_04"); //Hmm... voil� un mat�riau extr�mement r�sistant... Id�al pour la finition des armures, � condition qu'ils �closent, bien s�r.
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_05"); //Alors, �a vous int�resse, oui ou non�?
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_06"); //Bien s�r�! Donnez-le moi.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_07"); //Combien de fois allez-vous me le montrer�? Vous voulez que je vous l'ach�te ou pas�?
	};

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_08"); //Je vous offre... hmm... disons 300 pi�ces d'or par �uf que vous me ram�nerez.

	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Alors �conomisez votre or, je crois que je vais les garder.", DIA_Bennet_DRACHENEIER_nein );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Ce sont des �ufs de dragon, pas de poule�", DIA_Bennet_DRACHENEIER_mehr );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "March� conclu.", DIA_Bennet_DRACHENEIER_ok );

	IF (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet veut bien acheter un bon prix tous les �ufs de dragon que je trouverai."); 
	B_GivePlayerXP (XP_DJG_BringDragonEgg);
	DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Bennet_DRACHENEIER_ok ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_00"); //March� conclu.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_01"); //Excellent�!
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_02"); //Dans ce cas, amenez-m'en autant que vous le pourrez.

	if (BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;	
	};

	CreateInvItems (self, ItMi_Gold, BennetsDragonEggOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	BennetsDragonEggOffer);

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_03"); //Euh... vous dites l'avoir pris aux hommes-l�zards�?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_04"); //Exact.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_05"); //Que je sache, ils vivent g�n�ralement dans des grottes.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_06"); //Peut-�tre en trouverez-vous davantage si vous explorez les cavernes de la r�gion.
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet pense que je devrais chercher les �ufs dans les cavernes de Khorinis. On raconte que bon nombre d'entre elles sont habit�es par le peuple l�zard."); 
	
	AI_Output (self, other, "DIA_Bennet_DRACHENEIER_ok_06_07"); //Tenez, cette carte vous aidera � les trouver.
	CreateInvItems (self, ItWr_Map_Caves_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_Caves_MIS,1);
	B_LogEntry (TOPIC_DRACHENEIER,"Il m'a donn� la carte des cavernes pour m'aider."); 
	
	if (1 == 2) //MH: Besser Karte direkt (war sowieso so - wegen Bug)
	{
		AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_08"); //Mais il vous faut tout d'abord aller voir un cartographe afin de vous procurer une carte indiquant l'emplacement de toutes les grottes. Ce serait dommage d'en rater�!
		B_LogEntry (TOPIC_DRACHENEIER,"Je devrais pouvoir obtenir la carte des cavernes chez un cartographe de la ville. C'est juste pour s'assurer de ne rater aucun �uf."); 
	};
	
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_mehr_15_00"); //Je vous rappelle qu'il s'agit d'�ufs de dragon, pas d'�ufs de poule.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_mehr_06_01"); //(exasp�r�) Bon d'accord, disons 350 pi�ce. Mais je ne peux pas aller au-del�, sans quoi je ne m'en sortirai pas financi�rement.
	BennetsDragonEggOffer =	350;
};

func void DIA_Bennet_DRACHENEIER_nein ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_nein_15_00"); //Dans ce cas, gardez votre argent. Moi, je conserve mon �uf.
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

	description	 = 	"Etes-vous int�ress� par d'autres �ufs de dragon ?";
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
	AI_Output			(other, self, "DIA_Bennet_EierBringen_15_00"); //Vous �tes toujours int�ress� par les �ufs de dragon�?
	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_01"); //Bien s�r.

	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;
	
	DragonEggCount = Npc_HasItems(other, ItAt_DragonEgg_MIS);


	if (DragonEggCount == 1)
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_02"); //Tenez, en voil� un autre.
			B_GivePlayerXP (XP_DJG_BringDragonEgg);
			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
			AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
			DragonEggCounter = DragonEggCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_03"); //Tenez, en voil� d'autres.

			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	DragonEggCount);
			concatText = ConcatStrings(IntToString(DragonEggCount), PRINT_ItemsGegeben);		// "x Gegenst�nde gegeben"
			AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			XP_DJG_BringDragonEggs = (DragonEggCount * XP_DJG_BringDragonEgg);
			DragonEggCounter = (DragonEggCounter + DragonEggCount); 

			B_GivePlayerXP (XP_DJG_BringDragonEggs);
		};

	if (DragonEggCounter <= 7)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_04"); //Splendide�! Donnez-moi �a. Vous avez cherch� partout�? Il doit bien y en avoir d'autres, non�?
	}
	else if	(DragonEggCounter <= 11)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_05"); //Mais o� les trouvez-vous donc�? J'imagine qu'il ne doit plus gu�re en rester maintenant...
	}
	else
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_06"); //Je ne pense pas que vous en trouviez encore beaucoup. Et de toute fa�on, j'en ai d�j� tellement que je ne sais pour ainsi dire pas quoi en faire.
		TOPIC_END_DRACHENEIER = TRUE;
	};

	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_07"); //Oh, c'est vrai... voil� votre argent.

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
	description	 = 	"Je dois me rendre sur une �le. Je pourrais avoir besoin d'un forgeron.";
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
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_00"); //Je dois me rendre sur une �le. Un forgeron pourrait m'�tre utile.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_01"); //Et vous avez pens� � moi�?
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_02"); //Oui. Qu'en dites-vous ? �a vous permettrait au moins de partir d'ici.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_03"); //Ce sera forc�ment mieux que la ferme d'Onar. M�me l'enfer serait pr�f�rable � ce trou paum�. D'accord, je suis partant.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	B_LogEntry (TOPIC_Crew,"Bennet peut partir. Sa ma�trise de la forge est sans �gale. Je suis s�r qu'il pourrait m'apprendre quelques trucs.");
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Bennet_KnowWhereEnemy_15_04"); //Mon �quipage est complet � l'heure actuelle.
		AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_05"); //Alors, d�barrassez-vous de quelqu'un.
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
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_No_06_01"); //Tr�s bien. D'ici l�, je reste ici.

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
	AI_Output			(self, other, "DIA_Bennet_LeaveMyShip_06_01"); //Vous changez d'avis d'une minute � l'autre, vous. D�cidez-vous une bonne fois pour toutes�! Quand vous aurez enfin pris votre d�cision, faites-le moi savoir.
	
	Bennet_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Start"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
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
	AI_Output	(other, self, "DIA_Bennet_StillNeedYou_15_00"); //Revenez, je n'arrive pas � trouver d'autre forgeron.
	AI_Output	(self, other, "DIA_Bennet_StillNeedYou_06_01"); //(irrit�) Ben voyons�! Ce n'est que moi, alors vous pouvez bien me traiter comme un chien�! Je vous retrouve sur les quais.
		
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


























