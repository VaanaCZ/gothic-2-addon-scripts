//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_EXIT   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 999;
	condition   = DIA_Addon_Snaf_EXIT_Condition;
	information = DIA_Addon_Snaf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Snaf_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Snaf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Snaf_PICKPOCKET (C_INFO)
{
	npc			= BDT_1098_Addon_Snaf;
	nr			= 900;
	condition	= DIA_Addon_Snaf_PICKPOCKET_Condition;
	information	= DIA_Addon_Snaf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       
FUNC INT DIA_Addon_Snaf_PICKPOCKET_Condition()
{
	C_Beklauen (49, 56);
};
 
FUNC VOID DIA_Addon_Snaf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Snaf_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Snaf_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Snaf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Snaf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Snaf_PICKPOCKET_DoIt);
};

func void DIA_Addon_Snaf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Snaf_PICKPOCKET);
};
	
func void DIA_Addon_Snaf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Snaf_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Hi   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 1;
	condition   = DIA_Addon_Snaf_Hi_Condition;
	information = DIA_Addon_Snaf_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Snaf_Hi_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Snaf_Hi_01_00"); //Vous voulez manger ou discuter ? Qu'est-ce que vous prendrez ?
};
//---------------------------------------------------------------------
//	Was gibt's denn leckeres?
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Cook (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 2;
	condition   = DIA_Addon_Snaf_Cook_Condition;
	information = DIA_Addon_Snaf_Cook_Info;
	permanent   = FALSE;
	description = "Qu'y a-t-il au menu ?";
};
FUNC INT DIA_Addon_Snaf_Cook_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Snaf_Cook_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_15_00"); //Qu'y a-t-il au menu ?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_01_01"); //Je vais vous faire goûter un nouveau plat - viande grillée au feu de bois, sauce Marteau.
	
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
	Info_AddChoice 	  (DIA_Addon_Snaf_Cook,"Des grillades au feu de bois ?",DIA_Addon_Snaf_Cook_FEUER);	
	Info_AddChoice 	  (DIA_Addon_Snaf_Cook,"Sauce Marteau ?",DIA_Addon_Snaf_Cook_HAMMER);
};
//---------------------------------------------------------------------
FUNC VOID DIA_Addon_Snaf_Cook_FEUER()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_FEUER_15_00");//De la viande grillée ?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_FEUER_01_01");//De la viande croustillante, délicatement grillée, mélangée à de l'herbe de feu marinée.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_FEUER_01_02");//Mais ne vous inquiétez pas - j'ai déjà tous les ingrédients nécessaires pour cette recette.
};
FUNC VOID DIA_Addon_Snaf_Cook_HAMMER()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_15_00");//Sauce Marteau ?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_01_01");//Une sauce à base de Marteau - un alcool fort. Je tiens cette recette d'un type appelé Lou.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_01_02");//Trouvez-moi les ingrédients et allez me distiller l'alcool dans le laboratoire d'alchimie. Ensuite, je vous préparerai une sauce pour accompagner votre viande. Qu'est-ce que vous en dites ?
	
	Info_AddChoice (DIA_Addon_Snaf_Cook,"Je n'ai pas le temps.",DIA_Addon_Snaf_Cook_NO);
	Info_AddChoice (DIA_Addon_Snaf_Cook,"Bien, je m'en occuperai.",DIA_Addon_Snaf_Cook_YES);
	
};
FUNC VOID DIA_Addon_Snaf_Cook_NO ()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");//Je n'ai pas de temps pour cela.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");//Alors laissez tomber.
	
	MIS_SnafHammer = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
};
FUNC VOID DIA_Addon_Snaf_Cook_YES()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");//Bien, je m'en occupe.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");//Parfait. Voici la recette !
	
	B_GiveInvItems (self, other,ItWr_Addon_Lou_Rezept,1);
	MIS_SnafHammer = LOG_RUNNING;
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
	
	Log_CreateTopic (Topic_Addon_Hammer,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Hammer,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Hammer,"Snaf a besoin d'alcool pour sa recette. Il m'a donné la recette d'un breuvage appelé 'Liqueur du Marteau', que je pourrai préparer sur la table du laboratoire.");
};
//---------------------------------------------------------------------
//	Info Booze
//---------------------------------------------------------------------
var int Snaf_Tip_Kosten;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Booze   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 3;
	condition   = DIA_Addon_Snaf_Booze_Condition;
	information = DIA_Addon_Snaf_Booze_Info;
	permanent   = FALSE;
	description = "J'ai distillé l'alcool !";
};
FUNC INT DIA_Addon_Snaf_Booze_Condition()
{	
	if (Npc_HasItems (other, ItFo_Addon_LousHammer) >= 1)
	&& (MIS_SnafHammer == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Booze_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Booze_15_00");//J'ai distillé l'alcool !

	//PATCH N.B.
	B_GiveInvItems (other, self, ItFo_Addon_LousHammer, 1);

	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_01");//Excellent, alors je vais pouvoir terminer la cuisson du plat !
	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_02");//Tenez, vous pouvez en goûter une part dès maintenant. Ça vous donnera des forces.
	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_03");//Oh, et si je peux encore vous être utile... Pour vous, toutes les informations seront gratuites, désormais.
	Snaf_Tip_Kosten = 0;
	B_GiveInvItems (self, other, ItFo_Addon_FireStew,1);
	MIS_SnafHammer = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Loushammer);
};

//---------------------------------------------------------------------
//	ATTENTAT
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Attentat   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 4;
	condition   = DIA_Addon_Snaf_Attentat_Condition;
	information = DIA_Addon_Snaf_Attentat_Info;
	permanent   = FALSE;
	description = "Que savez-vous de l'attaque ?";
};
FUNC INT DIA_Addon_Snaf_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_15_00"); //Que savez-vous de l'attaque ?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_01_01"); //Le complot contre Esteban ?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_01_02"); //Vous savez comment ça se passe. Le tavernier entend tout, mais ne prend jamais parti...
	
	Info_ClearChoices (DIA_Addon_Snaf_Attentat);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"Dites-moi au moins à qui je peux m'adresser.",DIA_Addon_Snaf_Attentat_GoWhere);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"Si vous étiez à ma place, qu'est-ce que vous feriez ?",DIA_Addon_Snaf_Attentat_YouBeingMe);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"Alors vous savez quelque chose ?",DIA_Addon_Snaf_Attentat_Something);	
};
	
func void DIA_Addon_Snaf_Attentat_Something()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_Something_15_00"); //Alors vous savez quelque chose ?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_Something_01_01"); //Je n'ai pas dit ÇA.
};
func void DIA_Addon_Snaf_Attentat_GoWhere()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_GoWhere_15_00"); //Dites-moi au moins à qui je peux m'adresser.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_GoWhere_01_01"); //Oh, bon sang ! Qu'est-ce que ça change ! Laissez tomber !
};
func void DIA_Addon_Snaf_Attentat_YouBeingMe()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_YouBeingMe_15_00"); //Si vous étiez à ma place, qu'est-ce que vous feriez ?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_01"); //Je penserais à ce que je sais et au commanditaire de l'attaque.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_02"); //Premièrement, c'était certainement l'un des bandits, ce qui signifie qu'il est ici, dans le camp.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_03"); //Deuxièmement, s'il est ici dans le camp, cela signifie qu'il vous observe.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_04"); //Troisièmement, aussi longtemps qu'il croira que vous êtes du côté d'Esteban, il ne se dévoilera jamais à vous.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_05"); //Par conséquent, la question INTERESSANTE est la suivante : quelles sont vos chances d'identifier votre homme ?

	Info_ClearChoices (DIA_Addon_Snaf_Attentat);
};

//---------------------------------------------------------------------
//	Info Abrechnung
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_Abrechnung   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 5;
	condition   = DIA_Addon_Snaf_Abrechnung_Condition;
	information = DIA_Addon_Snaf_Abrechnung_Info;
	permanent   = TRUE;
	description = "Quelles sont mes chances d'identifier mon homme ?";
};
FUNC INT DIA_Addon_Snaf_Abrechnung_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Snaf_Attentat)
	&& (MIS_JUDAS == LOG_RUNNING)
	&& (Huno_zuSnaf == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Abrechnung_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Abrechnung_15_00"); //Quelles sont mes chances d'identifier mon homme ?
	AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_01"); //Hmmm...
	
	if (Senyan_Erpressung == LOG_RUNNING) 
	&& (!Npc_IsDead (Senyan))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_02"); //Elles sont plutôt minces. Certaines personnes ont déjà remarqué que vous êtes proche de Senyan.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_03"); //Vous devrez couper les ponts avec lui. Sinon, vous n'aurez jamais la moindre chance de trouver le commanditaire de l'attaque.
		
		if (Snaf_Tip_Senyan == FALSE)
		{
			B_LogEntry (Topic_Addon_Senyan,"Je devrais couper les ponts avec Senyan. En revanche, je n'ai pas intérêt à l'attaquer directement... il faudrait que je parle avec lui, avant.");
			Snaf_Tip_Senyan = TRUE;
		};
	}
	else if (Npc_IsDead(Senyan))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_04"); //Vous avez éliminé l'un des gars d'Esteban. L'homme que vous recherchez croira maintenant que vous êtes de son côté.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_05"); //Mais ce n'est pas pour ça qu'il se dévoilera à vous. Vous allez devoir en découvrir davantage à son sujet.
	}
	else if (Finn_Petzt == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_06"); //Finn semble vraiment nerveux, depuis que vous lui avez parlé.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_07"); //Et tout le monde ici sait qu'il est en bons termes avec Esteban.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_08"); //Ça signifie que vous lui avez sûrement appris quelque chose qu'il ne voulait pas entendre.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_09"); //Ça fera plaisir à la personne que vous recherchez...
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_10"); //Toutefois, il y a des risques qu'il aille voir Esteban avec cette information - (ironiquement) mais cela, vous le savez déjà...
	}
	if (Finn_TellAll == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_11"); //On raconte que vous avez informé Finn que vous travailliez pour Esteban...
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_12"); //Je ne sais pas vraiment ce que vous avez en tête, mais l'homme que vous recherchez se montrera certainement plus prudent, désormais.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_13"); //Pour l'instant, toutes vos choix sont encore intacts.
	};
	
	//------------------- Abschied ----------------------------------
	if (Snaf_Rechnung == FALSE)
	{
		if (Snaf_Einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_Snaf_Abschied_15_14"); //Merci.
			AI_Output (self, other, "DIA_Addon_Snaf_Abschied_01_15"); //(sèchement) Hé ! Je ne vous ai rien dit que vous ne sachiez pas déjà, compris ?
			
			Snaf_Einmal = TRUE;
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Snaf_Abschied_15_16"); //Je le savais...
			AI_Output (self, other, "DIA_Addon_Snaf_Abschied_01_17"); //Exactement.
		};
	};
};

//---------------------------------------------------------------------
//	HOCH
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_HOCH (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 6;
	condition   = DIA_Addon_Snaf_HOCH_Condition;
	information = DIA_Addon_Snaf_HOCH_Info;
	permanent   = FALSE;
	description = "Huno dit que je devrais y rencontrer quelqu'un...";
};
FUNC INT DIA_Addon_Snaf_HOCH_Condition()
{	
	if (Huno_zuSnaf == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_HOCH_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_HOCH_15_00"); //Huno m'envoie.
	AI_Output (self, other, "DIA_Addon_Snaf_HOCH_01_01"); //Il semblerait que vous ayez trouvé votre homme...
	AI_Output (self, other, "DIA_Addon_Snaf_HOCH_01_02"); //Montez à l'étage, quelqu'un vous attend.
		
	AI_StopProcessInfos (self);
	AI_Teleport (Fisk,"BL_INN_UP_06");
	B_StartotherRoutine (Fisk,"MEETING");

	B_GivePlayerXP (XP_Addon_Auftraggeber);
};

//---------------------------------------------------------------------
//	People
//---------------------------------------------------------------------
var int Kosten_Einmal;
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_People (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 6;
	condition   = DIA_Addon_Snaf_People_Condition;
	information = DIA_Addon_Snaf_People_Info;
	permanent   = TRUE;
	description = "Que pensent les gens ici d'Esteban ?";
};
FUNC INT DIA_Addon_Snaf_People_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Snaf_Attentat))
	&& (!Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_People_Info()
{
	
	AI_Output (other, self, "DIA_Addon_Snaf_People_15_00"); //Que pensent les gens ici d'Esteban ?
	AI_Output (self, other, "DIA_Addon_Snaf_People_01_01"); //Il va falloir être un peu plus précis...
	if (Kosten_Einmal == FALSE)
	&& (MIS_SnafHammer != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_01_02"); //Chaque information vous coûtera...
		AI_Output (other, self, "DIA_Addon_Snaf_People_15_03"); //Combien ?
		AI_Output (self, other, "DIA_Addon_Snaf_People_01_04"); //10 pièces d'or !
		
		Snaf_Tip_Kosten = 10;
		Kosten_Einmal = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Snaf_People);
	Info_AddChoice (DIA_Addon_Snaf_People, DIALOG_BACK, DIA_Addon_Snaf_People_BACK);
	Info_AddChoice (DIA_Addon_Snaf_People, "Paul", DIA_Addon_Snaf_People_Paul);
	Info_AddChoice (DIA_Addon_Snaf_People, "Huno", DIA_Addon_Snaf_People_Huno);
	Info_AddChoice (DIA_Addon_Snaf_People, "Fisk", DIA_Addon_Snaf_People_Fisk);
	Info_AddChoice (DIA_Addon_Snaf_People, "Emilio", DIA_Addon_Snaf_People_Emilio);
	if (!Npc_IsDead (Senyan))
	{
		Info_AddChoice (DIA_Addon_Snaf_People, "Senyan", DIA_Addon_Snaf_People_Senyan);
	};
	Info_AddChoice (DIA_Addon_Snaf_People, "Lennar", DIA_Addon_Snaf_People_Lennar);
	Info_AddChoice (DIA_Addon_Snaf_People, "Finn", DIA_Addon_Snaf_People_Finn);
};
// --------------------------------------------
	func void B_Addon_Snaf_NotEnough()
	{
		AI_Output (self, other, "DIA_Addon_Snaf_NotEnough_01_00"); //Vous n'avez pas assez d'or, mon garçon !
	};

FUNC VOID DIA_Addon_Snaf_People_BACK()
{
	Info_ClearChoices (DIA_Addon_Snaf_People);
};
FUNC VOID DIA_Addon_Snaf_People_Paul()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Paul_15_00"); //Et Paul ?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Paul_01_01"); //Je crois qu'il n'apprécie pas particulièrement Esteban. Et puisqu'il a travaillé pour Huno, il n'entrera jamais dans la mine.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Huno()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Huno_15_00"); //Et que pense Huno d'Esteban ?
	AI_Output (self, other, "DIA_Addon_Snaf_People_Huno_01_01"); //Ah ! Huno... Je ne sais presque rien de lui.
	AI_Output (self, other, "DIA_Addon_Snaf_People_Huno_01_02"); //(sourit) Cette information est gratuite, bien évidemment.
};
FUNC VOID DIA_Addon_Snaf_People_Fisk()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Fisk_15_00"); //Et Fisk ?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Fisk_01_01"); //Fisk est Fisk. Il verse sa part à Esteban et distribue les marchandises qu'il se procure essentiellement auprès des pirates.
		AI_Output (self, other, "DIA_Addon_Snaf_People_Fisk_01_02"); //Je ne crois pas qu'il apprécie réellement Esteban.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Emilio()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Emilio_15_00"); //Et Emilio... que pense-t-il d'Esteban ?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Emilio_01_01"); //Je ne pense pas qu'il aille un jour fleurir la tombe d'Esteban, si vous voyez ce que je veux dire...
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Senyan()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Senyan_15_00"); //Et à propos de Senyan ?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Senyan_01_01"); //Senyan est l'un des hommes d'Esteban. Cela fait un moment qu'il travaille pour lui.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Lennar()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Lennar_15_00"); //Que pense Lennar d'Esteban ?
	AI_Output (self, other, "DIA_Addon_Snaf_People_Lennar_01_01"); //En réalité, je crois que Lennar ne pense pas DU TOUT.
};

func VOID DIA_Addon_Snaf_People_Finn()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Finn_15_00"); //Et Finn ?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Finn_01_01"); //Un bon mineur. Il a le flair pour repérer les pépites d'or.
		AI_Output (self, other, "DIA_Addon_Snaf_People_Finn_01_02"); //Esteban l'apprécie pour cette raison. Je crois qu'ils sont en assez bons termes.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

//---------------------------------------------------------------------
//	Und du?
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_Himself (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 7;
	condition   = DIA_Addon_Snaf_Himself_Condition;
	information = DIA_Addon_Snaf_Himself_Info;
	permanent   = FALSE;
	description = "Et que pensez-vous d'Esteban, vous ?";
};
FUNC INT DIA_Addon_Snaf_Himself_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Snaf_Attentat))
	&& (!Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Himself_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Himself_15_00"); //Et que pensez-vous d'Esteban, vous ?
	AI_Output (self, other, "DIA_Addon_Snaf_Himself_01_01"); //Ceux qui parlent de lui ne tardent pas à mourir...
	//AI_Output (other, self, "DIA_Addon_Snaf_Himself_15_02"); //Und?
	//AI_Output (self, other, "DIA_Addon_Snaf_Himself_01_03"); //Ende der Geschichte. //wav fehlt
};

//---------------------------------------------------------------------
//	PERM
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_PERM (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 8;
	condition   = DIA_Addon_Snaf_PERM_Condition;
	information = DIA_Addon_Snaf_PERM_Info;
	permanent   = TRUE;
	description = "Comment vont les affaires ?";
};
FUNC INT DIA_Addon_Snaf_PERM_Condition()
{	
	if (Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_PERM_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_PERM_15_00"); //Comment vont les affaires ?
	AI_Output (self, other, "DIA_Addon_Snaf_PERM_01_01"); //Bien ! La mort d'Esteban incite pas mal de personnes à venir faire la fête ici...
};


