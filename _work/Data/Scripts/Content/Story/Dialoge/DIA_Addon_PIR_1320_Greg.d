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
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_00"); //(mena�ant) H�, vous. Qu'est-ce que vous faites dans ma cabane ?
	AI_Output (other,self,"DIA_Addon_Greg_Hello_15_01"); //Je...
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_02"); //(furieux) Bon sang ! Je m'absente quelques jours seulement, et tout un chacun s'imagine soudain qu'il est libre de faire ce que bon lui semble !
	//AI_Output (other,self,"DIA_Addon_Greg_ImNew_15_00"); //Ich bin der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_01"); //(zynisch) So so, du bist der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_02"); //Hier entscheide immer noch ICH, wer bei uns mitmacht.
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_03"); //Que se passe-t-il ici, bon sang ?
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_04"); //La palissade n'est pas encore achev�e ? Le canyon grouille de cr�atures en tout genre et tout le monde reste assis � profiter de la vie.
		
	GregIsBack = TRUE;
	
	if (!Npc_IsDead (Francis))
	{
		AI_TurnToNpc (self, Francis);
		AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_05"); //(fort) Alors, c'est tout ce que vous avez pu faire, Francis ?
		
		if (C_BodyStateContains (Francis, BS_SIT))
		{
			AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_06"); //(fort) D�gagez de mon banc imm�diatement !
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
				Info_AddChoice	(DIA_Addon_Greg_ImNew, "J'ai travaill�.", DIA_Addon_Greg_ImNew_turm );
			};

	};
// ------------------------------------------------------------------
func void B_UseRakeBilanz ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_00"); //Je ne pense pas non plus que vous ayez oubli� que vous me devez toujours une ou deux choses.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_01"); //C'est-�-dire, l'�quivalent de plusieurs centaines de pi�ces d'or enterr�es dans les terres de Khorinis.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_02"); //Vous avez tout empoch�, je suppose ?
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_03"); //Je vous ferai travailler jusqu'� ce que vous me les ayez enti�rement rembours�es !
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
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_00"); //J'ai travaill�.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_01"); //Ah, vraiment ? Et qu'avez-vous fait ?

	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_02"); //J'ai �limin� les bandits dans la tour.
	};

	if (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
	&& (MIS_Addon_MorganLurker != 0)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_03"); //Il n'y a plus aucune cr�ature sur la plage au nord.
	};

	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_04"); //Eh bien... c'est un d�but, apr�s tout.
	
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
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_01"); //Tout d'abord, je vais veiller � ce que chacun s'active un peu, ici.

	if ((Npc_IsDead(Morgan))== FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_02"); //Ce goret apathique de Morgan va pouvoir aller d�biter des planches.
	};
	
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_03"); //Vous allez prendre la place de Morgan et m'�liminer toutes ces cr�atures du canyon.
	
	MIS_Addon_Greg_ClearCanyon = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_ClearCanyon,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg me demande de reprendre le travail de Morgan et d'�liminer les cr�atures qui r�dent dans le canyon.");

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Dans ce cas, je vais me mettre en route.",DIA_Addon_Greg_JoinPirates_Leave);

	if (((Npc_IsDead(Brandon))== FALSE)
	|| ((Npc_IsDead(Matt))== FALSE))
	{
		Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Je suis cens� les �liminer � moi seul ?",DIA_Addon_Greg_JoinPirates_Compadres);
	};

	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Quelles cr�atures ?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00"); //Dans ce cas, je vais me mettre en route.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01"); //Encore une chose... Vous �tes l'un des n�tres, maintenant.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02"); //Alors allez d'abord vous chercher une tenue de chasseur digne de ce nom.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03"); //Voici une armure pour vous. J'esp�re qu'elle est � votre taille.
	CreateInvItems (self, ItAr_Pir_M_Addon, 1);									
	B_GiveInvItems (self, other, ItAr_Pir_M_Addon, 1);		
	AI_EquipArmor(hero,ItAr_Pir_M_Addon);
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04"); //Et ne tra�nez pas - au travail !
	

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_Compadres_15_00"); //Je suis cens� les �liminer � moi seul ?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01"); //Allez recruter quelques gars pour vous accompagner.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02"); //Qu'ils gagnent un peu leur cro�te, au lieu de passer leurs journ�es � se la couler douce.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg m'a dit que je pouvais emmener quelques hommes avec moi.");
};

FUNC VOID DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00"); //Quelles cr�atures ?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01"); //Les lames qui r�dent dans le canyon se rapprochent chaque jour de notre camp.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02"); //Je n'ai pas envie d'attendre qu'elles d�vorent l'un de mes gars un soir de beuverie.

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
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"Quelles cr�atures suis-je cens� abattre ?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else 
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"J'ai �limin� les lames.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
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
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02"); //De toutes fa�ons, ils n'ont rien d'autre � faire.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Job_15_00"); //Quelles cr�atures suis-je cens� abattre ?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01"); //Eliminez les lames ! Les autres cr�atures sont inoffensives.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00"); //J'ai �limin� les lames.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01"); //Bien. Vous m'avez tout l'air d'�tre quelqu'un de fiable...
	
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg m'a m�me sembl� impressionn� en apprenant que j'avais tu� toutes les lames dans le canyon.");
	
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
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_01"); //Montrez-moi d'abord ce dont vous �tes capable. Ensuite, nous parlerons.
		if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
		{
			AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_02"); //D'abord, allez �liminer toutes les lames dans le canyon.
		};
		
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Greg veut que je l'aide � remettre un peut d'entrain dans ce camp. Ensuite, je pourrai aller lui parler de l'armure."); 
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_03"); //H�, vous �tes un sacr� bonhomme !
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_04"); //Bones devait porter cette armure et aller espionner les bandits.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_05"); //Toutefois, il semblerait que vous soyez l'homme de la situation.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_06"); //Peut-�tre avez-vous m�me une chance d'en r�chapper...?
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_07"); //Allez parler � Bones et dites-lui de vous remettre l'armure. Ensuite, mettez-la et rendez-vous dans le camp des bandits.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_08"); //J'ai besoin de conna�tre la raison de la pr�sence de ces ordures dans notre vall�e.
		AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_09"); //� vos ordres, Cap'taine !
	
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Apr�s avoir �limin� les lames du camp pour le compte de Greg, je pourrai me procurer l'armure aupr�s de Bones."); 
	
		Log_CreateTopic (TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_ScoutBandits,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_ScoutBandits,"Greg m'a demand� de d�couvrir pourquoi les bandits sont arriv�s dans cette vall�e.");
	
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

	description	 = 	"Avez-vous autre chose � me faire faire ?";
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
	AI_Output	(other, self, "DIA_Addon_Greg_Auftraege2_15_00"); //Avez-vous une autre mission � me confier ?

	if (Npc_IsDead(BeachLurker1)== FALSE)
	&& (Npc_IsDead(BeachLurker2)== FALSE)
	&& (Npc_IsDead(BeachLurker3)== FALSE)
	&& (Npc_IsDead(BeachWaran1)== FALSE)
	&& (Npc_IsDead(BeachWaran2)== FALSE)
	&& (Npc_IsDead(BeachShadowbeast1)== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_01"); //La plage au nord grouille toujours de cr�atures dangereuses.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_02"); //Il semblerait que Morgan n'ait pas lev� le petit doigt.
		
		Log_CreateTopic (TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_MorganBeach,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_MorganBeach,"Greg m'a demand� de me rendre sur la plage. Celle-ci grouille de cr�atures dangereuses, et a grand besoin d'�tre nettoy�e.");
		
		MIS_Addon_MorganLurker = LOG_RUNNING;
	};
	
	if	(C_TowerBanditsDead() == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_03"); //Des bandits tiennent toujours la tour �rig�e au sud de la falaise.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_04"); //Francis aurait d�j� d� leur r�gler leur compte.
	
		Log_CreateTopic (TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_BanditsTower,LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BanditsTower,"Greg m'a demand� de d�loger les bandits de la tour au sud du camp.");
		
		MIS_Henry_FreeBDTTower = LOG_RUNNING; 
	
	};
	
	AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_05"); //Vous pouvez vous occuper d'eux aussi, si leur c�ur vous en dit.
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

	description	 = 	"La plage nord est nettoy�e.";
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
	AI_Output	(other, self, "DIA_Addon_Greg_Sauber2_15_00"); //La plage nord est nettoy�e.
	AI_Output	(self, other, "DIA_Addon_Greg_Sauber2_01_01"); //Fantastique. Voici votre r�compense.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	
	B_LogEntry	(TOPIC_Addon_MorganBeach,"J'ai indiqu� � Greg que la plage au nord du camp est d�sormais s�re.");
	
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

	description	 = 	"Les bandits dans la tour ont �t� �limin�s.";
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
	AI_Output	(other, self, "DIA_Addon_Greg_BanditPlatt2_15_00"); //Les bandits dans la tour ont �t� �limin�s.
	AI_Output	(self, other, "DIA_Addon_Greg_BanditPlatt2_01_01"); //Excellent. Du beau travail. Voici votre r�compense.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);	
	
	B_LogEntry (TOPIC_Addon_BanditsTower,"Les bandits de la tour sont morts. Greg a l'air tr�s satisfait de mes services.");
	
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
	description = "Les bandits ont d�couvert une mine d'or.";
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
	AI_Output (other,self,"DIA_Addon_Greg_BanditGoldmine_15_00"); //Les bandits ont d�couvert une mine d'or.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_01"); //Je le savais. VOILA la raison de leur pr�sence ici.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_02"); //Personne ne viendrait vivre dans ce mar�cage infest� de monstres sans raison valable.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_03"); //Beau travail. Tenez, voici quelque chose pour vous.
	
	B_GiveInvItems (self,other,ItRi_Addon_STR_01,1);
	
	B_LogEntry (TOPIC_Addon_ScoutBandits,"J'ai inform� Greg au sujet de la mine d'or.");	
	
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
	description = "Qui �tes-vous ?";
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
	AI_Output (other,self ,"DIA_Addon_Greg_WhoAreYou_15_00"); //Qui �tes-vous ?
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
	description = "Alors comment �tes-vous arriv� ici ?";
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
	AI_Output (other,self ,"DIA_Addon_Greg_NiceToSeeYou_15_00"); //Alors comment �tes-vous arriv� ici ?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_01"); //Vous ne vous attendiez pas � me voir, hein ?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_02"); //Juste pour que les choses soient claires, une fois pour toutes : mon nom est Greg, et voici mon camp.
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_03"); //�a vous suffit ?
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
	Info_AddChoice (DIA_Addon_Greg_Story,"Comment �tes-vous arriv� l� ?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice (DIA_Addon_Greg_Story,"O� est votre navire ?",DIA_Addon_Greg_Story_Ship);

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
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Way_15_00"); //Comment �tes-vous arriv� ici ?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_01"); //J'ai d�couvert un tunnel pr�s de l'ancienne pyramide, gard� par une poign�e de mages.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_02"); //Je me suis simplement gliss� dans le tunnel au nez et � la barbe de ces taupes.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_03"); //Au d�but, je pensais qu'il s'agissait d'un tombeau ancien, et j'ai d�cid� de le fouiller afin de voir ce que je pourrais y trouver.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_04"); //Imaginez ma surprise lorsque je me suis soudain retrouv� dans ma vall�e bien-aim�e !
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_05"); //Moi qui commen�ais � croire que j'allais passer le restant de mes jours � fuir la milice...
};

FUNC VOID DIA_Addon_Greg_Story_Ship()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_00"); //O� est votre navire ?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_01"); //�a, c'est tout moi. Depuis des mois, plus aucun navire ne vogue entre cette �le et le continent.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_02"); //Depuis des mois ! Et comme par hasard, le premier navire que je trouve est un b�timent de guerre en ordre de marche, appartenant au roi !
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_03"); //Empli de paladins, de la soute jusqu'au sommet du m�t !
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_04"); //Effectivement, c'est un tour du mauvais sort...
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_05"); //�a, vous pouvez le dire. Ils nous ont coul�s en une seconde. Je suis le seul � avoir pu rejoindre le rivage.
};
FUNC VOID DIA_Addon_Greg_Story_Raven()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Raven_15_00"); //Que savez-vous de Raven ?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_01"); //A ma connaissance, c'est un baron du minerai d�chu. Un grand ponte de la colonie.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_02"); //Je n'ai aucune id�e quant � la raison de sa pr�sence ici, et je ne sais pas non plus pourquoi qui que ce soit suivrait ses ordres...
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_03"); //En tout cas, il pr�pare quelque chose. Il n'est pas du genre � se terrer dans un marais sans raison.
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

	description	 = 	"J'ai r�gl� son compte � Raven.";
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
	AI_Output	(other, self, "DIA_Addon_Greg_RavenDead_15_00"); //J'ai r�gl� son compte � Raven.
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_01"); //Eh bien, c'est... inattendu. Vous l'avez surpris pendant son sommeil ?!
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_02"); //En ce qui me concerne, ce service vaut bien 500 pi�ces d'or !
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);		
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_03"); //Vous �tes un sacr� aventurier. Continuez comme �a !
	B_GivePlayerXP (XP_ADDON_GregRavenLohn);
};



