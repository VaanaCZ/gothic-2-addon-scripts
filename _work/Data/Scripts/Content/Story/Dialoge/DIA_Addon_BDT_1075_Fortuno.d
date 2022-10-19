///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_EXIT   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 999;
	condition   = DIA_Addon_Fortuno_EXIT_Condition;
	information = DIA_Addon_Fortuno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Fortuno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1075_Addon_Fortuno;
	nr			= 900;
	condition	= DIA_Addon_Fortuno_PICKPOCKET_Condition;
	information	= DIA_Addon_Fortuno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Fortuno_PICKPOCKET_Condition()
{
	C_Beklauen (10, 25);
};
 
FUNC VOID DIA_Addon_Fortuno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Fortuno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Fortuno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Fortuno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fortuno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Fortuno_PICKPOCKET);
};
	
func void DIA_Addon_Fortuno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Hi   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_Hi_Condition;
	information = DIA_Addon_Fortuno_Hi_Info;
	permanent   = TRUE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Fortuno_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Fortuno_Geheilt_01 == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_Info()
{
	if (Fortuno_Einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_00");//(inquiet) Un nuage sombre sur la maison... l'élu approche...
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_01");//Avec du sang... pour l'invoquer... lui, celui qui me voit... IL me voit... oh non, partez, par pitié...
		AI_Output (other, self, "DIA_Addon_Fortuno_Hi_15_02");//Tout va bien ?
		Fortuno_Einmal = TRUE;
		
		Log_CreateTopic (Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_RUNNING);
		
		B_LogEntry (Topic_Addon_Fortuno,"Fortuno a perdu l'esprit. Il cherche un 'novice vert'.");
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_03");//Vert... novice vert... je ne le trouve plus...
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Je reviendrai plus tard... (FIN)",DIA_Addon_Fortuno_Hi_BACK);	
	
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Comment puis-je vous aider ?",DIA_Addon_Fortuno_Hi_HILFE);
	
	if Npc_HasItems (other, ItMi_Joint ) >= 1
	{
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Tenez, prenez cette herbe des marais.",DIA_Addon_Fortuno_Hi_JOINT);
	};
	if Npc_HasItems (other, ItMi_Addon_Joint_01 ) >= 1
	{ 
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Tenez, prenez ce novice vert...",DIA_Addon_Fortuno_Hi_GREEN);
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_HILFE_15_00");//Comment puis-je vous aider ?
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_HILFE_13_01");//Le novice... le novice vert aidera le novice...
};
FUNC VOID DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_JOINT_15_00");//Tenez, prenez cette herbe des marais.
	
	if B_GiveInvItems (other, self,ItMi_Joint,1)
	{
		AI_UseItem (self, ItMI_Joint);
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_JOINT_13_01");//Pas vert, pas fort, pas vert, pas fort...
};
FUNC VOID DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_GREEN_15_00");//Tenez, prenez ce novice vert...
	
	if B_GiveInvItems (other, self,ItMi_Addon_Joint_01,1)
	{
		AI_UseItem (self, ItMI_Addon_Joint_01);
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_01");//(reprenant ses esprits) AAAH !!!
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_02");//Ma tête... qui... je suis... Fortuno... que... que m'arrive-t-il ?
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	
	B_GivePlayerXP (XP_Addon_Fortuno_01);
	
	B_LogEntry (Topic_Addon_Fortuno,"Le 'novice vert' a permis à Fortuno de reprendre ses esprits.");
};


///////////////////////////////////////////////////////////////////////
//	Info wer
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_wer   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_wer_Condition;
	information = DIA_Addon_Fortuno_wer_Info;
	permanent   = FALSE;
	description	= "Bien, alors dites-moi ce qu'il vous arrive.";
};
FUNC INT DIA_Addon_Fortuno_wer_Condition()
{	
	if (Fortuno_Geheilt_01 == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_wer_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_00");//Alors, dites-moi ce qu'il vous arrive.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_01");//J'appartenais autrefois à la Confrérie du dormeur. A l'époque, tout allait pour le mieux.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_02");//Certes, nous étions tous des criminels condamnés, mais pour nous autres novices, la vie était facile...
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_03");//Hé, j'étais moi-même prisonnier dans la Vallée des mines. Dites-moi quelque chose que je ne sache pas déjà.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_04");//Je... je ne me souviens de rien. Les ténèbres obscurcissent mon esprit.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_05");//Allez, concentrez-vous. Que s'est-il passé ? Quand êtes-vous revenu à vous ?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_06");//Raven... Je ne me rappelle que de Raven... et de salles sombres.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_07");//Et à propos de Raven ? Que vous a-t-il fait ?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_08");//(soupire) Je suis désolé. C'est comme si mon esprit était retenu captif... Je n'y comprends rien, moi-même...
};
///////////////////////////////////////////////////////////////////////
//	Info FREE
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_FREE   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 5;
	condition   = DIA_Addon_Fortuno_FREE_Condition;
	information = DIA_Addon_Fortuno_FREE_Info;
	permanent   = FALSE;
	description	= "Il doit exister un moyen pour vous rafraîchir la mémoire.";
};
FUNC INT DIA_Addon_Fortuno_FREE_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_wer)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_FREE_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_00");//Il doit exister un moyen pour vous rafraîchir la mémoire.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_01");//Oui... oui, peut-être existe-t-il un moyen.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_02");//Les gourous connaissaient différentes manières d'altérer l'esprit et la volonté des hommes.
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_03");//Vous souvenez-vous de quelque chose en ce sens ?
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_04");//Non, je suis désolé... ces connaissances ont disparu avec les derniers gourous...
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_05");//Dommage... Eh bien, s'il existe une manière de libérer votre esprit, je la découvrirai !

	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	
	B_LogEntry (Topic_Addon_Fortuno,"Fortuno est revenu à lui, mais ne se souvient toujours de rien.");
};
///////////////////////////////////////////////////////////////////////
//	Info Herb
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Herb   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 99;
	condition   = DIA_Addon_Fortuno_Herb_Condition;
	information = DIA_Addon_Fortuno_Herb_Info;
	permanent   = FALSE;
	description	= "Avez-vous besoin d'herbe des marais ?";
};
FUNC INT DIA_Addon_Fortuno_Herb_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Herb_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Herb_15_00");//Avez-vous besoin d'herbe des marais ?
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_01");//Ouiiii, sans aucun doute. Je vous rachèterai toute l'herbe des marais que vous pouvez vous procurer.
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_02");//Je vous en donnerai même un meilleur prix que Fisk.
};
FUNC VOID B_Fortuno_InfoManager()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
	Info_AddChoice (DIA_Addon_Fortuno_Trade,DIALOG_BACK,DIA_Addon_Fortuno_Trade_BACK);
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	{
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(donner toute l'herbe des marais)",DIA_Addon_Fortuno_Trade_all);
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(donner 1 tige d'herbe des marais)",DIA_Addon_Fortuno_Trade_1);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Trade (kein Trade Modul!)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Trade   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 100;
	condition   = DIA_Addon_Fortuno_Trade_Condition;
	information = DIA_Addon_Fortuno_Trade_Info;
	permanent   = TRUE;
	description	= "Je vous apporte de l'herbe des marais...";
};
FUNC INT DIA_Addon_Fortuno_Trade_Condition()
{	
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	&& Npc_KnowsInfo (other, DIA_Addon_Fortuno_Herb)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Trade_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Trade_15_00");//Je vous apporte de l'herbe des marais...
	B_Fortuno_InfoManager();
};
FUNC VOID DIA_Addon_Fortuno_Trade_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
};
FUNC VOID DIA_Addon_Fortuno_Trade_all()
{
	var int amount;
	amount = Npc_HasItems (other, Itpl_Swampherb);
	
	if B_GiveInvItems (other, self, ITPL_Swampherb, amount)
	{
		Npc_RemoveInvItems (self, ITPL_Swampherb, Npc_HasItems (self, ITPL_Swampherb));
	};
	
	B_GiveInvItems (self, other, ItMi_Gold, amount * Value_SwampHerb);
	
	B_GivePlayerXP (amount * 10);
	B_Fortuno_InfoManager();
};
FUNC VOID DIA_Addon_Fortuno_Trade_1()
{
	if B_GiveInvItems (other, self, ITPL_Swampherb, 1)
	{
		Npc_RemoveInvItems (self, ITPL_Swampherb, Npc_HasItems (self, ITPL_Swampherb));
	};
	
	B_GiveInvItems (self, other, ItMi_Gold, Value_SwampHerb);
	
	B_GivePlayerXP (10);
	B_Fortuno_InfoManager();
};

///////////////////////////////////////////////////////////////////////
//	Info Trank
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Trank   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 3;
	condition   = DIA_Addon_Fortuno_Trank_Condition;
	information = DIA_Addon_Fortuno_Trank_Info;
	permanent   = FALSE;
	description	= "Je vous apporte une potion...";
};
FUNC INT DIA_Addon_Fortuno_Trank_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	&&   Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE)
	&& ((Npc_HasItems (other, ItPo_Addon_Geist_01) >= 1)
	||  (Npc_HasItems (other, ItPo_Addon_Geist_02) >= 1))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Trank_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Trank_15_00");//Je vous apporte une potion. Elle vous aidera à vous souvenir.
	AI_Output (self, other, "DIA_Addon_Fortuno_Trank_13_01");//Je vous fais confiance.
	
	if (Npc_HasItems (other, ItPo_Addon_Geist_02) >= 1)//der richtige
	{
		if B_GiveInvItems (other, self, ItPo_Addon_Geist_02,1)
		{
			AI_UseItem (self, ItPo_Addon_Geist_02);
		};
		B_GivePlayerXP (XP_Addon_Fortuno_02);
		
	}
	else
	{
		if B_GiveInvItems (other, self, ItPo_Addon_Geist_01,1)//der...äh...tödliche
		{
			Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_OBSOLETE);
			AI_StopProcessInfos (self);
			AI_UseItem (self, ItPo_Addon_Geist_01);
		};
	};
};
///////////////////////////////////////////////////////////////////////
//	Info No more Secrets
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_more   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_more_Condition;
	information = DIA_Addon_Fortuno_more_Info;
	permanent   = FALSE;
	description	= "Et...?";
};
FUNC INT DIA_Addon_Fortuno_more_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_Trank)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_more_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_00");//Et...?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_01");//Ahh ! Je... je me souviens ! Maintenant, je sais... Qu'Adanos soit avec moi - qu'ai-je donc fait ?
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_02");//Oui, qu'avez-vous fait ? Et surtout - qu'a fait Raven ?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_03");//Je l'ai aidé... à prendre contact. Avec LUI. Il voulait différents élixirs... je les ai brassés pour lui.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_04");//Il a tenté d'ouvrir le portail afin d'entrer dans le temple.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_05");//Pourquoi ? Que veut-il à l'intérieur du temple ?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_06");//Un puissant artefact... Il a été enterré avec celui qui l'a autrefois porté. Un puissant guerrier asservi par LUI...
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_07");//Et ensuite ?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_08");//Nous n'avons pu ouvrir le portail...
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_09");//Mais Raven était CERTAIN qu'il y parviendrait à condition d'ouvrir le tombeau du prêtre.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_10");//C'est la raison pour laquelle il a fait venir les esclaves ici... des victimes qu'il pouvait forcer à creuser à l'endroit même où est enfouie la toute-puissance du temps.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_11");//La tombe du prêtre ?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_12");//La dernière demeure d'un prêtre d'Adanos. Elle se trouve au fond de la mine.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_13");//Je me suis également souvenu des tablettes de pierre. Raven croyait qu'elles lui montreraient la voie.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_14");//Et lorsqu'il est parvenu à déchiffrer les signes qu'elles contiennent, il n'a plus eu besoin de moi.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_15");//Il m'a lancé un sort d'oubli et... vous m'avez libéré de son emprise.
	
	SC_KnowsFortunoInfos = TRUE;
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven veut retrouver un puissant artefact aux confins du temple d'Adanos."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Pour quelque raison, Raven a ordonné l'excavation de la tombe du prêtre du culte ancestral dans la mine."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Raven pense que certaines tablettes de pierre sont susceptibles de l'aider dans sa quête."); 
	
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Addon_Fortuno_03);
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fortuno_Attentat   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 9;
	condition   = DIA_Addon_Fortuno_Attentat_Condition;
	information = DIA_Addon_Fortuno_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Fortuno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	&&  Npc_KnowsInfo (other,DIA_Addon_Fortuno_Trank)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Fortuno_Attentat_13_00");//Attaque ? Désolé, j'étais... absent... pendant quelque temps. Je ne sais rien à ce sujet.
};

