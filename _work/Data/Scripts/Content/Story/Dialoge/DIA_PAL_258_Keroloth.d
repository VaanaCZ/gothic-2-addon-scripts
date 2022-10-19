// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Keroloth_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_EXIT_Condition;
	information	= DIA_Keroloth_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Keroloth_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//**************************************************************
//	Ansprechen 
//**************************************************************
INSTANCE DIA_Keroloth_HELLO(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 2;
	condition	= DIA_Keroloth_HELLO_Condition;
	information	= DIA_Keroloth_HELLO_Info;
	permanent	= FALSE;
	important	= TRUE;	
};                       

FUNC INT DIA_Keroloth_HELLO_Condition()
{
	if Npc_IsInState (self,ZS_Talk)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_HELLO_Info()
{	
	AI_Output	(other ,self,"DIA_Keroloth_HELLO_15_00"); //Vous entraînez les gens ?
	AI_Output	(self ,other,"DIA_Keroloth_HELLO_07_01"); //Oui. Nous aurons besoin de tous les combattants possible quand les orques ou pire, les dragons, nous attaqueront de nouveau.
};
//***********************************************
//	Kannst DU mir was beibringen
//***********************************************

INSTANCE DIA_Keroloth_WantTeach(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 3;
	condition	= DIA_Keroloth_WantTeach_Condition;
	information	= DIA_Keroloth_WantTeach_Info;
	permanent	= FALSE;
	description = "Pouvez-vous également m'entraîner ?";
};                       

FUNC INT DIA_Keroloth_WantTeach_Condition()
{
	if (Keroloths_BeutelLeer == FALSE)
	{
	 	return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_WantTeach_Info()
{	
	AI_Output 	(other,self ,"DIA_Keroloth_WantTeach_15_00"); //Pouvez-vous m'entraîner moi aussi ?
	AI_Output 	(self ,other,"DIA_Keroloth_WantTeach_07_01"); //Bien sûr. J'accepte d'entraîner tous les hommes de valeur.
	AI_Output 	(self ,other,"DIA_Keroloth_WantTeach_07_02"); //Mais votre talent ne suffira pas. Il vous faut également une bonne arme si vous voulez survivre.
	AI_Output 	(self ,other,"DIA_Keroloth_WantTeach_07_03"); //Allez en demander une au chevalier Tandor. Il va s'occuper de vous.
		
	Keroloth_TeachPlayer = TRUE;
	Log_CreateTopic (TOPIC_Teacher_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Teacher_OC,"Au château, Kéroloth entraîne les spadassins.");
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Tandor vend des armes au château.");
};
//***********************************************
//	Kampflehrer EINHAND
//***********************************************

INSTANCE DIA_Keroloth_Teacher(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 6;
	condition	= DIA_Keroloth_Teacher_Condition;
	information	= DIA_Keroloth_Teacher_Info;
	permanent	= TRUE;
	description = "(Apprendre le combat avec des armes à une main)";
};                       

FUNC INT DIA_Keroloth_Teacher_Condition()
{
	if (Keroloth_TeachPlayer == TRUE)
	&& (Keroloths_BeutelLeer == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_Teacher_Info()
{	
	AI_Output 	(other,self ,"DIA_Keroloth_Teacher_15_00"); //Je veux m'entraîner !
	
	Info_ClearChoices 	(DIA_Keroloth_Teacher);
	Info_AddChoice 		(DIA_Keroloth_Teacher,DIALOG_BACK,DIA_Keroloth_Teacher_Back);
	Info_AddChoice		(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Keroloth_Teacher_1H_1);
	Info_AddChoice		(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Keroloth_Teacher_1H_5);
};

FUNC VOID DIA_Keroloth_Teacher_Back ()
{
	Info_ClearChoices (DIA_Keroloth_Teacher);
};

FUNC VOID B_Keroloth_TeachNoMore1 ()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore1_07_00"); //Vous êtes déjà très fort. Je n'ai plus rien à vous apprendre.
};

FUNC VOID B_Keroloth_TeachNoMore2 ()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore2_07_00"); //Seul un maître de l'épée peut désormais vous aider.
};

FUNC VOID DIA_Keroloth_Teacher_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);
	
	if (other.HitChance[NPC_TALENT_1H] >= 60)
	{
		B_Keroloth_TeachNoMore1	();
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_1H) == 2)
		{
			B_Keroloth_TeachNoMore2	();
		};
	};
	Info_AddChoice		(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Keroloth_Teacher_1H_1);
};

FUNC VOID DIA_Keroloth_Teacher_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);
	
	if (other.HitChance[NPC_TALENT_1H] >= 60)
	{
		B_Keroloth_TeachNoMore1	();
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_1H) == 2)
		{
			B_Keroloth_TeachNoMore2	();
		};
	};
	Info_AddChoice		(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Keroloth_Teacher_1H_5);
};
//**************************************
//		Kampflehrer ZWEIHAND
//**************************************
INSTANCE DIA_Keroloth_Teach(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 100;
	condition	= DIA_Keroloth_Teach_Condition;
	information	= DIA_Keroloth_Teach_Info;
	permanent	= TRUE;
	description = "(Apprendre le combat avec des armes à deux mains)";
};                       
//----------------------------------
var int DIA_Keroloth_Teach_permanent;
//----------------------------------
FUNC INT DIA_Keroloth_Teach_Condition()
{
	if (Keroloth_TeachPlayer == TRUE)
	&& (Keroloths_BeutelLeer == FALSE)
	&& (DIA_Keroloth_Teach_permanent == FALSE)
	&& (other.HitChance[NPC_TALENT_2H] < 60)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Keroloth_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Keroloth_Teach_15_00"); //Commençons.
	
	Info_ClearChoices 	(DIA_Keroloth_Teach);
	Info_AddChoice 		(DIA_Keroloth_Teach,	DIALOG_BACK		,DIA_Keroloth_Teach_Back);
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Keroloth_Teach_2H_1);
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Keroloth_Teach_2H_5);

};
FUNC VOID DIA_Keroloth_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 60)
	{
		B_Keroloth_TeachNoMore1	();
		
		DIA_Keroloth_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Keroloth_Teach);
};

FUNC VOID DIA_Keroloth_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 60);
	
	Info_ClearChoices 	(DIA_Keroloth_Teach);
	Info_AddChoice 		(DIA_Keroloth_Teach,	DIALOG_BACK		,DIA_Keroloth_Teach_Back);
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Keroloth_Teach_2H_1);	
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Keroloth_Teach_2H_5);	
};

FUNC VOID DIA_Keroloth_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 60);
	
	Info_ClearChoices 	(DIA_Keroloth_Teach);
	Info_AddChoice 		(DIA_Keroloth_Teach,	DIALOG_BACK		,DIA_Keroloth_Teach_Back);
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Keroloth_Teach_2H_1);	
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Keroloth_Teach_2H_5);	
};
//************************************
//	Suche andere Lehrer
//************************************

INSTANCE DIA_Keroloth_Udar(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 4;
	condition	= DIA_Keroloth_Udar_Condition;
	information	= DIA_Keroloth_Udar_Info;
	permanent	= FALSE;
	description = "Et en ce qui concerne le combat à distance ?";
};                       

FUNC INT DIA_Keroloth_Udar_Condition()
{
	if (Keroloth_TeachPlayer == TRUE)
	&& (Keroloths_BeutelLeer == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_Udar_Info()
{	
	AI_Output 	(other,self ,"DIA_Keroloth_Udar_15_00"); //Et le combat à distance ?
	AI_Output	(self ,other,"DIA_Keroloth_Udar_07_01"); //Oui ?
	AI_Output 	(other,self ,"DIA_Keroloth_Udar_15_02"); //Pouvez-vous me l'enseigner aussi ?
	AI_Output	(self ,other,"DIA_Keroloth_Udar_07_03"); //Non, mais allez voir Udar. C'est un bon... pardon, c'est le meilleur arbalétrier que j'aie jamais vu.
	
	
	Log_CreateTopic	(TOPIC_Teacher_OC, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher_OC, "Udar, du château de la Vallée des mines, sait tout sur les arbalètes.");
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

INSTANCE DIA_Keroloth_KAP3_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_KAP3_EXIT_Condition;
	information	= DIA_Keroloth_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Keroloth_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Keroloth_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Keroloth_KAP4_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_KAP4_EXIT_Condition;
	information	= DIA_Keroloth_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Keroloth_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Keroloth_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Kap4_Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_HELLO		(C_INFO)
{
	npc		 = 	PAL_258_Keroloth;
	nr		 = 	40;
	condition	 = 	DIA_Keroloth_KAP4_HELLO_Condition;
	information	 = 	DIA_Keroloth_KAP4_HELLO_Info;

	description	 = 	"Vous faites une drôle de tête.";
};

func int DIA_Keroloth_KAP4_HELLO_Condition ()
{
	if (Kapitel >= 4)	
		{
				return TRUE;
		};
};

func void DIA_Keroloth_KAP4_HELLO_Info ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_15_00"); //Pourquoi faites-vous cette tête ?
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_07_01"); //(agité) C'est incroyable, il faut ouvrir l'œil en permanence !
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_07_02"); //Il suffit de tourner le dos ne serait-ce qu'un instant pour se faire détrousser. Sale racaille !

	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, DIALOG_BACK, DIA_Keroloth_KAP4_HELLO_ende );
	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "Un paladin ne devrait pas perdre son sang-froid.", DIA_Keroloth_KAP4_HELLO_ruhig );
 	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "Quelqu'un vous a volé ?", DIA_Keroloth_KAP4_HELLO_bestohlen );
	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "Quelle vermine ?", DIA_Keroloth_KAP4_HELLO_pack );


};
func void DIA_Keroloth_KAP4_HELLO_ende ()
{
	Info_ClearChoices	(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_bestohlen ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_15_00"); //Quelqu'un vous a volé ?
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_07_01"); //Qu'est-ce que vous croyez ? Qu'on a mis de l'argent dans ma poche sans que je m'en aperçoive ? Bien sûr qu'on m'a volé, espèce de crétin !
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_07_02"); //Quand je mettrai la main sur l'enfant de sal...

	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "Alors qu'est-ce qu'il vous manque ?", DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt );
};
func void DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_00"); //Qu'est-ce qui vous manque, au juste ?
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_01"); //Ma bourse. Elle contenait toutes mes économies.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_02"); //Et voilà... envolée !
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_03"); //Quelqu'un finira bien par la retrouver...
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_04"); //Quand je mettrai la main sur ce sale type....

	Log_CreateTopic (TOPIC_KerolothsGeldbeutel, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KerolothsGeldbeutel, LOG_RUNNING);
	B_LogEntry (TOPIC_KerolothsGeldbeutel,"Le paladin Kéroloth a perdu sa bourse. Il affirme que les chasseurs de dragon la lui ont volée."); 


	Info_ClearChoices	(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_pack ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_pack_15_00"); //Qui traitez-vous de racaille ?
	
	if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_01"); //A votre avis ? Vous autres chasseurs de dragons, bien sûr.
		}
	else
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_02"); //Ces sales chasseurs de dragons, bien sûr. De qui voulez-vous que je parle de la sorte ?
		};
		
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_03"); //(se parle tout seul) Il faut sans cesse les avoir à l'œil, ça oui !
};

func void DIA_Keroloth_KAP4_HELLO_ruhig ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_ruhig_15_00"); //Du calme. Un paladin ne devrait pas s'énerver de la sorte.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_ruhig_07_01"); //Mais je ne veux pas me calmer ! C'était tout ce que je possédais, bon sang !
};


///////////////////////////////////////////////////////////////////////
//	Info GELDGEFUNDEN
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_GELDGEFUNDEN		(C_INFO)
{
	npc		 = 	PAL_258_Keroloth;
	nr		 = 	42;
	condition	 = 	DIA_Keroloth_KAP4_GELDGEFUNDEN_Condition;
	information	 = 	DIA_Keroloth_KAP4_GELDGEFUNDEN_Info;

	description	 = 	"Je crois que j'ai retrouvé votre bourse.";
};

func int DIA_Keroloth_KAP4_GELDGEFUNDEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Keroloth_KAP4_HELLO))
		&& 	(
			(Npc_HasItems (other,ItMi_KerolothsGeldbeutel_MIS))
			|| (Npc_HasItems (other,ItMi_KerolothsGeldbeutelLeer_MIS))
			)		
		{
				return TRUE;
		};
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Info ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_15_00"); //Je crois avoir retrouvé votre bourse.
	TOPIC_END_KerolothsGeldbeutel = TRUE;
	B_GivePlayerXP (XP_KerolothsGeldbeutel);
	if (B_GiveInvItems (other, self, ItMi_KerolothsGeldbeutelLeer_MIS,1))
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_07_01"); //Elle est vide. Qui est le pourri qui a fait ça ?
	
		Keroloths_BeutelLeer = TRUE;
	};
	if (B_GiveInvItems (other, self, ItMi_KerolothsGeldbeutel_MIS,1))
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_07_02"); //Quoi ? Où ça ? Qui est le saligaud qui m'a fait ça ?
	};
	
	if (hero.guild == GIL_DJG)
	{
		Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Attendez une minute. Et la récompense ?", DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn );
	};

	Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Elle était là-bas, près de chez le forgeron.", DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede );
	Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Je soupçonne un des chasseurs de dragons.", DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG );
	Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Comment le saurai-je ?", DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung);
};
func void DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_15_00"); //Comment voulez-vous que je le sache ?

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_01"); //Vous vous fichez de moi ? C'est vous, avouez !
		
		Info_ClearChoices	(DIA_Keroloth_KAP4_GELDGEFUNDEN);
		Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Je soupçonne un des chasseurs de dragons.", DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG );
		Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Va te faire...", DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_kannstmich );
	}
	else
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_02"); //Je finirai bien par découvrir la vérité.
		AI_StopProcessInfos (self);
	};
};
func void DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_kannstmich ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_kannstmich_15_00"); //Allez vous faire voir !
	AI_Output			(self, other, "DIA_Keroloth_KAP4_kannstmich_07_01"); //Je vais vous apprendre à détrousser les honnêtes gens !

	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_15_00"); //A mon avis le coupable est un chasseur de dragons.
		
	AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_01"); //(en colère) Je le savais !
	
	if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_02"); //(cri de rage) On n'aurait jamais dû vous laisser entrer dans le château !
		}
		else
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_03"); //Attendez voir. Je vais leur donner une bonne leçon à cette vermine.
		};

	AI_StopProcessInfos	(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;

	if (Npc_IsDead(Ferros) == FALSE)
		&& ((Npc_GetDistToNpc(self, Ferros)) <= 2000)
		{
			B_Attack (self, Ferros, AR_NONE, 1);
		}
	else if (Npc_IsDead(Jan) == FALSE)
		&& ((Npc_GetDistToNpc(self, Jan)) <= 2000)
		{
			B_Attack (self, Jan, AR_NONE, 1);
		}
	else if (Npc_IsDead(Rethon) == FALSE)
		&& ((Npc_GetDistToNpc(self, Rethon)) <= 2000)
		{
			B_Attack (self, Rethon, AR_NONE, 1);
		};
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_15_00"); //Euh... je l'ai trouvée là-bas, près de la forge.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_07_01"); //La forge ? Ha ! Elle a dû tomber de la poche d'un chasseur de dragons, et n'allez pas me dire le contraire !
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_15_00"); //Une minute... et ma récompense ?
	
 	if (Keroloths_BeutelLeer == TRUE)
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_01"); //Ça, c'est la meilleure ! Cela fait bien longtemps que personne ne vous a refait le portrait, hein ?
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_NONE, 1);	
	}
	else
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_02"); //Aaaahhh. D'accord, voilà quelques pièces. Et maintenant, dites-moi qui a fait ça.
		CreateInvItems (self, ItMi_Gold, 50);									
		B_GiveInvItems (self, other, ItMi_Gold, 50);					
		Keroloth_HasPayed = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info belohnung
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_BELOHNUNG		(C_INFO)
{
	npc		 = 	PAL_258_Keroloth;
	nr		 = 	43;
	condition	 = 	DIA_Keroloth_KAP4_BELOHNUNG_Condition;
	information	 = 	DIA_Keroloth_KAP4_BELOHNUNG_Info;
	permanent	 = 	TRUE;

	description	 = 	"Je veux une récompense pour avoir retrouvé votre bourse.";
};

func int DIA_Keroloth_KAP4_BELOHNUNG_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Keroloth_KAP4_GELDGEFUNDEN))
 		&& (Keroloth_HasPayed == FALSE)
 		&& (hero.guild != GIL_KDF)
 		{
				return TRUE;
		};
};

func void DIA_Keroloth_KAP4_BELOHNUNG_Info ()
{
 	AI_Output			(other, self, "DIA_Keroloth_KAP4_BELOHNUNG_15_00"); //Je veux une récompense pour avoir retrouvé cette bourse.

	if ((Keroloths_BeutelLeer == TRUE) || (hero.guild == GIL_DJG))
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_BELOHNUNG_07_01"); //Tout ce que vous allez avoir, c'est mon poing dans la figure !
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_NONE, 1);	
	}
	else
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_BELOHNUNG_07_02"); //C'est cela qui vous préoccupe ? Voilà quelques misérables piécettes. Et maintenant, déguerpissez !
		
		CreateInvItems (self, ItMi_Gold, 50);									
		B_GiveInvItems (self, other, ItMi_Gold, 50);					
		
		Keroloth_HasPayed = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info entspanndich
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_ENTSPANNDICH		(C_INFO)
{
	npc		 = 	PAL_258_Keroloth;
	nr		 = 	44;
	condition	 = 	DIA_Keroloth_KAP4_ENTSPANNDICH_Condition;
	information	 = 	DIA_Keroloth_KAP4_ENTSPANNDICH_Info;
	permanent	 = 	TRUE;

	description	 = 	"Calmez-vous.";
};

func int DIA_Keroloth_KAP4_ENTSPANNDICH_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Keroloth_KAP4_GELDGEFUNDEN))
		&& (Kapitel >= 4))
		|| (MIS_OCGateOpen == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Keroloth_KAP4_ENTSPANNDICH_Info ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_ENTSPANNDICH_15_00"); //Détendez-vous.
	
	if (hero.guild == GIL_KDF)
	{
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_01"); //Oui, maître. Je vais essayer.
	}
	else if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_02"); //Je n'en ai pas la preuve, mais je pense que c'est vous le traître qui a ouvert la porte à l'ennemi.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_03"); //Vous finirez bien par le payer un jour !
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);	
	}
	else 
	{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_ENTSPANNDICH_15_04"); //Vous avez récupéré votre bourse, non ?
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_05"); //Ne me cherchez pas, OK ? Tirez-vous !
	AI_StopProcessInfos (self);
	};
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

INSTANCE DIA_Keroloth_KAP5_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_KAP5_EXIT_Condition;
	information	= DIA_Keroloth_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Keroloth_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Keroloth_KAP5_EXIT_Info()
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


INSTANCE DIA_Keroloth_KAP6_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_KAP6_EXIT_Condition;
	information	= DIA_Keroloth_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Keroloth_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Keroloth_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Keroloth_PICKPOCKET (C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 900;
	condition	= DIA_Keroloth_PICKPOCKET_Condition;
	information	= DIA_Keroloth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Keroloth_PICKPOCKET_Condition()
{
	C_Beklauen (25, 45);
};
 
FUNC VOID DIA_Keroloth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Keroloth_PICKPOCKET);
	Info_AddChoice		(DIA_Keroloth_PICKPOCKET, DIALOG_BACK 		,DIA_Keroloth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Keroloth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Keroloth_PICKPOCKET_DoIt);
};

func void DIA_Keroloth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Keroloth_PICKPOCKET);
};
	
func void DIA_Keroloth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Keroloth_PICKPOCKET);
};




















































