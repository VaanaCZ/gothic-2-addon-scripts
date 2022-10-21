// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Jan_EXIT(C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 999;
	condition	= DIA_Jan_EXIT_Condition;
	information	= DIA_Jan_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jan_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Jan_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//***********
//	Begrüßung
//***********

INSTANCE DIA_JAN_Hello (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Hello_Condition;
	information	= DIA_Jan_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_Jan_Hello_Condition()
{
	if (Kapitel >= 4)
	&& (Npc_IsInState (self,ZS_TALK))
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_Hello_Info()
{		
		AI_Output (self ,other,"DIA_Jan_Hello_10_00"); //C'était une idée vraiment stupide de venir ici.
		AI_Output (self ,other,"DIA_Jan_Hello_10_01"); //Je pensais qu'on trouverait des trucs ici. Mais il n'y a rien d'autre que quelques paladins arrogants et des orques.
};

//*******************************************
//	Du hast die Drachen vergessen!
//*******************************************

INSTANCE DIA_JAN_Dragons (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Dragons_Condition;
	information	= DIA_Jan_Dragons_Info;
	permanent	= FALSE;
	description	= "Vous avez oublié pour les dragons !";
};                       

FUNC INT DIA_Jan_Dragons_Condition()
{
	if (Npc_KnowsInfo (other,DIA_JAN_Hello))
	&& (MIS_JanBecomesSmith == FALSE)
	&& (Kapitel == 4)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_Dragons_Info()
{		
		AI_Output (other,self ,"DIA_Jan_Dragons_15_00"); //Vous oubliez les dragons !
		AI_Output (self ,other,"DIA_Jan_Dragons_10_01"); //(moqueur) Comment les oublier ? Je vais vous dire, je suis un forgeron, pas un guerrier.
		AI_Output (self ,other,"DIA_Jan_Dragons_10_02"); //Je fabrique des armes. Les combats, je laisse ça aux autres.
		AI_Output (other,self ,"DIA_Jan_Dragons_15_03"); //Alors pourquoi ne restez-vous pas derrière une enclume ?
		AI_Output (self ,other,"DIA_Jan_Dragons_10_04"); //Les paladins refusent de me laisser aller à la forge. Je ne peux rien faire à moins de risquer de finir en prison.

		if (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Jan_Dragons_10_05"); //Vous êtes l'un d'eux. Vous ne pouvez pas m'arranger le coup ?
		};

		Info_ClearChoices (DIA_JAN_Dragons);
		Info_AddChoice (DIA_JAN_Dragons,"Je dois m'en aller.",DIA_JAN_Dragons_ShitHappen);
		Info_AddChoice (DIA_JAN_Dragons,"Qu'est-ce que j'y gagne si je vous aide ?",DIA_JAN_Dragons_Reward);
		Info_AddChoice (DIA_JAN_Dragons,"Je vais essayer de vous aider.",DIA_JAN_Dragons_HelpYou);
};

FUNC VOID DIA_JAN_Dragons_HelpYou ()
{	
	AI_Output (other,self ,"DIA_JAN_Dragons_HelpYou_15_00"); //J'essaierai de vous aider.
	AI_Output (self ,other,"DIA_JAN_Dragons_HelpYou_10_01"); //Et comment allez-vous faire ? Parcival a ordonné que l'on nous surveille.
	AI_Output (self ,other,"DIA_JAN_Dragons_HelpYou_10_02"); //Personne n'osera lui désobéir.
	AI_Output (other,self ,"DIA_JAN_Dragons_HelpYou_15_03"); //Je ferai ce que je peux.
	AI_Output (self ,other,"DIA_JAN_Dragons_HelpYou_10_04"); //Je ne pense pas qu'il vous écoutera.
	
	Log_CreateTopic (TOPIC_JanBecomesSmith, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JanBecomesSmith, LOG_RUNNING);
	B_LogEntry (TOPIC_JanBecomesSmith,"Jan, le chasseur de dragon du château de la Vallée des mines, veut travailler comme forgeron. Mais Parcival le lui a interdit."); 


	MIS_JanBecomesSmith = LOG_RUNNING;
	Info_ClearChoices (DIA_JAN_Dragons);
};

FUNC VOID DIA_JAN_Dragons_Reward ()
{
	AI_Output (other,self ,"DIA_JAN_Dragons_Reward_15_00"); //Qu'est-ce que j'ai à y gagner si je vous aide ?
	AI_Output (self ,other,"DIA_JAN_Dragons_Reward_10_01"); //Je n'ai rien. Par contre, je peux vous apprendre des choses.
	if (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_JAN_Dragons_Reward_10_02"); //Je connais une méthode pour fabriquer des lames de minerai magique qui soient encore plus résistantes.
	};
	Jan_TeachPlayer = TRUE;
};

FUNC VOID DIA_JAN_Dragons_ShitHappen ()
{
	AI_Output (other,self ,"DIA_JAN_Dragons_ShitHappen_15_00"); //Je dois y aller.
	AI_Output (self ,other,"DIA_JAN_Dragons_ShitHappen_10_01"); //Génial. Je ne peux même pas quitter le château maintenant et je ne peux rien forger.

	Info_ClearChoices (DIA_JAN_Dragons);
};
//*******************************************
//	Wo kommst du her?
//*******************************************

INSTANCE DIA_JAN_Home (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Home_Condition;
	information	= DIA_Jan_Home_Info;
	permanent	= FALSE;
	description	= "D'où venez-vous ?";
};                       

FUNC INT DIA_Jan_Home_Condition()
{
	if (Npc_KnowsInfo (other,DIA_JAN_Hello))
	&& (Kapitel >= 4)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_Home_Info()
{		
		AI_Output (other,self ,"DIA_Jan_Home_15_00"); //D'où venez-vous ?
		AI_Output (self ,other,"DIA_Jan_Home_10_01"); //Je me suis joint à quelques gars des montagnes. On se rendait dans la vallée pour chasser des dragons et se faire de l'argent.
		AI_Output (self ,other,"DIA_Jan_Home_10_02"); //Leur chef s'appelait Sylvio. Quel con ! Il me traitait comme si je lui appartenais.
};

//*******************************************
//	Was ist in der Burg alles passiert?
//*******************************************

INSTANCE DIA_JAN_OldCamp (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_OldCamp_Condition;
	information	= DIA_Jan_OldCamp_Info;
	permanent	= TRUE;
	description	= "Que s'est-il passé au château ?";
};                       

FUNC INT DIA_Jan_OldCamp_Condition()
{
	if (Npc_KnowsInfo (other,DIA_JAN_Hello))
	&& (Kapitel == 4)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_OldCamp_Info()
{		
		AI_Output (other,self ,"DIA_Jan_OldCamp_15_00"); //Que s'est-il passé au château ?
		AI_Output (self ,other,"DIA_Jan_OldCamp_10_01"); //Rien dont je sois au courant. Par contre, ce qui se passe HORS du château m'inquiète terriblement.
};
//*******************************************
//	Ich hab mit Parcival geredet
//*******************************************

INSTANCE DIA_JAN_Parcival (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Parcival_Condition;
	information	= DIA_Jan_Parcival_Info;
	permanent	= FALSE;
	description	= "J'ai parlé à Parcival.";
};                       

FUNC INT DIA_Jan_Parcival_Condition()
{
	if (MIS_JanBecomesSmith != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other,DIA_Parcival_Jan))
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_Parcival_Info()
{		
		AI_Output (other,self ,"DIA_Jan_Parcival_15_00"); //J'ai parlé à Parcival.
		AI_Output (self ,other,"DIA_Jan_Parcival_10_01"); //Alors ?

		if (hero.guild == GIL_DJG)
		{
			AI_Output (other,self ,"DIA_Jan_Parcival_15_02"); //Il ne ne nous fait pas confiance.
		}
		else
		{
			AI_Output (other,self ,"DIA_Jan_Parcival_15_03"); //Il ne fait pas confiance aux chasseurs de dragons.
		};
		AI_Output (self ,other,"DIA_Jan_Parcival_10_04"); //Merde. Je veux juste travailler moi.
		AI_Output (self ,other,"DIA_Jan_Parcival_10_05"); //Alors autant renoncer. Seul Garond pourrait m'aider désormais.
};


//*******************************************
//	Ich hab mit Garond geredet
//*******************************************

INSTANCE DIA_JAN_JanIsSmith (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_JanIsSmith_Condition;
	information	= DIA_Jan_JanIsSmith_Info;
	permanent	= FALSE;
	description	= "Allez chercher votre marteau, j'ai du travail pour vous.";
};                       

FUNC INT DIA_Jan_JanIsSmith_Condition()
{
	if (MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_JanIsSmith_Info()
{		
		AI_Output (other,self ,"DIA_Jan_JanIsSmith_15_00"); //Allez chercher votre marteau, j'ai du travail pour vous.
		AI_Output (self ,other,"DIA_Jan_JanIsSmith_10_01"); //Vous avez réussi ? Comment avez-vous fait ?
		AI_Output (other,self ,"DIA_Jan_JanIsSmith_15_02"); //J'ai dû me porter garant de votre personne, alors ne me décevez pas.
		AI_Output (self ,other,"DIA_Jan_JanIsSmith_10_03"); //Ne vous inquiétez pas. Je suis heureux de pouvoir travailler.

		AI_StopProcessInfos (self);
	
		Npc_ExchangeRoutine (self,"SMITH");
};

//*******************************************
//	Verkaufst du Waffen?
//*******************************************

INSTANCE DIA_JAN_SellWeapons (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_SellWeapons_Condition;
	information	= DIA_Jan_SellWeapons_Info;
	permanent	= FALSE;
	description	= "Vendez-vous des armes ?";
};                       

FUNC INT DIA_Jan_SellWeapons_Condition()
{
	if (MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other ,DIA_JAN_JanIsSmith))
	&& (Jan_TeachPlayer == FALSE)
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_SellWeapons_Info()
{		
		AI_Output (other,self ,"DIA_Jan_SellWeapons_15_00"); //Vendez-vous des armes ?

		if (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Jan_SellWeapons_10_01"); //C'est ça. Et vos collègues me mettront en prison pour avoir fait du marché noir ? Laissez tomber.
		}
		else
		{
			AI_Output (self ,other,"DIA_Jan_SellWeapons_10_02"); //Je le ferais si je le pouvais. Mais je dois d'abord fournir des armes aux paladins du château.
		};

		AI_Output (self ,other,"DIA_Jan_SellWeapons_10_03"); //Mais je peux vous apprendre à forger vos propres armes.
		
		Jan_TeachPlayer = TRUE;
};

//*******************************************
//	Zeig mir wie man schmiedet.
//*******************************************

INSTANCE Jan_Training_Talente (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= Jan_Training_Talente_Condition;
	information	= Jan_Training_Talente_Info;
	permanent	= TRUE;
	description	= "Enseignez-moi l'art de la forge.";
};                       

FUNC INT Jan_Training_Talente_Condition()
{
	if (Jan_TeachPlayer == TRUE)
	&& (Npc_KnowsInfo (other ,DIA_JAN_JanIsSmith))
	&& (MIS_OCGateOpen == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID Jan_Training_Talente_Info()
{		
	AI_Output (other,self ,"DIA_Jan_TeachPlayer_15_00"); //Apprenez-moi l'art de la forge.
	AI_Output (self,other ,"DIA_Jan_TeachPlayer_10_01"); //Que voulez-vous fabriquer exactement ?
	
	Info_ClearChoices (Jan_Training_Talente);
	
	Info_AddChoice		(Jan_Training_Talente, Dialog_Back,Jan_Training_Smith_Back);
	
	if ( PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString("Apprendre l'art de la forge"	   , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common))			,Jan_Training_Smith_Common);
	};
	if ( PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{	
		if ( PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG))
		{
			Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_1H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_01))		,Jan_Training_Smith_1hSpecial1);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG))
		{
			Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_01))		,Jan_Training_Smith_2hSpecial1);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG))
		{
			Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_02))		,Jan_Training_Smith_1hSpecial2);
		};
		if ( PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG))
		{
			Info_AddChoice		(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_02))		,Jan_Training_Smith_2hSpecial2);
		};
	};
};

FUNC VOID Jan_Training_Smith_Back()
{
	Info_ClearChoices (Jan_Training_Talente);
};

FUNC VOID Jan_Training_Smith_Common ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_Common);
};

FUNC VOID Jan_Training_Smith_1hSpecial1 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_01);	
};

FUNC VOID Jan_Training_Smith_2hSpecial1 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_01);	
};

FUNC VOID Jan_Training_Smith_1hSpecial2 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_02);
};

FUNC VOID Jan_Training_Smith_2hSpecial2 ()
{
	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_02);
};

//*******************************************
//	Kann ich bei dir Rüstungen kaufen?
//*******************************************

//-------------------------------------
 var int DIA_JAN_SellArmor_permanent;
//------------------------------------

INSTANCE DIA_JAN_SellArmor (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_SellArmor_Condition;
	information	= DIA_Jan_SellArmor_Info;
	permanent	= TRUE;
	description	= "Puis-je vous acheter une armure ?";
};                       

FUNC INT DIA_Jan_SellArmor_Condition()
{
	if (MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other ,DIA_JAN_JanIsSmith))
	&& (MIS_OCGateOpen == FALSE)
	&& (DIA_JAN_SellArmor_permanent == FALSE)
	{
		return 1;
	};	
};
 
FUNC VOID DIA_Jan_SellArmor_Info()
{		
		AI_Output (other,self ,"DIA_Jan_SellArmor_15_00"); //Puis-je vous acheter une armure ?

		if (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Jan_SellArmor_10_01"); //Rien qui serait supérieur à votre armure. Oubliez ça.
		}
		else if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Jan_SellArmor_10_02"); //Un magicien qui veut une armure ? Laissez tomber, allez voir un tailleur. Je ne peux pas vous fabriquer d'armure.
		}
		else
		{
			AI_Output (self ,other,"DIA_Jan_SellArmor_10_03"); //Si j'en avais, je vous en vendrais. Malheureusement, je n'en ai pas.
			
			Info_ClearChoices (DIA_JAN_SellArmor);
			Info_AddChoice (DIA_JAN_SellArmor,"Je suppose qu'il n'y a rien à faire.",DIA_JAN_SellArmor_Sorry);
			Info_AddChoice (DIA_JAN_SellArmor,"Pouvez-vous en fabriquer une pour moi ?",DIA_JAN_SellArmor_BuildOne);
		};	
};

FUNC VOID DIA_JAN_SellArmor_Sorry()
{
	AI_Output (other,self ,"DIA_JAN_SellArmor_Sorry_15_00"); //Je suppose qu'on ne peut rien y faire.
	AI_Output (self ,other,"DIA_JAN_SellArmor_Sorry_10_01"); //Quand vous aurez ce qu'il faut, dites-le moi.
	
	Info_ClearChoices (DIA_JAN_SellArmor);
};

FUNC VOID DIA_JAN_SellArmor_BuildOne()
{
	AI_Output (other,self ,"DIA_JAN_SellArmor_BuildOne_15_00"); //Alors pouvez-vous m'en fabriquer une ?
	AI_Output (self ,other,"DIA_JAN_SellArmor_BuildOne_10_01"); //Eh bien, si vous voulez quelque chose de mieux, vous devrez trouver les matériaux nécessaires.
	AI_Output (other,self ,"DIA_JAN_SellArmor_BuildOne_15_02"); //De quoi avez-vous besoin ?
	AI_Output (self ,other,"DIA_JAN_SellArmor_BuildOne_10_03"); //Vous voulez affronter les dragons, n'est-ce pas ? Apportez-moi des écailles de dragon et je devrais être capable de vous fabriquer quelque chose.
	AI_Output (self ,other,"DIA_JAN_SellArmor_BuildOne_10_04"); //20 écailles devraient suffire.
	
	DIA_JAN_SellArmor_permanent = TRUE;
	Info_ClearChoices (DIA_JAN_SellArmor);
};

//*******************************************
//	Ich habe die Drachenschuppen für dich.
//*******************************************

//-------------------------------------------
var int Jan_Sells_Armor;
//-------------------------------------------

INSTANCE DIA_JAN_Dragonscales (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_Dragonscales_Condition;
	information	= DIA_Jan_Dragonscales_Info;
	permanent	= TRUE;
	description	= "J'ai les écailles de dragon.";
};                       

FUNC INT DIA_Jan_Dragonscales_Condition()
{
	if (MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other ,DIA_JAN_JanIsSmith))
	&& (MIS_OCGateOpen == FALSE)
	&& (DIA_JAN_SellArmor_permanent == TRUE)
	&& (Jan_Sells_Armor == FALSE)
	&& (Npc_HasItems (other,ItAT_Dragonscale) >= 1)
	{
		return 1;
	};	
};
 var int DIA_JAN_Dragonscales_OneTime;
FUNC VOID DIA_Jan_Dragonscales_Info()
{		
		AI_Output (other,self ,"DIA_JAN_Dragonscales_15_00"); //J'ai les écailles de dragon.
		if (Npc_HasItems (other,ItAT_Dragonscale) >= 20)
		{
			B_GiveInvItems (other,self ,ItAT_Dragonscale,20);
			AI_Output (self ,other,"DIA_JAN_Dragonscales_10_01"); //Bien, on devrait pouvoir faire quelque chose avec ça.
			AI_Output (self ,other,"DIA_JAN_Dragonscales_10_02"); //Revenez demain, je devrais alors avoir fini.
			
			if (DIA_JAN_Dragonscales_OneTime == FALSE)//Joly:zur sicherheit
			{
				B_GivePlayerXP (XP_Addon_JanSellsArmor);
				DIA_JAN_Dragonscales_OneTime = TRUE;
			};
			
			Jan_Sells_Armor = Wld_GetDay ();
		}
		else
		{	
			AI_Output (self ,other,"DIA_JAN_Dragonscales_10_03"); //J'ai besoin de 20 écailles sinon je ne peux pas vous fabriquer d'armure.
		};	
};

//*******************************************
//	Ist die Rüstung fertig?
//*******************************************

//-------------------------------
var int DJG_Armor_is_offered;
var int DIA_JAN_ArmorReady_NoPerm;
//-------------------------------

INSTANCE DIA_JAN_ArmorReady (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 4;
	condition	= DIA_Jan_ArmorReady_Condition;
	information	= DIA_Jan_ArmorReady_Info;
	permanent	= TRUE;
	description	= "L'armure est-elle prête ?";
};                       

FUNC INT DIA_Jan_ArmorReady_Condition()
{
	if (MIS_OCGateOpen == FALSE)
	&& (Jan_Sells_Armor != FALSE)
	&& (DIA_JAN_ArmorReady_NoPerm == FALSE)
	{
		return 1;
	};	
};

FUNC VOID DIA_Jan_ArmorReady_Info()
{		
		AI_Output (other,self ,"DIA_JAN_ArmorReady_15_00"); //L'armure est-elle prête ?
		if (Jan_Sells_Armor == Wld_GetDay ())
		{
			AI_Output (self ,other,"DIA_JAN_ArmorReady_10_01"); //Non, non pas encore. Revenez demain.
		}
		else
		{
			AI_Output (self ,other,"DIA_JAN_ArmorReady_10_02"); //Oui, un vrai chef-d'œuvre. Vous pouvez me l'acheter si vous voulez.
			AI_Output (self ,other,"DIA_JAN_ArmorReady_10_03"); //Je vous ferai un prix. 12 000 pièces d'or.
			AI_Output (other,self ,"DIA_JAN_ArmorReady_15_04"); //Quoi ? Après tout ce que j'ai fait pour vous ?
			AI_Output (self ,other,"DIA_JAN_ArmorReady_10_05"); //Ne réagissez pas comme ça. Il faut bien que je gagne ma vie ici. C'est à prendre ou à laisser.
		
			DJG_Armor_is_offered = TRUE;
			DIA_JAN_ArmorReady_NoPerm = TRUE;
		};	
};

//*********************************************************************
//		DJG_ARMOR_M
//*********************************************************************

//-----------------------------
var int Jan_DIA_Jan_DJG_ARMOR_M_permanent;
//-----------------------------

instance DIA_Jan_DJG_ARMOR_M		(C_INFO)
{
	npc		 	 = 	DJG_714_Jan;
	nr           = 	4;
	condition	 = 	DIA_Jan_DJG_ARMOR_M_Condition;
	information	 = 	DIA_Jan_DJG_ARMOR_M_Info;
	permanent	 = 	TRUE;
	description	 =	"Armure moyenne chasseur de dragons. Prot. : Armes 80, flèches 80 (12 000 po)"; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Jan_DJG_ARMOR_M_Condition ()
{
	IF (Jan_DIA_Jan_DJG_ARMOR_M_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (DJG_Armor_is_offered == TRUE)
	{
		return TRUE;
	};	
};

func void DIA_Jan_DJG_ARMOR_M_Info ()
{	
	AI_Output	(other,self ,"DIA_Jan_DJG_ARMOR_M_15_00"); //Je veux acheter l'armure.
	
	if (Npc_HasItems (other,itmi_Gold) >= 12000)
	{
		AI_Output 	(self ,other,"DIA_Jan_DJG_ARMOR_M_10_01"); //Vous pouvez constater qu'elle vaut chaque pièce d'or investie.
		
		B_GiveInvItems (other,self,ItMi_Gold,12000);
		CreateInvItems (self,ITAR_DJG_M,1);
		B_GiveInvItems (self,other,ITAR_DJG_M,1);
		
		Jan_DIA_Jan_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Jan_DJG_ARMOR_M_10_02"); //Vous n'avez pas assez d'or.
	};	
	
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Jan_DragonPlettBericht		(C_INFO)
{
	npc			 = 	DJG_714_Jan;
	nr			 = 	3;
	condition	 = 	DIA_Jan_DragonPlettBericht_Condition;
	information	 = 	DIA_Jan_DragonPlettBericht_Info;

	description	 = 	"A propos des dragons...";
};

var int DIA_Jan_DragonPlettBericht_NoPerm;
func int DIA_Jan_DragonPlettBericht_Condition ()
{
	if (Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_JAN_Dragons))
	&& (DIA_Jan_DragonPlettBericht_NoPerm == FALSE)
	&& (MIS_OCGateOpen == FALSE)
	&& (MIS_KilledDragons != 0)
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonPlettBericht_Info ()
{
	if (MIS_KilledDragons == 1)
	{
		AI_Output (other, self, "DIA_Jan_DragonPlettBericht_15_00"); //J'ai tué un dragon.
	}
	else if ((MIS_KilledDragons == 2) || (MIS_KilledDragons == 3))
	{
		AI_Output (other, self, "DIA_Jan_DragonPlettBericht_15_01"); //J'ai tué quelques dragons.
	}
	else 
	{
		AI_Output (other, self, "DIA_Jan_DragonPlettBericht_15_02"); //J'ai tué tous les dragons.
	};
	
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_03"); //Et alors ? Vous êtes un chasseur de dragons, non ?
		AI_Output (other, self, "DIA_Jan_DragonPlettBericht_15_04"); //Vous n'en êtes pas un vous aussi ?
	}
	else
	{
		AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_05"); //C'est gentil. Mais, pour être honnête, cela ne m'intéresse pas vraiment.
	};
	
	AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_06"); //Je vous l'ai déjà dit, je préfère fabriquer des armes que d'aller à la chasse aux dragons.

	if (hero.guild != GIL_DJG)
	&& (hero.guild != GIL_SLD)
	{
		AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_07"); //Il y a une chose cependant qui pourrait m'intéresser.
		AI_Output (self, other, "DIA_Jan_DragonPlettBericht_10_08"); //Si vous pouviez me trouver du sang de dragon, je vous en donnerais un bon prix.
		Jan_WantsDragonBlood = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonBlood
///////////////////////////////////////////////////////////////////////
instance DIA_Jan_DragonBlood		(C_INFO)
{
	npc		 = 	DJG_714_Jan;
	nr		 = 	3;
	condition	 = 	DIA_Jan_DragonBlood_Condition;
	information	 = 	DIA_Jan_DragonBlood_Info;
	permanent	 = 	TRUE;

	description	 = 	"J'ai du sang de dragon pour vous.";
};

func int DIA_Jan_DragonBlood_Condition ()
{
	if (Jan_WantsDragonBlood == TRUE)
	&& (MIS_OCGateOpen == FALSE)
	&& (Npc_HasItems (other,ItAt_DragonBlood))
	&& ((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
		{
			return TRUE;
		};
};

func void DIA_Jan_DragonBlood_Info ()
{
	AI_Output			(other, self, "DIA_Jan_DragonBlood_15_00"); //J'ai du sang de dragon pour vous.
	AI_Output			(self, other, "DIA_Jan_DragonBlood_10_01"); //Fantastique. Vendez-moi tout ce que vous avez.

	Info_ClearChoices	(DIA_Jan_DragonBlood);
	Info_AddChoice	(DIA_Jan_DragonBlood, DIALOG_BACK, DIA_Jan_DragonBlood_BACK );
	if ((Npc_HasItems (other,ItAt_DragonBlood)) >= 1)
	{
		Info_AddChoice	(DIA_Jan_DragonBlood, "(Tout)", DIA_Jan_DragonBlood_all );
		Info_AddChoice	(DIA_Jan_DragonBlood, "(Une fiole)", DIA_Jan_DragonBlood_1 );
	};
};
func void DIA_Jan_DragonBlood_BACK ()
{
	Info_ClearChoices	(DIA_Jan_DragonBlood);
};

func void DIA_Jan_DragonBlood_1 ()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;

	DragonBloodCount = 1;

	B_GiveInvItems (other, self, ItAt_DragonBlood,  DragonBloodCount);
	XP_DJG_BringDragonBloods = (DragonBloodCount * XP_AmbientKap4);
	B_GivePlayerXP (XP_DJG_BringDragonBloods);
	DragonBloodGeld	= (DragonBloodCount * Value_DragonBlood);	//Joly:ganzer Wert ohne Handelsmultiplier
	CreateInvItems (self, ItMi_Gold, DragonBloodGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, DragonBloodGeld);

	Info_ClearChoices	(DIA_Jan_DragonBlood);
	Info_AddChoice	(DIA_Jan_DragonBlood, DIALOG_BACK, DIA_Jan_DragonBlood_BACK );
	if ((Npc_HasItems (other,ItAt_DragonBlood)) >= 1)
	{
		Info_AddChoice	(DIA_Jan_DragonBlood, "(Tout)", DIA_Jan_DragonBlood_all );
		Info_AddChoice	(DIA_Jan_DragonBlood, "(Une fiole)", DIA_Jan_DragonBlood_1 );
	};
	

	var string BloodText;
	var string BloodLeft;
	BloodLeft = IntToString (Npc_HasItems(other, ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft, PRINT_NumberLeft);
	AI_PrintScreen	(BloodText, -1, -1, FONT_ScreenSmall, 2);
};

func void DIA_Jan_DragonBlood_all ()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;

	DragonBloodCount = Npc_HasItems(other, ItAt_DragonBlood);

	B_GiveInvItems (other, self, ItAt_DragonBlood,  DragonBloodCount);
	XP_DJG_BringDragonBloods = (DragonBloodCount * XP_AmbientKap4);
	B_GivePlayerXP (XP_DJG_BringDragonBloods);
	DragonBloodGeld	= (DragonBloodCount * Value_DragonBlood); //Joly:ganzer Wert ohne Handelsmultiplier
	CreateInvItems (self, ItMi_Gold, DragonBloodGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, DragonBloodGeld);

	Info_ClearChoices	(DIA_Jan_DragonBlood);
	Info_AddChoice	(DIA_Jan_DragonBlood, DIALOG_BACK, DIA_Jan_DragonBlood_BACK );
	if ((Npc_HasItems (other,ItAt_DragonBlood)) >= 1)
	{
		Info_AddChoice	(DIA_Jan_DragonBlood, "(Tout)", DIA_Jan_DragonBlood_all );
		Info_AddChoice	(DIA_Jan_DragonBlood, "(Une fiole)", DIA_Jan_DragonBlood_1 );
	};

	var string BloodText;
	var string BloodLeft;
	BloodLeft = IntToString (Npc_HasItems(other, ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft, PRINT_NumberLeft);
	AI_PrintScreen	(BloodText, -1, -1, FONT_ScreenSmall, 2);
};

///////////////////////////////////////////////////////////////////////
//	Info nachOCGATEOPEN
///////////////////////////////////////////////////////////////////////
instance DIA_Jan_NACHOCGATEOPEN		(C_INFO)
{
	npc		 = 	DJG_714_Jan;
	nr		 = 	3;
	condition	 = 	DIA_Jan_NACHOCGATEOPEN_Condition;
	information	 = 	DIA_Jan_NACHOCGATEOPEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Tout va bien ?";
};

func int DIA_Jan_NACHOCGATEOPEN_Condition ()
{
	if (MIS_OCGateOpen == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Jan_NACHOCGATEOPEN_Info ()
{
	AI_Output			(other, self, "DIA_Jan_NACHOCGATEOPEN_15_00"); //Tout va bien ?
	AI_Output			(self, other, "DIA_Jan_NACHOCGATEOPEN_10_01"); //Rien ne va !
	if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Jan_NACHOCGATEOPEN_10_02"); //Bande d'imbéciles, pourquoi avez-vous ouvert les portes ? Vous autres les paladins, vous êtes vraiment débiles !
	}
	else
	{
		AI_Output			(self, other, "DIA_Jan_NACHOCGATEOPEN_10_03"); //Alors ils ont ouvert les portes. Les imbéciles ! Je n'en reviens pas.
	};
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jan_PICKPOCKET (C_INFO)
{
	npc			= DJG_714_Jan;
	nr			= 900;
	condition	= DIA_Jan_PICKPOCKET_Condition;
	information	= DIA_Jan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Jan_PICKPOCKET_Condition()
{
	C_Beklauen (37, 95);
};
 
FUNC VOID DIA_Jan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jan_PICKPOCKET);
	Info_AddChoice		(DIA_Jan_PICKPOCKET, DIALOG_BACK 		,DIA_Jan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jan_PICKPOCKET_DoIt);
};

func void DIA_Jan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jan_PICKPOCKET);
};
	
func void DIA_Jan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jan_PICKPOCKET);
};









