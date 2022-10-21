
//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################



//***************************************************************************
//	Info EXIT
//***************************************************************************
INSTANCE DIA_SylvioDJG_EXIT (C_INFO)
{
	npc			= DJG_700_Sylvio;
	nr   		= 999;
	condition	= DIA_SylvioDJG_EXIT_Condition;
	information	= DIA_SylvioDJG_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SylvioDJG_EXIT_Condition()
{
	return 1;
};

func VOID DIA_SylvioDJG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info HelloAgain
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_HelloAgain		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	condition	 = 	DIA_SylvioDJG_HelloAgain_Condition;
	information	 = 	DIA_SylvioDJG_HelloAgain_Info;
	important	 = 	TRUE;

};

func int DIA_SylvioDJG_HelloAgain_Condition ()
{
	if 	((Npc_IsDead(IceDragon))== FALSE)
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
			{
				return TRUE;
			};
};

func void DIA_SylvioDJG_HelloAgain_Info ()
{
	if((other.guild == GIL_SLD)||(other.guild == GIL_DJG))
	{
		AI_Output			(self, other,"DIA_SylvioDJG_HelloAgain_09_00"); //Que je sois damn�. Vous cherchez � gagner de l'argent ? Je le savais ! Vous avez l'�me d'un mercenaire.
		AI_Output			(self, other,"DIA_SylvioDJG_HelloAgain_09_01"); //Ecoutez, si vous croyez pouvoir faire votre beurre ici, vous vous trompez. J'�tais l� en premier.
	}
	else if (other.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_SylvioDJG_HelloAgain_09_02"); //Eh, vous ! Les magiciens me rendent nerveux ! Allez voir ailleurs si j'y suis ! Il n'y a rien ici.
	}
	else
	{
		AI_Output			(self, other, "DIA_SylvioDJG_HelloAgain_09_03"); //Eh, vous ! Le paladin ! Retournez dans la mine. Il n'y a rien ici.
	};
	
	AI_Output			(other, self, "DIA_SylvioDJG_HelloAgain_15_04"); //Compris. Personne n'aime renoncer � son butin.
	AI_Output			(self, other, "DIA_SylvioDJG_HelloAgain_09_05"); //Vous l'avez dit. Disparaissez.
};

///////////////////////////////////////////////////////////////////////
//	Info Versager
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_VERSAGER		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	6;
	condition	 = 	DIA_Sylvio_VERSAGER_Condition;
	information	 = 	DIA_Sylvio_VERSAGER_Info;

	description	 = 	"Et si je refuse d'y aller ?";
};

func int DIA_Sylvio_VERSAGER_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_SylvioDJG_HelloAgain))
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Sylvio_VERSAGER_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_VERSAGER_15_00"); //Et si je refuse ?
	AI_Output			(self, other, "DIA_Sylvio_VERSAGER_09_01"); //Ne jouez pas les seigneurs ici. D�gagez ou je vais devoir vous achever comme ces pauvres cr�tins qui gisent dans la neige.
};


///////////////////////////////////////////////////////////////////////
//	Info DeineLeute
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_DEINELEUTE		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	7;
	condition	 = 	DIA_Sylvio_DEINELEUTE_Condition;
	information	 = 	DIA_Sylvio_DEINELEUTE_Info;

	description	 = 	"Ils �taient des v�tres ?";
};

func int DIA_Sylvio_DEINELEUTE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Sylvio_VERSAGER))
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
		&& (MIS_DJG_Sylvio_KillIceGolem == 0)
		{
				return TRUE;
		};
};

func void DIA_Sylvio_DEINELEUTE_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_DEINELEUTE_15_00"); //Ils �taient des v�tres ?
	AI_Output			(self, other, "DIA_Sylvio_DEINELEUTE_09_01"); //Plus maintenant. Pas une grande perte. Ces idiots ne valaient pas grand-chose.
};


///////////////////////////////////////////////////////////////////////
//	Info WasIstPassiert
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_WASISTPASSIERT		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	8;
	condition	 = 	DIA_Sylvio_WASISTPASSIERT_Condition;
	information	 = 	DIA_Sylvio_WASISTPASSIERT_Info;

	description	 = 	"Que leur est-il arriv� ?";
};

func int DIA_Sylvio_WASISTPASSIERT_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Sylvio_VERSAGER))
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Sylvio_WASISTPASSIERT_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_15_00"); //Que leur est-il arriv� ?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_09_01"); //Ils n'ont pas r�ussi � passer les grands g�ants des glaces et se sont faits pi�tiner.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_09_02"); //Si vous �tes aussi bal�ze, pourquoi n'essayez-vous pas ?


	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "Tr�s bien. Pourquoi pas ?", DIA_Sylvio_WASISTPASSIERT_ok );
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "Et si je le faisais, en quoi cela vous aiderait-il ?", DIA_Sylvio_WASISTPASSIERT_washastdudavon );
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "Et qu�est-ce que j'ai � y gagner ?", DIA_Sylvio_WASISTPASSIERT_warum );
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "Pourquoi ne pas vous en d�barrasser vous-m�me ?", DIA_Sylvio_WASISTPASSIERT_selbst );

	Log_CreateTopic (TOPIC_SylvioKillIceGolem, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SylvioKillIceGolem, LOG_RUNNING);
	B_LogEntry (TOPIC_SylvioKillIceGolem,"Sylvio est terroris� par les deux golems de glace � l'entr�e de la r�gion arctique de la Vall�e des mines."); 

	MIS_DJG_Sylvio_KillIceGolem = LOG_RUNNING;
};
func void DIA_Sylvio_WASISTPASSIERT_selbst ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_selbst_15_00"); //Pourquoi ne pas vous en d�barrasser vous-m�me ?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_selbst_09_01"); //Allons, allons. Arr�tez de jouer les ca�ds.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_selbst_09_02"); //Si vous voulez mon avis, vous n'�tes qu'une poule mouill�e.
	
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "Je ne joue pas � ces petits jeux.", DIA_Sylvio_WASISTPASSIERT_keinInteresse );

};
var int DJG_Sylvio_PromisedMoney;
func void DIA_Sylvio_WASISTPASSIERT_warum ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_warum_15_00"); //Et qu'est-ce que j'ai � y gagner ?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_warum_09_01"); //Disons... 1 000 pi�ces d'or. Qu'est-ce que vous en dites ?

	DJG_Sylvio_PromisedMoney = TRUE;
};

func void DIA_Sylvio_WASISTPASSIERT_washastdudavon ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00"); //En quoi cela vous aidera-t-il si je le fais ?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01"); //Ce sera pareil pour vous. Mais pour r�pondre � votre question, je veux me rendre dans la r�gion arctique.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02"); //Malheureusement, ces maudites cr�atures barrent le passage.
	
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "Que voulez-vous faire dans la r�gion arctique ?", DIA_Sylvio_WASISTPASSIERT_Eisregion );

};

func void DIA_Sylvio_WASISTPASSIERT_keinInteresse ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00"); //Je refuse de jouer � votre petit jeu.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01"); //Ah ! Alors d�gagez d'ici, l�che.

	AI_StopProcessInfos	(self);
};

func void DIA_Sylvio_WASISTPASSIERT_Eisregion ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00"); //Que voulez-vous faire dans la r�gion arctique ?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01"); //Vous n'arr�tez jamais de poser des questions, hein ? Tr�s bien, je vais vous le dire.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02"); //L�-bas, derri�re ces falaises, il y a une �tendue de glace comme vous n'en avez jamais vue.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03"); //Le joyau d'un dragon des glaces y est cach� ainsi que son tr�sor.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04"); //Je le veux. Alors, qu'en dites-vous ? Oui ou non ?
};
func void DIA_Sylvio_WASISTPASSIERT_ok ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_ok_15_00"); //Tr�s bien. Pourquoi pas ?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_ok_09_01"); //Alors d�p�chez-vous. Je n'ai pas toute la journ�e.

	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info IceGolemsKilled
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_ICEGOLEMSKILLED		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	9;
	condition	 = 	DIA_Sylvio_ICEGOLEMSKILLED_Condition;
	information	 = 	DIA_Sylvio_ICEGOLEMSKILLED_Info;

	description	 = 	"La voie est d�gag�e !";
};

func int DIA_Sylvio_ICEGOLEMSKILLED_Condition ()
{
	if 	(Npc_IsDead(IceGolem_Sylvio1))
		&& (Npc_IsDead(IceGolem_Sylvio2))
		&& (MIS_DJG_Sylvio_KillIceGolem  == LOG_RUNNING)
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
			{
					return TRUE;
			};
};

func void DIA_Sylvio_ICEGOLEMSKILLED_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_ICEGOLEMSKILLED_15_00"); //Le chemin est d�gag� ! Les g�ants des glaces ne sont plus.
	AI_Output			(self, other, "DIA_Sylvio_ICEGOLEMSKILLED_09_01"); //Beau travail. Voyons ce que nous avons.

	if (DJG_Sylvio_PromisedMoney  == TRUE)
	{
	AI_Output			(other, self, "DIA_Sylvio_ICEGOLEMSKILLED_15_02"); //Un instant� Et mon argent ?
	AI_Output			(self, other, "DIA_Sylvio_ICEGOLEMSKILLED_09_03"); //Chaque chose en son temps.
	};

	AI_StopProcessInfos	(self);

	MIS_DJG_Sylvio_KillIceGolem = LOG_SUCCESS;
	B_GivePlayerXP (XP_SylvioDJGIceGolemDead);
	Npc_ExchangeRoutine	(self,		"IceWait1");
	B_StartotherRoutine (DJG_Bullco,"IceWait1");	
};


///////////////////////////////////////////////////////////////////////
//	Info Wasjetzt
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_WASJETZT		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	10;
	condition	 = 	DIA_Sylvio_WASJETZT_Condition;
	information	 = 	DIA_Sylvio_WASJETZT_Info;

	description	 = 	"Et ensuite ?";
};

func int DIA_Sylvio_WASJETZT_Condition ()
{
	if 	(MIS_DJG_Sylvio_KillIceGolem  == LOG_SUCCESS)
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
			{
					return TRUE;
			};
};

func void DIA_Sylvio_WASJETZT_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_15_00"); //Et apr�s ?
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_09_01"); //Je dirais que �a m'a pas l'air bon.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_09_02"); //La meilleure chose � faire est que vous passiez devant et je vous suivrai.

	Info_AddChoice	(DIA_Sylvio_WASJETZT, "Alors tr�s bien.", DIA_Sylvio_WASJETZT_ok );
	Info_AddChoice	(DIA_Sylvio_WASJETZT, "Avez-vous peur ?", DIA_Sylvio_WASJETZT_trennen );
	Info_AddChoice	(DIA_Sylvio_WASJETZT, "Je ne ferai pas votre sale travail.", DIA_Sylvio_WASJETZT_nein );
	if (DJG_Sylvio_PromisedMoney  == TRUE)
	{
	Info_AddChoice	(DIA_Sylvio_WASJETZT, "Je veux d'abord voir l'argent.", DIA_Sylvio_WASJETZT_Geld );
	};
};
func void DIA_Sylvio_WASJETZT_trennen ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_trennen_15_00"); //Vous avez peur ?
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_trennen_09_01"); //Ridicule. Allez avancez.

};

func void DIA_Sylvio_WASJETZT_ok ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_ok_15_00"); //Tr�s bien.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_ok_09_01"); //Allez-y. On se bouge !

	AI_StopProcessInfos	(self);
};

func void DIA_Sylvio_WASJETZT_nein ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_nein_15_00"); //Je refuse de faire le sale travail pour vous.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_nein_09_01"); //L�che !

	AI_StopProcessInfos	(self);
};

func void DIA_Sylvio_WASJETZT_Geld ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_Geld_15_00"); //D'abord, je veux voir mon argent.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_Geld_09_01"); //Une fois qu'on se sera fait le dragon, vous pourrez avoir plus d'or que vous ne pouvez en porter.

	Info_AddChoice	(DIA_Sylvio_WASJETZT, "Je veux mon argent maintenant.", DIA_Sylvio_WASJETZT_jetztGeld );
};

func void DIA_Sylvio_WASJETZT_jetztGeld ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_jetztGeld_15_00"); //Je veux mon argent maintenant.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_jetztGeld_09_01"); //Soit vous passez devant soit vous aurez affaire � moi.
};

///////////////////////////////////////////////////////////////////////
//	Info Kommstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_KOMMSTDU		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	11;
	condition	 = 	DIA_Sylvio_KOMMSTDU_Condition;
	information	 = 	DIA_Sylvio_KOMMSTDU_Info;
	permanent	 = 	TRUE;

	description	 = 	"Je pensais que vous alliez vers la r�gion arctique.";
};

func int DIA_Sylvio_KOMMSTDU_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Sylvio_WASJETZT))
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
			{
					return TRUE;
			};
};

func void DIA_Sylvio_KOMMSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_KOMMSTDU_15_00"); //Je croyais que vous vouliez aller dans la r�gion arctique.
	AI_Output			(self, other, "DIA_Sylvio_KOMMSTDU_09_01"); //Passez devant, je serai juste derri�re vous.

	AI_StopProcessInfos	(self);	 
};

///////////////////////////////////////////////////////////////////////
//	Info DuHier
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_DUHIER		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	11;
	condition	 = 	DIA_Sylvio_DUHIER_Condition;
	information	 = 	DIA_Sylvio_DUHIER_Info;
	permanent	 = 	TRUE;

	description	 = 	"De l'aide serait la bienvenue.";
};

func int DIA_Sylvio_DUHIER_Condition ()
{
	if 	((Npc_IsDead(IceDragon)) == FALSE)
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == TRUE)
			{
					return TRUE;
			};
};

func void DIA_Sylvio_DUHIER_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_DUHIER_15_00"); //J'aurai besoin d'aide.
	AI_Output			(self, other, "DIA_Sylvio_DUHIER_09_01"); //Ridicule ! Vous vous en tirez tr�s bien.
	
	AI_StopProcessInfos	(self);	 
};

///////////////////////////////////////////////////////////////////////
//	Info WhatNext
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_WHATNEXT		(C_INFO)
{
	npc		     = 	DJG_700_Sylvio;
	nr		 = 	12;
	condition	 = 	DIA_SylvioDJG_WHATNEXT_Condition;
	information	 = 	DIA_SylvioDJG_WHATNEXT_Info;
	important	 = 	TRUE;
};

func int DIA_SylvioDJG_WHATNEXT_Condition ()
{
	if 	(Npc_IsDead(IceDragon))		
		{
			return TRUE;
		};
};

func void DIA_SylvioDJG_WHATNEXT_Info ()
{
	AI_Output	(self, other, "DIA_SylvioDJG_WHATNEXT_09_00"); //Le dragon des glaces est mort ! Maintenant, donnez-moi tout ce que vous avez sur vous !
	AI_Output	(other, self, "DIA_SylvioDJG_WHATNEXT_15_01"); //Jamais de la vie !
	AI_Output	(self, other, "DIA_SylvioDJG_WHATNEXT_09_02"); //C'est moi qui serait c�l�bre pour avoir tu� le dragon des glaces.
	AI_Output	(self, other, "DIA_SylvioDJG_WHATNEXT_09_03"); //Votre r�le dans cette histoire est termin� !

	TOPIC_END_SylvioKillIceGolem = TRUE;
	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_SylvioDJG_WHATNEXT);
	Info_AddChoice	(DIA_SylvioDJG_WHATNEXT, DIALOG_ENDE, DIA_SylvioDJG_WHATNEXT_ATTACK );
};
func void DIA_SylvioDJG_WHATNEXT_ATTACK ()
{
	AI_StopProcessInfos	(self);
	Npc_SetRefuseTalk (self,60);

	Npc_ExchangeRoutine (self,	"Start");
	B_StartOtherRoutine (DJG_Bullco,"Start");

	B_LogEntry (TOPIC_Dragonhunter,"Ce sale porc de Sylvio s'�tait attribu� ma victoire contre le dragon des glaces. On a eu une petite conversation."); 

	B_Attack (self, other, AR_NONE, 1);	
	B_Attack (DJG_Bullco, other, AR_NONE, 1);	
};

///////////////////////////////////////////////////////////////////////
//	Info ButNow
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_BUTNOW		(C_INFO)
{
	npc		     = 	DJG_700_Sylvio;
	nr		 = 	13;
	condition	 = 	DIA_SylvioDJG_BUTNOW_Condition;
	information	 = 	DIA_SylvioDJG_BUTNOW_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_SylvioDJG_BUTNOW_Condition ()
{
	if 	(Npc_IsDead(IceDragon))
		&& (Npc_RefuseTalk(self) == FALSE)
		&& (Npc_KnowsInfo(other, DIA_SylvioDJG_WHATNEXT))
			{
				return TRUE;
			};
};

func void DIA_SylvioDJG_BUTNOW_Info ()
{
	AI_Output	(self, other, "DIA_SylvioDJG_BUTNOW_09_00"); //Il est temps de r�gler le probl�me.
	
	AI_StopProcessInfos	(self);

	Npc_SetRefuseTalk (self,60);

	B_Attack (self, other, AR_NONE, 1);	
	B_Attack (DJG_Bullco, other, AR_NONE, 1);	
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sylvio_PICKPOCKET (C_INFO)
{
	npc			= DJG_700_Sylvio;
	nr			= 900;
	condition	= DIA_Sylvio_PICKPOCKET_Condition;
	information	= DIA_Sylvio_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Sylvio_PICKPOCKET_Condition()
{
	C_Beklauen (78, 560);
};
 
FUNC VOID DIA_Sylvio_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sylvio_PICKPOCKET);
	Info_AddChoice		(DIA_Sylvio_PICKPOCKET, DIALOG_BACK 		,DIA_Sylvio_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sylvio_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sylvio_PICKPOCKET_DoIt);
};

func void DIA_Sylvio_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sylvio_PICKPOCKET);
};
	
func void DIA_Sylvio_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sylvio_PICKPOCKET);
};






























	/*	

///////////////////////////////////////////////////////////////////////
//	Info AngebotMachen
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_ANGEBOTMACHEN		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	condition	 = 	DIA_SylvioDJG_ANGEBOTMACHEN_Condition;
	information	 = 	DIA_SylvioDJG_ANGEBOTMACHEN_Info;



	description	 = 	"Ich brauche eure Hilfe in der Eisregion!";
};

func int DIA_SylvioDJG_ANGEBOTMACHEN_Condition ()
{
	if (
	(Npc_KnowsInfo(other, DIA_SylvioDJG_HelloAgain))
	&& ((Npc_IsDead(IceDragon))== FALSE)
	)
	{
	return TRUE;
	};
};

func void DIA_SylvioDJG_ANGEBOTMACHEN_Info ()
{
	AI_Output			(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_00"); //Pa� auf, ich mach euch ein Angebot.
	AI_Output			(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_01"); //Na, dann la� mal h�ren.
	AI_Output			(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_02"); //Ihr hockt garantiert nicht zuf�llig hier vor der Eisregion da dr�ben. Ihr spielt mit dem Gedanken da rein zu gehen und euch die Beute dahinter zu schnappen.
	AI_Output			(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_03"); //Und wenn es so w�re?
	AI_Output			(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_04"); //Wir k�nnten gemeinsam hinein gehen!
	AI_Output			(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_05"); //Warum denkst du sollten WIR das tun?
	AI_Output			(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_06"); //Mich interssieren die Sch�tze nicht, die sich dahinter verbergen. Was es da zu holen gibt, k�nnt ihr meinet wegen behalten.
	AI_Output			(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_07"); //Mmh!
	AI_Output			(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_08"); //Ihr seid zwar gut, aber mit drei Mann sind wir schneller wieder raus.
	AI_Output			(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_09"); //Bilde dir aber nicht ein, da� du uns �bers Ohr hauen kannst! Ausserdem ist der Eisdrache nicht von schlechten Eltern. Wir kriegen alles, sagst du?
	AI_Output			(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_10"); //Genau! Jetzt, wo ich wei�, da� es um einen Drachen geht...
	AI_Output			(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_11"); //Verdammt! Na sch�n, von mir aus! Sag bescheid, wenn du bereit bist!

	Log_AddEntry (TOPIC_Dragonhunter,"Sylvio vermutet einen Drachen in der Eisregion."); 
};


//---------------------------------------------------------------------
//	Info WAIT
//---------------------------------------------------------------------
INSTANCE DIA_SylvioDJG_WAIT (C_INFO)
{
	npc			= DJG_700_Sylvio;
	condition	= DIA_SylvioDJG_WAIT_Condition;
	information	= DIA_SylvioDJG_WAIT_Info;
	important	= 0;	
	permanent	= 1;
	description	= "Warte mal einen Moment!";
};                       

FUNC INT DIA_SylvioDJG_WAIT_Condition()
{
	if	(
		(self.aivar[AIV_PARTYMEMBER] == TRUE)
		&& ((Npc_IsDead(IceDragon))== FALSE)
		)
	{
		return TRUE;
	};
};

func VOID DIA_SylvioDJG_WAIT_Info()
{
	AI_Output 			(other,self,"DIA_SylvioDJG_WAIT_15_00"); //Warte mal einen Moment!
	AI_Output 			(self,other,"DIA_SylvioDJG_WAIT_09_01"); //Was ist denn? Geh� gef�lligst weiter!
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info IceWait1
//---------------------------------------------------------------------
INSTANCE DIA_SylvioDJG_IceWait1 (C_INFO)
{
	npc			= DJG_700_Sylvio;
	condition	= DIA_SylvioDJG_IceWait1_Condition;
	information	= DIA_SylvioDJG_IceWait1_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Ich bin soweit!";
};                       

FUNC INT DIA_SylvioDJG_IceWait1_Condition()
{
	if	((self.aivar[AIV_PARTYMEMBER] == FALSE) 
		&& (Npc_KnowsInfo(other, DIA_SylvioDJG_ANGEBOTMACHEN))
		&& ((Npc_IsDead(IceDragon))== FALSE)
		 )
	{
		return TRUE;
	};
};

func VOID DIA_SylvioDJG_IceWait1_Info()
{
	AI_Output 			(other,self,"DIA_SylvioDJG_IceWait1_15_00"); //Ich bin soweit! La� uns losgehen!
	AI_Output 			(self,other,"DIA_SylvioDJG_IceWait1_09_01"); //Dann werden wir ja sehen, wie gut du bist.
	Info_AddChoice		(DIA_SylvioDJG_IceWait1, "losgehen", DIA_SylvioDJG_IceWait1_losgehen );


};
func void DIA_SylvioDJG_IceWait1_losgehen ()
{
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Bullco.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self,		"IceWait1");

	if 	((Hlp_IsValidNpc (DJG_Bullco))
		&& (!Npc_IsDead (DJG_Bullco)))
		{
			Npc_ExchangeRoutine	(DJG_Bullco,"IceWait1");
			AI_ContinueRoutine (DJG_Bullco);
		};
};




//***************************************************************************
//	Info IceWait2
//***************************************************************************
INSTANCE DIA_SylvioDJG_IceWait2 (C_INFO)
{
	npc			= DJG_700_Sylvio;
	condition	= DIA_SylvioDJG_IceWait2_Condition;
	information	= DIA_SylvioDJG_IceWait2_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT DIA_SylvioDJG_IceWait2_Condition()
{
	if (
		(Npc_GetDistToWP(self,"OW_DJG_ICEREGION_WAIT1_01")<1000) 				
		&& ((Npc_IsDead(IceDragon))== FALSE)
		)
	{
		return TRUE;
	};
};

func VOID DIA_SylvioDJG_IceWait2_Info()
{
	AI_GotoNpc	(self,	other);

	AI_Output (self, other,"DIA_SylvioDJG_IceWait2_09_00"); //So! Die erste Ebene scheint nun sicher!
	AI_Output (other, self,"DIA_SylvioDJG_IceWait2_15_01"); //Geh weiter!
	AI_Output (self, other,"DIA_SylvioDJG_IceWait2_09_02"); //H�r dir das an! Der Kleine, kriegt wohl nicht genug, was? 
	Info_AddChoice	(DIA_SylvioDJG_IceWait2, DIALOG_ENDE, DIA_SylvioDJG_IceWait2_weiter );
};

func void DIA_SylvioDJG_IceWait2_weiter ()
{
	AI_Output (self, other,"DIA_SylvioDJG_IceWait2Weiter_09_00"); //Na dann komm!

	AI_StopProcessInfos	(self);

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Bullco.aivar[AIV_PARTYMEMBER] = TRUE;

	Npc_ExchangeRoutine	(self,		"IceWait2");

	if 	((Hlp_IsValidNpc (DJG_Bullco))
		&& (!Npc_IsDead (DJG_Bullco)))
		{
			Npc_ExchangeRoutine	(DJG_Bullco,"IceWait2");
			AI_ContinueRoutine (DJG_Bullco);
		};
};

	



//***************************************************************************
//	Info GoForIceDragon
//***************************************************************************
INSTANCE DIA_SylvioDJG_GoForIceDragon (C_INFO)
{
	npc			= DJG_700_Sylvio;
	condition	= DIA_SylvioDJG_GoForIceDragon_Condition;
	information	= DIA_SylvioDJG_GoForIceDragon_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT DIA_SylvioDJG_GoForIceDragon_Condition()
{
	if (
	(Npc_GetDistToWP(self,"OW_DJG_ICEREGION_WAIT2_01")<1000) 
	&& ((Npc_IsDead(IceDragon))== FALSE)
	)
	{
		return TRUE;
	};
};

func VOID DIA_SylvioDJG_GoForIceDragon_Info()
{
	AI_GotoNpc	(self,	other);

	AI_Output 	(self, other,"DIA_SylvioDJG_GoForIceDragon_09_00"); //So. Jetzt hei�t, es dem Drachen das Handwerk zu legen. Was du machst? Ist mit ehrlich gesagt egal!
	AI_Output	(other, self,"DIA_SylvioDJG_GoForIceDragon_15_01"); //Ich warne dich, Sylvio, verarsch mich jetzt nicht!
	AI_Output 	(self, other,"DIA_SylvioDJG_GoForIceDragon_09_02"); //Bis hierhin warst du eine...na ja...sagen wir...Hilfe. Aber jetzt, da wir an den ganzen Golemfeldern vorbei sind, �berlass die Hauptarbeit mal lieber einem Profi. Sonst passiert dir noch was.
	AI_Output	(other, self,"DIA_SylvioDJG_GoForIceDragon_15_03"); //Keine Chance!
	AI_Output	(self, other,"DIA_SylvioDJG_GoForIceDragon_09_04"); //Na gut! Wenn du nicht anders willst. Aber beschwer dich nachher nicht ich h�tte...
	AI_Output	(other, self,"DIA_SylvioDJG_GoForIceDragon_15_05"); //Halt endlich die Klappe!

	Log_AddEntry (TOPIC_Dragonhunter,"Sylvio wollte mich erst los werden, nachdem wir die Icegolemebene hinter uns gelassen hatten. Schlie�lich griffen wir dann doch gemeinsam den Eisdrachen an."); 
	
	B_GivePlayerXP (XP_SylvioDJGIceClear);
	
	Info_AddChoice	(DIA_SylvioDJG_GoForIceDragon, "weiter gehen", DIA_SylvioDJG_GoForIceDragon_weitergehen );
};

func void DIA_SylvioDJG_GoForIceDragon_weitergehen ()
{
	AI_Output	(self, other, "DIA_SylvioDJG_GoForIceDragon_weitergehen_09_00"); //Los, weiter!

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self,	"IceDragon");

	if 	((Hlp_IsValidNpc (DJG_Bullco))
		&& (!Npc_IsDead (DJG_Bullco)))
		{
			Npc_ExchangeRoutine	(DJG_Bullco,"IceDragon");
			AI_ContinueRoutine (DJG_Bullco);
		};

	self.flags =0;
	DJG_Bullco.flags =0;

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Bullco.aivar[AIV_PARTYMEMBER] = FALSE;
};



///////////////////////////////////////////////////////////////////////
//	Info WhatNext
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_WHATNEXT		(C_INFO)
{
	npc		     = 	DJG_700_Sylvio;
	condition	 = 	DIA_SylvioDJG_WHATNEXT_Condition;
	information	 = 	DIA_SylvioDJG_WHATNEXT_Info;
	important	 = 	TRUE;


};

func int DIA_SylvioDJG_WHATNEXT_Condition ()
{
	if (
		((Npc_IsDead(IceDragon))== TRUE)	
		)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_WHATNEXT_Info ()
{
	AI_Output	(self, other, "DIA_SylvioDJG_WHATNEXT_09_00"); //Der Eisdrache ist tot! Und du gibst mir jetzt alles, was du bei dir hast!
	AI_Output	(other, self, "DIA_SylvioDJG_WHATNEXT_15_01"); //Was ist los? Ich denke ja gar nicht daran!	
	AI_Output	(self, other, "DIA_SylvioDJG_WHATNEXT_09_02"); //Ich werde derjenige sein, der als Eisdrachent�ter gefeiert wird. Deine kleine Rolle bei der Sache, wird jetzt aus der Welt geschafft!
	
	AI_StopProcessInfos	(self);
	
	self.flags =0;
	DJG_Bullco.flags =0;

	Log_AddEntry (TOPIC_Dragonhunter,"Das dreckige Schwein Sylvio wollte mir den Sieg �ber den Eisdrachen steitig machen. Es gab eine kleine Auseinandersetzung."); 

	B_Attack (self, other, AR_NONE, 1);	
	B_Attack (DJG_Bullco, other, AR_NONE, 1);	
	
	Npc_ExchangeRoutine (self,	"Start");

	if 	((Hlp_IsValidNpc (DJG_Bullco))
		&& (!Npc_IsDead (DJG_Bullco)))
		{
			Npc_ExchangeRoutine	(DJG_Bullco,"Start");
			AI_ContinueRoutine (DJG_Bullco);
		};
};


	*/	









