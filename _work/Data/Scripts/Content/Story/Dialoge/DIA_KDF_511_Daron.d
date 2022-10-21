FUNC VOID B_DaronSegen ()
{
	Daron_Segen = TRUE;

	var string concatText;
	
	var int Bonus_1;
	var int Bonus_2;
	var int Bonus_3;

	if (Daron_Spende < 100)
	{
		if other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX]
		{
			other.attribute [ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
		};
	}	 	
	else if (Daron_Spende < 250)
	&&		(Bonus_1 == FALSE)
	{
		B_RaiseAttribute (other, ATR_MANA_MAX, 2);
		
		other.attribute[ATR_MANA] =  other.attribute[ATR_MANA_MAX];
				
		Bonus_1 = TRUE;
	}
	else if (Daron_Spende < 500)
	&&		(Bonus_2 == FALSE)
	{
		B_GivePlayerXP (XP_Ambient);
		Bonus_2 = TRUE;
	}
	else if (Daron_Spende >= 750) 	
	&&		(Daron_Spende < 1000) 	
	&& 		(Bonus_3 == FALSE)
	{
		other.lp = (other.lp + 1);
		
		concatText = ConcatStrings(PRINT_LearnLP, IntToString(1));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);
		Bonus_3 = TRUE;
	}
	else 
	{
		other.attribute[ATR_HITPOINTS] =  other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] =  other.attribute[ATR_MANA_MAX];

		other.attribute[ATR_HITPOINTS_MAX] = (other.attribute[ATR_HITPOINTS_MAX] + 5);
		
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX, IntToString(5));
		PrintScreen	(concatText, -1, -1, FONT_Screen, 2);
	};
};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Daron_EXIT(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 999;
	condition	= DIA_Daron_EXIT_Condition;
	information	= DIA_Daron_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Daron_EXIT_Condition()
{
	
	return TRUE;
};
FUNC VOID DIA_Daron_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				  Hallo 
// ************************************************************
INSTANCE DIA_Daron_Hallo(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_Hallo_Condition;
	information	= DIA_Daron_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Daron_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Daron_Hallo_10_00");//Que puis-je faire pour vous ? Recherchez-vous l'apaisement spirituel ?
	AI_Output (self, other,"DIA_Daron_Hallo_10_01");//Voulez-vous adresser une prière à notre seigneur Innos ou faire une offrande à notre église ?
};

// ************************************************************
// 			  	Oberes Viertel - Paladine 
// ************************************************************
INSTANCE DIA_Daron_Paladine(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_Paladine_Condition;
	information	= DIA_Daron_Paladine_Info;
	permanent	= FALSE;
	description = "Je dois parler aux paladins...";
};                       
FUNC INT DIA_Daron_Paladine_Condition()
{	
	if (other.guild != GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Daron_Paladine_15_00");//Je dois parler aux paladins. Pouvez-vous m'aider ?
	AI_Output (self, other,"DIA_Daron_Paladine_10_01");//Il faut que vous ayez accès au haut quartier de la ville. Mais ce n'est permis qu'aux citoyens et aux membres de la garde.
	AI_Output (self, other,"DIA_Daron_Paladine_10_02");//Et, bien entendu, à nous autres, les Magiciens du feu.
	AI_Output (other, self,"DIA_Daron_Paladine_15_03");//Comment puis-je devenir Magicien du feu ?
	AI_Output (self, other,"DIA_Daron_Paladine_10_04");//Vous devez rejoindre notre ordre en tant que novice. Une fois que vous nous aurez servi pendant quelque temps, vous serez peut-être accepté au sein des magiciens.
	AI_Output (self, other,"DIA_Daron_Paladine_10_05");//Cependant, c'est un long chemin nécessitant du travail et beaucoup d'études.
};

// ************************************************************
// 			  				About Segen 
// ************************************************************
INSTANCE DIA_Daron_AboutSegen (C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_AboutSegen_Condition;
	information	= DIA_Daron_AboutSegen_Info;
	permanent	= FALSE;
	description = "Je suis venu solliciter votre bénédiction !";
};                       
FUNC INT DIA_Daron_AboutSegen_Condition()
{	
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Player_IsApprentice == APP_NONE)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_AboutSegen_Info()
{	
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_00"); //Je suis venu pour obtenir votre bénédiction.
	AI_Output (self, other,"DIA_Daron_AboutSegen_10_01"); //C'est une bonne chose. Vous voudrez donc probablement faire un don en or à la sainte église d'Innos, n'est-ce pas ?
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_02"); //En fait, je voudrais votre bénédiction pour pouvoir devenir apprenti dans le bas quartier de la ville...
	if (Daron_Segen == TRUE)
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_03"); //Mais je vous ai déjà donné ma bénédiction, mon fils.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_04"); //Qu'Innos soit avec vous mon fils !
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_05"); //Mais, mon fils ! Sans une modeste offrande à l'église, il m'est impossible de vous bénir.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_06"); //Comment puis-je savoir autrement que vous ne nourrissez que de bonnes intentions envers la sainte église d'Innos ?
	};
};

// ************************************************************
// 			  		Spenden
// ************************************************************
INSTANCE DIA_Daron_Spenden(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 3;
	condition	= DIA_Daron_Spenden_Condition;
	information	= DIA_Daron_Spenden_Info;
	permanent	= FALSE;
	description	= "A combien s'élève généralement une offrande dans le coin ?";
};                       
FUNC INT DIA_Daron_Spenden_Condition()
{	if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spenden_Info()
{	
	AI_Output (other, self,"DIA_Daron_Spenden_15_00");//A combien se monte généralement une offrande ?
	AI_Output (self, other,"DIA_Daron_Spenden_10_01");//Eh bien, cela dépend de quel pourcentage de votre fortune vous voulez donner. Laissez-moi voir combien vous avez.
	AI_Output (self, other,"DIA_Daron_Spenden_10_02");//(il regarde dans la bourse) Hum, hum...
	
	if (Npc_HasItems (other, ItMi_Gold) < 10)
	{
		AI_Output (self, other,"DIA_Daron_Spenden_10_03");//Hum, vous êtes pauvre, n'est-ce pas ? Gardez le peu que vous avez.
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, le Magicien du feu, ne m'a pas accordé sa bénédiction. Je suppose que cela signifie que je dois réunir de l'or et le lui donner.");
		};
	}
	else //Gold >= 10
	{
		if (Npc_HasItems (other, ItMi_Gold) < 50)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_04");//Vous n'avez pas grand-chose mais vous n'êtes pas pauvre. 10 pièces d'or pour Innos, nous vivons modestement.
			B_GiveInvItems (other, self, ItMi_Gold, 10);
			
		}
		else if (Npc_HasItems (other, ItMi_Gold) < 100)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_05");//Vous avez plus de 50 pièces d'or. Donnez-en 25 à Innos et recevez ma bénédiction.
			B_GiveInvItems (other, self, ItMi_Gold, 25);
		}
		else
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_06");//Vous avez plus de cent pièces d'or. Le Seigneur Innos a dit, 'Donnez si vous avez'.
			AI_Output (self, other,"DIA_Daron_Spenden_10_07");//L'église accepte votre généreuse offrande.
			B_GiveInvItems (other, self, ItMi_Gold, 50);
			
		};
		
		AI_Output (self, other,"DIA_Daron_Spenden_10_08");//Je vous bénis au nom d'Innos. Car Il est la lumière et la droiture.
		Daron_Segen = TRUE;
		B_GivePlayerXP (XP_InnosSegen);
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, le Magicien du feu, m'a accordé sa bénédiction.");
		};
	};
};

// ************************************************************
// 			  Wo kommst du her?
// ************************************************************
INSTANCE DIA_Daron_Woher(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Woher_Condition;
	information	= DIA_Daron_Woher_Info;
	permanent	= FALSE;
	description	= "D'où venez-vous ?";
};                       
FUNC INT DIA_Daron_Woher_Condition()
{	
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Woher_Info()
{	
	AI_Output (other, self,"DIA_Daron_Woher_15_00");//D'où venez-vous ?
	AI_Output (self, other,"DIA_Daron_Woher_10_01");//Je viens du monastère des magiciens, dans les montagnes.
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other,"DIA_Daron_Woher_10_02");//Ici nous acceptons tous ceux qui ont le cœur pur et qui souhaitent servir le tout puissant Seigneur Innos.
	};
};

// ************************************************************
// 			Innos
// ************************************************************
INSTANCE DIA_Daron_Innos(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Innos_Condition;
	information	= DIA_Daron_Innos_Info;
	permanent	= FALSE;
	description	= "Parlez-moi d'Innos.";
};                       
FUNC INT DIA_Daron_Innos_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_DJG)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Innos_Info()
{	
	AI_Output (other, self,"DIA_Daron_Innos_15_00");//Parlez-moi d'Innos.
	AI_Output (self, other,"DIA_Daron_Innos_10_01");//Innos, notre dieu tout-puissant, est la lumière et le feu.
	AI_Output (self, other,"DIA_Daron_Innos_10_02");//Il a choisi les hommes pour être ses instruments et il leur a donné la magie et les lois.
	AI_Output (self, other,"DIA_Daron_Innos_10_03");//Nous agissons en Son nom. Nous faisons justice selon Sa volonté et nous prêchons Sa sagesse.
};

// ************************************************************
// 			  Kloster
// ************************************************************
INSTANCE DIA_Daron_Kloster(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Kloster_Condition;
	information	= DIA_Daron_Kloster_Info;
	permanent	= FALSE;
	description	= "Dites-m'en plus au sujet du monastère.";
};                       
FUNC INT DIA_Daron_Kloster_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	|| Npc_KnowsInfo (other, DIA_Daron_Paladine)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_KDF) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Kloster_Info()
{	
	AI_Output (other, self,"DIA_Daron_Kloster_15_00");//Dites-m'en plus au sujet du monastère.
	AI_Output (self, other,"DIA_Daron_Kloster_10_01");//Nous apprenons à nos étudiants toutes les formes de magie. Mais les arts des Magiciens du feu ne se limitent pas à ça.
	AI_Output (self, other,"DIA_Daron_Kloster_10_02");//Nous maîtrisons également l'alchimie et la création de puissantes runes.
	AI_Output (self, other,"DIA_Daron_Kloster_10_03");//De plus, nous produisons un excellent vin.
};

// ************************************************************
// 			 Stadt
// ************************************************************
INSTANCE DIA_Daron_Stadt(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 99;
	condition	= DIA_Daron_Stadt_Condition;
	information	= DIA_Daron_Stadt_Info;
	permanent	= FALSE;
	description	= "Que faites-vous en ville ?";
};                       
FUNC INT DIA_Daron_Stadt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Stadt_Info()
{	
	AI_Output (other, self,"DIA_Daron_Stadt_15_00");//Que faites-vous en ville ?
	AI_Output (self, other,"DIA_Daron_Stadt_10_01");//J'ai des affaires à régler avec les paladins et j'aide la population de mes conseils et de mes paroles rassurantes.
	AI_Output (self, other,"DIA_Daron_Stadt_10_02");//Particulièrement en ces temps difficiles, il est de notre devoir d'être là pour le peuple et d'aider les pauvres.
};

///////////////////////////////////////////////////////////////////////
//	Info GuildHelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_GuildHelp		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Daron_GuildHelp_Condition;
	information	 = 	DIA_Addon_Daron_GuildHelp_Info;

	description	 = 	"J'ai entendu des rumeurs au sujet d'une statuette...";
};

func int DIA_Addon_Daron_GuildHelp_Condition ()
{
	if (MIS_Addon_Vatras_Go2Daron == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Daron_Stadt))
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_GuildHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_00"); //J'ai entendu des rumeurs qui disaient que vous aviez perdu une statuette.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_01"); //Tiens donc ! Cela ne peut venir que de Vatras le Mage de l'eau.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_02"); //Quel est votre problème ?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_03"); //Une stauette de grande valeur a été envoyée du continent à destination du monastère. Mais elle n'est jamais arrivée.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_04"); //Le bateau a été attaqué ?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_05"); //(honteux) Non. Elle est arrivée à Khorinis en parfait état et je m'y suis rendu pour la récupérer.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_06"); //Sur le chemin du retour vers le monastère, une bande de gobelins me l'a prise.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_07"); //(en colère) Ne me regardez pas comme ça. Nous autres magiciens ne sommes que des hommes, vous savez.
	
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	MIS_Addon_Daron_GetStatue = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Vous dites que ce sont les gobelins qui l'ont maintenant ?", DIA_Addon_Daron_GuildHelp_gobbos );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Où avez-vous perdu la statuette ?", DIA_Addon_Daron_GuildHelp_wo );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Pourquoi ne pas avoir essayé de la récupérer ?", DIA_Addon_Daron_GuildHelp_wiederholen );
};

func void DIA_Addon_Daron_GuildHelp_wiederholen ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wiederholen_15_00"); //Pourquoi ne pas avoir essayé de la récupérer ?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wiederholen_10_01"); //Bien sûr que j'ai essayé ! Je l'ai cherchée partout. Peine perdue.
};

func void DIA_Addon_Daron_GuildHelp_gobbos ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_gobbos_15_00"); //Vous dites que ce sont les gobelins qui l'ont maintenant ?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_01"); //Ils l'ont volée avant de s'enfuir dans les buissons.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_02"); //Je ne l'ai jamais retrouvée. Ils l'ont sûrement cachée dans un trou.
};

func void DIA_Addon_Daron_GuildHelp_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wo_15_00"); //Où avez-vous perdu la statuette ?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wo_10_01"); //Sur la route du monastère, près de la taverne d'Orlan.

	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "J'en sais assez. Je vais vous la retrouver.", DIA_Addon_Daron_GuildHelp_auftrag );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "La taverne d'Orlan ? Où est-ce ?", DIA_Addon_Daron_GuildHelp_woTaverne );
};

func void DIA_Addon_Daron_GuildHelp_woTaverne ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_woTaverne_15_00"); //La taverne d'Orlan ? Où est-ce ?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_01"); //Si vous sortez de la ville par cette porte et que vous suivez le chemin, vous arriverez à une maison isolée.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_02"); //C'est la taverne d'Orlan. La 'Harpie Morte'.
};

func void DIA_Addon_Daron_GuildHelp_auftrag ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_auftrag_15_00"); //J'en sais assez. Je vais vous la retrouver.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_auftrag_10_01"); //Qu'Innos vous guide et vous protège des dangers qui vous attendent hors des murs de la ville.
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Daron a été détroussé par des gobelins effrontés. Depuis, il ne parvient pas à retrouver une statuette précieuse qu'il devait apporter au monastère. On raconte que les gobelins se terrent au fond d'un trou près de la Taverne de la la harpie morte."); 
};

///////////////////////////////////////////////////////////////////////
//	Info FoundStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_FoundStatue		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Daron_FoundStatue_Condition;
	information	 = 	DIA_Addon_Daron_FoundStatue_Info;

	description	 = 	"J'ai trouvé votre statuette.";
};

func int DIA_Addon_Daron_FoundStatue_Condition ()
{
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (DIA_Gorax_GOLD_perm == FALSE) 
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_FoundStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_00"); //J'ai trouvé votre statuette.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_01"); //Innos soit loué !
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_02"); //Qu'allez-vous faire maintenant ?
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_03"); //Rien. Elle n'a fait que me porter la poisse.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_04"); //Vous allez la rapporter au monastère pour moi, mon fils.
	if (other.guild == GIL_NONE)
	{
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_05"); //Bien sûr, ils ne vous laisseront pas entrer si vous ne dédiez pas le reste de votre vie au service du monastère.
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_06"); //Mais je suis sûr que cela ne vous dérange pas puisque cela vous permet de me rendre service, n'est-ce pas ?
	};
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_07"); //Qu'Innos vous accompagne, mon fils !
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_ReturnedStatue		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Daron_ReturnedStatue_Condition;
	information	 = 	DIA_Addon_Daron_ReturnedStatue_Info;

	description	 = 	"J'ai apporté la statuette à votre monastère.";
};

func int DIA_Addon_Daron_ReturnedStatue_Condition ()
{
	if (DIA_Gorax_GOLD_perm == TRUE) 
	&& (MIS_Addon_Daron_GetStatue == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_ReturnedStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_ReturnedStatue_15_00"); //J'ai porté votre statuette au monastère. Vous pouvez vous détendre.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_01"); //Voilà une bonne nouvelle. Qu'Innos vous protège.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_02"); //Prenez ceci comme marque de ma reconnaissance, mon fils.
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);
	TOPIC_End_RangerHelpKDF = TRUE;		
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};

// ************************************************************
// 			arm
// ************************************************************
INSTANCE DIA_Daron_arm(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 10;
	condition	= DIA_Daron_arm_Condition;
	information	= DIA_Daron_arm_Info;
	permanent	= FALSE;
	description	= "Je suis pauvre !";
};                       
FUNC INT DIA_Daron_arm_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Stadt)
	&& (Npc_HasItems  (other, ItMi_Gold) < 10) 
	&& (other.guild == GIL_NONE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_arm_Info()
{	
	AI_Output (other, self,"DIA_Daron_arm_15_00");//Je suis pauvre !
	AI_Output (self, other,"DIA_Daron_arm_10_01");//Vous êtes donc démuni. Ce n'est pas étonnant par les temps qui courent. Prenez cet or, cela devrait vous aider.
	AI_Output (self, other,"DIA_Daron_arm_10_02");//Mais vous devriez chercher du travail, alors vous verrez à quelle rapidité vous pouvez gagner de l'or. Alors vous pourrez en faire don à l'église d'Innos comme elle l'a fait pour vous.
	
	B_GiveInvItems (self, other, ItMi_Gold, 20);
};

// ************************************************************
// 			 Immer wieder spenden 
// ************************************************************
INSTANCE DIA_Daron_Spende(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 990;
	condition	= DIA_Daron_Spende_Condition;
	information	= DIA_Daron_Spende_Info;
	permanent	= TRUE;
	description	= "Je veux faire une offrande...";
};      
//-------------------------------------
var int DIA_Daron_Spende_permanent;
//-------------------------------------                 
FUNC INT DIA_Daron_Spende_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Daron_Spende_permanent == FALSE)
	&& Npc_KnowsInfo (other,DIA_Daron_Spenden)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spende_Info()
{	
	
	AI_Output (other, self,"DIA_Daron_Spende_15_00");//Je veux faire une offrande.
	
	Info_ClearChoices (DIA_Daron_Spende);
	
	if (Daron_Spende < 1000)
	{
		Info_AddChoice 	(DIA_Daron_Spende,"Mais je n'ai pas assez d'or...(RETOUR)",DIA_Daron_Spende_BACK);
		
		Info_AddChoice 	(DIA_Daron_Spende,"(50 pièces d'or)",DIA_Daron_Spende_50);
		Info_AddChoice 	(DIA_Daron_Spende,"(100 pièces d'or)",DIA_Daron_Spende_100);
		Info_AddChoice 	(DIA_Daron_Spende,"(200 pièces d'or)",DIA_Daron_Spende_200);
	 }
	 else 
	 {
	 	AI_Output (self, other,"DIA_Daron_Spende_10_01");//Vous m'avez donné plus de 1 000 pièces d'or.
	 	AI_Output (self, other,"DIA_Daron_Spende_10_02");//Que la bénédiction d'Innos soit toujours sur vous.
	 	
	 	DIA_Daron_Spende_permanent = TRUE;	
		B_DaronSegen ();
	 };
};
FUNC VOID DIA_Daron_Spende_BACK()
{
	AI_Output (other, self,"DIA_Daron_Spende_BACK_15_00"); //Mais je n'ai pas assez d'or...
	AI_Output (self, other,"DIA_Daron_Spende_BACK_10_01"); //Ce n'est pas grave, mon fils. Vous pourrez en donner davantage plus tard.
	
	Info_ClearChoices (DIA_Daron_Spende);
};	
//----------------------------
var int Daron_Spende;
//----------------------------
FUNC VOID DIA_Daron_Spende_50()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 50)
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_00");//Je vous bénis au nom d'Innos. Car Il est la lumière et la droiture.
		Daron_Spende = (Daron_Spende + 50);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, le Magicien du feu, m'a accordé sa bénédiction.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_01");//Si vous avez assez d'or, vous pouvez effectuer un don n'importe quand.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_100()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_00");//Innos, Tu es la lumière qui illumine la voie des justes.
		AI_Output (self, other,"DIA_Daron_Spende_100_10_01");//En Ton nom, je bénis cet homme. Qu'il soit baigné de Ta lumière.
		Daron_Spende = (Daron_Spende + 100);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, le Magicien du feu, m'a accordé sa bénédiction.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_02");//Le Seigneur a dit : si tu désires prier, ouvre ton esprit. Et si tu souhaites donner, apporte ton don.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_200()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 200)
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_00");//Innos, bénis cet homme. Que Ta lumière l'éclaire.
		AI_Output (self, other,"DIA_Daron_Spende_200_10_01");//Donne-lui la force d'agir avec justice.
		Daron_Spende = (Daron_Spende + 200);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, le Magicien du feu, m'a accordé sa bénédiction.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_02");//Si vous voulez donner autant d'or, vous devriez l'avoir sur vous.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};


	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Daron_PICKPOCKET (C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 900;
	condition	= DIA_Daron_PICKPOCKET_Condition;
	information	= DIA_Daron_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Daron_PICKPOCKET_Condition()
{
	C_Beklauen (47, 80);
};
 
FUNC VOID DIA_Daron_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Daron_PICKPOCKET);
	Info_AddChoice		(DIA_Daron_PICKPOCKET, DIALOG_BACK 		,DIA_Daron_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Daron_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Daron_PICKPOCKET_DoIt);
};

func void DIA_Daron_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Daron_PICKPOCKET);
};
	
func void DIA_Daron_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Daron_PICKPOCKET);
};










