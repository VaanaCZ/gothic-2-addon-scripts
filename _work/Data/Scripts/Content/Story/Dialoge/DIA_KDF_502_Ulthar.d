///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ulthar_EXIT   (C_INFO)
{
	npc         = KDF_502_Ulthar;
	nr          = 999;
	condition   = DIA_Ulthar_EXIT_Condition;
	information = DIA_Ulthar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Ulthar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
	
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_GREET		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_GREET_Condition;
	information	 = 	DIA_Ulthar_GREET_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Ulthar_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&&(!Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_GREET_Info ()
{
	AI_Output (self, other, "DIA_Ulthar_GREET_05_00"); //Regardez, le nouveau novice se présente devant le Haut Conseil. Qu'Innos soit avec vous, mon fils.
	AI_Output (other, self, "DIA_Ulthar_GREET_15_01"); //Quelle est exactement la tâche du Haut Conseil ?
	AI_Output (self, other, "DIA_Ulthar_GREET_05_02"); //Notre devoir est de proclamer la volonté d'Innos. Ainsi nous choisissons les novices qui seront soumis à l'Epreuve de magie.
	AI_Output (self, other, "DIA_Ulthar_GREET_05_03"); //Même si nous menons une existence retirée, nous observons les événements du monde car l'église d'Innos est l'incarnation des plus hauts principes terrestres.
	AI_Output (other, self, "DIA_Ulthar_GREET_15_04"); //Ainsi vous vous intéressez à ce qui se passe dans le monde...
	AI_Output (other, self, "DIA_Ulthar_GREET_15_05"); //Alors que pensez-vous de ces dragons réunis dans la Vallée des mines avec leur armée qui s'agrandit jour après jour ?
	AI_Output (self, other, "DIA_Ulthar_GREET_05_06"); //Je comprends votre colère mais nous devons d'abord peser le pour et le contre avant de prendre des mesures.
	AI_Output (self, other, "DIA_Ulthar_GREET_05_07"); //Si nous nous laissons emporter et que nous agissons imprudemment, nous n'arriverons à rien. Alors accomplissez votre devoir et nous reparlerons de ce qu'il convient de faire.
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_MAGETEST		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_MAGETEST_Condition;
	information	 = 	DIA_Ulthar_MAGETEST_Info;
	description	 = 	"Parlez-moi du test de magie.";
};
func int DIA_Ulthar_MAGETEST_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Ulthar_GREET)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_MAGETEST_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_MAGETEST_15_00"); //Parlez-moi de l'Epreuve de magie.
	AI_Output (self, other, "DIA_Ulthar_MAGETEST_05_01"); //C'est l'occasion pour les novices qui ont été choisis d'entrer dans la guilde des magiciens. Mais seul l'un d'entre eux peut réussir ce test.
	AI_Output (self, other, "DIA_Ulthar_MAGETEST_05_02"); //Et seul Innos choisit le novice qui l'emportera.
};
///////////////////////////////////////////////////////////////////////
//	Info WHEN
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_WHEN		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	3;
	condition	 = 	DIA_Ulthar_WHEN_Condition;
	information	 = 	DIA_Ulthar_WHEN_Info;
	permanent	 =  TRUE;
	description	 = 	"Quand aura lieu le test ?";
};
func int DIA_Ulthar_WHEN_Condition ()
{
	if  Npc_KnowsInfo (hero, DIA_Ulthar_MAGETEST)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_WHEN_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_WHEN_15_00"); //Quand se déroulera cette épreuve ?
	AI_Output (self, other, "DIA_Ulthar_WHEN_05_01"); //Dès qu'Innos nous aura fait part de sa volonté. Nous informons alors les novices qui ont été choisis et nous leur faisons passer l'épreuve.
	
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_TEST		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  10;
	condition	 = 	DIA_Ulthar_TEST_Condition;
	information	 = 	DIA_Ulthar_TEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Maître, je suis prêt à passer votre test.";
};
func int DIA_Ulthar_TEST_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_TEST_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_TEST_15_00"); //Je suis prêt à surmonter votre épreuve, maître.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_01"); //Je ne suis pas surpris que vous connaissiez l'ancienne loi.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_02"); //Mais je pense que vous ne vous rendez pas compte des risques que vous encourez. N'oubliez pas qu'un impatient ne peut surmonter l'Epreuve du feu.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_03"); //Cela fait longtemps que personne n'a passé cette épreuve. Et seul un homme y a survécu.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_04"); //C'était alors un jeune novice ambitieux qui a trouvé depuis longtemps sa place au Haut Conseil. Je parle de Serpentes.
	AI_Output (other, self, "DIA_Ulthar_TEST_15_05"); //Il ne restera pas très longtemps le seul à avoir réussi cette épreuve.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_06"); //Alors je ne vous ferai pas attendre plus longtemps. Voici mon épreuve :
	AI_Output (self, other, "DIA_Ulthar_TEST_05_07"); //Créez une rune de flèche de feu. C'est tout. Qu'Innos vous vienne en aide.
	
	MIS_RUNE = LOG_RUNNING;
	Log_CreateTopic (TOPIC_Rune,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rune,LOG_RUNNING);
	B_LogEntry (TOPIC_Rune,"Ulthar m'a annoncé mon épreuve. Je dois fabriquer une rune de Flèche de feu.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_RUNNING		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  10;
	condition	 = 	DIA_Ulthar_RUNNING_Condition;
	information	 = 	DIA_Ulthar_RUNNING_Info;
	permanent	 = 	TRUE;
	important	 = 	TRUE;
};
func int DIA_Ulthar_RUNNING_Condition ()
{	
	if (MIS_RUNE == LOG_RUNNING)
	&& Npc_IsInState	(self, ZS_Talk) 
	&& (Npc_HasItems    (other, ItRu_FireBolt) == 0)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_RUNNING_Info ()
{
	AI_Output (self, other, "DIA_Ulthar_RUNNING_05_00"); //Vous savez ce que vous devez faire, alors allez-y.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_SUCCESS_Condition;
	information	 = 	DIA_Ulthar_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"J'ai créé la rune !";
};
func int DIA_Ulthar_SUCCESS_Condition ()
{
	if (MIS_RUNE == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItRu_FireBolt) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_SUCCESS_15_00"); //J'ai créé la rune !
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_01"); //Très bien, novice. Gardez-la, c'est votre première rune.
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_02"); //Une fois que vous aurez atteint le 1er Cercle de feu, vous pourrez l'utiliser.
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_03"); //Vous avez réussi cette épreuve et j'en suis satisfait.
	
	if (MIS_GOLEM == LOG_RUNNING)
	&& ((Npc_IsDead (Magic_Golem)) == FALSE)
	{
		AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_04"); //Mais il vous reste encore à surmonter le dangereux test que Serpentes vous a préparé.
	};
	
	MIS_RUNE = LOG_SUCCESS;
	B_GivePlayerXP (XP_RUNE);
	
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

INSTANCE DIA_Ulthar_KAP3_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP3_EXIT_Condition;
	information	= DIA_Ulthar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PermAbKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_PermAbKap3		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  99;
	condition	 = 	DIA_Ulthar_PermAbKap3_Condition;
	information	 = 	DIA_Ulthar_PermAbKap3_Info;
	permanent	 = 	TRUE;
	description  =  "Des nouvelles ?";
};
func int DIA_Ulthar_PermAbKap3_Condition ()
{	
	if (Kapitel >= 3)
	|| Npc_KnowsInfo (other,DIA_Ulthar_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_PermAbKap3_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_PermAbKap3_15_00"); //Des nouvelles ?

	if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ulthar_PermAbKap3_05_01"); //Pas pour le moment. Occupez-vous de vos tâches, vous avez encore beaucoup à faire.
	}
	else
	{
		AI_Output (self, other, "DIA_Ulthar_PermAbKap3_05_02"); //Non. Rien que vous ne sachiez déjà, mon frère.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchreineVergiftet
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SCHREINEVERGIFTET		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SCHREINEVERGIFTET_Condition;
	information	 = 	DIA_Ulthar_SCHREINEVERGIFTET_Info;
	important	 = 	TRUE;
};

func int DIA_Ulthar_SCHREINEVERGIFTET_Condition ()
{
	if (Pedro_Traitor == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SCHREINEVERGIFTET_Info ()
{
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_00"); //Encore une chose. Certains sanctuaires d'Innos le long de la route ont été profanés par l'ennemi. Ils ont perdu leur enchantement.
			AI_Output			(other, self, "DIA_Ulthar_SCHREINEVERGIFTET_15_01"); //Je vois. Et maintenant ?
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_02"); //Il vous revient de purifier ces sanctuaires pour éviter que la situation n'empire.
			CreateInvItems (self, ItMi_UltharsHolyWater_Mis, 1);									
			B_GiveInvItems (self, other, ItMi_UltharsHolyWater_Mis, 1);	
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_03"); //Prenez cette eau bénite et versez-en à la base des sanctuaires.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_04"); //Avec les saintes paroles de purification, les sanctuaires retrouveront leur ancien pouvoir.

			if ((Npc_HasItems (other,ItWr_Map_Shrine_MIS))==FALSE)
			{
				if ((Npc_HasItems (Gorax,ItWr_Map_Shrine_MIS)))
				&& ((Npc_IsDead(Gorax))== FALSE)
				{
					AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_05"); //Gorax peut vous vendre une carte sur laquelle seront indiqués les endroits où se trouvent les sanctuaires.
				}
				else
				{
					AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_06"); //Voici une carte. Les sanctuaires que nous avons érigés y sont indiqués.
					CreateInvItems (self, ItWr_Map_Shrine_MIS, 1);									
					B_GiveInvItems (self, other, ItWr_Map_Shrine_MIS, 1);					
				};
			};

			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_07"); //Maintenant allez et accomplissez votre devoir.
			MIS_Ulthar_HeileSchreine_PAL = LOG_RUNNING;	
			
			Log_CreateTopic (TOPIC_Ulthar_HeileSchreine_PAL, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Ulthar_HeileSchreine_PAL, LOG_RUNNING);
			B_LogEntry (TOPIC_Ulthar_HeileSchreine_PAL,"Ulthar m'a demandé de purifier avec de l'eau bénite tous les temples souillés par l'ennemi."); 
			
			AI_StopProcessInfos (self);
		}
		else
		{
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_08"); //Une dernière petite chose. Ne vous approchez pas des sanctuaires le long de la route. Nous avons appris que certains d'entre eux avaient été profanés.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_09"); //Personne ne peut dire quels effets ils peuvent avoir sur les gens.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_10"); //Ce n'est pas à vous de résoudre ce problème. Les paladins s'en chargeront.
			AI_StopProcessInfos (self);
		};
};

///////////////////////////////////////////////////////////////////////
//	Info SchreineGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SchreineGeheilt		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SchreineGeheilt_Condition;
	information	 = 	DIA_Ulthar_SchreineGeheilt_Info;

	description  = 	"J'ai purifié tous les sanctuaires.";
};

func int DIA_Ulthar_SchreineGeheilt_Condition ()
{
	if (MIS_Ulthar_HeileSchreine_PAL == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SchreineGeheilt_Info ()
{
	AI_Output			(other, self, "DIA_Ulthar_SchreineGeheilt_15_00"); //J'ai purifié les sanctuaires.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheilt_05_01"); //Excellent mon fils. Je suis fier de vous. Qu'Innos veille sur vous.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheilt_05_02"); //Prenez cette amulette de force, elle pourra vous aider dans votre combat contre l'ennemi.
	CreateInvItems (self, ItAm_Dex_Strg_01, 1);									
	B_GiveInvItems (self, other, ItAm_Dex_Strg_01, 1);
	B_GivePlayerXP (XP_Ulthar_SchreineGereinigt);
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Ulthar_KAP4_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP4_EXIT_Condition;
	information	= DIA_Ulthar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info SchreineGeheiltNoPAL
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SchreineGeheiltNoPAL		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SchreineGeheiltNoPAL_Condition;
	information	 = 	DIA_Ulthar_SchreineGeheiltNoPAL_Info;
	important	 = 	TRUE;

};

func int DIA_Ulthar_SchreineGeheiltNoPAL_Condition ()
{
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)|| (hero.guild == GIL_KDF))
	&& (Kapitel >= 4)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SchreineGeheiltNoPAL_Info ()
{
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheiltNoPAL_05_00"); //Bonnes nouvelles. Les sanctuaires le long de la route ont été purifiés. La force d'Innos a aidé les paladins à nous débarrasser de ce problème.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheiltNoPAL_05_01"); //Vous pouvez de nouveau faire des offrandes à Innos sans crainte.
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Ulthar_KAP5_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP5_EXIT_Condition;
	information	= DIA_Ulthar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Ulthar_KAP6_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP6_EXIT_Condition;
	information	= DIA_Ulthar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ulthar_PICKPOCKET (C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 900;
	condition	= DIA_Ulthar_PICKPOCKET_Condition;
	information	= DIA_Ulthar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Ulthar_PICKPOCKET_Condition()
{
	C_Beklauen (74, 320);
};
 
FUNC VOID DIA_Ulthar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ulthar_PICKPOCKET);
	Info_AddChoice		(DIA_Ulthar_PICKPOCKET, DIALOG_BACK 		,DIA_Ulthar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ulthar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ulthar_PICKPOCKET_DoIt);
};

func void DIA_Ulthar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ulthar_PICKPOCKET);
};
	
func void DIA_Ulthar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ulthar_PICKPOCKET);
};
































 
























