///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Farim_EXIT   (C_INFO)
{
	npc         = VLK_4301_Addon_Farim;
	nr          = 999;
	condition   = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Farim_PICKPOCKET (C_INFO)
{
	npc			= VLK_4301_Addon_Farim;
	nr			= 900;
	condition	= DIA_Addon_Farim_PICKPOCKET_Condition;
	information	= DIA_Addon_Farim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Farim_PICKPOCKET_Condition()
{
	C_Beklauen (20, 11);
};
 
FUNC VOID DIA_Addon_Farim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
	
func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Hallo		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Hallo_Condition;
	information	 = 	DIA_Addon_Farim_Hallo_Info;

	description	 = 	"Vous êtes pêcheur ?";
};

func int DIA_Addon_Farim_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Hallo_15_00"); //Vous êtes pêcheur ?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_01"); //(cynique) Comment avez-vous deviné ?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_02"); //Vous ne pouvez pas me laisser tranquille ?
	if (hero.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_02"); //Ça n'a rien de personnel mais j'ai eu des problèmes avec la milice.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_03"); //Ça n'a rien de personnel mais j'ai eu des problèmes récemment. C'est la milice.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MilizProbs
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MilizProbs		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MilizProbs_Condition;
	information	 = 	DIA_Addon_Farim_MilizProbs_Info;

	description	 = 	"Des problèmes avec la milice ?";
};

func int DIA_Addon_Farim_MilizProbs_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MilizProbs_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MilizProbs_15_00"); //Des problèmes avec la milice ?
	if (((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_01"); //Ces salopards n'arrêtent pas de venir ici pour se servir.
	};
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_02"); //La semaine dernière, ils ont pris toute ma pêche. 'C'est pour la bonne cause', ils ont dit.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_03"); //Je sais que chacun doit se débrouiller depuis que les fermiers ne vendent plus rien.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_04"); //Et bien sûr, les gens ont faim. Pas étonnant qu'ils viennent voler mes poissons sous mon nez.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_05"); //Mais s'ils continuent, je n'aurai même plus de quoi me nourrir.
	
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Donnez-moi tous vos poissons.", DIA_Addon_Farim_MilizProbs_klauen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Peut-être puis-je vous aider ?", DIA_Addon_Farim_MilizProbs_helfen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "En avez-vous parlé aux paladins ?", DIA_Addon_Farim_MilizProbs_paladine );
};
func void DIA_Addon_Farim_MilizProbs_paladine ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_paladine_15_00"); //En avez-vous parlé aux paladins ?
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_paladine_11_01"); //(rit) Vous plaisantez ? Vous croyez vraiment qu'ils s'intéresseront aux problèmes avec la milice d'un pauvre diable comme moi ?
};
var int Farim_PissedOff;
func void DIA_Addon_Farim_MilizProbs_klauen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_klauen_15_00"); //Donnez-moi tous vos poissons.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_01"); //(en colère) Je le savais ! Encore un de ces salopards !
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_02"); //J'ai bien peur que vous n'arriviez trop tard. Vos amis sont venus hier et ils ont tout emporté.
	};
	
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_04"); //Vous n'avez plus qu'à vous en aller.
	Farim_PissedOff = TRUE;
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
};
func void DIA_Addon_Farim_MilizProbs_helfen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_00"); //Je peux peut-être vous aider.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_02"); //Je ne sais pas. Il faudrait que vous connaissiez quelqu'un dans la milice qui ait des relations chez les paladins.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_03"); //Il y a peu de chance que les paladins achètent mon poisson.
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_04"); //Je vais voir ce que je peux faire.
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	
	Log_CreateTopic (TOPIC_Addon_FarimsFish, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_FarimsFish,"Farim le pêcheur a un problème avec la milice. Ils lui prennent tant de poisson qu'il ne lui reste plus de quoi vivre. Si je veux l'aider, je dois trouver une personne dans la milice capable d'influencer les paladins."); 
		
	MIS_Addon_Farim_PaladinFisch = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MartinHelps
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MartinHelps		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MartinHelps_Condition;
	information	 = 	DIA_Addon_Farim_MartinHelps_Info;

	description	 = 	"Je sais comment résoudre votre problème avec la milice.";
};

func int DIA_Addon_Farim_MartinHelps_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Martin_KnowsFarim == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MartinHelps_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_00"); //Je sais comment résoudre votre problème avec la milice.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_01"); //Ah, et comment allez-vous faire ?

	if (hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)
	{
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_02"); //Je ne suis pas ici assez souvent pour protéger votre pêche.
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_03"); //Mais je connais quelqu'un qui peut le faire.
	};
	
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_04"); //Martin, le maître du cellier des paladins, veut entendre votre histoire de milice et de poissons.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_05"); //Vous croyez qu'il pourra faire en sorte que la milice me laisse tranquille ?
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_06"); //C'est ce qu'il a dit.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_07"); //Excellent. Merci beaucoup. Je n'ai pas grand-chose mais attendez
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_08"); //J'ai trouvé cette étrange pierre bleue sur une des îles au large de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_09"); //Je ne pense pas qu'elle ait une grande valeur, mais quelqu'un comme vous saura sûrement en faire bon usage.
		
	B_GiveInvItems (self, other, ItMi_Aquamarine, 1);		
	
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Farim_PaladinFisch);
};

///////////////////////////////////////////////////////////////////////
//	Info Landstreicher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Landstreicher		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Landstreicher_Condition;
	information	 = 	DIA_Addon_Farim_Landstreicher_Info;

	description	 = 	"Pouvez-vous me dire quelque chose sur les disparus ?";
};

func int DIA_Addon_Farim_Landstreicher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info ()
{
	AI_Output (other, self, "DIA_Addon_Farim_Landstreicher_15_01"); //Savez-vous quelque chose à propos des personnes disparues ?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_02"); //Mon ami William s'est mis à fréquenter des personnes peu recommandables. Et où ça l'a mené ?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_03"); //Un jour, il n'est pas venu travailler et on n'a plus eu de nouvelles de lui.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_William		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_William_Condition;
	information	 = 	DIA_Addon_Farim_William_Info;

	description	 = 	"Votre ami William a disparu ?";
};

func int DIA_Addon_Farim_William_Condition ()
{
	if (SCKnowsFarimAsWilliamsFriend == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_William_15_00"); //Votre ami William a disparu ?
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_01"); //C'est ça. C'est un pêcheur mais il a des rêves de grandeur, si vous voulez savoir.
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_02"); //Il aurait dû se tenir à l'écart de ces types là.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 
	
	Info_ClearChoices	(DIA_Addon_Farim_William);	
	Info_AddChoice	(DIA_Addon_Farim_William, "Qui sont ces types ?", DIA_Addon_Farim_William_typen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Il va refaire surface.", DIA_Addon_Farim_William_auftauchen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Qu'est-ce qu'il mijotait ?", DIA_Addon_Farim_William_WasGemacht );
	Info_AddChoice	(DIA_Addon_Farim_William, "Quand l'avez-vous vu pour la dernière fois ?", DIA_Addon_Farim_William_WannWeg );
};
func void DIA_Addon_Farim_William_WasGemacht ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WasGemacht_15_00"); //Qu'est-ce qu'il mijotait ?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_01"); //Il magouillait avec ces escrocs.
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_02"); //Il faisait de la contrebande avec ces salopards.
	//AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_03"); //Aber seit die Handelschiffe nicht mehr hier in Khorinis anlegen, weiß ich nicht, was er stattdessen für sie gemacht hat.
};
func void DIA_Addon_Farim_William_typen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_typen_15_00"); //Qui sont ces types ?
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_01"); //Je ne sais pas qui ils sont ni ce qu'ils font à Khorinis.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_02"); //Je connais seulement l'endroit où William les rencontrait.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_03"); //J'y ai vu William un jour par hasard où je pêchais dans la baie.
	
	Info_AddChoice	(DIA_Addon_Farim_William, "Où est cet endroit ?", DIA_Addon_Farim_William_Wo );
};
func void DIA_Addon_Farim_William_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Wo_15_00"); //Où est cet endroit ?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_01"); //Il y a une baie en face du port, au nord d'ici.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_02"); //On ne peut l'atteindre qu'en bateau ou à la nage.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_03"); //Il y a une plage et un petit campement de pêcheurs. C'est là que je les ai vus.
	self.flags = 0;	//Joly: hat seine Pflicht getan

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Farim le pêcheur pleure la mort de son copain William. Farim m'a dit que William partait souvent retrouver des pirates dans une baie au nord du port."); 

	Info_AddChoice	(DIA_Addon_Farim_William, "Je crois que j'en sais assez.", DIA_Addon_Farim_William_Tschau );
};
func void DIA_Addon_Farim_William_WannWeg ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WannWeg_15_00"); //Quand l'avez-vous vu pour la dernière fois ?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WannWeg_11_01"); //Il y a quelques jours.

	Info_AddChoice	(DIA_Addon_Farim_William, "Peut-être est-il simplement parti pêcher en mer ?", DIA_Addon_Farim_William_Fischen );
};
func void DIA_Addon_Farim_William_Fischen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Fischen_15_00"); //Il est peut-être sorti en mer pour pêcher ?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Fischen_11_01"); //C'est peu probable. Son bateau est toujours à quai.
};
func void DIA_Addon_Farim_William_auftauchen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_auftauchen_15_00"); //Il va refaire surface.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_01"); //Je ne crois pas. Ça fait trop longtemps qu'il a disparu.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_02"); //J'ai peur de ramener son corps dans mes filets un de ces jours.
};
func void DIA_Addon_Farim_William_Tschau ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Tschau_15_00"); //Je crois que j'en sais assez.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Tschau_11_01"); //Ne vous fatiguez pas. Vous ne le retrouverez pas.
	Info_ClearChoices	(DIA_Addon_Farim_William);	
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Perm		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Farim_Perm_Condition;
	information	 = 	DIA_Addon_Farim_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"Alors, ça mord ?";
};

func int DIA_Addon_Farim_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Perm_15_00"); //Alors, ça mord ?

	if (Farim_PissedOff == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_01"); //Arrêtez de faire semblant de vous intéresser.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_02"); //J'ai connu des jours meilleurs. Trop peu pour vivre mais trop pour mourir.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_WilliamReport (C_INFO)
{
	npc		 	= VLK_4301_Addon_Farim;
	nr		 	= 1;
	condition	= DIA_Addon_Farim_WilliamReport_Condition;
	information	= DIA_Addon_Farim_WilliamReport_Info;

	important 	= TRUE;
};

func int DIA_Addon_Farim_WilliamReport_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_William))
	{
		if (Npc_HasItems (other, ITWr_Addon_William_01) > 0)
		|| (Saturas_AboutWilliam == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info ()
{
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_01"); //Vous revoilà !
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_02"); //Avez-vous des nouvelles de mon ami William ?
	AI_Output (other, self, "DIA_Addon_Farim_Add_15_02"); //Il est mort.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_03"); //(soupire) Je m'en doutais.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_04"); //Merci d'être revenu pour me prévenir.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_05"); //Je vais aller à la taverne boire sa part de notre dernière pêche - c'est ce qu'il aurait voulu que je fasse
};






