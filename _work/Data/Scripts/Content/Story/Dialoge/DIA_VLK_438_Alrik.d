// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Alrik_EXIT(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 999;
	condition	= DIA_Alrik_EXIT_Condition;
	information	= DIA_Alrik_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Alrik_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Alrik_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Alrik_PICKPOCKET (C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 900;
	condition	= DIA_Alrik_PICKPOCKET_Condition;
	information	= DIA_Alrik_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Alrik_PICKPOCKET_Condition()
{
	C_Beklauen (55, 50);
};
 
FUNC VOID DIA_Alrik_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Alrik_PICKPOCKET);
	Info_AddChoice		(DIA_Alrik_PICKPOCKET, DIALOG_BACK 		,DIA_Alrik_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Alrik_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Alrik_PICKPOCKET_DoIt);
};

func void DIA_Alrik_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Alrik_PICKPOCKET);
};
	
func void DIA_Alrik_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Alrik_PICKPOCKET);
};
// ************************************************************
// 			  				  Hallo
// ************************************************************

INSTANCE DIA_Alrik_Hallo(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Hallo_Condition;
	information	= DIA_Alrik_Hallo_Info;
	permanent	= FALSE;
	description = "Que faites-vous ici ?";
};                       

FUNC INT DIA_Alrik_Hallo_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Alrik_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_Alrik_Hallo_15_00"); //Que faites-vous ici ?
	
	if (Npc_GetDistToWP (self,"NW_CITY_PATH_HABOUR_16_01") <= 500) //In Ecke
	{
		AI_Output (self ,other,"DIA_Alrik_Hallo_09_01"); //(éclate de rire) C'est chez moi ici !
	}
	else //In Kneipe oder auf dem Weg
	{
		if (Npc_GetDistToWP (self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
		{
			AI_Output (self ,other,"DIA_Alrik_Hallo_09_02"); //Qu'est-ce que je suis censé faire ici ? Boire, ça ne se voit pas ?
		}
		else
		{
			AI_Output (self ,other,"DIA_Alrik_Hallo_09_03"); //Je vais faire un tour.
		};
	};
	AI_Output (self ,other,"DIA_Alrik_Hallo_09_04"); //Par contre, si vous voulez savoir quelle est mon occupation, eh bien, j'arrange des combats.
};

// ************************************************************
// 			  				Du kämpfst?
// ************************************************************

INSTANCE DIA_Alrik_YouFight(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_YouFight_Condition;
	information	= DIA_Alrik_YouFight_Info;
	permanent	= FALSE;
	description = "Vous organisez des combats ?";
};                       

FUNC INT DIA_Alrik_YouFight_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_Hallo))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_YouFight_Info()
{
	AI_Output (other,self ,"DIA_Alrik_YouFight_15_00"); //Vous arrangez des combats ?
	AI_Output (self ,other,"DIA_Alrik_YouFight_09_01"); //Tous les jours, de midi à la nuit tombée.
	if (Npc_GetDistToWP (self,"NW_CITY_PATH_HABOUR_16_01") <= 500) //In Ecke
	{
		AI_Output (self ,other,"DIA_Alrik_YouFight_09_02"); //Et ici même !
	};
	AI_Output (self ,other,"DIA_Alrik_YouFight_09_03"); //Derrière l'entrepôt du quartier du port. C'est mon chez moi là-bas.
};


// ************************************************************
// 			  				Regeln
// ************************************************************

INSTANCE DIA_Alrik_Regeln(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Regeln_Condition;
	information	= DIA_Alrik_Regeln_Info;
	permanent	= FALSE;
	description = "Quelles sont les règles du combat ?";
};                       

FUNC INT DIA_Alrik_Regeln_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_Regeln_Info()
{
	AI_Output (other,self ,"DIA_Alrik_Regeln_15_00"); //Quelles sont les règles de ces combats ?
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_01"); //Elles sont on ne peut plus simple : toutes les armes de corps à corps classiques sont autorisées, mais pas d'arc ni d'arbalète, et encore moins de magie.
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_02"); //On se bat jusqu'à ce qu'un des deux combattants s'effondre. A ce moment-là, le combat est terminé. Pigé ?
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_03"); //Quitter l'angle de la rue revient à concéder la défaite. Autrement dit, si vous abandonnez, c'est moi qui gagne !
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_04"); //La mise est de 50 pièces d'or. Si vous gagnez, vous repartez avec 100 pièces d'or. Et dans le cas contraire, votre argent finit dans ma poche. (sourit)
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_05"); //Vous avez compris ?
	AI_Output (other,self ,"DIA_Alrik_Regeln_15_06"); //Oui.
};


// ************************************************************
// 		  			Important für NEUE 3 Kämpfe ab Kap 3
// ************************************************************

		func void B_Alrik_Again()
		{
			AI_Output (self, other, "DIA_Alrik_Add_09_03"); //Comment ça va ? Vous voulez de nouveau vous mesurer à moi ? Je crois bien que je me suis amélioré depuis la dernière fois.
		};

INSTANCE DIA_Alrik_NewFights3(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_NewFights3_Condition;
	information	= DIA_Alrik_NewFights3_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Alrik_NewFights3_Condition()
{
	if (Kapitel >= 3)
	&& (Kapitel <= 4)
	&& (Alrik_ArenaKampfVerloren <= 6)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Alrik_NewFights3_Info()
{
	B_AddFightSkill (self, NPC_TALENT_1H, 20);
	B_SetAttributesToChapter (self, 4);
	B_Alrik_Again();
};

// ************************************************************
// 		  			Important für NEUE 3 Kämpfe ab Kap 5
// ************************************************************

INSTANCE DIA_Alrik_NewFights5(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_NewFights5_Condition;
	information	= DIA_Alrik_NewFights5_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Alrik_NewFights5_Condition()
{
	if (Kapitel >= 5)
	&& (Alrik_ArenaKampfVerloren <= 9)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Alrik_NewFights5_Info()
{
	B_AddFightSkill (self, NPC_TALENT_1H, 20);
	B_SetAttributesToChapter (self, 6);
	B_Alrik_Again();
};

// ************************************************************
// 			  			WannaFight
// ************************************************************
		
		func void B_Alrik_Enough()
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_05"); //Je trouve que vous avez bien assez gagné comme ça.
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_06"); //Ne le prenez pas mal, mais j'ai encore ce bourdonnement dans le crâne de la dernière fois.
		};
		
		func void B_Alrik_ComeBackLater()
		{
			AI_Output (self, other, "DIA_Alrik_Add_09_02"); //Revenez plus tard, ça me laissera le temps de m'entraîner.
		};
		

INSTANCE DIA_Alrik_WannaFight(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_WannaFight_Condition;
	information	= DIA_Alrik_WannaFight_Info;
	permanent	= TRUE;
	description = "Je veux combattre contre vous !";
};                       

FUNC INT DIA_Alrik_WannaFight_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_Regeln))
	&& (self.aivar[AIV_ArenaFight] == AF_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Alrik_WannaFight_Info()
{
	AI_Output (other,self ,"DIA_Alrik_WannaFight_15_00"); //Je veux me battre contre vous !
	
	Info_ClearChoices 	(DIA_Alrik_WannaFight);
	
	// ------ EXIT: Wenn Alrik schonmal verloren, nächster Kampf erst, wenn Alrik das bessere Schwert hat ------
	if ( (Alrik_ArenaKampfVerloren > 0) && (Npc_HasItems (self, ItMW_AlriksSword_Mis) == 0) )
	|| (Npc_HasEquippedMeleeWeapon (self) == FALSE)
	{
		if (MIS_Alrik_Sword == LOG_SUCCESS) //Wenn nach Schwert-Mission niedergeschlagen und Schwert weggenommen
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_01"); //Commencez par me rendre mon épée, et après, on verra.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_02"); //Non, non, non. Je ne me mesurerai pas de nouveau à vous tant que je n'aurai pas une meilleure arme.
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_03"); //J'ai été obligé de vendre mon épée il y a quelques jours de ça.
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_04"); //Avec ma toute belle, je suis imbattable ! Récupérez-la pour moi et j'accepte de me mesurer de nouveau à vous.
			
			Alrik_VomSchwertErzaehlt = TRUE;
			
			Log_CreateTopic (TOPIC_AlrikSchwert,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_AlrikSchwert,LOG_RUNNING);
			B_LogEntry (TOPIC_AlrikSchwert,"Alrik a vendu son épée à Jora. Il ne m'affrontera que si je la lui récupère.");
		};
	}
	
	// ----- EXIT: ÜBER DREI MAL Alrik_ArenaKampfVerloren ------
	else if (Kapitel <= 2)
	&& (Alrik_ArenaKampfVerloren > 3)
	{
		AI_Output (self, other, "DIA_Alrik_Add_09_00"); //Je pense que ça suffit pour le moment.
		AI_Output (self, other, "DIA_Alrik_Add_09_01"); //Laissez-moi récupérer un peu...
		B_Alrik_ComeBackLater();
	}
	
	else if (Kapitel >= 3)
	&& (Kapitel <= 4)
	&& (Alrik_ArenaKampfVerloren > 6)
	{
		B_Alrik_Enough();
		B_Alrik_ComeBackLater();
	}
	
	else if (Kapitel >= 5)
	&& (Alrik_ArenaKampfVerloren > 9)
	{
		B_Alrik_Enough();
		AI_Output (self, other, "DIA_Alrik_Add_09_04"); //Et puis, j'ai gagné bien assez d'or.
		AI_Output (self, other, "DIA_Alrik_Add_09_05"); //J'ai décidé d'arrêter et de trouver un endroit où m'installer en ville.
		AI_Output (self, other, "DIA_Alrik_Add_09_06"); //Qui sait ? Peut-être que je pourrais vendre des armes...
	}
	
	// ------ normaler KAMPF ------
	else if (Wld_IsTime(11,00,19,00))
	{
		AI_Output (self ,other,"DIA_Alrik_WannaFight_09_07"); //Vous avez 50 pièces d'or ?
		Info_ClearChoices 	(DIA_Alrik_WannaFight);
		Info_AddChoice 		(DIA_Alrik_WannaFight, "Nan...",	DIA_Alrik_WannaFight_NoGold);
		if (Npc_HasItems (other, itmi_gold) >= 50)
		{
			Info_AddChoice 		(DIA_Alrik_WannaFight, "Tenez...",	DIA_Alrik_WannaFight_Gold);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Alrik_WannaFight_09_08"); //Je ne combats que de midi au soir.
		AI_Output (self ,other,"DIA_Alrik_WannaFight_09_09"); //Ça ne vaut le coup de combattre que s'il y a suffisamment de spectateurs disposés à parier.
		if (Wld_IsTime(19,00,03,30))
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_10"); //Il est trop tard ce soir. Revenez demain à midi.
		}
		else // 03,30 - 11,00 
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_11"); //Il est encore trop tôt. Revenez plus tard.
		};
	};
};

func void DIA_Alrik_WannaFight_Gold()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_Gold_15_00"); //Ah, vous voilà...
	B_GiveInvItems (other, self, itmi_gold, 50);
	AI_Output (self ,other,"DIA_Alrik_WannaFight_Gold_09_01"); //(à tue-tête) Nous avons un nouveau challenger aujourd'hui.
	AI_Output (self ,other,"DIA_Alrik_WannaFight_Gold_09_02"); //Les paris sont clos...
	
	Npc_RemoveInvItems (self, itmi_gold, Npc_HasItems(self, itmi_gold) );
	CreateInvItems (self, itmi_gold, 100); //50 vom Spieler und 50 Einsatz von Alrik...
	
	AI_Output (self ,other,"DIA_Alrik_WannaFight_Gold_09_03"); //Prêt ?
	
	//--------------------------------------
	self.aivar[AIV_ArenaFight] = AF_RUNNING;
	Alrik_Kaempfe 		= Alrik_Kaempfe + 1;
	//--------------------------------------
	
	Info_ClearChoices 	(DIA_Alrik_WannaFight);
	Info_AddChoice 		(DIA_Alrik_WannaFight, "Une petite seconde...",	DIA_Alrik_WannaFight_Moment);
	Info_AddChoice 		(DIA_Alrik_WannaFight, "Allez !",	DIA_Alrik_WannaFight_NOW);
};

func void DIA_Alrik_WannaFight_NoGold()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_NoGold_15_00"); //Non.
	AI_Output (self, other,"DIA_Alrik_WannaFight_NoGold_09_01"); //Alors, allez chercher de l'argent ! Pas de combat sans mise !
	
	Info_ClearChoices 	(DIA_Alrik_WannaFight);
};

func void DIA_Alrik_WannaFight_NOW()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_NOW_15_00"); //Venez ici !
	AI_Output (self, other,"DIA_Alrik_WannaFight_NOW_09_01"); //Voyons ce que vous savez faire...
	
	if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems (self, ItPo_Health_03, 1); 
		B_UseItem (self, ItPo_Health_03);
	};
	
	AI_StopProcessInfos (self);
	B_Attack (self,other, AR_NONE, 1);
};	

func void DIA_Alrik_WannaFight_Moment()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_Moment_15_00"); //Un petit instant...
	AI_Output (self, other,"DIA_Alrik_WannaFight_Moment_09_01"); //Prenez votre temps... moi, je commence tout de suite !
	
	if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems (self, ItPo_Health_03, 1); 
		B_UseItem (self, ItPo_Health_03);
	};
	
	AI_StopProcessInfos (self);
	B_Attack (self,other, AR_NONE, 1);
};	


// ************************************************************
// 			  			NACH Kampf
// ************************************************************

INSTANCE DIA_Alrik_AfterFight(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_AfterFight_Condition;
	information	= DIA_Alrik_AfterFight_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

FUNC INT DIA_Alrik_AfterFight_Condition()
{
	if (self.aivar[AIV_LastFightComment] == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	{
		if (self.aivar[AIV_ArenaFight] != AF_NONE)
		{	
			return TRUE;	//direkt ansprechen
		}
		else if (Npc_IsInState (self, ZS_Talk))
		{
			return TRUE; 	//wenn kein Kampf war, nur reagieren, wenn SC ihn angesprochen hat
		};
	};
};
 
FUNC VOID DIA_Alrik_AfterFight_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	&& (self.aivar[AIV_ArenaFight] != AF_NONE)
	&& (self.aivar[AIV_ArenaFight] != AF_AFTER_PLUS_DAMAGE)
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_00"); //Bon sang ! Quand vous cognez, vous ne faites pas semblant !
			
			if (Npc_HasItems (self, itmi_gold) >= 100)
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_01"); //Tenez, voici vos 100 pièces d'or. Vous les avez bien méritées.
				B_GiveInvItems (self, other, itmi_gold, 100);
			}
			else if (Npc_HasItems (self, itmi_gold) == 0)
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_02"); //Je vois que vous vous êtes déjà payé.
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_03"); //Vous auriez quand même pu attendre que je vous donne l'argent moi-même. Je suis homme de parole, vous savez.
			}
			else //zwischen 1 und 99 Gold...
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_04"); //Vous m'avez fait les poches pendant que j'étais inconscient !
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_05"); //C'est très mal élevé vous savez ? Bah, l'argent vous revenait de droit de toute façon. Tenez, voici le reliquat.
				B_GiveInvItems (self, other, itmi_gold, Npc_HasItems(self, itmi_gold) );
			};
			
			Alrik_ArenaKampfVerloren = Alrik_ArenaKampfVerloren + 1;
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_06"); //C'était un chouette combat, mais n'espérez pas revoir votre mise. Bah, ne vous en faites pas, c'était pour la bonne cause ! (sourit)
		}
		else //FIGHT_CANCEL
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_07"); //Hé, comme je vous avais dit, celui qui quitte l'angle de la rue perd automatiquement le combat. Mais si vous voulez réessayer, je suis à votre service.
		};
		
		// ------ nur einmal ------
		if (Alrik_Kaempfe == 1)
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_08"); //Ah, une dernière chose : défense de parler de ce qui se passe derrière l'entrepôt.
			
			if (other.guild != GIL_MIL)
			&& (other.guild != GIL_PAL)
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_09"); //Les miliciens ont la fâcheuse tendance de mettre derrière les barreaux quiconque lève le petit doigt, et ils n'aiment pas les paris.
			};
		};
				
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	}
	else //anderer Kampfgrund gegen den Spieler ODER kein sauberer Kampf
	{
		if (self.aivar[AIV_ArenaFight] == AF_AFTER_PLUS_DAMAGE) // NACH Kampf und VOR Bewertung nochmal angegriffen.
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_10"); //Le combat était terminé, espèce de crétin !
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_11"); //Je déteste les gens qui ne respectent pas les règles !
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_12"); //Sortez d'ici !
		}
		else //einfach so angegriffen (unvorbereitet)
		{
			if (Alrik_Kaempfe == 0)
			{	
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_13"); //Si vous vouliez m'affronter, il suffisait de me défier !
			}
			else // > 0
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_14"); //Si vous vouliez m'affronter de nouveau, il suffisait de me défier !
			};
			
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_15"); //Tirez-vous ! Je ne veux rien avoir à faire avec les minables tels que vous !
		};
		
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		AI_StopProcessInfos(self);
	};
};
	

// ************************************************************
// 			  			Du wohnst hier?
// ************************************************************

INSTANCE DIA_Alrik_DuWohnst(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_DuWohnst_Condition;
	information	= DIA_Alrik_DuWohnst_Info;
	permanent	= FALSE;
	description = "Vous 'vivez' derrière l'entrepôt ?";
};                       

FUNC INT DIA_Alrik_DuWohnst_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_DuWohnst_Info()
{
	AI_Output (other,self ,"DIA_Alrik_DuWohnst_15_00"); //(surpris) Vous vivez derrière l'entrepôt ?
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_01"); //C'est seulement temporaire. (sourit) Quand on est aussi riche que moi, on peut se permettre de vivre dans le luxe et la volupté.
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_02"); //J'étais instructeur dans l'armée, mais j'ai démissionné pour tenter ma chance dans la carrière d'aventurier.
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_03"); //Et je me suis retrouvé dans ce trou. Les 100 pièces d'or qui me restaient m'ont tout juste permis de payer les gardes de la porte pour qu'ils me laissent entrer.
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_04"); //Alors, je fais tout mon possible pour récupérer un minimum d'argent. Il m'a même fallu vendre mon épée.
	
	Alrik_VomSchwertErzaehlt = TRUE;
};


// ************************************************************
// 			  		Wer hat dein Schwert?
// ************************************************************

INSTANCE DIA_Alrik_WerSchwert(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_WerSchwert_Condition;
	information	= DIA_Alrik_WerSchwert_Info;
	permanent	= FALSE;
	description = "A qui avez-vous vendu l'épée ?";
};                       

FUNC INT DIA_Alrik_WerSchwert_Condition()
{
	if (Alrik_VomSchwertErzaehlt == TRUE)
	&& (MIS_Alrik_Sword != LOG_SUCCESS)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_WerSchwert_Info()
{
	AI_Output (other,self ,"DIA_Alrik_WerSchwert_15_00"); //A qui l'avez-vous vendue ?
	AI_Output (self ,other,"DIA_Alrik_WerSchwert_09_01"); //Je l'ai échangée contre deux ou trois articles sur la place du marché.
	AI_Output (self ,other,"DIA_Alrik_WerSchwert_09_02"); //Le marchand s'appelait Jora. Quant aux torches et à la viande contre lesquelles il m'a échangé mon épée, elles ne m'ont pas duré longtemps.
	AI_Output (other,self ,"DIA_Alrik_WerSchwert_15_03"); //Cela m'étonnerait qu'il me donne l'épée pour rien...
	AI_Output (self ,other,"DIA_Alrik_WerSchwert_09_04"); //C'est une vieille arme. Il ne voudra pas grand-chose en échange. Et dites-vous que c'est juste une mise supplémentaire pour pouvoir m'affronter... (sourit)
		
	MIS_Alrik_Sword = LOG_RUNNING;
};

// **************************************
//			Ich hab dein Schwert
// **************************************
var int Alrik_EinmalSchwertBonus;

INSTANCE DIA_Alrik_HaveSword(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_HaveSword_Condition;
	information	= DIA_Alrik_HaveSword_Info;
	permanent	= TRUE;
	description = "J'ai votre épée !";
};                       

FUNC INT DIA_Alrik_HaveSword_Condition()
{
	IF (Npc_HasItems (other,ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Alrik_HaveSword_Info()
{	
	AI_Output (other,self ,"DIA_Alrik_HaveSword_15_00"); //J'ai votre épée !
	B_GiveInvItems (other,self,ItMW_AlriksSword_Mis,1);
	
	if (MIS_Alrik_Sword != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Alrik_HaveSword_09_01"); //Ah, je préfère ça que de me battre avec un vieux bâton !
		
		MIS_Alrik_Sword = LOG_SUCCESS;
		B_GivePlayerXP (XP_AlriksSword);
	}
	else
	{	
		AI_Output (self ,other,"DIA_Alrik_HaveSword_09_02"); //Bien ! Je suis curieux de voir si vous oserez me défier de nouveau !
	};
		
	if (Alrik_EinmalSchwertBonus == FALSE)
	{
		B_AddFightSkill (self, NPC_TALENT_1H, 20);
		Alrik_EinmalSchwertBonus = TRUE;
	};
	AI_EquipBestMeleeWeapon (self);
};

// ************************************************************
// 			  			Krieg mit Orks
// ************************************************************

INSTANCE DIA_Alrik_Krieg(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Krieg_Condition;
	information	= DIA_Alrik_Krieg_Info;
	permanent	= FALSE;
	description = "Que savez-vous de la guerre contre les orques ?";
};                       

FUNC INT DIA_Alrik_Krieg_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_DuWohnst))
	|| (hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_Krieg_Info()
{
	AI_Output (other,self ,"DIA_Alrik_Krieg_15_00"); //Que savez-vous au sujet de la guerre contre les orques ?
	AI_Output (self ,other,"DIA_Alrik_Krieg_09_01"); //Il n'y a pas grand-chose à en dire, sinon qu'elle dure depuis bien trop longtemps.
	AI_Output (self ,other,"DIA_Alrik_Krieg_09_02"); //Les gens meurent de faim dans les campagnes. Partout, les paysans se révoltent et les troupes du roi matent les tentatives de rébellion sans la moindre pitié.
	AI_Output (self ,other,"DIA_Alrik_Krieg_09_03"); //Mais il y en a trop. Si la guerre ne s'achève pas rapidement, le royaume va voler en éclats.
};

// ************************************************************
// 			  			Mich ausbilden?
// ************************************************************

// -------------------------------
	var int Alrik_VorausErzaehlt;
// -------------------------------


instance DIA_Alrik_Ausbilden(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Ausbilden_Condition;
	information	= DIA_Alrik_Ausbilden_Info;
	permanent	= TRUE;
	description = "Pouvez-vous m'entraîner ?";
};                       

FUNC INT DIA_Alrik_Ausbilden_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Alrik_DuWohnst))
	|| (hero.guild != GIL_NONE))
	&& (Alrik_Teach1H == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_Ausbilden_Info()
{
	AI_Output (other,self ,"DIA_Alrik_Ausbilden_15_00"); //Pouvez-vous m'entraîner ?
	
	if (Alrik_Kaempfe == 0)
	&& (hero.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Alrik_Ausbilden_09_01"); //Si vous voulez vraiment apprendre à vous battre, mesurez-vous à moi. (se fend d'un sourire narquois) Vous prendrez en même temps une bonne leçon sans frais supplémentaires.
		Alrik_VorausErzaehlt = TRUE; 
	}
	else //>0
	{
		if (Alrik_VorausErzaehlt == TRUE)
		{
			AI_Output (self ,other,"DIA_Alrik_Ausbilden_09_02"); //Je suis homme de parole. Je vous apprendrai tout ce que je sais si vous avez l'expérience nécessaire.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alrik_Ausbilden_09_03"); //D'accord, à condition que vous ayez l'expérience nécessaire.
		};
		
		
		Alrik_Teach1H = TRUE;
		Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
		B_LogEntry (Topic_CityTeacher,"Alrik peut m'entraîner au combat avec des armes à une main. Il traîne derrière l'entrepôt du quartier du port.");
	};
};

//**************************************
//			Ich will trainieren
//**************************************

// -------------------------------------
	var int Alrik_Merke_1h;
// -------------------------------------

instance DIA_Alrik_Teach(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Teach_Condition;
	information	= DIA_Alrik_Teach_Info;
	permanent	= TRUE;
	description = "Entraînez-moi comme spadassin !";
};                       

FUNC INT DIA_Alrik_Teach_Condition()
{
	if (Alrik_Teach1H == TRUE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Alrik_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Alrik_Teach_15_00"); //Apprenez-moi à combattre à l'épée !
	
	Alrik_Merke_1h =  other.HitChance[NPC_TALENT_1H];
	
	Info_ClearChoices 	(DIA_Alrik_Teach);
	Info_AddChoice 		(DIA_Alrik_Teach, DIALOG_BACK,	DIA_Alrik_Teach_Back);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Alrik_Teach_1H_1);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Alrik_Teach_1H_5);
};

FUNC VOID DIA_Alrik_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_1H] >= (60-30))
	{
		AI_Output (self ,other,"DIA_Alrik_Teach_Back_09_00"); //Vous n'êtes plus un débutant.
	}
	else if (other.HitChance[NPC_TALENT_1H] > Alrik_Merke_1h)
	{
		AI_Output (self ,other,"DIA_Alrik_Teach_Back_09_01"); //Vous avez déjà fait des progrès. Bientôt, vous serez un vrai guerrier.
	};
	
	Info_ClearChoices (DIA_Alrik_Teach);
};

FUNC VOID DIA_Alrik_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);
	
	Info_ClearChoices 	(DIA_Alrik_Teach);
	Info_AddChoice 		(DIA_Alrik_Teach, DIALOG_BACK,	DIA_Alrik_Teach_Back);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Alrik_Teach_1H_1);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Alrik_Teach_1H_5);
};

FUNC VOID DIA_Alrik_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);

	Info_ClearChoices 	(DIA_Alrik_Teach);
	Info_AddChoice 		(DIA_Alrik_Teach, DIALOG_BACK,	DIA_Alrik_Teach_Back);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Alrik_Teach_1H_1);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Alrik_Teach_1H_5);
};



		






		







