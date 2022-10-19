///////////////////////////////////////////////////////////////////////
//	Info Kap1 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap1_EXIT_Condition;
	information = DIA_Serpentes_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info NOTALK
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOTALK		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOTALK_Condition;
	information	 = 	DIA_Serpentes_NOTALK_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Serpentes_NOTALK_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOTALK_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_NOTALK_10_00"); //(en colère) Vous osez vous adresser à moi, novice ? Retournez au travail.
	
	Info_ClearChoices (DIA_Serpentes_NOTALK);
	Info_AddChoice 	  (DIA_Serpentes_NOTALK,"Je dois y aller (FIN)",DIA_Serpentes_NOTALK_EXIT);
	Info_AddChoice 	  (DIA_Serpentes_NOTALK,"J'ai encore une question...",DIA_Serpentes_NOTALK_QUESTION);
};
FUNC VOID DIA_Serpentes_NOTALK_QUESTION()
{
	AI_Output (other, self, "DIA_Serpentes_NOTALK_QUESTION_15_00"); //J'ai une autre question.
	AI_Output (self, other, "DIA_Serpentes_NOTALK_QUESTION_10_01"); //(furieux) Vous semblez ne rien vouloir comprendre. Je décide quand je trouve opportun de vous parler. Pour qui vous prenez-vous ?
	AI_Output (self, other, "DIA_Serpentes_NOTALK_QUESTION_10_02"); //Maintenant, retournez au travail !
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Serpentes_NOTALK_EXIT()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_GOAWAY		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_GOAWAY_Condition;
	information	 = 	DIA_Serpentes_GOAWAY_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Serpentes_GOAWAY_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Serpentes_NOTALK)
	&& Npc_IsInState (self, ZS_Talk)
	&& !(Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_GOAWAY_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_GOAWAY_10_00"); //Votre présence ici démontre votre manque de respect mais aussi votre stupidité, novice !
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info YOURSTORY
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_YOURSTORY		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr			 = 	24;
	condition	 = 	DIA_Serpentes_YOURSTORY_Condition;
	information	 = 	DIA_Serpentes_YOURSTORY_Info;
	permanent	 =  FALSE;
	description	 = 	"J'ai entendu dire que vous avez réussi l'Epreuve du feu.";
};
func int DIA_Serpentes_YOURSTORY_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Ulthar_TEST)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (hero, DIA_Pyrokar_MAGICAN)== FALSE)
	&& (MIS_GOLEM != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_YOURSTORY_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_YOURSTORY_15_00"); //J'ai entendu dire que vous aviez passé l'Epreuve du feu.
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_01"); //(d'une voix douce) Humblement, je peux vous dire ceci. Tous ceux qui l'ont tentée en sont morts.
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_02"); //(condescendant) Vous devriez éviter de la passer. Votre esprit est faible. Vous feriez mieux de servir au monastère et peut-être que, dans quelques années, vous serez choisi.
	AI_Output (other, self, "DIA_Serpentes_YOURSTORY_15_03"); //Je vais passer l'épreuve.
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_04"); //Si telle est la volonté d'Innos, alors faites donc. Mais dans le cas contraire, vous échouerez.
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_TEST		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_TEST_Condition;
	information	 = 	DIA_Serpentes_TEST_Info;
	permanent	 = 	FALSE;
	description	 = 	"Maître, je suis prêt à passer votre test.";
};
func int DIA_Serpentes_TEST_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_TEST_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_TEST_15_00"); //Je suis prêt à surmonter votre épreuve, maître.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_01"); //Ainsi vous voulez être mis à l'épreuve. Seuls les novices courageux demandent le test. Mais le courage n'est pas tout ce dont vous aurez besoin.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_02"); //Etes-vous assez futé ? Etes-vous assez fort pour affronter les dangers qui vous guettent ?
	AI_Output (self, other, "DIA_Serpentes_TEST_10_03"); //Sinon, vous le paierez de votre vie.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_04"); //Et maintenant, voici votre test : Là où se dressent les pierres, cherchez celui qui n'est jamais né, trouvez celui qui fut autrefois invoqué.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_05"); //Triomphez de celui dont on ne peut triompher, mesurez-vous au rocher vivant, combattez la pierre éternelle et détruisez-la.
	
	//----- Der Magische Golem ----
	Wld_InsertNpc 	(MagicGolem, 			"FP_MAGICGOLEM");
	Magic_Golem		= Hlp_GetNpc (MagicGolem);	//Damits auch initialisiert ist!!


	MIS_GOLEM = LOG_RUNNING;
	Log_CreateTopic (TOPIC_Golem,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Golem,LOG_RUNNING);
	B_LogEntry (TOPIC_Golem,"Serpentes a préparé mon épreuve. Il veut que je trouve 'celui qui fut convoqué', le rocher vivant, et que j'en triomphe.");
};
///////////////////////////////////////////////////////////////////////
//	Info NOIDEA
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOIDEA		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOIDEA_Condition;
	information	 = 	DIA_Serpentes_NOIDEA_Info;
	permanent	 = 	FALSE;
	description	 = 	"Quelle sorte de créature cela peut-il être ?";
};
func int DIA_Serpentes_NOIDEA_Condition ()
{	
	if (MIS_GOLEM == LOG_RUNNING)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOIDEA_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_NOIDEA_15_00"); //Le rocher vivant... ? De quel genre de créature peut-il s'agir ?
	AI_Output (self, other, "DIA_Serpentes_NOIDEA_10_01"); //Je vous ai tout dit. (moqueur) Peut-être trouvez-vous ce test trop difficile ?
	AI_Output (self, other, "DIA_Serpentes_NOIDEA_10_02"); //Maintenant, vous allez découvrir ce que cela implique de choisir l'Epreuve du feu. Je ne répondrai plus à aucune de vos questions.
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info NOHELP
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOHELP		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOHELP_Condition;
	information	 = 	DIA_Serpentes_NOHELP_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Serpentes_NOHELP_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Serpentes_NOIDEA)
	&& ((Npc_IsDead (Magic_Golem)) == FALSE)
	&& (MIS_GOLEM == LOG_RUNNING)
	&& Npc_IsInState	(self, ZS_Talk) 
	&& (other.guild == GIL_NOV)
	&& ((Npc_KnowsInfo (other, DIA_Ulthar_TEST) == FALSE)
	|| Npc_KnowsInfo (other,DIA_Serpentes_YOURSTORY))
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOHELP_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_NOHELP_10_00"); //(méprisant) Allez et accomplissez votre tâche, novice !
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr			 = 	3;
	condition	 = 	DIA_Serpentes_SUCCESS_Condition;
	information	 = 	DIA_Serpentes_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"J'ai vaincu le golem.";
};
func int DIA_Serpentes_SUCCESS_Condition ()
{	
	if (Npc_IsDead (MagicGolem))
	&& (MIS_GOLEM == LOG_RUNNING)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_SUCCESS_Info ()
{
	var C_NPC garwig;
	garwig = Hlp_GetNpc (NOV_608_Garwig);
	
	AI_Output (other, self, "DIA_Serpentes_SUCCESS_15_00"); //J'ai vaincu le golem.
	AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_01"); //Quoi ? Vous avez vraiment réussi ? Mais, sans le marteau d'Innos, il est impossible que vous ayez détruit le golem.
	
	if (Npc_IsDead (garwig))
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_02"); //(triomphant) Mais vous vous êtes trahi ! C'est vous qui avez tué Garwig !
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_03"); //RECEVEZ LA PUNITION POUR LE MEURTRE D'UN SERVITEUR D'INNOS !!!!
		
		AI_StopProcessInfos (self);
		B_Attack  (self, other, AR_HumanMurderedHuman, 0);
	}
	else 
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_04"); //(avec regret) Qu'importe, je dois admettre que vous avez accompli la tâche que je vous avais confiée.
	};
	if (Npc_HasItems (other, Holy_Hammer_Mis) >= 1)
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_05"); //Et je ferais bien de reprendre le marteau.
		
		Npc_RemoveInvItems (other, Holy_Hammer_MIS,1); 
		Wld_InsertItem (Holy_Hammer_MIS,"FP_HAMMER");
	};
	
	MIS_GOLEM = LOG_SUCCESS;
	B_GivePlayerXP (XP_GOLEM);
	
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_PERM   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 99;
	condition   = DIA_Serpentes_PERM_Condition;
	information = DIA_Serpentes_PERM_Info;
	permanent   = TRUE;

	description = "Y a-t-il autre chose que vous vouliez me dire ?";
};
FUNC INT DIA_Serpentes_PERM_Condition()
{	
	if (Kapitel >= 3)
	|| Npc_KnowsInfo (other,DIA_Serpentes_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Serpentes_PERM_Info()
{
	AI_Output (other, self, "DIA_Serpentes_PERM_15_00"); //Y a-t-il autre chose que vous vouliez me dire ?

		if (hero.guild == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Serpentes_PERM_10_01"); //Non. Pas pour l'instant, mon frère.
		}
		else
		{
			AI_Output (self, other, "DIA_Serpentes_PERM_10_02"); //Rompez. Vous savez ce que vous avez à faire.
		};
	AI_StopProcessInfos (self);
};

//##################################################################
//##
//##	Kapitel 2
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap2 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap2_EXIT_Condition;
	information = DIA_Serpentes_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


//##################################################################
//##
//##	Kapitel 3
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap3 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap3_EXIT_Condition;
	information = DIA_Serpentes_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info MinenAnteile
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_MinenAnteile		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	30;
	condition	 = 	DIA_Serpentes_MinenAnteile_Condition;
	information	 = 	DIA_Serpentes_MinenAnteile_Info;
	important	 = 	TRUE;
};

func int DIA_Serpentes_MinenAnteile_Condition ()
{
	if (Pedro_Traitor == TRUE)
	&& ((hero.guild == GIL_KDF) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Serpentes_MinenAnteile_Info ()
{
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_00"); //Pas si vite. J'ai une autre tâche à vous confier.

	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_15_01"); //(en soupirant) Et laquelle ?
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_02"); //Maintenant que vous appartenez à la Confrérie du feu, vous devez vous acquitter des tâches qui nous incombent.
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_03"); //Vous n'êtes pas sans savoir que non seulement l'église s'occupe d'affaires concernant la magie mais elle fait aussi autorité en matière de justice.
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_04"); //Le dernier cas qui nous a été soumis nous plonge dans un abîme de perplexité et nous devons régler cette affaire une fois pour toutes.
		
		Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "J'en ai assez. Allez trouver quelqu'un d'autre.", DIA_Serpentes_MinenAnteile_nein );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Qu'est-ce que cela signifie ?", DIA_Serpentes_MinenAnteile_was );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "N'est-ce pas le travail de la milice ?", DIA_Serpentes_MinenAnteile_miliz );
	}
	else
	{
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_05"); //Un mercenaire de votre genre pourrait nous aider.
		
		Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "J'en ai assez. Allez trouver quelqu'un d'autre.", DIA_Serpentes_MinenAnteile_nein );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Qui devrais-je tuer ?", DIA_Serpentes_MinenAnteile_KillSLD );
	};
};
func void DIA_Serpentes_MinenAnteile_miliz ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_miliz_15_00"); //N'est-ce pas le travail de la milice ?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_miliz_10_01"); //La milice est responsable de la ville uniquement. Cette affaire a des conséquences beaucoup plus larges.

};

func void DIA_Serpentes_MinenAnteile_nein ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_nein_15_00"); //J'en ai assez de ce genre de choses. Trouvez-vous quelqu'un d'autre.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_nein_10_01"); //(en colère) C'est un outrage. Jamais vous n'atteindrez les cercles supérieurs de la magie si vous ne voulez pas rendre un service à la Confrérie.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_nein_10_02"); //Vous méritez un blâme. J'espère que ça ne se reproduira plus ou cela pourrait aller mal pour vous.
	AI_StopProcessInfos (self);
};

func void DIA_Serpentes_MinenAnteile_was ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_15_00"); //De quoi s'agit-il ?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_01"); //Quelqu'un en ville vend de fausses concessions minières de l'ancienne colonie pénitentiaire.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_02"); //Ces documents n'ont aucune valeur et sont sans importance. Mais ils peuvent cependant provoquer des troubles au sein de la population, ce que nous ne pouvons permettre.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_03"); //On pense que l'escroc a contacté tous les marchands les plus réputés de la ville et du pays et qu'il a même réussi à vendre ces documents falsifiés à certains d'entre eux.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_04"); //Trouvez cet escroc et conduisez-le devant ce jury. En ces temps difficiles nous ne pouvons tolérer de telles pratiques.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_05"); //Nous devons faire un exemple pour en dissuader d'autres d'agir de même.
	
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Je vais essayer de tirer cette affaire au clair.", DIA_Serpentes_MinenAnteile_was_ja );

};
func void DIA_Serpentes_MinenAnteile_was_ja ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_ja_15_00"); //Je vais essayer d'éclaircir cette affaire.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_01"); //Encore une chose. Quand vous rendrez visite à ces marchands, ne leur dites pas que vous recherchez des concessions minières.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_02"); //Je pense qu'ils veulent les vendre et ils refuseront de vous les proposer s'ils découvrent que vous travaillez pour le compte de l'église. Compris ?
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_ja_15_03"); //Oui.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_04"); //Alors mettez-vous au travail. Je vous souhaite de réussir mon frère.
	Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
	
	MIS_Serpentes_MinenAnteil_KDF = LOG_RUNNING;	

	 if ((Npc_IsDead(Salandril))== FALSE)
	 {
		 CreateInvItems (Salandril, 	ItWr_MinenAnteil_Mis, 2); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	 };
	 if ((Npc_IsDead(VLK_416_Matteo))== FALSE)
	 {
		 CreateInvItems (VLK_416_Matteo, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_413_Bosper))== FALSE)
	 {
		 CreateInvItems (VLK_413_Bosper, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_409_Zuris))== FALSE)
	 {
		 CreateInvItems (VLK_409_Zuris, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(BAU_911_Elena))== FALSE)
	 {
		 CreateInvItems (BAU_911_Elena, 	ItWr_MinenAnteil_Mis, 2); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	 };
	 if ((Npc_IsDead(BAU_970_Orlan))== FALSE)
	 {
		 CreateInvItems (BAU_970_Orlan, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_407_Hakon))== FALSE)
	 {
		 CreateInvItems (VLK_407_Hakon, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(BAU_936_Rosi))== FALSE)
	 {
		 CreateInvItems (BAU_936_Rosi, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_468_Canthar))== FALSE)
	 {
		 CreateInvItems (VLK_468_Canthar, 	ItWr_MinenAnteil_Mis, 3); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 3;
	 };
	SalandrilVerteilteMinenAnteil =	SalandrilMinenAnteil_MAINCounter;

	Log_CreateTopic (TOPIC_MinenAnteile, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile, LOG_RUNNING);
	B_LogEntry (TOPIC_MinenAnteile,"Pour s'enrichir, quelqu'un vend des concessions minières illégales. Je dois trouver qui vend ces parts aux marchands des environs. Serpentes veut tous les faux papiers."); 
};

func void DIA_Serpentes_MinenAnteile_KillSLD ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_Kill_15_00"); //Qui devrai-je tuer ?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_01"); //Par la grâce d'Innos, mais personne ! Cette affaire exige de la finesse, espèce de rustre.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_02"); //Salandril, l'alchimiste du haut quartier de la ville, est coupable d'un crime majeur. Il doit être puni.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_03"); //Cependant, il a refusé de venir au monastère pour être jugé. Ramenez-le-nous.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_04"); //Faites comme bon vous semble. Vous serez, bien sûr, récompensé.
	
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "N'est-ce pas le travail de la milice ?", DIA_Serpentes_MinenAnteile_miliz );
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Pas de problème. Je vais m'en occuper.", DIA_Serpentes_MinenAnteile_was_jaSLD );
};

var int MIS_Serpentes_BringSalandril_SLD;
func void DIA_Serpentes_MinenAnteile_was_jaSLD ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_jaSLD_15_00"); //Pas de problème, je m'en occupe.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_jaSLD_10_01"); //Bien. Nous espérons avoir de vos nouvelles dans quelques jours.
	MIS_Serpentes_BringSalandril_SLD = LOG_RUNNING;
	Info_ClearChoices	(DIA_Serpentes_MinenAnteile);

	Log_CreateTopic (TOPIC_MinenAnteile, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile, LOG_RUNNING);
	B_LogEntry (TOPIC_MinenAnteile,"Je dois conduire Salandril, un alchimiste du haut quartier de Khorinis, au monastère pour qu'il y soit jugé. Je me fiche de savoir ce qu'il est censé avoir fait tant que je suis payé."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MinenAnteileBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_MinenAnteileBringen		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	2;
	condition	 = 	DIA_Serpentes_MinenAnteileBringen_Condition;
	information	 = 	DIA_Serpentes_MinenAnteileBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Au sujet des fausses concessions minières...";
};

func int DIA_Serpentes_MinenAnteileBringen_Condition ()
{
	if (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_MinenAnteil_Mis))
	&& (hero.guild == GIL_KDF) 
		{
				return TRUE;
		};
};

var int SerpentesMinenAnteilCounter;
func void DIA_Serpentes_MinenAnteileBringen_Info ()
{
		var int SerpentesMinenAnteilCount;
		var int XP_BringSerpentesMinenAnteils;
		var int SerpentesMinenAnteilOffer;
		var int SerpentesMinenAnteilGeld;
	
		SerpentesMinenAnteilCount = Npc_HasItems(other, ItWr_MinenAnteil_Mis);
		SerpentesMinenAnteilOffer = 200; 

		 if (SerpentesMinenAnteilCount == 1)
			{
				AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_00"); //J'ai réussi à récupérer une concession minière.
				B_GivePlayerXP (XP_BringSerpentesMinenAnteil);
				B_GiveInvItems (other, self, ItWr_MinenAnteil_Mis,1);
				SerpentesMinenAnteilCounter = SerpentesMinenAnteilCounter + 1;
			}
			else
			{
				AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_01"); //J'ai réussi à récupérer quelques concessions minières.
	
				B_GiveInvItems (other, self, ItWr_MinenAnteil_Mis,  SerpentesMinenAnteilCount);
	
				XP_BringSerpentesMinenAnteils = (SerpentesMinenAnteilCount * XP_BringSerpentesMinenAnteil);
				SerpentesMinenAnteilCounter = (SerpentesMinenAnteilCounter + SerpentesMinenAnteilCount); 
	
				B_GivePlayerXP (XP_BringSerpentesMinenAnteils);
			};

		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter - SerpentesMinenAnteilCount;
		
		var string MinenAnteilText;
		var string MinenAnteilLeft;
		MinenAnteilLeft = IntToString (SalandrilMinenAnteil_MAINCounter);
		MinenAnteilText = ConcatStrings(MinenAnteilLeft, PRINT_NumberLeft);
		AI_PrintScreen	(MinenAnteilText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);

		if (SerpentesMinenAnteilCounter < SalandrilVerteilteMinenAnteil)
		{
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_02"); //Très bien. Vous devez toutes les retirer de la circulation. C'est un poison pour le peuple. Ramenez-les moi toutes.
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_03"); //Tenez. Je vais vous en donner les moyens.
		}
		else if (SerpentesMinenAnteilCounter == SalandrilVerteilteMinenAnteil) //Joly:kein Exploid
		{
			AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_04"); //Je pense qu'il n'y en a plus.
			AI_Output		(self, other, "DIA_Serpentes_MinenAnteileBringen_10_05"); //Bien joué. Vous avez mérité une récompense.
			AI_Output		(self, other, "DIA_Serpentes_MinenAnteileBringen_10_06"); //Prenez cette amulette de protection. Elle vous aidera dans la voie sur laquelle vous vous êtes déjà engagé.
			CreateInvItems (self, ItAm_Prot_Mage_01, 1); 
			B_GiveInvItems (self, other, ItAm_Prot_Mage_01, 1);
		}
		else	//Joly: zur Sicherheit!
		{
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_07"); //C'est vraiment la dernière, n'est-ce pas ?
		};
		
		SerpentesMinenAnteilGeld	= (SerpentesMinenAnteilCount * SerpentesMinenAnteilOffer);
		
		CreateInvItems (self, ItMi_Gold, SerpentesMinenAnteilGeld); 
		B_GiveInvItems (self, other, ItMi_Gold, SerpentesMinenAnteilGeld);
};

///////////////////////////////////////////////////////////////////////
//	Info GotSalandril
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_GOTSalandril		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	32;
	condition	 = 	DIA_Serpentes_GOTSalandril_Condition;
	information	 = 	DIA_Serpentes_GOTSalandril_Info;

	description	 = 	"Je sais qui a mis en circulation ces concessions minières.";
};

func int DIA_Serpentes_GOTSalandril_Condition ()
{
	if (SC_KnowsProspektorSalandril == TRUE)
	&& (hero.guild == GIL_KDF) 
		{
				return TRUE;
		};
};

func void DIA_Serpentes_GOTSalandril_Info ()
{
	AI_Output			(other, self, "DIA_Serpentes_GOTSalandril_15_00"); //Je sais qui a mis ces concessions minières en circulation. C'est Salandril, l'alchimiste du haut quartier de la ville.
	AI_Output			(self, other, "DIA_Serpentes_GOTSalandril_10_01"); //Alors amenez-le-nous. Nous devons lui parler.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info SalandrilHere
///////////////////////////////////////////////////////////////////////

instance DIA_Serpentes_SalandrilHERE		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	33;
	condition	 = 	DIA_Serpentes_SalandrilHERE_Condition;
	information	 = 	DIA_Serpentes_SalandrilHERE_Info;

	description	 = 	"Salandril est ici, au monastère.";
};

func int DIA_Serpentes_SalandrilHERE_Condition ()
{
	if (Npc_GetDistToWP(Salandril,"ALTAR")<10000) 
		{
			if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
				{
					return TRUE;
				}
			else if (Npc_KnowsInfo(other, DIA_Serpentes_GOTSalandril))
			&& (hero.guild == GIL_KDF) 
				{
					return TRUE;
				}
			else
				{
					return FALSE;
				};
		};
};

func void DIA_Serpentes_SalandrilHERE_Info ()
{
	AI_Output		(other, self, "DIA_Serpentes_SalandrilHERE_15_00"); //Salandril est ici, au monastère.
	AI_Output		(self, other, "DIA_Serpentes_SalandrilHERE_10_01"); //Bien joué. Nous nous occuperons de lui plus tard.

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output		(self, other, "DIA_Serpentes_SalandrilHERE_10_02"); //Voici votre récompense. Et ne parlez plus de tout ça, compris ?
		CreateInvItems (self, ItMi_Gold, 400);									
		B_GiveInvItems (self, other, ItMi_Gold, 400);					
	};
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP 	(XP_SalandrilInKloster);
};

///////////////////////////////////////////////////////////////////////
//	Info SalandrilDEAD
///////////////////////////////////////////////////////////////////////

instance DIA_Serpentes_SalandrilDEAD		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	33;
	condition	 = 	DIA_Serpentes_SalandrilDEAD_Condition;
	information	 = 	DIA_Serpentes_SalandrilDEAD_Info;

	description	 = 	"Salandril est mort.";
};

func int DIA_Serpentes_SalandrilDEAD_Condition ()
{
	if  (
			(Npc_KnowsInfo(other, DIA_Serpentes_GOTSalandril))
			||  (
					((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
					&& (MIS_Serpentes_BringSalandril_SLD == LOG_RUNNING)
				)
		)
		&& (Npc_IsDead(Salandril))
		{
				return TRUE;
		};
};

func void DIA_Serpentes_SalandrilDEAD_Info ()
{
	AI_Output			(other, self, "DIA_Serpentes_SalandrilDEAD_15_00"); //Salandril est mort.
	AI_Output			(self, other, "DIA_Serpentes_SalandrilDEAD_10_01"); //Alors il aura payé pour ses actes. Qu'Innos ait pitié de son âme.
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP 	(XP_Ambient);
};
	
//##################################################################
//##
//##	Kapitel 4
//##
//##################################################################

///////////////////////////////////////////////////////////////////////
//	Info Kap2 EXIT 
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Serpentes_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap4_EXIT_Condition;
	information = DIA_Serpentes_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//##################################################################
//##
//##	Kapitel 5
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap5 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap5_EXIT_Condition;
	information = DIA_Serpentes_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Serpentes_PICKPOCKET (C_INFO)
{
	npc			= KDF_501_Serpentes;
	nr			= 900;
	condition	= DIA_Serpentes_PICKPOCKET_Condition;
	information	= DIA_Serpentes_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Serpentes_PICKPOCKET_Condition()
{
	C_Beklauen (86, 380);
};
 
FUNC VOID DIA_Serpentes_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Serpentes_PICKPOCKET);
	Info_AddChoice		(DIA_Serpentes_PICKPOCKET, DIALOG_BACK 		,DIA_Serpentes_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Serpentes_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Serpentes_PICKPOCKET_DoIt);
};

func void DIA_Serpentes_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Serpentes_PICKPOCKET);
};
	
func void DIA_Serpentes_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Serpentes_PICKPOCKET);
};





















