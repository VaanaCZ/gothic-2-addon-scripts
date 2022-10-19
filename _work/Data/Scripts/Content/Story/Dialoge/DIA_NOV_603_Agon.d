
//***********************************************************************
//	Info EXIT 
//***********************************************************************

INSTANCE DIA_Agon_EXIT   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 999;
	condition   = DIA_Agon_EXIT_Condition;
	information = DIA_Agon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Agon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Agon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//************************************************************************
//			Hello
//************************************************************************

INSTANCE DIA_Agon_Hello   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 2;
	condition   = DIA_Agon_Hello_Condition;
	information = DIA_Agon_Hello_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Agon_Hello_Condition()
{
	if  (Npc_IsInState (self,ZS_Talk))
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&  (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_Hello_Info()
{
	AI_Output (self ,other,"DIA_Agon_Hello_07_00"); //(méprisant) Qu'est-ce que vous me voulez ?
};

// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Agon_Wurst(C_INFO)
{
	npc         = NOV_603_Agon;
	nr			= 2;
	condition	= DIA_Agon_Wurst_Condition;
	information	= DIA_Agon_Wurst_Info;
	permanent	= FALSE;
	description = "Tenez, j'ai une saucisse d'agneau pour vous.";
};                       

FUNC INT DIA_Agon_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Agon_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Agon_Wurst_15_00"); //Tenez, j'ai une saucisse d'agneau pour vous.
	AI_Output (self, other, "DIA_Agon_Wurst_07_01"); //Des saucisses d'agneau, du fromage et du lait de brebis... J'en ai marre de ces sales bêtes !
	AI_Output (other, self, "DIA_Agon_Wurst_15_02"); //Alors, vous la voulez cette saucisse, oui ou non ?
	AI_Output (self, other, "DIA_Agon_Wurst_07_03"); //Bon, d'accord, donnez-la moi !
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//***********************************************************************
//	Ich bin Neu hier.
//***********************************************************************

INSTANCE DIA_Agon_New   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_New_Condition;
	information = DIA_Agon_New_Info;
	permanent   = FALSE;
	description = "Je suis nouveau ici.";
};

FUNC INT DIA_Agon_New_Condition()
{
	if (MIS_SCHNITZELJAGD == FALSE)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_New_Info()
{
	AI_Output	(other,self ,"DIA_Agon_New_15_00"); //Je suis nouveau, ici.
	AI_Output	(self ,other,"DIA_Agon_New_07_01"); //C'est ce que je vois.
	AI_Output	(self ,other,"DIA_Agon_New_07_02"); //Si vous n'avez toujours pas de travail, allez voir Parlan, il vous en donnera.
};
//***********************************************************************
//	Was ist zwischen dir und Babo passiert?
//***********************************************************************

INSTANCE DIA_Agon_YouAndBabo   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_YouAndBabo_Condition;
	information = DIA_Agon_YouAndBabo_Info;
	permanent   = FALSE;
	description = "Qu'est-il arrivé entre Babo et vous ?";
};

FUNC INT DIA_Agon_YouAndBabo_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Opolos_Monastery)
	&& (MIS_SCHNITZELJAGD == FALSE))
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_YouAndBabo_Info()
{
	AI_Output	(other,self ,"DIA_Agon_YouAndBabo_15_00"); //Que s'est-il passé entre Babo et vous ?
	AI_Output	(self ,other,"DIA_Agon_YouAndBabo_07_01"); //Il ne faut pas accorder foi à tout ce qu'on entend.
	AI_Output	(self ,other,"DIA_Agon_YouAndBabo_07_02"); //(insistant) Mettons une chose au clair : je vais suivre la voie qu'Innos m'a tracée.
	AI_Output	(self ,other,"DIA_Agon_YouAndBabo_07_03"); //Je ne laisserai personne se dresser en travers de mon chemin, et certainement pas ce simple d'esprit de Babo !

	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
	Info_AddChoice	(DIA_Agon_YouAndBabo,"Nous autres novices ne devrions-nous pas nous serrer les coudes ?",DIA_Agon_YouAndBabo_AllTogether);
	Info_AddChoice	(DIA_Agon_YouAndBabo,"Innos seul sait la voie que nous devrions emprunter.",DIA_Agon_YouAndBabo_InnosWay);
	Info_AddChoice	(DIA_Agon_YouAndBabo,"On s'entendra très bien.",DIA_Agon_YouAndBabo_Understand);
};

FUNC VOID DIA_Agon_YouAndBabo_AllTogether ()
{
	AI_Output (other,self ,"DIA_Agon_YouAndBabo_AllTogether_15_00"); //Est-ce qu'on ne devrait pas se serrer les coudes entre novices ?
	AI_Output (self ,other,"DIA_Agon_YouAndBabo_AllTogether_07_01"); //Vous pouvez le faire sans moi si ça vous chante.
	AI_Output (self ,other,"DIA_Agon_YouAndBabo_AllTogether_07_02"); //Mais ne me faites pas perdre mon temps, c'est compris ? (implacable) Et que personne ne se mette en travers de mon chemin.
	
	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
};

FUNC VOID DIA_Agon_YouAndBabo_InnosWay ()
{
	AI_Output	(other,self ,"DIA_Agon_YouAndBabo_InnosWay_15_00"); //Innos seul sait la voie que nous prendrons.
	AI_Output 	(self ,other,"DIA_Agon_YouAndBabo_InnosWay_07_01"); //Ma famille a toujours eu la faveur d'Innos et cela n'est pas près de changer de sitôt.
	
	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
};
FUNC VOID DIA_Agon_YouAndBabo_Understand ()
{
	AI_Output	(other,self ,"DIA_Agon_YouAndBabo_Understand_15_00"); //Nous nous entendrons bien.
	AI_Output 	(self ,other,"DIA_Agon_YouAndBabo_Understand_07_01"); //Je vous le souhaite. Une fois que je serai magicien, je pourrai vous donner un coup de pouce.
	
	Info_ClearChoices 	(DIA_Agon_YouAndBabo);
};
//************************************************************************
//	Kann ich bei dir Kräuter bekommen?
//************************************************************************

INSTANCE DIA_Agon_GetHerb   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_GetHerb_Condition;
	information = DIA_Agon_GetHerb_Info;
	permanent   = TRUE;
	description = "Que plantez-vous ici ?";
};

FUNC INT DIA_Agon_GetHerb_Condition()
{
	if (MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Agon_GetHerb_Info()
{
	AI_Output (other,self ,"DIA_Agon_GetHerb_15_00"); //Qu'est-ce que vous plantez ici ?
	AI_Output (self ,other,"DIA_Agon_GetHerb_07_01"); //Nous essayons de faire pousser les plantes curatives que maître Néoras utilise pour préparer ses potions.
};
//************************************************************************
//	Agon ist in der Höhle
//************************************************************************

INSTANCE DIA_Agon_GolemDead   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_GolemDead_Condition;
	information = DIA_Agon_GolemDead_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Agon_GolemDead_Condition()
{
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (Npc_IsDead (Magic_Golem))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_GolemDead_Info()
{
	AI_Output (self ,other,"DIA_Agon_GolemDead_07_00"); //(triomphateur) Vous arrivez trop tard !
	AI_Output (self ,other,"DIA_Agon_GolemDead_07_01"); //J'étais là le premier ! J'ai gagné !
	 
	Info_ClearChoices (DIA_Agon_GolemDead);
	Info_AddChoice (DIA_Agon_GolemDead,"(menaçant) Uniquement si vous sortez d'ici vivant.",DIA_Agon_GolemDead_NoWay);
	Info_AddChoice (DIA_Agon_GolemDead,"Fermez-la !",DIA_Agon_GolemDead_ShutUp);
	Info_AddChoice (DIA_Agon_GolemDead,"Félicitations, vous l'avez vraiment mérité.",DIA_Agon_GolemDead_Congrat);
};

FUNC VOID DIA_Agon_GolemDead_NoWay ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_NoWay_15_00"); //(menaçant) Encore faudrait-il que vous sortiez d'ici en vie...
	AI_Output (self ,other,"DIA_Agon_GolemDead_NoWay_07_01"); //Vous voulez me tuer ? Vous n'y arriverez jamais !

	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Agon_GolemDead_ShutUp ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_ShutUp_15_00"); //La ferme !
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_07_01"); //(moqueur) C'est sans espoir, vous avez perdu ! Vous feriez mieux de vous résigner...
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_07_02"); //Moi seul suis destiné à devenir magicien.
	
	Info_ClearChoices (DIA_Agon_GolemDead);
	Info_AddChoice (DIA_Agon_GolemDead,"Destiné, mon cul ! Le coffre est à moi.",DIA_Agon_GolemDead_ShutUp_MyChest);
	Info_AddChoice (DIA_Agon_GolemDead,"Vous avez gagné.",DIA_Agon_GolemDead_ShutUp_YouWin);

};

FUNC VOID DIA_Agon_GolemDead_ShutUp_MyChest ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_ShutUp_MyChest_15_00"); //Destiné, mon œil ! Ce coffre est à moi !
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_MyChest_07_01"); //(furieux) Non, c'est hors de question ! Je vous tuerai le premier !
	
	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Agon_GolemDead_ShutUp_YouWin ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00"); //Vous avez gagné.
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_01"); //(furieux) Je ne me laisserai pas abuser ! Vous cherchez à vous débarrasser de moi !
	AI_Output (self ,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_02"); //Je ne vous laisserai pas faire !
	
	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Agon_GolemDead_Congrat ()
{
	AI_Output (other,self ,"DIA_Agon_GolemDead_Congrat_15_00"); //Félicitations, vous avez bien mérité votre victoire.
	AI_Output (self ,other,"DIA_Agon_GolemDead_Congrat_07_01"); //(méfiant) Qu'est-ce que cela signifie ? Qu'est-ce que vous mijotez ?
	AI_Output (other,self ,"DIA_Agon_GolemDead_Congrat_15_02"); //De quoi parlez-vous ?
	AI_Output (self ,other,"DIA_Agon_GolemDead_Congrat_07_03"); //(nerveux) Vous voulez me voler ma victoire en me tuant pour vous attribuer la gloire qui me revient de droit !
	AI_Output (self ,other,"DIA_Agon_GolemDead_Congrat_07_04"); //Mais vous n'y arriverez jamais !
	
	AI_StopProcessInfos (self);	
	B_Attack (self,other,AR_NONE, 1);
};

//****************************************
//	Der Sc war vor Agon in der Höhle
//****************************************

INSTANCE DIA_Agon_GolemLives   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_GolemLives_Condition;
	information = DIA_Agon_GolemLives_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Agon_GolemLives_Condition()
{
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (Npc_IsDead (Magic_Golem)== FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_GolemLives_Info()
{
	AI_Output (self ,other,"DIA_Agon_GolemLives_07_00"); //(surpris) Vous avez trouvé la cachette avant moi ? Mais c'est impossible !
	AI_Output (self ,other,"DIA_Agon_GolemLives_07_01"); //(déterminé) Cela ne peut être ! Je ne le permettrai pas !
	AI_Output (self ,other,"DIA_Agon_GolemLives_07_02"); //Nul ne retrouvera jamais votre corps...
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 0);
};

//****************************************
//	Sc hat Agon am Leben gelassen
//****************************************
/*
INSTANCE DIA_Agon_StillAlive   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 1;
	condition   = DIA_Agon_StillAlive_Condition;
	information = DIA_Agon_StillAlive_Info;
	permanent   = TRUE;
	description = "Was machst Du hier?";
};

FUNC INT DIA_Agon_StillAlive_Condition()
{
	if ((Kapitel >= 2)
	&& 	(hero.guild == GIL_KDF))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Agon_StillAlive_Info()
{
	AI_Output (other,self ,"DIA_Agon_StillAlive_15_00"); //Was machst Du hier? 
	AI_Output (self ,other,"DIA_Agon_StillAlive_07_01"); //Hättest Du mich nicht töten können? Dann müsste ich das ganze hier wenigstens nicht mehr ertragen. 
	AI_Output (self ,other,"DIA_Agon_StillAlive_07_02"); //Jetzt lass mich in Ruhe! Geh zurück ins Kloster!
	
	AI_StopProcessInfos (self);
};
*/
//***********************************************************************
// Perm
//***********************************************************************

INSTANCE DIA_Agon_Perm   (C_INFO)
{
	npc         = NOV_603_Agon;
	nr          = 2;
	condition   = DIA_Agon_Perm_Condition;
	information = DIA_Agon_Perm_Info;
	permanent   = TRUE;
	description = "Alors comment ça se passe ?";
};

FUNC INT DIA_Agon_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Agon_Perm_Info()
{
	AI_Output	(other,self ,"DIA_Agon_Perm_15_00"); //Alors, comment ça va ?
	
	if (other.guild == GIL_PAL)
	{
		AI_Output	(self ,other,"DIA_Agon_Perm_07_01"); //Oh, merci de votre sollicitude, sire paladin. Mon travail me plaît et je ne doute pas que je serai bientôt choisi pour devenir magicien.
	}
	else
	{
		AI_Output	(self ,other,"DIA_Agon_Perm_07_02"); //(arrogant) Vous n'êtes qu'un invité du monastère d'Innos. Tâchez donc de vous comporter comme tel et évitez de me déranger quand je travaille. Bonne fin de journée.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Agon_PICKPOCKET (C_INFO)
{
	npc			= NOV_603_Agon;
	nr			= 900;
	condition	= DIA_Agon_PICKPOCKET_Condition;
	information	= DIA_Agon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Agon_PICKPOCKET_Condition()
{
	C_Beklauen (23, 12);
};
 
FUNC VOID DIA_Agon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Agon_PICKPOCKET);
	Info_AddChoice		(DIA_Agon_PICKPOCKET, DIALOG_BACK 		,DIA_Agon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Agon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Agon_PICKPOCKET_DoIt);
};

func void DIA_Agon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Agon_PICKPOCKET);
};
	
func void DIA_Agon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Agon_PICKPOCKET);
};


