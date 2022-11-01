// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Greg_EXIT(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 999;
	condition	= DIA_Addon_Greg_EXIT_Condition;
	information	= DIA_Addon_Greg_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Greg_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Greg_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Greg_PICKPOCKET (C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 900;
	condition	= DIA_Addon_Greg_PICKPOCKET_Condition;
	information	= DIA_Addon_Greg_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Addon_Greg_PICKPOCKET_Condition()
{
	C_Beklauen (111, 666);
};
 
FUNC VOID DIA_Addon_Greg_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Greg_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Greg_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Greg_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Greg_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Greg_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Greg_PICKPOCKET);
};
	
func void DIA_Addon_Greg_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Greg_PICKPOCKET);
};
// ************************************************************
// 			  			Hallo - (Greg Is Back)
// ************************************************************
INSTANCE DIA_Addon_Greg_ImNew(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 1;
	condition	= DIA_Addon_Greg_ImNew_Condition;
	information	= DIA_Addon_Greg_ImNew_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Greg_ImNew_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Greg_ImNew_Info()
{	
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_00"); //(menaçant) Hé, vous. Qu'est-ce que vous faites dans ma cabane ?
	AI_Output (other,self,"DIA_Addon_Greg_Hello_15_01"); //Je...
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_02"); //(furieux) Bon sang ! Je m'absente quelques jours seulement, et tout un chacun s'imagine soudain qu'il est libre de faire ce que bon lui semble !
	//AI_Output (other,self,"DIA_Addon_Greg_ImNew_15_00"); //Ich bin der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_01"); //(zynisch) So so, du bist der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_02"); //Hier entscheide immer noch ICH, wer bei uns mitmacht.
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_03"); //Que se passe-t-il ici, bon sang ?
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_04"); //La palissade n'est pas encore achevée ? Le canyon grouille de créatures en tout genre et tout le monde reste assis à profiter de la vie.
		
	GregIsBack = TRUE;
	
	if (!Npc_IsDead (Francis))
	{
		AI_TurnToNpc (self, Francis);
		AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_05"); //(fort) Alors, c'est tout ce que vous avez pu faire, Francis ?
		
		if (C_BodyStateContains (Francis, BS_SIT))
		{
			AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_06"); //(fort) Dégagez de mon banc immédiatement !
		};
	};
	
	Npc_ExchangeRoutine	(self,"HOME");
	AI_TurnToNpc (self, other);
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_07"); //Et VOUS ? Qu'est-ce que vous avez fait, VOUS ?
	
	Info_ClearChoices	(DIA_Addon_Greg_ImNew);
	Info_AddChoice	(DIA_Addon_Greg_ImNew, "Pas grand-chose, pour l'instant.", DIA_Addon_Greg_ImNew_nich );
	if (
			(Npc_IsDead(BeachLurker1))
			&& (Npc_IsDead(BeachLurker2))
			&& (Npc_IsDead(BeachLurker3))
			&& (Npc_IsDead(BeachWaran1))
			&& (Npc_IsDead(BeachWaran2))
			&& (Npc_IsDead(BeachShadowbeast1))
			&& (Npc_IsDead(BeachShadowbeast1))
			&& (MIS_Addon_MorganLurker != 0 )
		)
		|| (C_TowerBanditsDead() == TRUE)
			{
				Info_AddChoice	(DIA_Addon_Greg_ImNew, "J'ai travaillé.", DIA_Addon_Greg_ImNew_turm );
			};

	};
// ------------------------------------------------------------------
func void B_UseRakeBilanz ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_00"); //Je ne pense pas non plus que vous ayez oublié que vous me devez toujours une ou deux choses.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_01"); //C'est-à-dire, l'équivalent de plusieurs centaines de pièces d'or enterrées dans les terres de Khorinis.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_02"); //Vous avez tout empoché, je suppose ?
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_03"); //Je vous ferai travailler jusqu'à ce que vous me les ayez entièrement remboursées !
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_04"); //Je vais vous apprendre la vraie signification du travail.
	};
	
	if (!Npc_IsDead (Francis))
	{
		Npc_ExchangeRoutine  (Francis,"GREGISBACK");
		AI_StartState (Francis, ZS_Saw, 1, "ADW_PIRATECAMP_BEACH_19"); //HACK - REDUNDANT!!!
		Francis_ausgeschissen = TRUE;
	};
	
	Info_ClearChoices	(DIA_Addon_Greg_ImNew);
};
// --------------------------------------------------------------------
func void DIA_Addon_Greg_ImNew_nich ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_nich_15_00"); //Pas grand-chose, pour l'instant.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_nich_01_01"); //Tant pis. Je vais trouver quelque chose qui vous convienne, mon ami.
	B_UseRakeBilanz ();
};
func void DIA_Addon_Greg_ImNew_turm ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_00"); //J'ai travaillé.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_01"); //Ah, vraiment ? Et qu'avez-vous fait ?

	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_02"); //J'ai éliminé les bandits dans la tour.
	};

	if (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
	&& (MIS_Addon_MorganLurker != 0)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_03"); //Il n'y a plus aucune créature sur la plage au nord.
	};

	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_04"); //Eh bien... c'est un début, après tout.
	
	B_UseRakeBilanz ();
};

// ************************************************************
// 			  				JoinPirates
// ************************************************************
INSTANCE DIA_Addon_Greg_JoinPirates(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_JoinPirates_Condition;
	information	= DIA_Addon_Greg_JoinPirates_Info;
	permanent	= FALSE;
	description = "Que faut-il faire ?";
};                       
FUNC INT DIA_Addon_Greg_JoinPirates_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Greg_ImNew) == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_15_00"); //Que dois-je faire ?
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_01"); //Tout d'abord, je vais veiller à ce que chacun s'active un peu, ici.

	if ((Npc_IsDead(Morgan))== FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_02"); //Ce goret apathique de Morgan va pouvoir aller débiter des planches.
	};
	
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_03"); //Vous allez prendre la place de Morgan et m'éliminer toutes ces créatures du canyon.
	
	MIS_Addon_Greg_ClearCanyon = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_ClearCanyon,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg me demande de reprendre le travail de Morgan et d'éliminer les créatures qui rôdent dans le canyon.");

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Dans ce cas, je vais me mettre en route.",DIA_Addon_Greg_JoinPirates_Leave);

	if (((Npc_IsDead(Brandon))== FALSE)
	|| ((Npc_IsDead(Matt))== FALSE))
	{
		Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Je suis censé les éliminer à moi seul ?",DIA_Addon_Greg_JoinPirates_Compadres);
	};

	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Quelles créatures ?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00"); //Dans ce cas, je vais me mettre en route.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01"); //Encore une chose... Vous êtes l'un des nôtres, maintenant.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02"); //Alors allez d'abord vous chercher une tenue de chasseur digne de ce nom.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03"); //Voici une armure pour vous. J'espère qu'elle est à votre taille.
	CreateInvItems (self, ItAr_Pir_M_Addon, 1);									
	B_GiveInvItems (self, other, ItAr_Pir_M_Addon, 1);		
	AI_EquipArmor(hero,ItAr_Pir_M_Addon);
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04"); //Et ne traînez pas - au travail !
	

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_Compadres_15_00"); //Je suis censé les éliminer à moi seul ?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01"); //Allez recruter quelques gars pour vous accompagner.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02"); //Qu'ils gagnent un peu leur croûte, au lieu de passer leurs journées à se la couler douce.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg m'a dit que je pouvais emmener quelques hommes avec moi.");
};

FUNC VOID DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00"); //Quelles créatures ?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01"); //Les lames qui rôdent dans le canyon se rapprochent chaque jour de notre camp.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02"); //Je n'ai pas envie d'attendre qu'elles dévorent l'un de mes gars un soir de beuverie.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Apparemment, il s'agirait de lames.");
};

// ************************************************************
// 			  				Wegen dem Canyon...
// ************************************************************
INSTANCE DIA_Addon_Greg_AboutCanyon(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_AboutCanyon_Condition;
	information	= DIA_Addon_Greg_AboutCanyon_Info;
	permanent	= TRUE;
	description = "A propos de ce canyon...";
};                       
FUNC INT DIA_Addon_Greg_AboutCanyon_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Info()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_15_00"); //A propos du canyon...
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_01_01"); //Oui, quoi ?
	
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
	if (C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,DIALOG_BACK,DIA_Addon_Greg_AboutCanyon_Back);	
		if (((Npc_IsDead(Brandon))== FALSE)
		|| ((Npc_IsDead(Matt))== FALSE))
		{
			Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Qui peut m'aider ?",DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Quelles créatures suis-je censé abattre ?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else 
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"J'ai éliminé les lames.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00"); //Qui peut m'aider ?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01"); //Prenez quelques gars avec vous.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02"); //De toutes façons, ils n'ont rien d'autre à faire.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Job_15_00"); //Quelles créatures suis-je censé abattre ?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01"); //Eliminez les lames ! Les autres créatures sont inoffensives.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00"); //J'ai éliminé les lames.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01"); //Bien. Vous m'avez tout l'air d'être quelqu'un de fiable...
	
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg m'a même semblé impressionné en apprenant que j'avais tué toutes les lames dans le canyon.");
	
	MIS_Addon_Greg_ClearCanyon = LOG_SUCCESS;
	B_Addon_PiratesGoHome();
	B_GivePlayerXP (XP_ADDON_CLEARCANYON);
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};


// ************************************************************
// 			  				BanditArmor
// ************************************************************
INSTANCE DIA_Addon_Greg_BanditArmor(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_BanditArmor_Condition;
	information	= DIA_Addon_Greg_BanditArmor_Info;
	permanent	= TRUE;
	description = "Il me faut cette armure de bandit.";
};                       
FUNC INT DIA_Addon_Greg_BanditArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_BanditArmor_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_00"); //Il me faut cette armure de bandit.
	if (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_01"); //Montrez-moi d'abord ce dont vous êtes capable. Ensuite, nous parlerons.
		if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
		{
			AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_02"); //D'abord, allez éliminer toutes les lames dans le canyon.
		};
		
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Greg veut que je l'aide à remettre un peut d'entrain dans ce camp. Ensuite, je pourrai aller lui parler de l'armure."); 
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_03"); //Hé, vous êtes un sacré bonhomme !
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_04"); //Bones devait porter cette armure et aller espionner les bandits.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_05"); //Toutefois, il semblerait que vous soyez l'homme de la situation.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_06"); //Peut-être avez-vous même une chance d'en réchapper...?
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_07"); //Allez parler à Bones et dites-lui de vous remettre l'armure. Ensuite, mettez-la et rendez-vous dans le camp des bandits.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_08"); //J'ai besoin de connaître la raison de la présence de ces ordures dans notre vallée.
		AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_09"); //À vos ordres, Cap'taine !
	
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Après avoir éliminé les lames du camp pour le compte de Greg, je pourrai me procurer l'armure auprès de Bones."); 
	
		Log_CreateTopic (TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_ScoutBandits,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_ScoutBandits,"Greg m'a demandé de découvrir pourquoi les bandits sont arrivés dans cette vallée.");
	
		MIS_Greg_ScoutBandits = LOG_RUNNING;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Auftraege2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_Auftraege2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_Auftraege2_Condition;
	information	 = 	DIA_Addon_Greg_Auftraege2_Info;

	description	 = 	"Avez-vous autre chose à me faire faire ?";
};

func int DIA_Addon_Greg_Auftraege2_Condition ()
{
	if (MIS_Greg_ScoutBandits != 0)
	&& (
		(C_TowerBanditsDead() == FALSE)
		|| (
				 (Npc_IsDead(BeachLurker1)== FALSE)
				&& (Npc_IsDead(BeachLurker2)== FALSE)
				&& (Npc_IsDead(BeachLurker3)== FALSE)
				&& (Npc_IsDead(BeachWaran1)== FALSE)
				&& (Npc_IsDead(BeachWaran2)== FALSE)
				&& (Npc_IsDead(BeachShadowbeast1)== FALSE)
		   )
		)
				{
					return TRUE;
				};
};

func void DIA_Addon_Greg_Auftraege2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_Auftraege2_15_00"); //Avez-vous une autre mission à me confier ?

	if (Npc_IsDead(BeachLurker1)== FALSE)
	&& (Npc_IsDead(BeachLurker2)== FALSE)
	&& (Npc_IsDead(BeachLurker3)== FALSE)
	&& (Npc_IsDead(BeachWaran1)== FALSE)
	&& (Npc_IsDead(BeachWaran2)== FALSE)
	&& (Npc_IsDead(BeachShadowbeast1)== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_01"); //La plage au nord grouille toujours de créatures dangereuses.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_02"); //Il semblerait que Morgan n'ait pas levé le petit doigt.
		
		Log_CreateTopic (TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_MorganBeach,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_MorganBeach,"Greg m'a demandé de me rendre sur la plage. Celle-ci grouille de créatures dangereuses, et a grand besoin d'être nettoyée.");
		
		MIS_Addon_MorganLurker = LOG_RUNNING;
	};
	
	if	(C_TowerBanditsDead() == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_03"); //Des bandits tiennent toujours la tour érigée au sud de la falaise.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_04"); //Francis aurait déjà dû leur régler leur compte.
	
		Log_CreateTopic (TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_BanditsTower,LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BanditsTower,"Greg m'a demandé de déloger les bandits de la tour au sud du camp.");
		
		MIS_Henry_FreeBDTTower = LOG_RUNNING; 
	
	};
	
	AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_05"); //Vous pouvez vous occuper d'eux aussi, si leur cœur vous en dit.
};

///////////////////////////////////////////////////////////////////////
//	Info Sauber2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_Sauber2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_Sauber2_Condition;
	information	 = 	DIA_Addon_Greg_Sauber2_Info;

	description	 = 	"La plage nord est nettoyée.";
};

func int DIA_Addon_Greg_Sauber2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_Auftraege2))
	&& (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_Sauber2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_Sauber2_15_00"); //La plage nord est nettoyée.
	AI_Output	(self, other, "DIA_Addon_Greg_Sauber2_01_01"); //Fantastique. Voici votre récompense.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	
	B_LogEntry	(TOPIC_Addon_MorganBeach,"J'ai indiqué à Greg que la plage au nord du camp est désormais sûre.");
	
	MIS_Addon_MorganLurker = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Addon_Morgan_LurkerPlatt);	
};

///////////////////////////////////////////////////////////////////////
//	Info BanditPlatt2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_BanditPlatt2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_BanditPlatt2_Condition;
	information	 = 	DIA_Addon_Greg_BanditPlatt2_Info;

	description	 = 	"Les bandits dans la tour ont été éliminés.";
};

func int DIA_Addon_Greg_BanditPlatt2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_Auftraege2))
	&& (C_TowerBanditsDead() == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditPlatt2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_BanditPlatt2_15_00"); //Les bandits dans la tour ont été éliminés.
	AI_Output	(self, other, "DIA_Addon_Greg_BanditPlatt2_01_01"); //Excellent. Du beau travail. Voici votre récompense.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);	
	
	B_LogEntry (TOPIC_Addon_BanditsTower,"Les bandits de la tour sont morts. Greg a l'air très satisfait de mes services.");
	
	MIS_Henry_FreeBDTTower = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Henry_FreeBDTTower);	
};



// ************************************************************
// 			  				BanditGoldmine
// ************************************************************
INSTANCE DIA_Addon_Greg_BanditGoldmine(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_BanditGoldmine_Condition;
	information	= DIA_Addon_Greg_BanditGoldmine_Info;
	permanent	= TRUE;
	description = "Les bandits ont découvert une mine d'or.";
};                       
FUNC INT DIA_Addon_Greg_BanditGoldmine_Condition()
{
	if (SC_KnowsRavensGoldmine == TRUE)
	&& (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_BanditGoldmine_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_BanditGoldmine_15_00"); //Les bandits ont découvert une mine d'or.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_01"); //Je le savais. VOILA la raison de leur présence ici.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_02"); //Personne ne viendrait vivre dans ce marécage infesté de monstres sans raison valable.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_03"); //Beau travail. Tenez, voici quelque chose pour vous.
	
	B_GiveInvItems (self,other,ItRi_Addon_STR_01,1);
	
	B_LogEntry (TOPIC_Addon_ScoutBandits,"J'ai informé Greg au sujet de la mine d'or.");	
	
	MIS_Greg_ScoutBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_Greg_ScoutBandits);
};


// ************************************************************
// 			Wer bist du			  				
// ************************************************************
INSTANCE DIA_Addon_Greg_WhoAreYou(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 2;
	condition	= DIA_Addon_Greg_WhoAreYou_Condition;
	information	= DIA_Addon_Greg_WhoAreYou_Info;
	permanent	= FALSE;
	description = "Qui êtes-vous ?";
};                       
FUNC INT DIA_Addon_Greg_WhoAreYou_Condition()
{
	if (PlayerTalkedToGregNW == FALSE)//Joly:WAR VOHER npc_gLOBAL -> GREG_NW
	&& (SC_MeetsGregTime == 0)//Joly:zur sicherheit
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_WhoAreYou_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_WhoAreYou_15_00"); //Qui êtes-vous ?
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_01"); //Mon nom est Greg. Je suis le chef de cette bande de tire-au-flanc.
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_02"); //Cela vous suffit ?
};

// ************************************************************
// 			  	NiceToSeeYou			
// ************************************************************
INSTANCE DIA_Addon_Greg_NiceToSeeYou(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_NiceToSeeYou_Condition;
	information	= DIA_Addon_Greg_NiceToSeeYou_Info;
	permanent	= FALSE;
	description = "Alors comment êtes-vous arrivé ici ?";
};                       
FUNC INT DIA_Addon_Greg_NiceToSeeYou_Condition()
{
	if (PlayerTalkedToGregNW	 == TRUE)
	&& (MIS_Greg_ScoutBandits == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_NiceToSeeYou_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_NiceToSeeYou_15_00"); //Alors comment êtes-vous arrivé ici ?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_01"); //Vous ne vous attendiez pas à me voir, hein ?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_02"); //Juste pour que les choses soient claires, une fois pour toutes : mon nom est Greg, et voici mon camp.
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_03"); //Ça vous suffit ?
};
	
// ************************************************************
// 			  	Story			
// ************************************************************
INSTANCE DIA_Addon_Greg_Story(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 99;
	condition	= DIA_Addon_Greg_Story_Condition;
	information	= DIA_Addon_Greg_Story_Info;
	permanent	= TRUE;
	description = "J'aimerais savoir juste une chose, encore...";
};                       
FUNC INT DIA_Addon_Greg_Story_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Addon_Greg_WhoAreYou) == TRUE)
	|| (Npc_KnowsInfo (other,DIA_Addon_Greg_NiceToSeeYou) == TRUE))
	&& (MIS_Greg_ScoutBandits != 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_Story_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_Story_15_00"); //J'aimerais savoir juste une chose, encore...
	AI_Output (self ,other,"DIA_Addon_Greg_Story_01_01"); //Et quoi donc ?
	
	Info_ClearChoices (DIA_Addon_Greg_Story);
	Info_AddChoice (DIA_Addon_Greg_Story,DIALOG_BACK,DIA_Addon_Greg_Story_Back);
	Info_AddChoice (DIA_Addon_Greg_Story,"Comment êtes-vous arrivé là ?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice (DIA_Addon_Greg_Story,"Où est votre navire ?",DIA_Addon_Greg_Story_Ship);

	if (RavenIsDead == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_Story,"Que savez-vous au sujet de Raven ?",DIA_Addon_Greg_Story_Raven);
	};
};	

FUNC VOID DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_Story);
};

FUNC VOID DIA_Addon_Greg_Story_Way()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Way_15_00"); //Comment êtes-vous arrivé ici ?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_01"); //J'ai découvert un tunnel près de l'ancienne pyramide, gardé par une poignée de mages.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_02"); //Je me suis simplement glissé dans le tunnel au nez et à la barbe de ces taupes.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_03"); //Au début, je pensais qu'il s'agissait d'un tombeau ancien, et j'ai décidé de le fouiller afin de voir ce que je pourrais y trouver.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_04"); //Imaginez ma surprise lorsque je me suis soudain retrouvé dans ma vallée bien-aimée !
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_05"); //Moi qui commençais à croire que j'allais passer le restant de mes jours à fuir la milice...
};

FUNC VOID DIA_Addon_Greg_Story_Ship()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_00"); //Où est votre navire ?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_01"); //Ça, c'est tout moi. Depuis des mois, plus aucun navire ne vogue entre cette île et le continent.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_02"); //Depuis des mois ! Et comme par hasard, le premier navire que je trouve est un bâtiment de guerre en ordre de marche, appartenant au roi !
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_03"); //Empli de paladins, de la soute jusqu'au sommet du mât !
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_04"); //Effectivement, c'est un tour du mauvais sort...
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_05"); //Ça, vous pouvez le dire. Ils nous ont coulés en une seconde. Je suis le seul à avoir pu rejoindre le rivage.
};
FUNC VOID DIA_Addon_Greg_Story_Raven()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Raven_15_00"); //Que savez-vous de Raven ?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_01"); //A ma connaissance, c'est un baron du minerai déchu. Un grand ponte de la colonie.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_02"); //Je n'ai aucune idée quant à la raison de sa présence ici, et je ne sais pas non plus pourquoi qui que ce soit suivrait ses ordres...
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_03"); //En tout cas, il prépare quelque chose. Il n'est pas du genre à se terrer dans un marais sans raison.
};

///////////////////////////////////////////////////////////////////////
//	Info RavenDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_RavenDead		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Greg_RavenDead_Condition;
	information	 = 	DIA_Addon_Greg_RavenDead_Info;

	description	 = 	"J'ai réglé son compte à Raven.";
};

func int DIA_Addon_Greg_RavenDead_Condition ()
{
	if (RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_RavenDead_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_RavenDead_15_00"); //J'ai réglé son compte à Raven.
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_01"); //Eh bien, c'est... inattendu. Vous l'avez surpris pendant son sommeil ?!
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_02"); //En ce qui me concerne, ce service vaut bien 500 pièces d'or !
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);		
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_03"); //Vous êtes un sacré aventurier. Continuez comme ça !
	B_GivePlayerXP (XP_ADDON_GregRavenLohn);
};



