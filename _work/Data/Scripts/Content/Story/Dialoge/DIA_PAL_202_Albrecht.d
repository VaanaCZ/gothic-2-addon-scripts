///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Albrecht_EXIT   (C_INFO)
{
	npc         = PAL_202_Albrecht;
	nr          = 999;
	condition   = DIA_Albrecht_EXIT_Condition;
	information = DIA_Albrecht_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Albrecht_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Albrecht_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_Hagen		(C_INFO)
{
	npc		 	 = 	PAL_202_Albrecht;
	nr			 =  1;
	condition	 = 	DIA_Albrecht_Hagen_Condition;
	information	 = 	DIA_Albrecht_Hagen_Info;
	permanent    =  FALSE;
	description	 =  "Je dois parler au seigneur Hagen !";
};

func int DIA_Albrecht_Hagen_Condition ()
{	
	if (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Albrecht_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_Hagen_15_00"); //Il faut que je parle au seigneur Hagen.
	AI_Output (self, other, "DIA_Albrecht_Hagen_03_01"); //Il se trouve dans la grande salle. Continuez tout droit.
	AI_Output (self, other, "DIA_Albrecht_Hagen_03_02"); //Quoi que vous lui vouliez, soyez bref, car il est très pris.
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_Hallo		(C_INFO)
{
	npc		 	 = 	PAL_202_Albrecht;
	nr			 =  2;
	condition	 = 	DIA_Albrecht_Hallo_Condition;
	information	 = 	DIA_Albrecht_Hallo_Info;
	permanent    =  FALSE;
	description	 =  "Qu'est-ce que cela implique d'être paladin ?";
};

func int DIA_Albrecht_Hallo_Condition ()
{	
	return TRUE;
};
func void DIA_Albrecht_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_Hallo_15_00"); //Que signifie être paladin ?
	AI_Output (self, other, "DIA_Albrecht_Hallo_03_01"); //Un paladin est un guerrier d'Innos. Il ne vit que pour servir notre dieu et se bat en son honneur.
	AI_Output (self, other, "DIA_Albrecht_Hallo_03_02"); //En échange, il reçoit le don de magie runique. Elle lui est accordée en reconnaissance de ses actes.
};
///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_CanTeach		(C_INFO)
{
	npc		 	 = 	PAL_202_Albrecht;
	nr			 =  99;
	condition	 = 	DIA_Albrecht_CanTeach_Condition;
	information	 = 	DIA_Albrecht_CanTeach_Info;
	permanent    =  TRUE;
	description	 = 	"Pouvez-vous m'enseigner quelque chose ?";
};

func int DIA_Albrecht_CanTeach_Condition ()
{	
	if  (Albrecht_TeachMANA == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Albrecht_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_CanTeach_15_00"); //Pouvez-vous m'apprendre quelque chose ?
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Albrecht_CanTeach_03_01"); //Si vous vous en montrez digne, je vous donnerai le pouvoir d'utiliser les runes magiques des paladins.
		AI_Output (self, other, "DIA_Albrecht_CanTeach_03_02"); //Sinon, je peux vous apprendre à augmenter votre puissance magique.
		Albrecht_TeachMANA = TRUE;
		B_LogEntry (TOPIC_CityTeacher,"Le paladin Albrecht peut m'aider à augmenter mon pouvoir magique.");
	}
	else
	{	
		AI_Output (self, other, "DIA_Albrecht_CanTeach_03_03"); //Mais mon enseignement est réservé aux paladins.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHPalRunes
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_TEACHPalRunes		(C_INFO)
{
	npc		  	 = 	PAL_202_Albrecht;
	nr			 = 	100;
	condition	 = 	DIA_Albrecht_TEACHPalRunes_Condition;
	information	 = 	DIA_Albrecht_TEACHPalRunes_Info;
	permanent	 = 	TRUE;
	description	 = 	"Suis-je digne de recevoir une rune ?";
};
func int DIA_Albrecht_TEACHPalRunes_Condition ()
{	
	if (Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Albrecht_TEACHPalRunes_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_TEACHPalRunes_15_00"); //Suis-je digne de recevoir une rune ?
	
	if (PLAYER_TALENT_RUNES [SPL_PalLight] == FALSE)
	{
		
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_01"); //Comme insigne de votre rang, je vous attribue la Rune de lumière, symbole de vérité et de justice.
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_02"); //Eclairez les pas de tous ceux qui suivent la voie d'Innos.
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_03"); //Vous devez mériter les autres runes. Revenez me voir quand vous vous en sentirez digne.
	
		PLAYER_TALENT_RUNES [SPL_PalLight] = TRUE;
	
		CreateInvItems (self,ItRu_PalLight,1);
		B_GiveInvItems (self,other,ItRu_PalLight,1);
	}
	else
	{
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_04"); //Quelle voie avez-vous choisie ?
		AI_Output (self,other, "DIA_Albrecht_TEACHPalRunes_03_05"); //Celle de la guérison ou celle du combat ?
		
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,"Je choisis la voie de la guérison.",DIA_Albrecht_TEACHPalRunes_Heal);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,"Je choisis la voie du combat.",DIA_Albrecht_TEACHPalRunes_Combat);
	};	
};

FUNC VOID DIA_Albrecht_TEACHPalRunes_BACK()
{
	Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
};

FUNC VOID B_Albrecht_YouAreNotWorthy ()
{
	AI_Output (self ,other,"B_Albrecht_YouAreNotWorthy_03_00"); //Vous n'êtes pas encore digne de recevoir le sort suivant de cette voie.
};

FUNC VOID DIA_Albrecht_TEACHPalRunes_Heal()
{
	AI_Output (other,self ,"DIA_Albrecht_TEACHPalRunes_Heal_15_00"); //J'ai choisi la voie de la guérison.
	if  (PLAYER_TALENT_RUNES [SPL_PalLightHeal] == FALSE)
	&&	(MIS_ReadyforChapter4 == TRUE)
	{
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString ("Soins légers.", CostForPalSpells) ,DIA_Albrecht_TEACHPalRunes_PalLightHeal);
	}
	else if 	(PLAYER_TALENT_RUNES [SPL_PalMediumHeal] == FALSE)
	&&	(Kapitel >= 5)
	{
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString ("Soins importants.", CostForPalSpells) ,DIA_Albrecht_TEACHPalRunes_PalMediumHeal);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy ();
	};
};

FUNC VOID DIA_Albrecht_TEACHPalRunes_Combat()
{
	AI_Output (other,self ,"DIA_Albrecht_TEACHPalRunes_Combat_15_00"); //J'ai choisi la voie du combat.
	
	if	(PLAYER_TALENT_RUNES [SPL_PalHolyBolt] == FALSE)
	&&	(MIS_ReadyforChapter4 == TRUE)
	{
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString ("Flèche sainte", CostForPalSpells) ,DIA_Albrecht_TEACHPalRunes_PalHolyBolt);
	}
	else if (PLAYER_TALENT_RUNES [SPL_PalRepelEvil] == FALSE)
	&&	(Kapitel >= 5)
	{
		Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice (DIA_Albrecht_TEACHPalRunes,DIALOG_BACK,DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice	(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString ("Bannissement du mal", CostForPalSpells) ,DIA_Albrecht_TEACHPalRunes_PalRepelEvil);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy ();
	};
};


FUNC INT DIA_Albrecht_TEACHPalRunes_PalLightHeal()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	PLAYER_TALENT_RUNES [SPL_PalLightHeal] = TRUE;
	CreateInvItems (self,ItRu_PalLightHeal,1);
	B_GiveInvItems (self,other,ItRu_PalLightHeal,1);
	other.lp = (other.lp -CostForPalSpells);
	Info_ClearChoices   (DIA_Albrecht_TEACHPalRunes); 

	return TRUE;
};

FUNC INT DIA_Albrecht_TEACHPalRunes_PalMediumHeal()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	PLAYER_TALENT_RUNES [SPL_PalMediumHeal] = TRUE;
	CreateInvItems (self,ItRu_PalMediumHeal,1);
	B_GiveInvItems (self,other,ItRu_PalMediumHeal,1); 
	other.lp = (other.lp -CostForPalSpells);
	return TRUE;
};

FUNC INT DIA_Albrecht_TEACHPalRunes_PalHolyBolt()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	PLAYER_TALENT_RUNES [SPL_PalHolyBolt] = TRUE;
	CreateInvItems (self,ItRu_PalHolyBolt,1);
	B_GiveInvItems (self,other,ItRu_PalHolyBolt,1);  
	other.lp = (other.lp -CostForPalSpells);
	return TRUE;
};

FUNC INT DIA_Albrecht_TEACHPalRunes_PalRepelEvil()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (self, other, "$NOLEARNNOPOINTS");
		
		return FALSE;
	};
	
	PLAYER_TALENT_RUNES [SPL_PalRepelEvil] = TRUE;
	CreateInvItems (self,ItRu_PalRepelEvil,1);
	B_GiveInvItems (self,other,ItRu_PalRepelEvil,1);
	other.lp = (other.lp -CostForPalSpells);
	return TRUE;
};



///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_Teach		(C_INFO)
{
	npc		  	 = 	PAL_202_Albrecht;
	nr			 = 	101;
	condition	 = 	DIA_Albrecht_Teach_Condition;
	information	 = 	DIA_Albrecht_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux augmenter mon pouvoir magique.";
};
func int DIA_Albrecht_Teach_Condition ()
{	
	if (Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Albrecht_Teach_Info ()
{
	AI_Output (other, self, "DIA_Albrecht_Teach_15_00"); //Je souhaite augmenter ma puissance magique.
	
	
	Info_ClearChoices   (DIA_Albrecht_Teach);
	Info_AddChoice 		(DIA_Albrecht_Teach, DIALOG_BACK, DIA_Albrecht_Teach_BACK);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))	,DIA_Albrecht_Teach_1);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Albrecht_Teach_5);
	
};
func void DIA_Albrecht_Teach_BACK()
{
	if (other.attribute [ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_Albrecht_Teach_03_00"); //Si vous voulez accroître davantage votre puissance magique, vous devrez vous trouver un autre mentor.
	};
	Info_ClearChoices (DIA_Albrecht_TEACH);
};
func void DIA_Albrecht_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_Albrecht_Teach);
	
	Info_AddChoice 		(DIA_Albrecht_Teach, DIALOG_BACK, DIA_Albrecht_TEACH_BACK);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))	,DIA_Albrecht_Teach_1);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Albrecht_Teach_5);
	
	
};
func void DIA_Albrecht_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_Albrecht_Teach);
	
	Info_AddChoice 		(DIA_Albrecht_Teach, DIALOG_BACK, DIA_Albrecht_Teach_BACK);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))	,DIA_Albrecht_Teach_1);
	Info_AddChoice		(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Albrecht_Teach_5);
	
	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Albrecht_PICKPOCKET (C_INFO)
{
	npc			= PAL_202_Albrecht;
	nr			= 900;
	condition	= DIA_Albrecht_PICKPOCKET_Condition;
	information	= DIA_Albrecht_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Albrecht_PICKPOCKET_Condition()
{
	C_Beklauen (41, 160);
};
 
FUNC VOID DIA_Albrecht_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Albrecht_PICKPOCKET);
	Info_AddChoice		(DIA_Albrecht_PICKPOCKET, DIALOG_BACK 		,DIA_Albrecht_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Albrecht_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Albrecht_PICKPOCKET_DoIt);
};

func void DIA_Albrecht_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Albrecht_PICKPOCKET);
};
	
func void DIA_Albrecht_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Albrecht_PICKPOCKET);
};




